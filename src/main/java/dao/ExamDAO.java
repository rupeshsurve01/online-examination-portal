package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Exam;
import util.DBConnection;

public class ExamDAO {
	
	public List<Exam> getAllExams(){
		
		List<Exam> list = new ArrayList<>();
		
		try {
			Connection conn = DBConnection.getConnection();
			
			String sql = "Select * from exams";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Exam exam = new Exam();
				
				exam.setId(rs.getInt("id"));
				exam.setTitle(rs.getString("title"));
		        exam.setDuration(rs.getInt("duration"));
		        
		        list.add(exam);
				
			}
					
		} catch (Exception e) {
            e.printStackTrace();
		}
		return list;
		
	}
	
	public void createExam(String title, int duration){

	    try{

	        Connection conn = DBConnection.getConnection();

	        String sql = "INSERT INTO exams(title,duration) VALUES(?,?)";

	        PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setString(1, title);
	        ps.setInt(2, duration);

	        ps.executeUpdate();

	    }catch(Exception e){
	        e.printStackTrace();
	    }
	}

}
