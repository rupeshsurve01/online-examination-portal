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

    public List<Result> getAllResults() {

        List<Result> list = new ArrayList<>();

        try{

            Connection conn = DBConnection.getConnection();

            String sql = "SELECT r.*, e.title FROM results r JOIN exams e ON r.exam_id = e.id ORDER BY r.id DESC";

            PreparedStatement ps = conn.prepareStatement(sql);
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
    
    public int getAttemptedExamCount(int studentId) {
        int count = 0;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT COUNT(*) AS total FROM results WHERE student_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                count = rs.getInt("total");
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public double getAverageScore(int studentId) {
        double average = 0.0;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT AVG(score) AS avg_score FROM results WHERE student_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                average = rs.getDouble("avg_score");
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return average;
    }

    public double getAverageScoreAcrossAllStudents() {
        double average = 0.0;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT AVG(score) AS avg_score FROM results";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                average = rs.getDouble("avg_score");
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return average;
    }

    public String getBestCategory(int studentId) {
        String bestCategory = "N/A";
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT e.category, AVG(r.score) AS avg_score " +
                         "FROM results r JOIN exams e ON r.exam_id = e.id " +
                         "WHERE r.student_id=? GROUP BY e.category " +
                         "ORDER BY avg_score DESC LIMIT 1";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                bestCategory = rs.getString("category");
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return bestCategory;
    }

    public String getBestCategoryAcrossAllStudents() {
        String bestCategory = "N/A";
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT e.category, AVG(r.score) AS avg_score " +
                         "FROM results r JOIN exams e ON r.exam_id = e.id " +
                         "GROUP BY e.category ORDER BY avg_score DESC LIMIT 1";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                bestCategory = rs.getString("category");
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return bestCategory;
    }
    
    public boolean hasAttempted(int studentId,int examId){

        boolean attempted = false;

        try{
            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM results WHERE student_id=? AND exam_id=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1,studentId);
            ps.setInt(2,examId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                attempted = true;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return attempted;
    }
    
}
