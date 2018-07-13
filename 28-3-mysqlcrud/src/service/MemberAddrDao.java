// 2018.7.13 김지완(정규룡 예비군으로 인한 업무대행) 
package service;

import java.util.ArrayList;
import java.sql.*;
import service.*;

public class MemberAddrDao {
	/*
	 * 	member_address 테이블
	 * 
	   CREATE TABLE `member_address` (
			`member_address_no` INT(11) NOT NULL AUTO_INCREMENT,
			`member_no` INT(11) NOT NULL,
			`member_address_content` VARCHAR(50) NOT NULL,
			PRIMARY KEY (`member_address_no`),
			INDEX `FK_member_address_member` (`member_no`),
			CONSTRAINT `FK_member_address_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
		)*/
	
	// member_address 테이블의 특정 레코드를 수정하는 메서드
	// 매개변수는 memberAddr 객체를 입력 받음. updateForm 으로 부터 넘겨받은 값들이 담긴 VO
	// 리턴 데이터 타입 void
	public void updateMemberAddress(MemberAddr memberAddr) {
		Connection conn = null;
		PreparedStatement pstmtUpdateMemberAddress = null;
		
		// memberList.jsp로 부터 member 객체를 잘 전달 받았는지 테스트
		System.out.println("memberAddressNo, updateMemberAddress => " + memberAddr.getMemberAddrNo());
		System.out.println("memberNo, updateMemberAddress => " + memberAddr.getMemberNo());
		System.out.println("memberAddrContent, updateMemberAddress => " + memberAddr.getMemberAddrContent());
		
		
		// member_address 테이블의 특정 레코드를 수정하는 쿼리
		String sqlUpdateMemberAddress = "UPDATE member_address SET member_address_content = ? WHERE member_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 위의 쿼리 준비
			pstmtUpdateMemberAddress = conn.prepareStatement(sqlUpdateMemberAddress);
			
			// ?에 값 대입
			pstmtUpdateMemberAddress.setString(1, memberAddr.getMemberAddrContent());
			pstmtUpdateMemberAddress.setInt(2, memberAddr.getMemberNo());
			
			// 쿼리 실행 및 수정된 레코드 수 출력
			System.out.println("수정된 레코드 수 : " + pstmtUpdateMemberAddress.executeUpdate());
			
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtUpdateMemberAddress != null) {
				try {
					pstmtUpdateMemberAddress.close();
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

	// member_address 테이블의 특정 레코드를 조회하여 VO에 담아 리턴하는 메서드
	// 매개변수로는 교사 번호. 특정 레코드를 가리키기 위함
	// 리턴 데이터 타입은 MemberAddr 클래스 데이터 타입. VO 담아 리턴하기 위함
	public MemberAddr selectForUpdateMemberAddress(int memberAddressNo) {
		Connection conn = null;
		PreparedStatement pstmtSelectForUpdateMemberAddress = null;
		ResultSet rsSelectForUpdateMemberAddress = null;
		MemberAddr memberAddr = null;
		
		// memberAddrList.jsp로 부터 memberNo값을 잘 전달 받았는지 테스트
		System.out.println("memberAddressNo, memberAddrList.jsp => MemberAddrDao.java " + memberAddressNo);
		
		// member 테이블의 특정 레코드를 조회하는 쿼리
		String sqlSelectForUpdateMemberAddress = "SELECT member_address_no,member_no,member_address_content FROM member_address WHERE member_address_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 위의 쿼리 준비
			pstmtSelectForUpdateMemberAddress = conn.prepareStatement(sqlSelectForUpdateMemberAddress);
			
			// ?에 값 대입
			pstmtSelectForUpdateMemberAddress.setInt(1, memberAddressNo);
			
			// 쿼리 실행
			rsSelectForUpdateMemberAddress = pstmtSelectForUpdateMemberAddress.executeQuery();
			
			// 조회된 결과가 있다면
			if(rsSelectForUpdateMemberAddress.next()) {
				memberAddr = new MemberAddr();
				
				// memberAddr 객체 내부에 조회된 각각의 데이터를 대입
				memberAddr.setMemberAddrNo(rsSelectForUpdateMemberAddress.getInt("member_address_no"));
				memberAddr.setMemberNo(rsSelectForUpdateMemberAddress.getInt("member_no"));
				memberAddr.setMemberAddrContent(rsSelectForUpdateMemberAddress.getString("member_address_content"));
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
			if(rsSelectForUpdateMemberAddress != null) {
				try {
					rsSelectForUpdateMemberAddress.close();
				} catch (SQLException sqlException){
					System.out.println("pstmt1 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtSelectForUpdateMemberAddress != null) {
				try {
					pstmtSelectForUpdateMemberAddress.close();
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
		return memberAddr;
	}

	// member_address 테이블의 특정 레코드를 삭제하는 메서드
	// 매개변수로 주소 번호를 입력받음. 특정 레코드를 가리키기 위함
	// 리턴 데이터 타입은 void.
	public void deleteMemberAddress(int memberAddressNo) {
		Connection conn = null;
		PreparedStatement pstmtDeleteMemberAddress = null;
		
		// memberAddrList.jsp로 부터 memberAddressNo값을 잘 전달 받았는지 테스트
		System.out.println("memberAddressNo, memberAddrList.jsp => MemberAddrDao.java " + memberAddressNo);
		
		// member_address 테이블의 특정 레코드를 삭제하는 쿼리
		String sqlDeleteMemberAddress = "DELETE FROM member_address WHERE member_address_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 위의 쿼리 준비
			pstmtDeleteMemberAddress = conn.prepareStatement(sqlDeleteMemberAddress);
			
			// ?에 값 대입
			pstmtDeleteMemberAddress.setInt(1, memberAddressNo);
			
			// 위의 쿼리 실행 및 삭제된 레코드의 수 출력
			System.out.println("삭제된 레코드의 수 : " + pstmtDeleteMemberAddress.executeUpdate());
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtDeleteMemberAddress != null) {
				try {
					pstmtDeleteMemberAddress.close();
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
	
	// member_address 테이블의 특정 레코드를 조회하는 메서드
	// 매개변수로 교사 번호를 입력 받음. 특정 레코드를 가리키기 위함
	// 리턴 데이터는 arrayListMemberAddr 리스트이다. 조회한 결과를 VO에 담고 그것을 또 리스트에 담아 보내는 형태
	public ArrayList<MemberAddr> selectMemberAddress(int memberNo){
		Connection conn = null;
		PreparedStatement pstmtSelectMemberAddress = null;
		ResultSet rsSelectMemberAddress = null;
		MemberAddr memberAddr = null;
		ArrayList<MemberAddr> arrayListMemberAddr = new ArrayList<MemberAddr>();
		
		// memberList.jsp로 부터 memberNo값을 잘 전달 받았는지 테스트
		System.out.println("memberNo, memberList.jsp => MemberAddrDao.java " + memberNo);
		
		// member_address 테이블의 특정 레코드를 조회하는 쿼리
		String sqlSelectMemberAddress = "SELECT member_address_no, member_no,member_address_content FROM member_address WHERE member_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 위의 쿼리 준비
			pstmtSelectMemberAddress = conn.prepareStatement(sqlSelectMemberAddress);
			
			// ?에 값 대입
			pstmtSelectMemberAddress.setInt(1, memberNo);
			
			// 위의 쿼리 실행
			rsSelectMemberAddress = pstmtSelectMemberAddress.executeQuery();
			
			while(rsSelectMemberAddress.next()) {
				// memberAddr 객체 생성
				memberAddr = new MemberAddr();
				
				// memberAddr 객체 내부 멤버변수에 조회된 데이터들을 각각 대입
				memberAddr.setMemberAddrNo(rsSelectMemberAddress.getInt("member_address_no"));
				memberAddr.setMemberNo(rsSelectMemberAddress.getInt("member_no"));
				memberAddr.setMemberAddrContent(rsSelectMemberAddress.getString("member_address_content"));
				
				arrayListMemberAddr.add(memberAddr);
			}
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsSelectMemberAddress != null) {
				try {
					rsSelectMemberAddress.close();
				} catch (SQLException sqlException){
					System.out.println("rsSelectForCount 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtSelectMemberAddress != null) {
				try {
					pstmtSelectMemberAddress.close();
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
		// arrayListMemberAddr 리스트 반환
		return arrayListMemberAddr;
	}
	
	// member_address 테이블에 레코드를 추가하는 메서드
	// 매개변수로 MemberAddr 객체의 참조값을 전달 받는다. (폼으로 넘겨받은 값을 담은 객체이다.)
	// 리턴 데이터 타입은 void
	public void insertMemberAddress(MemberAddr memberAddr) {
		Connection conn = null;
		PreparedStatement pstmtInsertMemberAddress = null;
		
		// insertMemberAddrAction.jsp로 부터 memberAddr 객체의 참조 값을 잘 전달 받았는지 테스트
		System.out.println("memberNo, insertMemberAddrAction => MemberAddrDao.java " + memberAddr.getMemberNo());
		System.out.println("memberAddrContent, insertMemberAddrAction => MemberAddrDao.java " + memberAddr.getMemberAddrContent());
		
		// member_address 테이블에 레코드를 추가하는 쿼리
		String sqlInsertMemberAddress = "INSERT INTO member_address(member_no,member_address_content) VALUES(?, ?)";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 실행 준비
			pstmtInsertMemberAddress = conn.prepareStatement(sqlInsertMemberAddress);
			
			// ? 에 값 대입
			pstmtInsertMemberAddress.setInt(1, memberAddr.getMemberNo());
			pstmtInsertMemberAddress.setString(2, memberAddr.getMemberAddrContent());
			
			// 해당 쿼리 실행 및 해당 쿼리로 인해 삽입 된 레코드 수 출력
			System.out.println("삽입된 레코드 수 : " + pstmtInsertMemberAddress.executeUpdate());
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 있는지 확인하세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtInsertMemberAddress != null) {
				try {
					pstmtInsertMemberAddress.close();
				} catch (SQLException sqlException){
					System.out.println("pstmtInsertMemberAddress 객체 종료 중 예외 발생");
					
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
