//2018-07-13 서연문
package service;

//각 메서드를 통해 DB와 연결해 INSERT DELETE UPDATE 하기 위해 필요한 class를 import
import java.util.ArrayList;
import java.sql.*;
import service.*;

public class EmployeeScoreDao {
	
	
	public int countEmployeeAboveAvgTable() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//int타입의 totalEmployee객체의 초기값을 0으로 설정
		int totalEmployeeAboveAvg = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			pstmt = conn.prepareStatement("SELECT COUNT(*) as total_records FROM employee_score WHERE score>=(select avg(score) FROM employee_score)");	
				
			//쿼리 실행
			rs = pstmt.executeQuery();
			//다음 행이 있다면
			if(rs.next()) {
				//totalEmployee객체에 찾은 행의 수 total_records의 수를 대입
				totalEmployeeAboveAvg = rs.getInt("total_records");
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
		//totalEmployee를 employeeList.jsp에 리턴
		return totalEmployeeAboveAvg;			
	}
	
	
	public EmployeeScore selectEmployeeScore(int employeeNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmployeeScore employeeScore = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			pstmt = conn.prepareStatement("SELECT employee_score_no, employee_no, score FROM employee_score WHERE employee_no = ?");
			pstmt.setInt(1, employeeNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {					
				employeeScore = new EmployeeScore();
				employeeScore.setEmployeeScoreNo(rs.getInt("employee_score_no"));
				employeeScore.setEmployeeNo(rs.getInt("employee_no"));
				employeeScore.setScore(rs.getInt("score"));
			}
		} catch (ClassNotFoundException e) {
			System.out.println("DB Driver Class를 찾을 수 없습니다");		
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			
		}
		return employeeScore;
	}	
	
	
	public void updateEmployeeScore(EmployeeScore employeeScore) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			pstmt = conn.prepareStatement("UPDATE employee_score SET score = ? WHERE employee_no = ?");
			
			// ?에 값 대입
			pstmt.setInt(1, employeeScore.getScore());
			pstmt.setInt(2, employeeScore.getEmployeeNo());
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
	
	
	public ArrayList<EmployeeAndScore> selectEmployeeAboveAvg(int currentPage, int rowPerPage) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<EmployeeAndScore> arrayListEmployeeAndScore = null;
		EmployeeAndScore employeeAndScore = null;
		
		int startPage = (currentPage - 1) * rowPerPage;	
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			arrayListEmployeeAndScore = new ArrayList<EmployeeAndScore>();
			
			pstmt = conn.prepareStatement("SELECT e.employee_no, e.employee_name, es.score FROM employee e INNER JOIN employee_score es ON es.employee_no = e.employee_no WHERE es.score>=(select avg(score) FROM employee_score) ORDER BY es.score DESC LIMIT ?,?");
			pstmt.setInt(1, startPage);
			pstmt.setInt(2, rowPerPage);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				employeeAndScore = new EmployeeAndScore();
				Employee employee = new Employee();
				employee.setEmployeeNo(rs.getInt("employee_no"));
				employee.setEmployeeName(rs.getString("employee_name"));
				
				EmployeeScore employeeScore = new EmployeeScore();
				employeeScore.setScore(rs.getInt("score"));
				
				employeeAndScore.setEmployee(employee);
				employeeAndScore.setEmployeeScore(employeeScore);
				
				arrayListEmployeeAndScore.add(employeeAndScore);
			}
		} catch (ClassNotFoundException e) {
			System.out.println("DB Driver Class를 찾을 수 없습니다");		
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) { try{rs.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(pstmt != null) { try{pstmt.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(conn != null) { try{conn.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
		}
		return arrayListEmployeeAndScore;
	}


	public int selectScoreAvg() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int scoreAvg = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			pstmt = conn.prepareStatement("SELECT avg(score) FROM employee_score");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				scoreAvg = rs.getInt("avg(score)");
			}
		
		} catch (ClassNotFoundException e) {
			System.out.println("DB Driver Class를 찾을 수 없습니다");		
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			
		}
		return scoreAvg;
	}


	public EmployeeAndScore selectEmployeeAndScore(int employeeNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmployeeAndScore employeeAndScore = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			pstmt = conn.prepareStatement("SELECT e.employee_no, e.employee_name, es.employee_score_no, es.score FROM employee e INNER JOIN employee_score es on e.employee_no = es.employee_no WHERE e.employee_no = ?");
			pstmt.setInt(1, employeeNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {	
				Employee employee = new Employee();
				employee.setEmployeeNo(rs.getInt("employee_no"));
				employee.setEmployeeName(rs.getString("employee_name"));
				
				EmployeeScore employeeScore = new EmployeeScore();
				employeeScore.setEmployeeScoreNo(rs.getInt("employee_score_no"));
				employeeScore.setEmployeeNo(rs.getInt("employee_no"));
				employeeScore.setScore(rs.getInt("score"));
				
				employeeAndScore = new EmployeeAndScore();
				employeeAndScore.setEmployee(employee);
				employeeAndScore.setEmployeeScore(employeeScore);
				
				System.out.println(rs.getInt("employee_score_no") + "<<<<score_no");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("DB Driver Class를 찾을 수 없습니다");		
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			
		}
		return employeeAndScore;
	}


	public void insertEmployeeScore(EmployeeScore employeeScore) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
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
			pstmt = conn.prepareStatement("INSERT INTO employee_score( Employee_no, score) VALUES(?, ?)");
			pstmt.setInt(1, employeeScore.getEmployeeNo());
			pstmt.setInt(2, employeeScore.getScore());		
			//쿼리 실행
			pstmt.executeUpdate();
			
		} catch(ClassNotFoundException x) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다 ");		
		//sql에서 문제 발생시 아래 실행
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "pstmt");}
			if (conn != null) try { conn.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "conn");}
		}		
	}
}