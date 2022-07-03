package com.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.TodoDao.TodoDao;
import com.entities.ToDo;

@Controller
public class HomeCtrl {
	
	@Autowired
	ServletContext context;
	
	// To fetch through Autowired
	@Autowired
	TodoDao todoDao;

	// Home page - View ToDo
	@RequestMapping("/home")
	public String home(Model m) {
		m.addAttribute("page", "home");
		
		// Getting all todos from DB
		List<ToDo> list = this.todoDao.getAllTodos();
		m.addAttribute("todos", list);
		
		return "home";
	}

	// Home Page - Add Todo
	@RequestMapping("/add")
	public String addTodo(Model m) {
		ToDo t = new ToDo();
		m.addAttribute("page", "add");
		m.addAttribute("todo", t);
		return "home";
	}

	// Execute when submit fires
	@RequestMapping(value = "/saveTodo", method = RequestMethod.POST)
	public String saveTodo(@ModelAttribute("todo") ToDo t, Model m) {
		t.setTodoDate(new Date());

		this.todoDao.savingTodo(t);
		m.addAttribute("msg", "Successfully Added...");

		return "home";
	}
}
