// 2018-07-03 서연문
package service;

import java.util.ArrayList;
import java.sql.*;
import service.*;

public class EmployeeAddressDao {
	
	public void updateEmployeeAddress(EmployeeAddress employeeAddress) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			pstmt = conn.prepareStatement("UPDATE employee_address SET employee_address_content = ? WHERE employee_address_no = ?");
			
			// ?에 값 대입
			pstmt.setString(1, employeeAddress.getEmployeeAddressContent());
			pstmt.setInt(2, employeeAddress.getEmployeeAddressNo());
			pstmt.executeUpdate();
			
		} catch(ClassNotFoundException x) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다 ");		
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
		} finally {
			if(pstmt != null) { try{pstmt.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(conn != null) { try{conn.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
		}	
	}
	
	
	public EmployeeAddress selectForUpdateEmployeeAddress(int emplyeeAddressNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmployeeAddress employeeAddress = null;
		
		try {
			//sql에 연결하기 위해 driver 로딩
			Class.forName("com.mysql.jdbc.Driver");
				
			//db접속하기 위해 각 데이터타입의 변수에 db유형/ip번호/포트번호/dbid/dbpw를 대입한다
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
				
			//db에 접속하기 위한 데이터를 conn객체에 대입한다
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);		
				
			//pstmt에 insert 쿼리문 준비
			pstmt = conn.prepareStatement("SELECT employee_address_no, employee_no, employee_address_content FROM employee_address WHERE employee_address_no = ?");
			pstmt.setInt(1, emplyeeAddressNo);
			rs = pstmt.executeQuery();
				
			if(rs.next()) {
				employeeAddress = new EmployeeAddress();	
				employeeAddress.setEmployeeAddressNo(rs.getInt("employee_address_no"));
				employeeAddress.setEmployeeNo(rs.getInt("employee_no"));
				employeeAddress.setEmployeeAddressContent(rs.getString("employee_address_content"));
			}	
		}	catch(ClassNotFoundException x) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다 ");				
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "rs");}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "pstmt");}
			if (conn != null) try { conn.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "conn");}
		}
		return employeeAddress;					
	} 
	
	
	public void insertEmployeeAddress(EmployeeAddress employeeAddress) {
		//매개변수 Employee는 employee_no, employee_name, employee_age데이터 값이 담겨있다
		//필요한 class를 객체 선언하고 초기값 null로 지정
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//sql에 연결하기 위해 driver 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			//db접속하기 위해 각 데이터타입의 변수에 db유형/ip번호/포트번호/dbid/dbpw를 대입한다
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			//db에 접속하기 위한 데이터를 conn객체에 대입한다
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);		
			
			//pstmt1에 insert 쿼리문 준비
			pstmt = conn.prepareStatement("INSERT INTO employee_address( Employee_no, employee_address_content)	VALUES(?, ?)");
			
			//values 값 ?에 각각 순서대로 대입
			pstmt.setInt(1, employeeAddress.getEmployeeNo());
			pstmt.setString(2, employeeAddress.getEmployeeAddressContent());		
			//쿼리 실행
			pstmt.executeUpdate();
			
			System.out.println(employeeAddress.getEmployeeNo() +"Addr EmployeeNo");
			System.out.println(employeeAddress.getEmployeeAddressContent() +"Addr Content");
		
		//db클래스를 못찾으면 아래 실행
		} catch(ClassNotFoundException x) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다 ");		
		//sql에서 문제 발생시 아래 실행
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "rs");}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "pstmt");}
			if (conn != null) try { conn.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "conn");}
		}		
	}	
	
	public void deleteEmployeeAddress(int employeeAddressNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmployeeDao employeeDao = new EmployeeDao();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			//db접속하기 위해 각 데이터타입의 변수에 db유형/ip번호/포트번호/dbid/dbpw를 대입한다
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			//db에 접속하기 위한 데이터를 conn객체에 대입한다
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			
			//pstmt객체에 db접속하기위한 conn객체와 select문을 대입
			//employee의 no를 구하기 위해 employee_no의 max값을 select (auto_increment 대신사용)
			pstmt = conn.prepareStatement("DELETE FROM employee_address WHERE employee_address_no=?");
			pstmt.setInt(1, employeeAddressNo);
			pstmt.executeUpdate();
					
		} catch(ClassNotFoundException x) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다 ");		
		//sql에서 문제 발생시 아래 실행
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "rs");}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "pstmt");}
			if (conn != null) try { conn.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "conn");}
		}
		employeeDao.deleteEmployee(employeeAddressNo);
	}
		
	public void deleteOnlyEmployeeAddress(int employeeNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			//db접속하기 위해 각 데이터타입의 변수에 db유형/ip번호/포트번호/dbid/dbpw를 대입한다
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			//db에 접속하기 위한 데이터를 conn객체에 대입한다
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			
			//pstmt객체에 db접속하기위한 conn객체와 select문을 대입
			//employee의 no를 구하기 위해 employee_no의 max값을 select (auto_increment 대신사용)
			pstmt = conn.prepareStatement("DELETE FROM employee_address WHERE employee_no=?");
			System.out.println("test - >" + employeeNo);
			pstmt.setInt(1, employeeNo);
			System.out.println("result!! ->" + pstmt.executeUpdate());
					
		} catch(ClassNotFoundException x) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다 ");		
		//sql에서 문제 발생시 아래 실행
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "rs");}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "pstmt");}
			if (conn != null) try { conn.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "conn");}
		}
	}
	
	
	public ArrayList<EmployeeAddress> selectEmployeeAddress(int employeeNo) {
		Connection conn = null;
		PreparedStatement pstmtSelectEmployeeAddr = null;
		ResultSet rsSelectEmployeeAddr = null;
		EmployeeAddress employeeAddress = null;
		ArrayList<EmployeeAddress> arrayListEmployeeAddress = new ArrayList<EmployeeAddress>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			//db접속하기 위해 각 데이터타입의 변수에 db유형/ip번호/포트번호/dbid/dbpw를 대입한다
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			//db에 접속하기 위한 데이터를 conn객체에 대입한다
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			//pstmt객체에 db접속하기위한 conn객체와 select문을 대입
			//employee의 no를 구하기 위해 employee_no의 max값을 select (auto_increment 대신사용)
			pstmtSelectEmployeeAddr = conn.prepareStatement("SELECT employee_address_no, employee_no, employee_address_content FROM employee_address WHERE employee_no=?");
			pstmtSelectEmployeeAddr.setInt(1, employeeNo);
			rsSelectEmployeeAddr = pstmtSelectEmployeeAddr.executeQuery();
			if(rsSelectEmployeeAddr.next()) {
				employeeAddress = new EmployeeAddress();
				employeeAddress.setEmployeeAddressNo(rsSelectEmployeeAddr.getInt("employee_address_no"));
				employeeAddress.setEmployeeNo(rsSelectEmployeeAddr.getInt("employee_no"));
				employeeAddress.setEmployeeAddressContent(rsSelectEmployeeAddr.getString("employee_address_content"));
				
				arrayListEmployeeAddress.add(employeeAddress);
			}
		}  catch(ClassNotFoundException x) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다 ");		
	
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
		} finally {
			if(rsSelectEmployeeAddr != null) { try{rsSelectEmployeeAddr.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(pstmtSelectEmployeeAddr != null) { try{pstmtSelectEmployeeAddr.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(conn != null) { try{conn.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
		}
		return arrayListEmployeeAddress;
	} 
}