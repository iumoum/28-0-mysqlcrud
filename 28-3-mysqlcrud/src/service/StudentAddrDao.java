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
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		int countNo = 0;
		//초기값 지정
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
		String dbUser = "sqlidkjy";
		String dbPass = "sqlpwkjy";
		
		
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("select student_no from student ORDER BY student_no DESC LIMIT 1;");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				countNo = rs.getInt("student_no");
				System.out.println(countNo);
			}
			pstmt2 = conn.prepareStatement("INSERT INTO student_address(student_no, student_address_content) values(?, ?)");
			pstmt2.setInt(1,countNo);
			pstmt2.setString(2, sa.getAddr());
			System.out.println(pstmt2);
			pstmt2.executeUpdate();
			
		}catch (SQLException e) {
			System.out.println("sql 오류다.");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				pstmt2.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		}
		return sa;
		
	}
}
