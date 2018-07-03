//김정연 addr 주석 x
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.DriverManager;
import service.StudentAddr;
import java.sql.ResultSet;
public class StudentAddrDao {
	
	public StudentAddr insertStudentAddr(StudentAddr sa) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		//초기값 지정
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "sqlidkjy";
			String dbPass = "sqlpwkjy";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("INSERT INTO student_address(student_no, student_address_content) values(?, ?)");
			pstmt.setInt(1,sa.getStudentNo());
			pstmt.setString(2, sa.getAddr());
			System.out.println(pstmt);
			pstmt.executeUpdate();
			
			}catch (SQLException e) {
			System.out.println("sql 오류다.");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		}
		return sa;
	}
}
