package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Result;
import util.DBConnection;

public class ResultDAO {

    public void saveResult(int studentId, int examId, int score) {

        try {

            Connection conn = DBConnection.getConnection();

            String sql = "INSERT INTO results(student_id, exam_id, score) VALUES(?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, studentId);
            ps.setInt(2, examId);
            ps.setInt(3, score);

            ps.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<Result> getResultsByStudent(int studentId){

        List<Result> list = new ArrayList<>();

        try{

            Connection conn = DBConnection.getConnection();

            String sql = "SELECT r.*, e.title FROM results r JOIN exams e ON r.exam_id = e.id WHERE r.student_id=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Result result = new Result();

                result.setId(rs.getInt("id"));
                result.setStudentId(rs.getInt("student_id"));
                result.setExamId(rs.getInt("exam_id"));
                result.setScore(rs.getInt("score"));
                result.setExamTitle(rs.getString("title"));

                list.add(result);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
}