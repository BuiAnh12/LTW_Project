package com.repository;

import java.util.Date;
import java.util.List;

import javax.swing.ListModel;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.entity.Course;
import com.entity.Group;
import com.entity.User;

@Repository
public interface  GroupRepo extends JpaRepository<Group, Integer> {
	@Query("select count(gr) from Group gr where gr.format = 1")
	int numberOnlGroup();
	
	@Query("select count(gr) from Group gr where gr.format = 0")
	int numberOffGroup();
	
	@Query("select DISTINCT gr from Group gr where gr.startDate between ?1 and ?2")
	List<Group> recentGroup(Date start, Date end);
	
	@Query("select count(r) from Registration r where r.group.id = ?1")
	String getNoStudent(int groupId);
	
	@Modifying
    @Query("UPDATE Group g SET g.course = :course, g.mainTeacher = :mainTeacher, g.startDate = :startDate, g.endDate = :endDate, g.supervisor = :supervisor, g.format = :format, g.status = :status, g.title = :title, g.groupDetail = :groupDetail WHERE g.id = :groupId")
    void updateGroupById(@Param("groupId") Integer groupId, @Param("course") Course course, @Param("mainTeacher") User mainTeacher, @Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("supervisor") User supervisor, @Param("format") Boolean format, @Param("status") Integer status, @Param("title") String title, @Param("groupDetail") String groupDetail);
}
