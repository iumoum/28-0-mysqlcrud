//2018-07-13 서연문
package service;

//각 메서드를 통해 DB와 연결해 INSERT DELETE UPDATE SELECT 하기 위해 필요한 class를 import
import java.util.ArrayList;
import java.sql.*;
import service.*;

public class EmployeeAddrDao {
	
	
	//employee의 주소를 UPDATE하기 위한 메서드
		public void updateEmployeeAddr(EmployeeAddr employeeAddr) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				Class.forName("com.mysql.jdbc.Driver");

				String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
				String dbUser = "root";
				String dbPw = "java0000";
				
				conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
				
				//updateEmployeeAction.jsp페이지의 메서드 호출을 통해 받은 값으로
				//employee_address테이블의 컬럼employee_address_no가 받아온 값과 일치하는 행의 employee_address_content컬럼을 받아온 값으로 수정
				pstmt = conn.prepareStatement("UPDATE employee_address SET employee_address_content = ? WHERE employee_address_no = ?");
				//?에 값을 세팅합니다
				pstmt.setString(1, employeeAddr.getEmployeeAddrContent());
				pstmt.setInt(2, employeeAddr.getEmployeeAddrNo());
				//쿼리 실행
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
	
	
	//employee의 주소를 수정하기전  담겨있는 값을 updateEmployeeForm.jsp에 입력해주기 위해 검색하는 메서드
	//EmployeeAddr 클래스 데이터 타입
	public EmployeeAddr selectForUpdateEmployeeAddr(int emplyeeAddrNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//EmployeeAddr클래스를 통해 employeeAddr객체 생성 초기값 null
		EmployeeAddr employeeAddr = null;
		
		try {
			//sql에 연결하기 위해 driver 로딩
			Class.forName("com.mysql.jdbc.Driver");
				
			//db접속하기 위해 각 데이터타입의 변수에 db유형/ip번호/포트번호/dbid/dbpw를 대입한다
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
				
			//db에 접속하기 위한 데이터를 conn객체에 대입한다
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);		
				
			//pstmt에 insert 쿼리문 준비 employee_address테이블의 컬럼employee_address_no가 updateEmployeeForm.jsp에서 호출한 값과 같은 값을 가진 행의 정보를 검색
			pstmt = conn.prepareStatement("SELECT employee_address_no, employee_no, employee_address_content FROM employee_address WHERE employee_address_no = ?");
			//WHERW절의 employee_address_no=?에 대입
			pstmt.setInt(1, emplyeeAddrNo);
			//쿼리 실행
			rs = pstmt.executeQuery();
			//rs객체에 값이 있다면	
			if(rs.next()) {
				//employeeAddr객체에 생성자 메서드를 통해 생성된 EmployeeAddr의 주소값을 대입
				employeeAddr = new EmployeeAddr();
				//employeeAddr객체에 담긴 주소값을 찾아가서 세팅 
				employeeAddr.setEmployeeAddrNo(rs.getInt("employee_address_no"));
				employeeAddr.setEmployeeNo(rs.getInt("employee_no"));
				employeeAddr.setEmployeeAddrContent(rs.getString("employee_address_content"));
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
		//updateEmployeeAddrForm.jsp에 employeeAddr로 리턴
		return employeeAddr;					
	} 
	
	//employee의 주소를 입력하기 위한 메서드
	public void insertEmployeeAddr(EmployeeAddr employeeAddr) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//sql에 연결하기 위해 driver 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			//db접속하기 위해 각 데이터타입의 변수에 db유형/ip번호/포트번호/dbid/dbpw를 대입한다
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			//db에 접속하기 위한 데이터를 conn객체에 대입한다
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);		
			
			//pstmt에 INSERT 쿼리문 준비 employee_address테이블의 컬럼 employee_no와 employee_address_content를 insert
			pstmt = conn.prepareStatement("INSERT INTO employee_address( employee_no, employee_address_content)	VALUES(?, ?)");		
			//values 값 ?에 각각 순서대로  insertEmployeeAction.jsp에서 받아온 값을 대입
			pstmt.setInt(1, employeeAddr.getEmployeeNo());
			pstmt.setString(2, employeeAddr.getEmployeeAddrContent());		
			//쿼리 실행
			pstmt.executeUpdate();
		
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
	
	
	/*//employee의 주소정보를 삭제하기 위한 메서
	public void deleteEmployeeAddr(int employeeNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmployeeDao employeeDao = new EmployeeDao();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			//db접속하기 위해 각 데이터타입의 변수에 db유형/ip번호/포트번호/dbid/dbpw를 대입한다
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
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
	}*/
	
	
	//employee의 주소정보를 삭제하기 위한 메서드
	public void deleteOnlyEmployeeAddr(int employeeAddrNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			//db접속하기 위해 각 데이터타입의 변수에 db유형/ip번호/포트번호/dbid/dbpw를 대입한다
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			//db에 접속하기 위한 데이터를 conn객체에 대입한다
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			//DELETE쿼리문 작성 employee_address테이블의 컬럼 employee_address_no가 받아온 값과 같은 행을 지운다
			pstmt = conn.prepareStatement("DELETE FROM employee_address WHERE employee_address_no=?");
			//deleteEmployeeAction.jsp에서 받아온 employeeAddrNo의 값을 ?에 대입
			pstmt.setInt(1, employeeAddrNo);
			//쿼리 실행
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
	
	
	//employee의 주소 리스트를 받아오기 위한 메서드
	//ArrayList의 list타입은 EmployeeAddr
	public ArrayList<EmployeeAddr> selectEmployeeAddr(int employeeNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//EmployeeAddress클래스 데이터 타입으로 employeeAddress객체 생성
		EmployeeAddr employeeAddr = null;
		//ArrayList<EmployeeAddr> 데이터 타입으로 arrayListEmployeeAddr 객체 생성하고 생성자메서드를 통해 ArrayList<EmployeeAddr>의 주소값 생성하고 객체에 대입
		ArrayList<EmployeeAddr> arrayListEmployeeAddr = new ArrayList<EmployeeAddr>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			//db접속하기 위해 각 데이터타입의 변수에 db유형/ip번호/포트번호/dbid/dbpw를 대입한다
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			//db에 접속하기 위한 데이터를 conn객체에 대입한다
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			//employee_address테이블의 컬럼 employee_no의 값이 받아온 값과 같은 테이블을 SELECT한다
			pstmt = conn.prepareStatement("SELECT employee_address_no, employee_no, employee_address_content FROM employee_address WHERE employee_no=?");
			//employeeAddrList.jsp에서 받아온 employeeNo값을 WHERE절의 employee_no에 대입 
			pstmt.setInt(1, employeeNo);
			//쿼리 실행
			rs = pstmt.executeQuery();
			//다음 행이 있다면 행의 숫자만큼 세팅
			while(rs.next()) {
				//employeeAddr객체에 생성자 메서드를 통해 EmployeeAddr의 주소값을 대입
				employeeAddr = new EmployeeAddr();
				//employeeAddr객체에 담긴 주소값을 찾아가 세팅
				employeeAddr.setEmployeeAddrNo(rs.getInt("employee_address_no"));
				employeeAddr.setEmployeeNo(rs.getInt("employee_no"));
				employeeAddr.setEmployeeAddrContent(rs.getString("employee_address_content"));
				
				arrayListEmployeeAddr.add(employeeAddr);
			}
		}  catch(ClassNotFoundException x) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다 ");		
	
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
		} finally {
			if(rs != null) { try{rs.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(pstmt != null) { try{pstmt.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
			if(conn != null) { try{conn.close();} catch (SQLException ex) {System.out.println(ex); ex.printStackTrace();}}
		}
		//employeeAddrList.jsp에 arrayListEmployeeAddr 반환
		return arrayListEmployeeAddr;
	} 
}