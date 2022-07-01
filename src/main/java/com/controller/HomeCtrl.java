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

//	@Autowired
//	ServletContext con;
	
	@Autowired
	TodoDao todoDao;

	@RequestMapping("/home")
	public String home(Model m) {
		String str = "home";
		m.addAttribute("page", str);
		
		List<ToDo> list = todoDao.getAllTodos();
		m.addAttribute("todos", list);
		
		return "home";
	}

	@RequestMapping("/add")
	public String addTodo(Model m) {

		ToDo t = new ToDo();
		m.addAttribute("page", "add");
		m.addAttribute("todo", t);
		return "home";
	}

	@RequestMapping(value = "/saveTodo", method = RequestMethod.POST)
	public String saveTodo(@ModelAttribute("todo") ToDo t, Model m) {
		t.setTodoDate(new Date());

		todoDao.saveTodo(t);
		m.addAttribute("msg", "Successfully Added...");

		return "home";
	}
}
