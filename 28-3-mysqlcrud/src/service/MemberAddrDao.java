/*18.07.03 28기 정규룡*/
package service;
import service.MemberDao;
import service.MemberAddr;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberAddrDao {

	public void insertMemberAddr(MemberAddr memberAddr) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO member_addr(member_no, member_addr_content) VALUES (?, ?)";
		// insert 쿼리문
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); 
						
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberAddr.getMemberNo());	// 매개변수에 있는 memberNo값 가져옴
			pstmt.setString(2, memberAddr.getMemberAddrContent()); // 매개변수에 있는 memberAddrContent값 가져옴
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("JDBC 시작을 할 수 없습니다 확인해주세요. <-- insertMemberAddr()");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("쿼리문을 시작할 수 없습니다. 확인해주세요. <-- insertMemberAddr()");
		}
	}
		
	public void deleteMemberAddr(int memberNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		MemberDao memberDao = new MemberDao();
		String sql = "DELETE FROM member_addr where member_no=?";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); 
						
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo); // memberDeleteAction 페이지에서 받아온 memberNo값 그대로 사용
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("JDBC 시작을 할 수 없습니다 확인해주세요. <-- deleteMemberAddr()");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("쿼리문을 시작할 수 없습니다. 확인해주세요. <-- deleteMemberAddr()");
		}
		memberDao.deleteMember(memberNo); // member_addr테이블이 자식테이블이기 때문에 행을 먼저 삭제해준 후에 member테이블의 행을 지운다.
	}
}
