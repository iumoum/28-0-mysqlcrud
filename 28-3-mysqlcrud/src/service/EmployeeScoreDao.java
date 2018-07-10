package service;

import service.*;
import java.sql.*;
import java.util.*;

public class EmployeeScoreDao {
	
	
	public ArrayList<EmployeeAndScore> selectEmployeeListAboveAvg() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<EmployeeAndScore> arrayListEmployeeAndScore = null;
		EmployeeAndScore employeeAndScore = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			arrayListEmployeeAndScore = new ArrayList<EmployeeAndScore>();
			
			pstmt = conn.prepareStatement("SELECT e.employee_no, e.employee_name ,es.employee_score_no, es.score FROM employee e INNER JOIN employee_score es ON es.employee_no = e.employee_no WHERE es.score>=(select avg(score) FROM employee_score) ORDER BY es.score DESC");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				employeeAndScore = new EmployeeAndScore();
				Employee employee = new Employee();
				employee.setEmployeeNo(rs.getInt("employee_no"));
				employee.setEmployeeName(rs.getString("employee_name"));
				
				EmployeeScore employeeScore = new EmployeeScore();
				employeeScore.setEmployeeScoreNo(rs.getInt("employee_score_no"));
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
	
	
	public EmployeeScore selectEmployeeScore(int no) {
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
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				employeeScore = new EmployeeScore();
				employeeScore.setEmployeeScoreNo(rs.getInt("employee_score_no"));
				employeeScore.setEmployeeNo(rs.getInt("employee_no"));
				employeeScore.setScore(rs.getInt("score"));
				
				System.out.println("employee_score_no");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("DB Driver Class를 찾을 수 없습니다");		
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			
		}
		return employeeScore;
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