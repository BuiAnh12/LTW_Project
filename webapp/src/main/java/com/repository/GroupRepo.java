package com.repository;

import java.util.Date;
import java.util.List;

import javax.swing.ListModel;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.entity.Group;

@Repository
public interface  GroupRepo extends JpaRepository<Group, Integer> {
	@Query("select count(gr) from Group gr where gr.format = 1")
	int numberOnlGroup();
	
	@Query("select count(gr) from Group gr where gr.format = 0")
	int numberOffGroup();
	
	@Query("select gr from Group gr where gr.startDate between ?1 and ?2")
	List<Group> recentGroup(Date start, Date end);
	
	@Query("select count(r) from Registration r where r.group.id = ?1")
	String getNoStudent(int groupId);
}
