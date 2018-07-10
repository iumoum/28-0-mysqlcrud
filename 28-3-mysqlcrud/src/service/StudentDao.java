//김정연 test
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.DriverManager;
import service.Student;
public class StudentDao {
	
	
	ArrayList<Student> list = null;
	String xtest = null;
	
	public Student studentScoreCheck(String sendNo) throws ClassNotFoundException, SQLException {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Student stu = new Student();
		
		Class.forName("com.mysql.jdbc.Driver");
		
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
		String dbUser = "sqlidkjy";
		String dbPass = "sqlpwkjy";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		pstmt = conn.prepareStatement("select * from student where student_no =?");
		pstmt.setString(1, sendNo);
		
		rs = pstmt.executeQuery();
		if(rs.next()) {
			stu.setName(rs.getString("student_name"));
		}
		
		return stu;
		
	}
	
	public Student studentSearch(String sk, String sv) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Student stu = new Student();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "sqlidkjy";
			String dbPass = "sqlpwkjy";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("select * from student where "+sk+"=?");
			pstmt.setString(1, sv);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				stu.setNo(rs.getInt("student_no"));
				stu.setName(rs.getString("student_name"));
				stu.setAge(rs.getInt("student_age"));
				
			}else {
				stu.setText("검색안됨");
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
		return stu;
	}
	
	public void studentDelete(String sendNo) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "sqlidkjy";
			String dbPass = "sqlpwkjy";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("DELETE FROM student_score WHERE student_no =?");
			pstmt.setString(1, sendNo);
			pstmt.executeUpdate();
			
			pstmt2 = conn.prepareStatement("DELETE FROM student_address WHERE student_no =?");
			pstmt2.setString(1, sendNo);
			pstmt2.executeUpdate();
			
			pstmt3 = conn.prepareStatement("DELETE FROM student WHERE student_no =?");
			pstmt3.setString(1, sendNo);
			pstmt3.executeUpdate();
			
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException e) {}
			if (pstmt3 != null) try { pstmt3.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	}
	
	public String studentUpdateAction(Student stu) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		

			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "sqlidkjy";
			String dbPass = "sqlpwkjy";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement("UPDATE Student SET student_name = ?, student_age = ? WHERE student_no = ?");
			pstmt.setString(1, stu.getName());
			pstmt.setInt(2, stu.getAge());
			pstmt.setInt(3, stu.getNo());
			
			pstmt.executeUpdate();
			
			xtest = "업데이트 성공";
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return xtest;
	}
	
	public Student studentUpdate(String sendNo) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Student s = new Student();
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "sqlidkjy";
			String dbPass = "sqlpwkjy";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement("SELECT * FROM student where student_no=?");
			pstmt.setString(1, sendNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				s.setNo(rs.getInt("student_no"));
				s.setName(rs.getString("student_name"));
				s.setAge(rs.getInt("student_age"));
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
		return s;
	}
	
	public String studentAddr(int sendNo){
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		
			//드라이버 로딩
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "sqlidkjy";
			String dbPass = "sqlpwkjy";
			//db연결을 위한 데이터들을 각각의 String 변수들에 대입한다.
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement("SELECT * FROM student_address where student_no=?");
			pstmt.setInt(1, sendNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				xtest = "주소있다";
			}else {
				xtest = "주소 없는듯";
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
		return xtest;
	}
	public String studentNo(int sendNo){
		String addr=null;
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		
			//드라이버 로딩
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "sqlidkjy";
			String dbPass = "sqlpwkjy";
			//db연결을 위한 데이터들을 각각의 String 변수들에 대입한다.
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement("SELECT * FROM student_address where student_no=?");
			pstmt.setInt(1,  sendNo);
			
		    rs = pstmt.executeQuery();
			
			if(rs.next()) {
				addr = rs.getString("student_address_content");
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
		return addr;
	}
	public Student countNo(Student s){
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		
			//드라이버 로딩
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "sqlidkjy";
			String dbPass = "sqlpwkjy";
			//db연결을 위한 데이터들을 각각의 String 변수들에 대입한다.
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement("SELECT COUNT(*) as countNo  FROM student");
			rs = pstmt.executeQuery();
			if(rs.next()) {
			s.setCountno(rs.getInt("countNo"));
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
		
		return s;
		
	}
	public ArrayList<Student> selectStudent(int begin, int rowPerPage){
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			//드라이버 로딩
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "sqlidkjy";
			String dbPass = "sqlpwkjy";
			//db연결을 위한 데이터들을 각각의 String 변수들에 대입한다.
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			list = new ArrayList<Student>();
			
			pstmt = conn.prepareStatement("select * from student order by student_no asc limit ?,?");
			pstmt.setInt(1, begin);
			pstmt.setInt(2,  rowPerPage);
			System.out.println(pstmt +"<-sptmt");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Student s = new Student();
				s.setName(rs.getString("student_name"));
				s.setAge(rs.getInt("student_age"));
				s.setNo(rs.getInt("student_no"));
				list.add(s);
			}	
		
		}catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		//객체 종료.	
		}
		return list;
		
				
		
	}
	
	public Student insertStudent(Student stu){
	//Student 리턴 타입으로 isnertStudent 메소드 선언뒤 Student 클래스 데이터 타입 매개변수인 stu를 선언한다.
	//Student 클래스(String data type 인 name과 int data type인 age가 set, geter된 클래스)
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
			pstmt = conn.prepareStatement("SELECT COUNT(*) as countNo  FROM student");
			//prepareStatement 객체를 이용한 쿼리문......을 PreparedStatement 객체로 생성된 객체참조변수 pstmt에 대입한다.
			rs = pstmt.executeQuery();
			//쿼리 실행
			if(rs.next()) {
				
			}
			
			pstmt2 = conn.prepareStatement("INSERT INTO student(student_name, student_age) VALUES (?, ?)");
			//prepareStatement 객체를 이용한 쿼리문......을 PreparedStatement 객체로 생성된 객체참조변수 pstmt2에 대입한다.
			pstmt2.setString(1, stu.getName());
			pstmt2.setInt(2, stu.getAge());
			//?가 있는곳에 각각 순서대로 세팅. 1=> countNo 2=> 입력된 name값 3=> 입력된 나이값
			System.out.println(pstmt2);
			pstmt2.executeUpdate();
			//쿼리 실행.
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		//예외처리. 오류 반환시 처리.
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		//클래스를 찾지 못했을때의 오류반환 시 처리.
		
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException e1) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e1) {}
			if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException e1) {}
			if (conn != null) try { conn.close(); } catch(SQLException e1) {}
		//객체 종료.	
		}
		return stu;
		//리턴 stu. finally 안에 있으면 경고가 발생해서 밖으로 빼두었다!
	}
}
