package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Question;
import util.DBConnection;

public class QuestionDAO {

    public List<Question> getQuestionsByExam(int examId) {

        List<Question> list = new ArrayList<>();

        try {

            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM questions WHERE exam_id=?";

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