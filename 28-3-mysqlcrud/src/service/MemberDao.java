/*18.06.26 28기 정규룡*/
package service; // 패키지 이름이 service

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.ResultSet;
import service.Member;	// 위의 페이지들을 import하여 안에 있는 메서드나 변수 사용

public class MemberDao {	// 클래스명
	/*	
	 	CREATE TABLE `member` (
			`member_no` INT(10) NOT NULL,
			`member_name` VARCHAR(50) NULL DEFAULT NULL,
			`member_age` INT(11) NULL DEFAULT NULL,
			PRIMARY KEY (`member_no`)
		);
		
		Member 클레스데이터 타입인 member변수에 각각의 항에 들어갈 값들을 담는 메서드와 담은 값을 사용하는 메서드가 있어서
		여러개의 값으로 각 항목들을 채운다.
	*/
	public void InsertMember(Member member) {	// member테이블에 항 행을 추가 하기 위한 메서드
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 지역변수 초기화
		
			try {
				Class.forName("com.mysql.jdbc.Driver"); // jdbc 시작
				
				String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
				String dbUser = "root";
				String dbPass = "java0000";
				// DB와 연결 하기 위해서 데이터베이스 주소, 사용자 아이디, 사용자 비밀번호를 변수선언 후 대입시킨다.
							
				conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); 
				// DB 연결
				
				pstmt = conn.prepareStatement("INSERT INTO member(member_no, member_name, member_age) VALUES (?, ?, ?)");
				// Insert쿼리
				pstmt.setInt(1, maxNum());
				pstmt.setString(2, member.getMemberName());
				pstmt.setInt(3, member.getMemberAge());
				pstmt.executeUpdate();
				
				/*System.out.println(pstmt +"<-- pstmt 쿼리문");*/ 
				//쿼리문 확인
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace(); // 오류 발생 시 오류를 출력하는 메서드
				System.out.println("JDBC 시작을 할 수 없습니다 확인해주세요.");
			}	
			catch (SQLException e) {
				e.printStackTrace(); // 오류 발생 시 오류를 출력하는 메서드
				System.out.println("쿼리문을 시작할 수 없습니다. 확인해주세요.");
			} finally{
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}
				// pstmt,Connection 객체 종료(close())
			}
	}
	
	public int maxNum() {
		Connection conn = null;
		PreparedStatement pstmtMaxNo = null;
		ResultSet rsMaxNo = null;
		int Num = 0;
		// 지역변수 초기화
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); // jdbc 시작
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			// DB와 연결 하기 위해서 데이터베이스 주소, 사용자 아이디, 사용자 비밀번호를 변수선언 후 대입시킨다.
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); 
			// DB 연결
			
			pstmtMaxNo = conn.prepareStatement("SELECT MAX(member_no) as Max FROM member");
			// member테이블에서 member_no의 값 중 가장 큰 값을 구하는 쿼리
			rsMaxNo = pstmtMaxNo.executeQuery();
			
			if (rsMaxNo.next()) { // MAX값이 null이면 Member_no에 MAX+1 값을 넣고 없으면 1을 넣는다.
				if (rsMaxNo.getString("MAX") != null) {
					Num = Integer.parseInt(rsMaxNo.getString("MAX")) + 1;
				} else {
					Num = 1;
				}
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // 오류 발생 시 오류를 출력하는 메서드
			System.out.println("JDBC 시작을 할 수 없습니다 확인해주세요.");
		} 
		catch (SQLException e) {
			e.printStackTrace(); // 오류 발생 시 오류를 출력하는 메서드
			System.out.println("쿼리문을 시작할 수 없습니다. 확인해주세요.");
		}  finally{
			if (pstmtMaxNo != null) try { pstmtMaxNo.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			// pstmt,Connection 객체 종료(close())
		}
		
		
		return Num;
	}
	
	public ArrayList<Member> selectMemberAll(int startPage, int pagePerRow) {
		ArrayList<Member> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		/*ArrayList<Member> selectMemberPage();*/
		String sql = "SELECT member_no, member_name, member_age FROM member ORDER BY member_no LIMIT ?, ?";
				
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); 
						
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startPage);
			pstmt.setInt(2, pagePerRow);
			
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next()){
				Member m = new Member();
				int dbno = resultSet.getInt("member_no");
				String dbname = resultSet.getString("member_name");
				int dbage = resultSet.getInt("member_age");
				
		
				m.setMemberNo(dbno);
				m.setMemberName(dbname);
				m.setMemberAge(dbage);
				list.add(m);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("JDBC 시작을 할 수 없습니다 확인해주세요.");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("쿼리문을 시작할 수 없습니다. 확인해주세요.");
		}
		
		return list;
	}
	
	public int totalRow() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		String sql = "SELECT COUNT(member_no) FROM member";
		int totalRow = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); 
						
			pstmt = conn.prepareStatement(sql);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				totalRow=resultSet.getInt("COUNT(notice_no)");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return totalRow;		
	}
	

}

