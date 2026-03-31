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
		return getAllExams(null);
	}

	public List<Exam> getAllExams(String category){
		List<Exam> list = new ArrayList<>();
		
		try {
			Connection conn = DBConnection.getConnection();
			
			String sql = "SELECT * FROM exams";
			if(category != null && !category.trim().isEmpty()){
				sql += " WHERE category = ?";
			}
			PreparedStatement ps = conn.prepareStatement(sql);
			if(category != null && !category.trim().isEmpty()){
				ps.setString(1, category.trim());
			}
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Exam exam = new Exam();
				
				exam.setId(rs.getInt("id"));
				exam.setTitle(rs.getString("title"));
				exam.setDuration(rs.getInt("duration"));
				exam.setCategory(rs.getString("category"));
		        
		        list.add(exam);
			}
					
		} catch (Exception e) {
            e.printStackTrace();
		}
		return list;
	}

	public List<String> getAllCategories(){
		List<String> categories = new ArrayList<>();
		
		try {
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT DISTINCT category FROM exams ORDER BY category";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				categories.add(rs.getString("category"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categories;
	}

	public int createExam(String title, int duration, String category){

	    int examId = 0;
	    if(category == null || category.trim().isEmpty()) {
	        category = "General";
	    }

	    try{

	        Connection conn = DBConnection.getConnection();

	        String sql = "INSERT INTO exams(title,duration,category) VALUES(?,?,?)";

	        PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

	        ps.setString(1, title);
	        ps.setInt(2, duration);
	        ps.setString(3, category.trim());

	        ps.executeUpdate();

	        ResultSet rs = ps.getGeneratedKeys();

	        if(rs.next()){
	            examId = rs.getInt(1);
	        }

	    }catch(Exception e){
	        e.printStackTrace();
	    }

	    return examId;
	}
	
	public Exam getExamById(int id){

	    Exam exam = null;

	    try{
	        Connection conn = DBConnection.getConnection();

	        String sql = "SELECT * FROM exams WHERE id=?";

	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1,id);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()){
	            exam = new Exam();
	            exam.setId(rs.getInt("id"));
	            exam.setTitle(rs.getString("title"));
	            exam.setDuration(rs.getInt("duration"));
	            exam.setCategory(rs.getString("category"));
	        }

	    }catch(Exception e){
	        e.printStackTrace();
	    }

	    return exam;
	}

    public boolean updateExam(Exam exam) {

        boolean updated = false;

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "UPDATE exams SET title=?, duration=?, category=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, exam.getTitle());
            ps.setInt(2, exam.getDuration());
            ps.setString(3, exam.getCategory());
            ps.setInt(4, exam.getId());

            updated = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return updated;
    }

    public boolean deleteExam(int examId) {

        boolean deleted = false;

        try {
            Connection conn = DBConnection.getConnection();

            PreparedStatement deleteResults = conn.prepareStatement("DELETE FROM results WHERE exam_id=?");
            deleteResults.setInt(1, examId);
            deleteResults.executeUpdate();

            PreparedStatement deleteQuestions = conn.prepareStatement("DELETE FROM questions WHERE exam_id=?");
            deleteQuestions.setInt(1, examId);
            deleteQuestions.executeUpdate();

            PreparedStatement deleteExam = conn.prepareStatement("DELETE FROM exams WHERE id=?");
            deleteExam.setInt(1, examId);

            deleted = deleteExam.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return deleted;
    }

}
