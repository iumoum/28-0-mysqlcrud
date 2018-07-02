//2018-07-02 서연문
package service;
import service.Employee;
import java.util.ArrayList;
import java.sql.*;

//mysql db에 연결하기 위해 sql패키지 모두 import

public class EmployeeDao {
	
	public int countEmployeeTable() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalEmployee = 0;
		
		String sql = "SELECT COUNT(*) as total_employee FROM employee";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalEmployee = rs.getInt("total_employee");
			}
		} catch(ClassNotFoundException x) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다 ");		
		//sql에서 문제 발생시 아래 실행
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
		} finally {
			if(rs != null) { try{rs.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(pstmt != null) { try{pstmt.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(conn != null) { try{conn.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
		}
		return totalEmployee;			
	}
	
	public ArrayList<Employee> selectEmployeeByPage(int currentPage, int pagePerRow) {
		ArrayList<Employee> arrayListEmployee = new ArrayList<Employee>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT employee_no, employee_name, employee_age FROM employee ORDER BY employee_no LIMIT ?, ?";
		int startRow = (currentPage - 1) * pagePerRow;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pagePerRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Employee e = new Employee();
				e.setEmployeeNo(rs.getInt("employee_no"));
				e.setEmployeeName(rs.getString("employee_name"));
				e.setEmployeeAge(rs.getInt("employee_age"));
				
				arrayListEmployee.add(e);
			}
								
		} catch(ClassNotFoundException x) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다 ");		
		//sql에서 문제 발생시 아래 실행
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
		} finally {
			if(rs != null) { try{rs.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(pstmt != null) { try{pstmt.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(conn != null) { try{conn.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
		}
		return arrayListEmployee;
	}
	
	//insertEmployee메서드는 Employee테이블에 한 행의 데이터(employee_no, employee_name, employee_age)를 추가하기 위한 메서드
	public void insertEmployee(Employee Employee) {
		//매개변수 Employee는 employee_no, employee_name, employee_age데이터 값이 담겨있다
		//필요한 class를 객체 선언하고 초기값 null로 지정
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
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
			
			//pstmt객체에 db접속하기위한 conn객체와 select문을 대입
			//employee의 no를 구하기 위해 employee_no의 max값을 select (auto_increment 대신사용)
			pstmt = conn.prepareStatement("SELECT MAX(employee_no) as employee_no FROM employee WHERE employee_no");

			//쿼리 실행
			rs = pstmt.executeQuery();	
			
			//리턴 값이 있으면 아래 실행
			rs.next();
			
			//db에 아무 값도 없으면 employee_no가 null이기 때문에 null일시 1로 설정
			if(rs.getString("Employee_no") == null) {
				Employee.setEmployeeNo(1);	
			}
			
			//employee_no가 null이 아니면 최대값에 +1을 해서 set해줌
			Employee.setEmployeeNo(rs.getInt("Employee_no")+1);			
			System.out.println(Employee.getEmployeeNo());
			
			//pstmt1에 insert 쿼리문 준비
			pstmt1 = conn.prepareStatement("INSERT INTO employee(employee_no, employee_name, Employee_age) VALUES (?,?,?)");
			
			//values 값 ?에 각각 순서대로 대입
			pstmt1.setInt(1, Employee.getEmployeeNo());
			pstmt1.setString(2, Employee.getEmployeeName());
			pstmt1.setInt(3, Employee.getEmployeeAge());		
			//쿼리 실행
			pstmt1.executeUpdate();
			
			System.out.println(Employee.getEmployeeNo() +"Dao no");
			System.out.println(Employee.getEmployeeName() +"Dao name");
			System.out.println(Employee.getEmployeeAge() +"Dao age");
		
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