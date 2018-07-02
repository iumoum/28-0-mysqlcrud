//2018-06-26 서연문
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmployeeAddrDao {
	
	
	public void insertEmployeeAddr(EmployeeAddr EmployeeAddr) throws ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			pstmt = conn.prepareStatement("SELECT MAX(employee_address_no) as employee_address_no FROM employee_address WHERE employee_address_no");
			rs = pstmt.executeQuery();
			
			rs.next();
			if(rs.getString("Employee_address_no") == null) {
				EmployeeAddr.setEmployeeAddrNo(1);	
			}
			EmployeeAddr.setEmployeeAddrNo(rs.getInt("Employee_address_no")+1);	
					
			System.out.println(EmployeeAddr.getEmployeeNo());
			//pstmt1에 insert 쿼리문 준비
			pstmt1 = conn.prepareStatement("INSERT INTO Employee_address(Employee_address_no, Employee_no, Employee_address_content) VALUES (?,?,?)");
			//values 값 ?에 각각 순서대로 대입
			pstmt1.setInt(1, EmployeeAddr.getEmployeeAddrNo());
			pstmt1.setInt(2, EmployeeAddr.getEmployeeNo());
			pstmt1.setString(3, EmployeeAddr.getEmployeeContent());
			//pstmt1 쿼리 실행
			pstmt1.executeUpdate();
			
			System.out.println(EmployeeAddr.getEmployeeAddrNo() +"AddrDao addrno");
			System.out.println(EmployeeAddr.getEmployeeNo() +"AddrDao no");
			System.out.println(EmployeeAddr.getEmployeeContent() +"AddrDao content");
			
		//db클래스를 못찾으면 아래 실행
		} catch(ClassNotFoundException x) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다 ");		
		//sql에서 문제 발생시 아래 실행
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "rs");}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "pstmt");}
			if (pstmt1 != null) try { pstmt1.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "pstmt1");}
			if (conn != null) try { conn.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "conn");}
		}		
	}
}