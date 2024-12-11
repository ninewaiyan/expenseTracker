package com.hostmdy.expense.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.sql.DataSource;

import com.hostmdy.expense.model.Expense;
import com.hostmdy.expense.model.ExpenseDAO;
import com.hostmdy.expense.model.User;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/expense")
public class ExpenseController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/living_expense")
	private DataSource dataSource;
	
	private ExpenseDAO expenseDAO;
	
	public ExpenseController() {
		
	}
	
	
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		expenseDAO = new ExpenseDAO(dataSource);
	}



	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		Long userId = user.getId();
		String mode = req.getParameter("mode");
		if(mode == null) {
			mode = "LIST";
		}
		
		switch(mode) {
		case "LIST":
			showList(req, resp,userId);
			break;
		case "FORM":
			showForm(req, resp);
			break;
		case "CREATE":
			createExpense(req, resp,userId);
			break;
		case "DETAILS":
			showDetail(req, resp);
			break;
		case "LOAD":
			loadExpense(req, resp);
			break;
		case "UPDATE":
			updateExpense(req, resp);
			break;
		case "DELETE":
			deleteExpense(req, resp);
			break;
		case "SEARCH":
			searchExpenseByTitle(req, resp, userId);
			break;
		}
	}
	
	private void searchExpenseByTitle(HttpServletRequest req, HttpServletResponse resp,Long userId) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String query = req.getParameter("query");
		List<Expense>expenses = expenseDAO.getAllExpense(userId);
		
		List<Expense>filteredExpenses = expenses.stream()
				.filter(e->e.getName().contains(query))
				.toList();
		req.setAttribute("expenses",filteredExpenses);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/index.jsp");
		dispatcher.forward(req, resp);
	}
	private void deleteExpense(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long expenseId = Long.parseLong(req.getParameter("expenseId"));
		
		boolean ok = expenseDAO.deleteExpense(expenseId);
		if(ok) {
			resp.sendRedirect("expense");
		}else {
			System.out.println("delete failed....");
		}
		
	}
	
	private void loadExpense(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long expenseId = Long.parseLong(req.getParameter("expenseId"));
		Expense expenses = expenseDAO.getExpenseById(expenseId);
		if(expenses == null) {
			System.out.println("expense with id="+ expenseId +" is not found");
			return;
		}
		req.setAttribute("expenses",expenses);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/expense/expense-update.jsp");
		dispatcher.forward(req, resp);
	}
	
	private void showDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long expenseId = Long.parseLong(req.getParameter("expenseId"));
		Expense expenses = expenseDAO.getExpenseById(expenseId);
		if(expenses == null) {
			System.out.println("expense with id="+ expenseId +" is not found");
			return;
		}
		req.setAttribute("expenses",expenses);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/expense/expense-details.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	private void showList(HttpServletRequest req, HttpServletResponse resp,Long userId) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<Expense>expenses = expenseDAO.getAllExpense(userId);
		req.setAttribute("expenses",expenses);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/index.jsp");
		dispatcher.forward(req, resp);
	}
	
	private void showForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/expense/expense-form.jsp");
		dispatcher.forward(req, resp);
	}
	
	private void updateExpense(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		long expenseId = Long.parseLong(req.getParameter("expenseId"));
		String name = req.getParameter("name");
		Integer qty = Integer.parseInt(req.getParameter("qty").trim());
		Double price =Double.parseDouble(req.getParameter("price").trim());
		String description = req.getParameter("description");
		String image = req.getParameter("image");
		Expense expense = new Expense(expenseId,name, qty,price, description, image);
		boolean ok = expenseDAO.updateExpense(expense);
		
		if(ok) {	
			System.out.println("expense updated");
			resp.sendRedirect("expense?mode=DETAILS&expenseId="+expenseId );
		}else {
			req.setAttribute("ok",ok);
			resp.sendRedirect("expense?mode=LOAD");
		}
//		RequestDispatcher dispatcher = req.getRequestDispatcher("template/expense/expense-form.jsp");
//		dispatcher.forward(req, resp);
	}
	
	
	
	
	
	
	private void createExpense(HttpServletRequest req, HttpServletResponse resp,Long userId) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = req.getParameter("name");
		Integer qty = Integer.parseInt(req.getParameter("qty").trim());
		Double price =Double.parseDouble(req.getParameter("price").trim());
		String description = req.getParameter("description");
		String image = req.getParameter("image");
		
		
		Expense expense = new Expense(name, qty,price, description, image);
		boolean ok = expenseDAO.createExpense(expense,userId);
		
		if(ok) {
			System.out.println("expense created");
			showList(req, resp,userId);
		}else {
			req.setAttribute("ok",ok);
			showForm(req,resp);
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/expense/expense-form.jsp");
		dispatcher.forward(req, resp);
	}
	
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

}
