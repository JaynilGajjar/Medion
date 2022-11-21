package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Service.Services;
import com.bean.Cart;
import com.bean.User;
import com.bean.Wishlist;
import com.dao.CartDao;
import com.dao.Userdao;
import com.dao.WishlistDao;
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("register")) 
		{
			boolean flag=Userdao.checkEmail(request.getParameter("email"));
			if(flag==false)
			{
				User u=new User();
				u.setUsertype(request.getParameter("usertype"));
				u.setFname(request.getParameter("fname"));
				u.setLname(request.getParameter("lname"));
				u.setMobile(request.getParameter("mobile"));
				u.setEmail(request.getParameter("email"));
				u.setPassword(request.getParameter("password"));
				u.setAddress(request.getParameter("address"));
				Userdao.insertuser(u);
				response.sendRedirect("login.jsp");
			}
			else
			{
				request.setAttribute("msg", "Email Already Registered");
				request.getRequestDispatcher("register.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("login"))
		{
			User u=Userdao.login(request.getParameter("email"),request.getParameter("password"));
			if(u!=null)
			{
				if(u.getUsertype().equals("user"))
				{
				HttpSession session=request.getSession();
				session.setAttribute("u", u);
				List<Wishlist> list=WishlistDao.getWishlistByUser(u.getId());
				session.setAttribute("wishlist_count", list.size());
				List<Cart> list1=CartDao.getCartByUser(u.getId());
				session.setAttribute("cart_count", list1.size());
				request.getRequestDispatcher("index.jsp").forward(request, response);
				}
				else 
				{
					HttpSession session=request.getSession();
					session.setAttribute("u", u);
					request.getRequestDispatcher("seller_index.jsp").forward(request, response);
				}
			}
			else
			{
				request.setAttribute("msg", "Email or Password is incorrect");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("change password"))
		{
			HttpSession session=request.getSession();
			User u=(User) session.getAttribute("u");
			if(u.getPassword().equals(request.getParameter("old_password")))
			{
				if(request.getParameter("new_password").equals(request.getParameter("cnew_password")))
				{
					Userdao.changePassword(u.getEmail(), request.getParameter("new_password"));	
					response.sendRedirect("logout.jsp");
				}
				else
				{
					if(u.getUsertype().equals("user"))
					{
						request.setAttribute("msg", "New password and Confirm new password does not match");
						request.getRequestDispatcher("change_password.jsp").forward(request, response);
					}
					else 
					{
						request.setAttribute("msg", "New password and Confirm new password does not match");
						request.getRequestDispatcher("seller_change_password.jsp").forward(request, response);
					}
				}
			}
			else
			{	if(u.getUsertype().equals("user"))
				{
				request.setAttribute("msg", "old password does not matched");
				request.getRequestDispatcher("change_password.jsp").forward(request, response);
				}
			else
			{
				request.setAttribute("msg", "old password does not matched");
				request.getRequestDispatcher("seller_change_password.jsp").forward(request, response);
			}
			}
		}
		else if(action.equalsIgnoreCase("send OTP"))
		{
			String email=request.getParameter("email");
			boolean flag=Userdao.checkEmail(email);
			if(flag==true)
			{
				int min=1000;
				int max=9999;
				int otp = (int)(Math.random()*(max-min+1)+min);
				Services.sendMail(email, otp);
				request.setAttribute("email", email);
				request.setAttribute("otp", otp);
				request.getRequestDispatcher("otp.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("msg", "Email not Registered");
				request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("verify otp"))
		{
			String email=request.getParameter("email");
			String otp=request.getParameter("otp");
			String uotp=request.getParameter("uotp");
		
			if(otp.equals(uotp))
			{
				request.setAttribute("email", email);
				request.getRequestDispatcher("new_password.jsp").forward(request, response);
				
			}
			else
			{
				request.setAttribute("msg", "Invalid otp");
				request.setAttribute("email", email);
				request.setAttribute("otp", otp);
				request.getRequestDispatcher("otp.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("update password"))
		{
			String email=request.getParameter("email");
			String np=request.getParameter("new_password");
			String cnp=request.getParameter("cnew_password");
			
			if(np.equals("cnp"))
			{
				Userdao.changePassword(email, np);
				request.setAttribute("msg", "password updates succesfully");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("msg", "password and Confirm password does not matched");
				request.setAttribute("email" , email);
				request.getRequestDispatcher("new_password.jsp").forward(request, response);
			}
		}
	}

}