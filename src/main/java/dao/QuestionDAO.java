package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Question;
import util.DBConnection;

public class QuestionDAO {
	
	public void createQuestion(Question q) {

	    try {
	        Connection conn = DBConnection.getConnection();

	        String sql = "INSERT INTO questions(exam_id,question_text,option1,option2,option3,option4,correct_option)\r\n"
	        		+ "VALUES (?,?,?,?,?,?,?)";

	        PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setInt(1, q.getExamId());
	        ps.setString(2, q.getQuestionText());
	        ps.setString(3, q.getOption1());
	        ps.setString(4, q.getOption2());
	        ps.setString(5, q.getOption3());
	        ps.setString(6, q.getOption4());
	        ps.setInt(7, q.getCorrectOption());

	        int row = ps.executeUpdate();

	        if(row > 0) {
	            System.out.println("Question Added Successfully");
	        } else {
	            System.out.println("Question Not Added");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	

    public List<Question> getQuestionsByExam(int examId) {

        List<Question> list = new ArrayList<>();

        try {

            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM questions WHERE exam_id=? ORDER BY RAND()";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, examId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Question q = new Question();

                q.setId(rs.getInt("id"));
                q.setExamId(rs.getInt("exam_id"));
                q.setQuestionText(rs.getString("question_text"));
                q.setOption1(rs.getString("option1"));
                q.setOption2(rs.getString("option2"));
                q.setOption3(rs.getString("option3"));
                q.setOption4(rs.getString("option4"));
                q.setCorrectOption(rs.getInt("correct_option"));

                list.add(q);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}