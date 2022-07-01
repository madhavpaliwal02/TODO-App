package com.TodoDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.entities.ToDo;

public class TodoDao {
	
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	public int saveTodo(ToDo t) {
		return (Integer)this.hibernateTemplate.save(t);	
	}
	
	public List<ToDo> getAllTodos(){
		return (List<ToDo>)this.hibernateTemplate.loadAll(ToDo.class);
	}

}
