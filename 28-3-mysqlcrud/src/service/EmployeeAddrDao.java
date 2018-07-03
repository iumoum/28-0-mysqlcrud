//2018-06-26 서연문
package service;

import service.EmployeeDao;
import service.EmployeeAddr;
import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmployeeAddrDao {
	
	public void insertEmployeeAddr(EmployeeAddr employeeAddr) {
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
			pstmt = conn.prepareStatement("INSERT INTO employee_address( Employee_no, Employee_address_content)	VALUES( ?, ?)");
			
			//values 값 ?에 각각 순서대로 대입
			pstmt.setInt(1, employeeAddr.getEmployeeNo());
			pstmt.setString(2, employeeAddr.getEmployeeContent());		
			//쿼리 실행
			pstmt.executeUpdate();
			
			System.out.println(employeeAddr.getEmployeeNo() +"Addr EmployeeNo");
			System.out.println(employeeAddr.getEmployeeContent() +"Addr Content");
		
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
	
	public void deleteEmployeeAddr(int employeeNo) {
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
			pstmt = conn.prepareStatement("DELETE FROM employee_address WHERE employee_no=?");
			pstmt.setInt(1, employeeNo);
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
		employeeDao.deleteEmployee(employeeNo);
	}
		
	public void deleteOnlyEmployeeAddr(int employeeNo) {
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
	
	
	public EmployeeAddr selectEmployeeAddr(int employeeNo) {
		Connection conn = null;
		PreparedStatement pstmtSelectEmployeeAddr = null;
		ResultSet rsSelectEmployeeAddr = null;
		EmployeeAddr e = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			//db접속하기 위해 각 데이터타입의 변수에 db유형/ip번호/포트번호/dbid/dbpw를 대입한다
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			//db에 접속하기 위한 데이터를 conn객체에 대입한다
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			System.out.println(employeeNo + "<<<<< 상세주소 보기위해 넘긴 번호");
			//pstmt객체에 db접속하기위한 conn객체와 select문을 대입
			//employee의 no를 구하기 위해 employee_no의 max값을 select (auto_increment 대신사용)
			pstmtSelectEmployeeAddr = conn.prepareStatement("SELECT employee_address_no, employee_no, employee_address_content FROM employee_address WHERE employee_no=?");
			pstmtSelectEmployeeAddr.setInt(1, employeeNo);
			rsSelectEmployeeAddr = pstmtSelectEmployeeAddr.executeQuery();
			if(rsSelectEmployeeAddr.next()) {
				e = new EmployeeAddr();
				e.setEmployeeAddrNo(rsSelectEmployeeAddr.getInt("employee_address_no"));
				e.setEmployeeNo(rsSelectEmployeeAddr.getInt("employee_no"));
				e.setEmployeeContent(rsSelectEmployeeAddr.getString("employee_address_content"));
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
		return e;
	} 
}