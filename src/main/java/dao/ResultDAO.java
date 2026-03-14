package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
}