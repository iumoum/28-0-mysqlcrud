// 2018.7.13 김지완(정규룡 예비군으로 인한 업무대행) 
package service;

import java.util.ArrayList;
import java.sql.*;
import service.*;

public class MemberScoreDao {
	// 교사들의 평균 점수보다 높은 점수를 가진 교사의 수를 조회하는 메서드
	// 리턴 되는 데이터는 교사의 수이다.
	public int countMemberWhoseScoreisAboveAvg(){
		// 필요한 객체참조변수 생성
		PreparedStatement pstmtCountMemberWhoseScoreisAboveAvg = null;
		ResultSet rsCountMemberWhoseScoreisAboveAvg = null;
		int memberWhoseScoreIsAboveAvg = 0;
		Connection conn = null;
	
		// 교사들의 평균 점수보다 높은 점수를 가진 교사들의 수를 조회하는 쿼리
		String sqlCountMemberWhoseScoreisAboveAvg = "SELECT COUNT(*) as member_whose_score_is_above_average FROM member_score WHERE score >= (SELECT AVG(score) FROM member_score)";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 실행 준비
			pstmtCountMemberWhoseScoreisAboveAvg = conn.prepareStatement(sqlCountMemberWhoseScoreisAboveAvg);
				
			// 쿼리 실행 
			rsCountMemberWhoseScoreisAboveAvg = pstmtCountMemberWhoseScoreisAboveAvg.executeQuery();
			
			if (rsCountMemberWhoseScoreisAboveAvg.next()) {
				memberWhoseScoreIsAboveAvg = rsCountMemberWhoseScoreisAboveAvg.getInt("member_whose_score_is_above_average");
			}
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 있는지 확인하세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsCountMemberWhoseScoreisAboveAvg != null) {
				try {
					rsCountMemberWhoseScoreisAboveAvg.close();
				} catch (SQLException sqlException){
					System.out.println("pstmtInsertMemberAddress 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtCountMemberWhoseScoreisAboveAvg != null) {
				try {
					pstmtCountMemberWhoseScoreisAboveAvg.close();
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
		return memberWhoseScoreIsAboveAvg;
	}
	
	// 교사들의 평균 점수를 구하는 메서드
	// 조회되는 평균 점수를 리턴한다.
	public int findAvgScore(){
		Connection conn = null;
		PreparedStatement pstmtFindAvgScore = null;
		ResultSet rsFindAvgScore = null;
		int memberAvgScore = 0;
		
		// 교사들의 평균 점수를 구하는 쿼리
		String sqlFindAvgScore = "SELECT AVG(score) as member_avg_score FROM member_score";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 실행 준비
			pstmtFindAvgScore = conn.prepareStatement(sqlFindAvgScore);
				
			// 쿼리 실행 
			rsFindAvgScore = pstmtFindAvgScore.executeQuery();
			
			if (rsFindAvgScore.next()) {
				memberAvgScore = rsFindAvgScore.getInt("member_avg_score");
			}
	
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 있는지 확인하세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsFindAvgScore != null) {
				try {
					rsFindAvgScore.close();
				} catch (SQLException sqlException){
					System.out.println("pstmtInsertMemberAddress 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtFindAvgScore != null) {
				try {
					pstmtFindAvgScore.close();
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
		return memberAvgScore;
	}
	
	// 교사들의 평균 점수보다 높은 점수를 가진 교사를 조회하는 메서드
	// 리턴 되는 데이터는 memberAndMemberScore 객체의 참조 값이 담긴 리스트이다.
	public ArrayList<MemberAndMemberScore> selectScoreAboveAvgByPage(int currentPage, int rowPerPage){
		// 필요한 객체참조변수 생성
		ArrayList<MemberAndMemberScore> arrayListScoreAboveAvg = new ArrayList<MemberAndMemberScore>();
		PreparedStatement pstmtSelectScoreAboveAvg = null;
		ResultSet rsSelectScoreAboveAvg = null;
		Connection conn = null;
	
		int startPoint = (currentPage - 1) * rowPerPage;
		
		// 교사들의 평균 점수보다 높은 점수를 가진 교사들을 조회하는 쿼리
		String sqlSelectScoreAboveAvg = "SELECT t.member_no, t.member_name, ts.score FROM member_score ts INNER JOIN member t on t.member_no = ts.member_no WHERE score >= (SELECT AVG(score) FROM member_score) ORDER BY score DESC LIMIT ?, ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 실행 준비
			pstmtSelectScoreAboveAvg = conn.prepareStatement(sqlSelectScoreAboveAvg);
			
			pstmtSelectScoreAboveAvg.setInt(1, startPoint);
			pstmtSelectScoreAboveAvg.setInt(2, rowPerPage);
				
			// 쿼리 실행 
			rsSelectScoreAboveAvg = pstmtSelectScoreAboveAvg.executeQuery();
			
			while (rsSelectScoreAboveAvg.next()) {
				MemberAndMemberScore memberAndMemberScore = new MemberAndMemberScore();
				MemberScore memberScore = new MemberScore();
				Member member = new Member();
				
				// member 객체 내부 데이터 영역에 조회된 각각의 값(교사 번호, 교사이름)을 대입
				member.setMemberNo(rsSelectScoreAboveAvg.getInt("member_no"));
				member.setMemberName(rsSelectScoreAboveAvg.getString("member_name"));
				
				// memberScore 객체 내부 데이터 영역에 조회된 각각의 값(교사 점수)을 대입
				memberScore.setScore(rsSelectScoreAboveAvg.getInt("score"));
				
				// memberAndMemberScore 객체 내부 데이터 영역에 필요한 정보들로 채워진 객체의 참조 값을 대입
				memberAndMemberScore.setMember(member);
				memberAndMemberScore.setMemberScore(memberScore);
				
				// memberAndMemberScore 객체를 arrayListScoreAboveAvg 리스트에 자동으로 추가 
				arrayListScoreAboveAvg.add(memberAndMemberScore);
			}
	
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 있는지 확인하세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtSelectScoreAboveAvg != null) {
				try {
					pstmtSelectScoreAboveAvg.close();
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
		return arrayListScoreAboveAvg;
	}
	
	// member_score 테이블의 특정 레코드를 수정하는 메서드
	// 특정 레코드를 가리키고 수정내용을 입력하기위해 매개변수로 memberScore 객체의 참조값을 입력 받음
	// 아무것도 리턴하지 않겠다
	public void updateMemberScore (MemberScore memberScore) {
		Connection conn = null;
		PreparedStatement pstmtUpdateMemberScore = null;
		
		// updateMemberScore.jsp로 부터 memberScore 객체의 참조 값을 잘 전달 받았는지 테스트
		System.out.println("memberScore, updateMemberScore.jsp => MemberScoreDao.java " + memberScore);
		
		// member_score 테이블의 특정 레코드를 수정하는 쿼리
		String sqlUpdateMemberScore = "UPDATE member_score SET score = ? WHERE member_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 실행 준비
			pstmtUpdateMemberScore = conn.prepareStatement(sqlUpdateMemberScore);
			
			// ? 에 값 대입
			pstmtUpdateMemberScore.setInt(1,memberScore.getScore());
			pstmtUpdateMemberScore.setInt(2,memberScore.getMemberNo());
			
			// 쿼리 실행 및 수정된 레코드 갯수 출력
			System.out.println("member_score 테이블에서 수정된 레코드 수 : " + pstmtUpdateMemberScore.executeUpdate());
	
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 있는지 확인하세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtUpdateMemberScore != null) {
				try {
					pstmtUpdateMemberScore.close();
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
	
	// 특정 교사의 member 테이블과 member_score 테이블을 조인하여 조회하는 메서드
	// 교사를 특정하기 위해 매개변수로 교사 번호를 입력받음
	// VO를 통해 memberScoreList.jsp로 전달하기 위해 memberAndMemberScore VO를 리턴
	public MemberAndMemberScore selectMemberAndMemberScore(int memberNo) {
		Connection conn = null;
		PreparedStatement pstmtSelectMemberAndMemberScore = null;
		ResultSet rsSelectMemberAndMemberScore = null;
		MemberAndMemberScore memberAndMemberScore = null;
		
		// memberScoreList.jsp로 부터 memberNo값을 잘 전달 받았는지 테스트
		System.out.println("memberNo, memberScoreList.jsp => MemberScoreDao.java " + memberNo);
		
		// member와 member_score 테이블에서  WHERE 조건에 해당하는 레코드를 내부 조인하여 조회하는 쿼리 
		String sqlSelectMemberAndMemberScore = "SELECT t.member_no,t.member_name,ts.score FROM member t INNER JOIN member_score ts on t.member_no = ts.member_no WHERE t.member_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 실행 준비
			pstmtSelectMemberAndMemberScore = conn.prepareStatement(sqlSelectMemberAndMemberScore);
			
			// ? 에 값 대입
			pstmtSelectMemberAndMemberScore.setInt(1,memberNo);
			
			// 쿼리 실행
			rsSelectMemberAndMemberScore = pstmtSelectMemberAndMemberScore.executeQuery();
			
			while(rsSelectMemberAndMemberScore.next()) {
				Member member = new Member();
				member.setMemberNo(rsSelectMemberAndMemberScore.getInt("member_no"));
				member.setMemberName(rsSelectMemberAndMemberScore.getString("member_name"));
				
				MemberScore memberScore = new MemberScore();
				
				memberScore.setScore(rsSelectMemberAndMemberScore.getInt("score"));
				
				memberAndMemberScore = new MemberAndMemberScore();
				
				memberAndMemberScore.setMember(member);
				memberAndMemberScore.setMemberScore(memberScore);
			}
	
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 있는지 확인하세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsSelectMemberAndMemberScore != null) {
				try {
					rsSelectMemberAndMemberScore.close();
				} catch (SQLException sqlException){
					System.out.println("pstmtInsertMemberAddress 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtSelectMemberAndMemberScore != null) {
				try {
					pstmtSelectMemberAndMemberScore.close();
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
		return memberAndMemberScore;
	}
	
	// member_score 테이블에 레코드를 추가하는 메서드
	// 매개변수로 MemberScore 객체의 참조값을 전달 받는다. (폼으로 넘겨받은 값을 담은 객체이다.)
	// 리턴되는 데이터는 해당 쿼리로 인해 삽입된 레코드의 수 이다. 
	public int insertMemberScore(MemberScore memberScore) {
		Connection conn = null;
		PreparedStatement pstmtInsertMemberScore = null;
		
		// insertMemberScoreAction.jsp로 부터 memberScore 객체의 참조 값을 잘 전달 받았는지 테스트
		System.out.println("memberNo, insertMemberScoreAction => MemberScoreDao.java " + memberScore.getMemberNo());
		System.out.println("memberAddrContent, insertMemberScoreAction => MemberScoreDao.java " + memberScore.getScore());
		
		// member_address 테이블에 레코드를 추가하는 쿼리
		String sqlInsertMemberScore = "INSERT INTO member_score(member_no,score) VALUES(?, ?)";
		
		int result = 0;
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 실행 준비
			pstmtInsertMemberScore = conn.prepareStatement(sqlInsertMemberScore);
			
			// ? 에 값 대입
			pstmtInsertMemberScore.setInt(1, memberScore.getMemberNo());
			pstmtInsertMemberScore.setInt(2, memberScore.getScore());
			
			result = pstmtInsertMemberScore.executeUpdate();
			
			// 해당 쿼리 실행 및 해당 쿼리로 인해 삽입 된 레코드 수 출력
			System.out.println("삽입된 레코드 수 : " + result);
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 있는지 확인하세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtInsertMemberScore != null) {
				try {
					pstmtInsertMemberScore.close();
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
		return result;
	}
}
