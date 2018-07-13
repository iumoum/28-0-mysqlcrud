
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.DriverManager;
import service.StudentAddr;
import java.sql.ResultSet;
public class StudentAddrDao {
	
	public void updateStudentAddr(StudentAddr studentAddr) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement("UPDATE student_address SET student_address_content = ? WHERE student_no = ?");
			pstmt.setString(1, studentAddr.getStudentAddrContent());
			pstmt.setInt(2, studentAddr.getStudentNo());
			
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
	// student_address 테이블의 특정 레코드를 조회하는 메서드
		// 매개변수로 교사 번호를 입력 받음. 특정 레코드를 가리키기 위함
		// 리턴 데이터는 arrayListStudentAddr 리스트이다. 조회한 결과를 VO에 담고 그것을 또 리스트에 담아 보내는 형태
		public ArrayList<StudentAddr> selectStudentAddress(int studentNo){
			Connection conn = null;
			PreparedStatement pstmtSelectStudentAddress = null;
			ResultSet rsSelectStudentAddress = null;
			StudentAddr studentAddr = null;
			ArrayList<StudentAddr> arrayListStudentAddr = new ArrayList<StudentAddr>();
			
			// studentList.jsp로 부터 studentNo값을 잘 전달 받았는지 테스트
			System.out.println("studentNo, studentList.jsp => StudentAddrDao.java " + studentNo);
			
			// student_address 테이블의 특정 레코드를 조회하는 쿼리
			String sqlSelectStudentAddress = "SELECT student_address_no, student_no,student_address_content FROM student_address WHERE student_no = ?";
			
			try {
				// mysql 드라이버 로딩
				Class.forName("com.mysql.jdbc.Driver");
				
				// DB 연결 
				String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
				String dbUser = "root";
				String dbPw = "java0000";
				conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
				// 위의 쿼리 준비
				pstmtSelectStudentAddress = conn.prepareStatement(sqlSelectStudentAddress);
				
				// ?에 값 대입
				pstmtSelectStudentAddress.setInt(1, studentNo);
				
				// 위의 쿼리 실행
				rsSelectStudentAddress = pstmtSelectStudentAddress.executeQuery();
				
				while(rsSelectStudentAddress.next()) {
					// studentAddr 객체 생성
					studentAddr = new StudentAddr();
					
					// studentAddr 객체 내부 멤버변수에 조회된 데이터들을 각각 대입
					studentAddr.setStudentAddrNo(rsSelectStudentAddress.getInt("student_address_no"));
					studentAddr.setStudentNo(rsSelectStudentAddress.getInt("student_no"));
					studentAddr.setStudentAddrContent(rsSelectStudentAddress.getString("student_address_content"));
					
					arrayListStudentAddr.add(studentAddr);
				}
			} catch (ClassNotFoundException classException) {
				System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
			} catch (SQLException sqlException) {
				System.out.println("DB와 관련된 예외가 발생하였습니다!");
				sqlException.printStackTrace();
			} finally {
				// 객체를 종료하는 부분
				if(rsSelectStudentAddress != null) {
					try {
						rsSelectStudentAddress.close();
					} catch (SQLException sqlException){
						System.out.println("rsSelectForCount 객체 종료 중 예외 발생");
						
						// 예외가 발생한 부분을 출력해줌.
						sqlException.printStackTrace();
					}
				}
				if(pstmtSelectStudentAddress != null) {
					try {
						pstmtSelectStudentAddress.close();
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
			// arrayListStudentAddr 리스트 반환
			return arrayListStudentAddr;
		}
	public StudentAddr updateStudentAddrSelect(String sendNo) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudentAddr studentAddr = new StudentAddr();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement("SELECT * FROM student_address where student_no = ?");
			pstmt.setString(1, sendNo);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				studentAddr.setStudentAddrNo(rs.getInt("student_address_no"));
				studentAddr.setStudentNo(rs.getInt("student_no"));
				studentAddr.setStudentAddrContent(rs.getString("student_address_content"));
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
		return studentAddr;
	}
	
	//리턴 타입 void로 DeleteAddr 메서드를 선언한다. 매겨변수는 String 데이터 타입인 sendNo를 선언.
	public void DeleteAddr(String sendNo) {
		//객체 초기값 설정.
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		try {
			//db연결 준비.
			Class.forName("com.mysql.jdbc.Driver");

			String jdbcDriver = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
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
			String jdbcDriver = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
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
				stu.setStudentAddrContent(rs.getString("student_address_content"));
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
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
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
		
	
	
			String jdbcDriver = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			//student_address 테이블 내에 student_no, student_address_content만 입력.
			pstmt = conn.prepareStatement("INSERT INTO student_address(student_no, student_address_content) values(?, ?)");
			pstmt.setInt(1,sa.getStudentNo());
			pstmt.setString(2, sa.getStudentAddrContent());
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
