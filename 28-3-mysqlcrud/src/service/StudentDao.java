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
	
	
	public String selectStudentName(String sendNo) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String studentName = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement("select * from student where student_no = ?");
			pstmt.setString(1, sendNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				studentName = rs.getString("student_name");
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
		return studentName;
	}
	
	

	
	public Student studentScoreCheck(String sendNo) throws ClassNotFoundException, SQLException {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Student stu = new Student();
		
		Class.forName("com.mysql.jdbc.Driver");
		
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
		String dbUser = "root";
		String dbPass = "java0000";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		pstmt = conn.prepareStatement("select * from student where student_no =?");
		pstmt.setString(1, sendNo);
		
		rs = pstmt.executeQuery();
		if(rs.next()) {
			stu.setStudentName(rs.getString("student_name"));
		}
		
		return stu;
		
	}
	
	public ArrayList<Student> selectStudentByPage(int currentPage, int rowPerPage, String searchValue){
		Connection conn = null;
		PreparedStatement pstmtSelectStudentByPage = null;
		ResultSet rsSelectStudentByPage = null;
		ArrayList<Student> arrayListStudent = new ArrayList<Student>();
		
		int startPoint = (currentPage - 1) * rowPerPage;
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 검색 내용 부분이 공백일 경우(즉, 전체보기)
			if(searchValue.equals("")) {
				// student 테이블의 student_no, student_name, student_age 컬럼의 값을 LIMIT 옵션에 따라 조회하는 쿼리 
				String sqlSelectStudentByPage = "SELECT student_no, student_name, student_age FROM student ORDER BY student_no DESC LIMIT ?, ?";
				
				pstmtSelectStudentByPage = conn.prepareStatement(sqlSelectStudentByPage);
				
				pstmtSelectStudentByPage.setInt(1, startPoint);
				pstmtSelectStudentByPage.setInt(2, rowPerPage);
			} else {
				// 검색한 이름에 따라 student 테이블의 student_no, student_name, student_age 컬럼의 값을 LIMIT 옵션에 따라 조회하는 쿼리 
				String sqlSelectStudentByPage = "SELECT student_no, student_name, student_age FROM student WHERE student_name LIKE ? ORDER BY student_no DESC LIMIT ?, ?";
				
				pstmtSelectStudentByPage = conn.prepareStatement(sqlSelectStudentByPage);
				
				// ?에 값 대입
				pstmtSelectStudentByPage.setString(1, "%" + searchValue + "%");
				pstmtSelectStudentByPage.setInt(2, startPoint);
				pstmtSelectStudentByPage.setInt(3, rowPerPage);
			}
			
			// 위의 쿼리 실행
			rsSelectStudentByPage = pstmtSelectStudentByPage.executeQuery();
			
			// 다음 레코드가 존재한다면
			while(rsSelectStudentByPage.next()) {
				// student 객체 생성
				Student student = new Student();
				
				// student 객체 내부 멤버변수에 값을 대입
				student.setStudentNo(rsSelectStudentByPage.getInt("student_no"));
				student.setStudentName(rsSelectStudentByPage.getString("student_name"));
				student.setStudentAge(rsSelectStudentByPage.getInt("student_age"));
				
				arrayListStudent.add(student);
			}
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsSelectStudentByPage != null) {
				try {
					rsSelectStudentByPage.close();
				} catch (SQLException sqlException){
					System.out.println("rsSelectForCount 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtSelectStudentByPage != null) {
				try {
					pstmtSelectStudentByPage.close();
				} catch (SQLException sqlException){
					System.out.println("pstmt1 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException sqlException){
					System.out.println("conn 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
		}	
		return arrayListStudent;
	}
	
	//리턴타입은 void 로 하고 studentTbDelete 메서드 선언. 매개변수는 String 데이터 타입인 sendNo을 선언.
	public void studentTbDelete(String sendNo) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("DELETE FROM student WHERE student_no =?");
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
	
	//리턴 타입은 String. studentUpdateAction 메서드 선언. 매개변수는 Student클래스 데이터 타입인 변수 stu.
	public String studentUpdateAction(Student stu) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		

			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement("UPDATE Student SET student_name = ?, student_age = ? WHERE student_no = ?");
			pstmt.setString(1, stu.getStudentName());
			pstmt.setInt(2, stu.getStudentAge());
			pstmt.setInt(3, stu.getStudentNo());
			
			pstmt.executeUpdate();
			
			//여기서 쿼리가 실행이 되면 전역변수인 xtest에 "업데이트 성공" 이라는 텍스트를 입력한다.
			xtest = "업데이트 성공";
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		//리턴 xtest.
		return xtest;
		
	}
	
	//리턴 타입은 클래스 리턴 타입인 Student. studentUpdate 메서드를 선언. 매개변수는 String 데이터 타입인 변수 sendNo 를 선언.
	public Student studentUpdate(String sendNo) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Student s = new Student();
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement("SELECT * FROM student where student_no=?");
			pstmt.setString(1, sendNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				s.setStudentNo(rs.getInt("student_no"));
				s.setStudentName(rs.getString("student_name"));
				s.setStudentAge(rs.getInt("student_age"));
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
	
	//리턴 타입은 클래스 리턴 타입인 String 으로 하고 studentAddr 메서드를 선언
	public String studentAddr(int sendNo){
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		
			//드라이버 로딩
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
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
	public int countNo(Student s){
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int countNo = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		
			//드라이버 로딩
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			//db연결을 위한 데이터들을 각각의 String 변수들에 대입한다.
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement("SELECT COUNT(*) as countNo  FROM student");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				countNo = rs.getInt("countNo");
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
		
		return countNo;
		
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
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
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
			pstmt2.setString(1, stu.getStudentName());
			pstmt2.setInt(2, stu.getStudentAge());
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
	// studentList의 마지막 페이지를 구하기 위해 레코드의 총 갯수를 조회하는 메서드
		// 매개변수는 검색어에 따라 총 레코드 수가 달라지기 때문에 searchValue를 입력 받음
		// 리턴되는 데이터는 검색어에 따라 조회되는 총 레코드의 수 이다.
		public int countTotalRecordsBySearchValue(String searchValue) {
			Connection conn = null;
			PreparedStatement pstmtCountTotalRecordsBySearchValue = null;
			ResultSet rsCountTotalRecordsBySearchValue = null;
			int totalRecordsBySelect = 0;
			
			try {
				// mysql 드라이버 로딩
				Class.forName("com.mysql.jdbc.Driver");
				
				// DB 연결 
				String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
				String dbUser = "root";
				String dbPw = "java0000";
				conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
				
				// 검색어가 존재하지 않으면 전체보기
				if(searchValue.equals("")) {
					// student 테이블의 전체 레코드 갯수를 조회하는 쿼리
					String sqlSelectForFindLastPage = "SELECT COUNT(*) as total_records FROM student";
					
					// 위의 쿼리 준비
					pstmtCountTotalRecordsBySearchValue = conn.prepareStatement(sqlSelectForFindLastPage);
				
				// 검색어가 존재하면
				} else {
					// student_name 컬럼의 값에 searchValue의 값이 포함(LIKE)되어 있을 때 조회되는 레코드의 수를 구하는 쿼리
					String sqlSelectForFindLastPage = "SELECT COUNT(*) as total_records FROM student WHERE student_name LIKE ?";
					
					// 위의 쿼리 준비
					pstmtCountTotalRecordsBySearchValue = conn.prepareStatement(sqlSelectForFindLastPage);
					
					pstmtCountTotalRecordsBySearchValue.setString(1, "%" + searchValue + "%");
				}
				// 위의 쿼리 실행
				rsCountTotalRecordsBySearchValue = pstmtCountTotalRecordsBySearchValue.executeQuery();
				
				// 다음 레코드가 존재한다면
				if(rsCountTotalRecordsBySearchValue.next()) {
					totalRecordsBySelect = rsCountTotalRecordsBySearchValue.getInt("total_records");
				}
			} catch (ClassNotFoundException classException) {
				System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
			} catch (SQLException sqlException) {
				System.out.println("DB와 관련된 예외가 발생하였습니다!");
				sqlException.printStackTrace();
			} finally {
				// 객체를 종료하는 부분
				if(rsCountTotalRecordsBySearchValue != null) {
					try {
						rsCountTotalRecordsBySearchValue.close();
					} catch (SQLException sqlException){
						System.out.println("rsSelectForCount 객체 종료 중 예외 발생");
						
						// 예외가 발생한 부분을 출력해줌.
						sqlException.printStackTrace();
					}
				}
				if(pstmtCountTotalRecordsBySearchValue != null) {
					try {
						pstmtCountTotalRecordsBySearchValue.close();
					} catch (SQLException sqlException){
						System.out.println("pstmt1 객체 종료 중 예외 발생");
						
						// 예외가 발생한 부분을 출력해줌.
						sqlException.printStackTrace();
					}
				}
				if(conn != null) {
					try {
						conn.close();
					} catch (SQLException sqlException){
						System.out.println("conn 객체 종료 중 예외 발생");
						
						// 예외가 발생한 부분을 출력해줌.
						sqlException.printStackTrace();
					}
				}
			}	
			return totalRecordsBySelect;
		}
}
