//김정연
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;
import service.Student;

public class StudentDao {
	
	public Student insertStudent(Student stu){
	//Student 리턴 타입으로 isnertStudent 메소드 선언뒤 Student 클래스 데이터 타입 매개변수인 stu를 선언한다.
	//Student 클래스(String data type 인 name과 int data type인 age가 set, geter된 클래스)
		int countNo = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		//초기값 지정
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//드라이버 로딩
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "sqlidkjy";
			String dbPass = "sqlpwkjy";
			//db연결을 위한 데이터들을 각각의 String 변수들에 대입한다.
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("ELECT COUNT(*) as countNo  FROM student");
			//prepareStatement 객체를 이용한 쿼리문......을 PreparedStatement 객체로 생성된 객체참조변수 pstmt에 대입한다.
			rs = pstmt.executeQuery();
			//쿼리 실행
			if(rs.next()) {
				countNo = rs.getInt("countNo") +1;
				//countNo이란 이름으로 검색된 데이터를 int 변수 countNo에 대입한다.
			}
			
			pstmt2 = conn.prepareStatement("INSERT INTO student VALUES (?, ?, ?)");
			//prepareStatement 객체를 이용한 쿼리문......을 PreparedStatement 객체로 생성된 객체참조변수 pstmt2에 대입한다.
			pstmt2.setInt(1, countNo);
			pstmt2.setString(2, stu.getName());
			pstmt2.setInt(3, stu.getAge());
			//?가 있는곳에 각각 순서대로 세팅. 1=> countNo 2=> 입력된 name값 3=> 입력된 나이값
			System.out.println(pstmt2);
			pstmt2.executeUpdate();
			//쿼리 실행.
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		//예외처리. 오류 반환시 throw 시킨다.
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException e1) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e1) {}
			if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException e1) {}
			if (conn != null) try { conn.close(); } catch(SQLException e1) {}
		}
		return stu;
	}
}
