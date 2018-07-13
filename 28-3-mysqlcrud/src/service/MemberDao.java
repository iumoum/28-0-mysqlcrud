// 2018.7.13 김지완(정규룡 예비군으로 인한 업무대행) 
package service;

import java.util.ArrayList;
import java.sql.*;
import service.*;


public class MemberDao {
	
	/*CREATE TABLE `member` (
			`member_no` INT(10) NOT NULL,
			`member_name` VARCHAR(50) NOT NULL,
			`member_age` INT(10) NOT NULL,
			PRIMARY KEY (`member_no`)
	  )  */
	
	// member 테이블의 특정 레코드를 수정하는 메서드
	// 매개변수는 member 객체를 입력 받음. updateForm 으로 부터 넘겨받은 값들이 담긴 VO
	// 리턴 데이터 타입 void
	public void updateMember(Member member) {
		Connection conn = null;
		PreparedStatement pstmtUpdateMember = null;
		
		// memberList.jsp로 부터 member 객체를 잘 전달 받았는지 테스트
		System.out.println("memberNo, updateMember => " + member.getMemberNo());
		System.out.println("memberName, updateMember => " + member.getMemberName());
		System.out.println("memberAge, updateMember => " + member.getMemberAge());
		
		// member 테이블의 특정 레코드를 수정하는 쿼리
		String sqlUpdateMember = "UPDATE member SET member_name = ?, member_age = ? WHERE member_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 위의 쿼리 준비
			pstmtUpdateMember = conn.prepareStatement(sqlUpdateMember);
			
			// ?에 값 대입
			pstmtUpdateMember.setString(1, member.getMemberName());
			pstmtUpdateMember.setInt(2, member.getMemberAge());
			pstmtUpdateMember.setInt(3, member.getMemberNo());
			
			// 쿼리 실행 및 수정된 레코드 수 출력
			System.out.println("수정된 레코드 수 : " + pstmtUpdateMember.executeUpdate());
			
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtUpdateMember != null) {
				try {
					pstmtUpdateMember.close();
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
	}

	// member 테이블의 특정 레코드를 조회하여 VO에 담아 리턴하는 메서드
	// 매개변수로는 교사 번호. 특정 레코드를 가리키기 위함
	// 리턴 데이터 타입은 Member 클래스 데이터 타입. VO 담아 리턴하기 위함
	public Member selectForUpdateMember(int memberNo) {
		Connection conn = null;
		PreparedStatement pstmtSelectForUpdateMember = null;
		ResultSet rsSelectForUpdateMember = null;
		Member member = null;
		
		// memberList.jsp로 부터 memberNo값을 잘 전달 받았는지 테스트
		System.out.println("memberNo, memberList.jsp => MemberDao.java " + memberNo);
		
		// member 테이블의 특정 레코드를 조회하는 쿼리
		String sqlSelectForUpdateMember = "SELECT member_no,member_name,member_age FROM member WHERE member_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 위의 쿼리 준비
			pstmtSelectForUpdateMember = conn.prepareStatement(sqlSelectForUpdateMember);
			
			// ?에 값 대입
			pstmtSelectForUpdateMember.setInt(1, memberNo);
			
			// 쿼리 실행
			rsSelectForUpdateMember = pstmtSelectForUpdateMember.executeQuery();
			
			// 조회된 결과가 있다면
			if(rsSelectForUpdateMember.next()) {
				member = new Member();
				
				// member 객체 내부에 조회된 각각의 데이터를 대입
				member.setMemberNo(rsSelectForUpdateMember.getInt("member_no"));
				member.setMemberName(rsSelectForUpdateMember.getString("member_name"));
				member.setMemberAge(rsSelectForUpdateMember.getInt("member_age"));
			} else {
				System.out.println("해당 데이터가 더 이상 존재하지 않습니다.");
			}
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsSelectForUpdateMember != null) {
				try {
					rsSelectForUpdateMember.close();
				} catch (SQLException sqlException){
					System.out.println("pstmt1 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtSelectForUpdateMember != null) {
				try {
					pstmtSelectForUpdateMember.close();
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
		return member;
	}
	
	// Member 테이블의 특정 레코드를 삭제하는 메서드
	// 매개변수는 교사번호를 입력받음. 특정 레코드를 가리키기 위함
	// 리턴 데이터 타입은 없다.
	public void deleteMember(int memberNo) {
		Connection conn = null;
		PreparedStatement pstmtDeleteMember = null;
		
		// memberList.jsp로 부터 memberNo값을 잘 전달 받았는지 테스트
		System.out.println("memberNo, memberList.jsp => MemberDao.java " + memberNo);
		
		// member 테이블의 특정 레코드를 삭제하는 쿼리
		String sqlDeleteMember = "DELETE FROM member WHERE member_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 위의 쿼리 준비
			pstmtDeleteMember = conn.prepareStatement(sqlDeleteMember);
			
			// ?에 값 대입
			pstmtDeleteMember.setInt(1, memberNo);
			
			// 위의 쿼리 실행 및 삭제된 레코드의 수 출력
			System.out.println("삭제된 레코드의 수 : " + pstmtDeleteMember.executeUpdate());
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtDeleteMember != null) {
				try {
					pstmtDeleteMember.close();
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
	}
	
	// memberList의 마지막 페이지를 구하기 위해 레코드의 총 갯수를 조회하는 메서드
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
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 검색어가 존재하지 않으면 전체보기
			if(searchValue.equals("")) {
				// member 테이블의 전체 레코드 갯수를 조회하는 쿼리
				String sqlSelectForFindLastPage = "SELECT COUNT(*) as total_records FROM member";
				
				// 위의 쿼리 준비
				pstmtCountTotalRecordsBySearchValue = conn.prepareStatement(sqlSelectForFindLastPage);
			
			// 검색어가 존재하면
			} else {
				// member_name 컬럼의 값에 searchValue의 값이 포함(LIKE)되어 있을 때 조회되는 레코드의 수를 구하는 쿼리
				String sqlSelectForFindLastPage = "SELECT COUNT(*) as total_records FROM member WHERE member_name LIKE ?";
				
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
	
	// member 테이블의 레코드를 페이징 조건에 따라 조회하여 ArrayList 데이터 타입으로 리턴하는 메서드
	// 매개변수는 페이징 조건인 startPoint와 rowPerPage를 입력받음 (쿼리문에 대입하기 위하여)
	// 리턴 데이터 타입은 ArrayList<Member> (Member 클래스 데이터 타입을 저장할 수 있는 클래스 배열)
	public ArrayList<Member> selectMemberByPage(int currentPage, int rowPerPage, String searchValue){
		Connection conn = null;
		PreparedStatement pstmtSelectMemberByPage = null;
		ResultSet rsSelectMemberByPage = null;
		ArrayList<Member> arrayListMember = new ArrayList<Member>();
		
		int startPoint = (currentPage - 1) * rowPerPage;
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 검색 내용 부분이 공백일 경우(즉, 전체보기)
			if(searchValue.equals("")) {
				// member 테이블의 member_no, member_name, member_age 컬럼의 값을 LIMIT 옵션에 따라 조회하는 쿼리 
				String sqlSelectMemberByPage = "SELECT member_no, member_name, member_age FROM member ORDER BY member_no DESC LIMIT ?, ?";
				
				pstmtSelectMemberByPage = conn.prepareStatement(sqlSelectMemberByPage);
				
				pstmtSelectMemberByPage.setInt(1, startPoint);
				pstmtSelectMemberByPage.setInt(2, rowPerPage);
			} else {
				// 검색한 이름에 따라 member 테이블의 member_no, member_name, member_age 컬럼의 값을 LIMIT 옵션에 따라 조회하는 쿼리 
				String sqlSelectMemberByPage = "SELECT member_no, member_name, member_age FROM member WHERE member_name LIKE ? ORDER BY member_no DESC LIMIT ?, ?";
				
				pstmtSelectMemberByPage = conn.prepareStatement(sqlSelectMemberByPage);
				
				// ?에 값 대입
				pstmtSelectMemberByPage.setString(1, "%" + searchValue + "%");
				pstmtSelectMemberByPage.setInt(2, startPoint);
				pstmtSelectMemberByPage.setInt(3, rowPerPage);
			}
			
			// 위의 쿼리 실행
			rsSelectMemberByPage = pstmtSelectMemberByPage.executeQuery();
			
			// 다음 레코드가 존재한다면
			while(rsSelectMemberByPage.next()) {
				// member 객체 생성
				Member member = new Member();
				
				// member 객체 내부 멤버변수에 값을 대입
				member.setMemberNo(rsSelectMemberByPage.getInt("member_no"));
				member.setMemberName(rsSelectMemberByPage.getString("member_name"));
				member.setMemberAge(rsSelectMemberByPage.getInt("member_age"));
				
				arrayListMember.add(member);
			}
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsSelectMemberByPage != null) {
				try {
					rsSelectMemberByPage.close();
				} catch (SQLException sqlException){
					System.out.println("rsSelectForCount 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtSelectMemberByPage != null) {
				try {
					pstmtSelectMemberByPage.close();
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
		return arrayListMember;
	}
	
	// member 테이블에 한 행을 추가하는 메서드
	// 매개변수로 member 테이블에 추가할 한 행의 레코드를 전달
	// 리턴 데이터 타입은 void로 정했다. 
	public void insertMember(Member member) {
		// 객체참조변수 선언
		Connection conn = null;
		PreparedStatement pstmtInsertMember = null;
		ResultSet rsSelectForCount = null;
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			// 이부분을 클래스를 통해 객체로 만들어서 구현 할 수도 있지 않을까 ?
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
	
			// memberNo 안의 값 테스트
			System.out.println("memberNo from memberDTO: " + member.getMemberNo());
			
			// member 테이블에 레코드를 삽입하는 쿼리 준비
			String sqlInsertMember = "INSERT INTO member(member_name,member_age) VALUES(?,?)";
			pstmtInsertMember = conn.prepareStatement(sqlInsertMember);
			
			// ?에 값 대입
			pstmtInsertMember.setString(1, member.getMemberName());
			pstmtInsertMember.setInt(2, member.getMemberAge());
			
			// 레코드 삽입 쿼리 실행
			// 실행 후 반환 되는 값은 해당 쿼리로 인해 변동되는(?) 행의 갯수 (예를 들어 삽입되는 행의 갯수)
			int resultUpdate = pstmtInsertMember.executeUpdate();
			
			// 삽입되는 레코드의 갯수 출력
			System.out.println("member 테이블에 삽입된 행 갯수 : " + resultUpdate);
			
		// 예외가 발생한다면 아래의 catch 블록 내부의 명령 실행.
			
		// ClassNotFoundException 은 Class.forName() 메서드에 매개변수로 대입된 클래스를 찾을 수 없을 때
		} catch(ClassNotFoundException classException){
			System.out.println("해당 DB Driver 클래스를 찾을 수 없습니다.");
		
		// SQLException 은 데이터베이스와 관련된 오류가 있을 때
		} catch(SQLException sqlException){
			System.out.println("SQL 오류가 생겼습니다.");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsSelectForCount != null) {
				try {
					rsSelectForCount.close();
				} catch (SQLException sqlException){
					System.out.println("rsSelectForCount 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtInsertMember != null) {
				try {
					pstmtInsertMember.close();
				} catch (SQLException sqlException){
					System.out.println("pstmt2 객체 종료 중 예외 발생");
					
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
	}
}
