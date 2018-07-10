package service;

import java.sql.*;
import java.util.ArrayList;

import service.*;

public class StudentScoreDao {
	
	public int selectScoreAvg() {
		
		
		return 0;
		
	}
	
	public ArrayList<StudentAndScore> selectStudentListAboveAvg(){
		ArrayList<StudentAndScore> list = new ArrayList<StudentAndScore>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "sqlidkjy";
			String dbPass = "sqlpwkjy";
		
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			//pstmt = conn.prepareStatement(arg0);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//
			}
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public ArrayList<StudentScore> studentScore(){
		
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<StudentScore> list = new ArrayList<StudentScore>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "sqlidkjy";
			String dbPass = "sqlpwkjy";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			
			pstmt = conn.prepareStatement("select * from student inner join student_score on student.student_no = student_score.student_no");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StudentScore studentScore = new StudentScore();
				studentScore.setStudentNo(rs.getInt("student_no"));
				studentScore.setStudentName(rs.getString("student_name"));
				studentScore.setStudentScoreNo(rs.getInt("student_score_no"));
				studentScore.setScore(rs.getInt("score"));
				list.add(studentScore);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return list;
	}
}	
