package com.TodoDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import javax.transaction.Transactional;

import com.entities.ToDo;

@Component
public class TodoDao {
	
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int savingTodo(ToDo t) {
		return (Integer)this.hibernateTemplate.save(t);	
	}
	
	public List<ToDo> getAllTodos(){
		return (List<ToDo>)this.hibernateTemplate.loadAll(ToDo.class);
	}

}
