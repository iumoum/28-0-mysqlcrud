package service;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import service.MemberAndScore;

public class MemberScoreDao {
	/*
	public class MemberAndScore{
		private Member member;
		private MemberScore memberScore;
		setter... getter....
	}
	*/
	
	/*
	SELECT member.member_no, member.member_name, member.member_age, member_score.score
	FROM member INNER JOIN member_score 
	ON member.member_no = member_score.member_no;
	*/
	
	public ArrayList<MemberAndScore> selectMemberScore(int memberNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet resultset = null;
		ArrayList<MemberAndScore> scorelist = new ArrayList<MemberAndScore>();
		
		
		String sql = "SELECT member.member_no, member.member_name, member.member_age, member_score.score FROM member INNER JOIN member_score ON member.member_no = member_score.member_no WHERE member_name=?";
				
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
									
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); 
			
			MemberDao memberdao = new MemberDao();
			Member member = memberdao.selectMember(memberNo);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberName());
			resultset = pstmt.executeQuery();
			
			while(resultset.next()) {
				MemberAndScore memberandscore = new MemberAndScore();
				memberandscore.setMemberNo(resultset.getInt("member.member_no"));
				memberandscore.setMemberName(resultset.getString("member.member_no"));
				memberandscore.setMemberAge(resultset.getInt("member.member_age"));
				memberandscore.setScore(resultset.getInt("member.member_no"));
				scorelist.add(memberandscore);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("JDBC 시작을 할 수 없습니다 확인해주세요. <-- insertMemberAddr()");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("쿼리문을 시작할 수 없습니다. 확인해주세요. <-- insertMemberAddr()");
		} finally{
			if (resultset != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			// pstmt,Connection 객체 종료(close())
		}
		return scorelist;
	}
}
