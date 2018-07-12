
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.DriverManager;
import service.StudentAddr;
import java.sql.ResultSet;
public class StudentAddrDao {
	
	//리턴 타입 void로 DeleteAddr 메서드를 선언한다. 매겨변수는 String 데이터 타입인 sendNo를 선언.
	public void DeleteAddr(String sendNo) {
		//객체 초기값 설정.
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		try {
			//db연결 준비.
			Class.forName("com.mysql.jdbc.Driver");

			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			//db연결 준비 끝.
			
			//db 연결을 위한 데이터들과 쿼리문들을 pstmt 객체참조변수에 대입.
			pstmt = conn.prepareStatement("DELETE FROM student_address where student_no = ?");
			pstmt.setString(1, sendNo);
			//쿼리 실행
			pstmt.executeUpdate();
	
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	}
	
	//리턴 타입은 dto클래스 데이터 타입으로 하고 studentNo을 선언. 매개변수는 int 타입인 sendNo을 선언한다.
	public StudentAddr studentNo(int sendNo){
		
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudentAddr stu = new StudentAddr();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			//드라이버 로딩
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			//db연결을 위한 데이터들을 각각의 String 변수들에 대입한다.
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement("SELECT * FROM student_address where student_no=?");
			pstmt.setInt(1,  sendNo);
			
			//실행된 쿼리의 데이터들을 rs 객체참조 변수에 대입.
		    rs = pstmt.executeQuery();
			
		    //db 내에 있는 테이블 데이터들 불러온다.
			if(rs.next()) {
				
				//객체 stu를 이용해 불러온 값을 dto 내에 세팅.
				stu.setStudentNo(rs.getInt("student_no"));
				stu.setStudentAddrNo(rs.getInt("student_address_no"));
				stu.setAddr(rs.getString("student_address_content"));
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		//객체 종료.	
		}
		//리턴 stu. 즉, 값들이 셋팅된 dto 객체가 리턴.
		return stu;
	}
	
	//리턴 타입은 void로 하고 studentAddrTbDelete메서드를 선언. 매개변수는 String 데이터 타입으로 sendNo를 선언.
	public void studentAddrTbDelete(String sendNo) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("DELETE FROM student_address WHERE student_no =?");
			pstmt.setString(1, sendNo);
			pstmt.executeUpdate();
		
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	}
	
	//리턴 타입은 StudentAddr 클래스 리턴 타입 지정하고. insertStudentAddr 메서드를 선언, 매개변수는 StudentAddr 클래스 데이터 타입으로 sa를 선언.
	public StudentAddr insertStudentAddr(StudentAddr sa) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
	
	
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			//student_address 테이블 내에 student_no, student_address_content만 입력.
			pstmt = conn.prepareStatement("INSERT INTO student_address(student_no, student_address_content) values(?, ?)");
			pstmt.setInt(1,sa.getStudentNo());
			pstmt.setString(2, sa.getAddr());
			System.out.println(pstmt);
			pstmt.executeUpdate();
	
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		//객체 종료.	
		}
		return sa;
	}
}
