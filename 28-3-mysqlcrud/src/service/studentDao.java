//±Ë¡§ø¨ ±Ë¡§ø¨
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;
import service.student;

public class studentDao {
	
	public student insertStudent(student stu){
		
		int countNo = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			// TODO Auto-generated catch block
			
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
		String dbUser = "sqlidkjy";
		String dbPass = "sqlpwkjy";
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("SELECT COUNT(*) as countNo  FROM student");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				countNo = rs.getInt("countNo") +1;
			}
			pstmt2 = conn.prepareStatement("INSERT INTO student VALUES (?, ?, ?)");
			pstmt2.setInt(1, countNo);
			pstmt2.setString(2, stu.getName());
			pstmt2.setInt(3, stu.getAge());
			
			System.out.println(pstmt2);
			pstmt2.executeUpdate();
			
			
		}catch (SQLException e1) {
		
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException e1) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e1) {}
			if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException e1) {}
			if (conn != null) try { conn.close(); } catch(SQLException e1) {}
		
		
		}
		return stu;
	}

}
