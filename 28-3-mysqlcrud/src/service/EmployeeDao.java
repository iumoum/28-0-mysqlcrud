//2018-07-02 서연문
package service;

import java.util.ArrayList;
import java.sql.*;
import service.*;


public class EmployeeDao {
	
	public void updateEmployee(Employee employee) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			pstmt = conn.prepareStatement("UPDATE employee SET employee_name = ?, employee_age = ? WHERE employee_no = ?");
			
			// ?에 값 대입
			pstmt.setString(1, employee.getEmployeeName());
			pstmt.setInt(2, employee.getEmployeeAge());
			pstmt.setInt(3, employee.getEmployeeNo());
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
	
	
	public Employee selectForUpdateEmployee(int employeeNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Employee employee = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			pstmt = conn.prepareStatement("SELECT employee_no, employee_name, employee_age FROM employee WHERE employee_no = ?");
			pstmt.setInt(1, employeeNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				employee = new Employee();	
				employee.setEmployeeNo(rs.getInt("employee_no"));
				employee.setEmployeeName(rs.getString("employee_name"));
				employee.setEmployeeAge(rs.getInt("employee_age"));
			}		
		} catch(ClassNotFoundException x) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다 ");		
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
		} finally {
			if(rs != null) { try{rs.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(pstmt != null) { try{pstmt.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(conn != null) { try{conn.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
		}
		return employee;
	}
		
	
	//테이블 수 구하기
	public int countEmployeeTable(String searchValue) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalEmployee = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			if(searchValue.equals("")) {
				
				pstmt = conn.prepareStatement("SELECT COUNT(*) as total_records FROM employee");

			} else {
				
				pstmt = conn.prepareStatement("SELECT COUNT(*) as total_records FROM employee WHERE employee_name LIKE ?");
				pstmt.setString(1, "%"+searchValue+"%");
			
			}			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalEmployee = rs.getInt("total_records");
			}
			
		} catch(ClassNotFoundException x) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다 ");		
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
		} finally {
			if(rs != null) { try{rs.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(pstmt != null) { try{pstmt.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(conn != null) { try{conn.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
		}
		return totalEmployee;			
	}
	
	
	public ArrayList<Employee> selectEmployeeByPage(int currentPage, int rowPerPage,String searchValue) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Employee> arrayListEmployee = new ArrayList<Employee>();
		
		int startPage = (currentPage - 1) * rowPerPage;	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			if(searchValue.equals("")) {
				pstmt = conn.prepareStatement("SELECT employee_no, employee_name, employee_age FROM employee ORDER BY employee_no LIMIT ?, ?");
				pstmt.setInt(1, startPage);
				pstmt.setInt(2, rowPerPage);
				
			} else {
				
				pstmt = conn.prepareStatement("SELECT employee_no, employee_name, employee_age FROM employee WHERE employee_name LIKE ? ORDER BY employee_no LIMIT ?, ?");
				pstmt.setString(1, "%"+searchValue+"%");
				pstmt.setInt(2, startPage);
				pstmt.setInt(3, rowPerPage);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Employee employee = new Employee();
				
				employee.setEmployeeNo(rs.getInt("employee_no"));
				employee.setEmployeeName(rs.getString("employee_name"));
				employee.setEmployeeAge(rs.getInt("employee_age"));
				
				arrayListEmployee.add(employee);
			}
								
		} catch(ClassNotFoundException x) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다 ");		
	
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
		} finally {
			if(rs != null) { try{rs.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(pstmt != null) { try{pstmt.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(conn != null) { try{conn.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
		}
		return arrayListEmployee;
	}
	
	//insertEmployee메서드는 Employee테이블에 한 행의 데이터(employee_name, employee_age)를 추가하기 위한 메서드
	//매개변수 Employee는 employee_name, employee_age데이터 값이 담겨있다
	public void insertEmployee(Employee employee) {
		
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
			pstmt = conn.prepareStatement("INSERT INTO employee(employee_name, Employee_age) VALUES (?,?)");
			
			//values 값 ?에 각각 순서대로 대입
			pstmt.setString(1, employee.getEmployeeName());
			pstmt.setInt(2, employee.getEmployeeAge());		
			//쿼리 실행
			pstmt.executeUpdate();
			
			System.out.println(employee.getEmployeeName() +"Dao name");
			System.out.println(employee.getEmployeeAge() +"Dao age");
		
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
	
	public void deleteEmployee(int employeeNo) {
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
			pstmt = conn.prepareStatement("DELETE FROM employee WHERE employee_no=?");
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
	}
}