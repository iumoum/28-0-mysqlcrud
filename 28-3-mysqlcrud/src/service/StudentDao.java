//김정연 김정연
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;
import service.Student;
// 임포트한다.
public class StudentDao {
	
	public Student insertStudent(Student stu){
	//student 리턴 타입으로 insertStudent 메서드를 선언한 후에 student 클래스 데이터 타입 으로 만들어진 변수 stu를 선언한다.	
	//student==Student.java 내에 스트링 변수 name과 인트 변수 age가 set, geter 되어있는 클래스.
		int countNo = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		//초기값 지정.
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
				//드라이버 로딩
			} catch (ClassNotFoundException e) {
				//예외처리 던진다.
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			// TODO Auto-generated catch block
			
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
		String dbUser = "sqlidkjy";
		String dbPass = "sqlpwkjy";
		
		//db연결을 하기위한 값들을 각가의 변수에 대입한다.
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("SELECT COUNT(*) as countNo  FROM student");
			
			rs = pstmt.executeQuery();
			//Connection 객체로 생성된 변수 conn에 db연결 데이터들을 대입하고 PreparedStatement 객체로 생성된 pstmt에 쿼리문을 입력.(executeQuery로 테이블값을 불러온다)
			if(rs.next()) {
				countNo = rs.getInt("countNo") +1;
			}
			//쿼리 실행. 초기값을 지정해둔 countNo 변수에 student 테이블에 입력된 coumtNo 값을 겟팅(+1) 한 값을 대입
			pstmt2 = conn.prepareStatement("INSERT INTO student VALUES (?, ?, ?)");
			pstmt2.setInt(1, countNo);
			pstmt2.setString(2, stu.getName());
			pstmt2.setInt(3, stu.getAge());
			
			System.out.println(pstmt2);
			pstmt2.executeUpdate();
			//pstmt2변수에 겟팅된 name과 age를 입력하고 변수 countNo을 대입 및 쿼리 실행.
			
		}catch (SQLException e1) {//*예외. 오류 반환시 throw.
			System.out.println("sql문 오류남");
			e1.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException e1) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e1) {}
			if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException e1) {}
			if (conn != null) try { conn.close(); } catch(SQLException e1) {}
		
		//객체 종료.
		}
		return stu;
		//finally 안에 return을 넣게되면 경고가 뜨므로 try-catch-finally가 벗어난 곳에서 return.
	}

}
