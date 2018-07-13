//2018-07-12 서연문
package service;

//각 메서드를 통해 DB와 연결해 INSERT DELETE UPDATE SELECT 하기 위해 필요한 class를 import
import java.util.ArrayList; 
import java.sql.*;
import service.*;

public class EmployeeDao {
	
	//employee의 정보를 삭제하기 위한 메서드 DELETE하기 때문에 리턴값은 없다
	public void deleteEmployee(int employeeNo) {
		
		//해당 페이지의 맨 위에서 import한 sql패키지 내에 있는 클래스들을 객체로 선언하고 초기값 null로 지정
		Connection conn = null;
		PreparedStatement pstmt = null;

		//try의 {}내에 있는 코드를 실행하여 오류가 생기면 catch{}의 내부 코드로 넘어가고 그 후에 finally{}의 내부 코드로 넘어간다  
		try {
			
			//jdbc를 통해 mysql드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			//mysql의 db베이스에 연결하기 위해
			//DB명:stemcrud ip:localhost 포트번호:3306 접속아이디:root 접속비밀번호:java0000을  String 타입의 객체에 대입
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
		
			//DriverManager클래스의getConnection메서드를호출하기 위해 위에서 생성한 객체를 대입한 후 Connection클래스를 통해 생성된 conn객체에 대입
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);	
			
			//conn의prepareStatement메서드에 쿼리문을 작성하여 PreparedStatement클래스를 통해 생성된 pstmt객체에 대입
			//employee테이블의 컬럼 employee_no가 deleteEmployeeAction.jsp페이지에서 호출시 입력한 값에 해당하는 행을 삭제한다
			pstmt = conn.prepareStatement("DELETE FROM employee WHERE employee_no=?");				
			//WHERE절의 employee_no의 ?값에 대입
			pstmt.setInt(1, employeeNo);		
			//쿼리 실행
			pstmt.executeUpdate();
		
		//try블록에서 DB연결을 위한 Class를 찾지 못할 경우 아래 출력
		} catch(ClassNotFoundException x) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다 ");
		//try블록에서 SQL처리과정에 발생하는 문제가 있다면 아래 출력
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		//try블록에서 문제가 발생하지 않으면 바로 finally로 넘어와 rs를 종료하고 pstmt를종료하고 conn을 종료한다 그 과정에서 문제가 일어나면 메세지를 출력한다
		//try블록에서 문제가 발생하면 catch후 finally로 넘어와 위와 동일한 과정을 실행한다
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "pstmt");}
			if (conn != null) try { conn.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "conn");}
		}					
	}
	
	
	//employee의 정보를 수정하기 위한 메서드 UPDATE만 하기 때문에 리턴값 없음
	public void updateEmployee(Employee employee) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			//employee테이블의 컬럼이employee_no=? 인 사람의  employee_name과 employee_age를 ?에 담긴 값으로 수정해준다
			pstmt = conn.prepareStatement("UPDATE employee SET employee_name = ?, employee_age = ? WHERE employee_no = ?");
			//updateEmployeeAction.jsp에서 넘겨받은 값으로 ?에 순서대로 대입
			pstmt.setString(1, employee.getEmployeeName());
			pstmt.setInt(2, employee.getEmployeeAge());
			pstmt.setInt(3, employee.getEmployeeNo());
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
	
	//employee의 정보를 UPDATE하기 전 updateEmployeeForm.jsp에 찾고자 하는 employeeNo를 가진 사람의 정보를 미리 입력해주기 위한 메서드
	//Employee클래스의 employee객체로 리턴한다
	public Employee selectForUpdateEmployee(int employeeNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//Employee클래스를 통해 employee객체를 생성하고 초기값을 null로 설정
		Employee employee = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			//employee테이블의 컬럼 employee_no가 ?인 행의 정보를 찾기위한 메서드
			pstmt = conn.prepareStatement("SELECT employee_no, employee_name, employee_age FROM employee WHERE employee_no = ?");
			//updateEmployeeForm.jsp에서 메서드 호출시 입력한 값을 ?에 대입
			pstmt.setInt(1, employeeNo);
			//쿼리 실행한 값을 rs객체에 대입
			rs = pstmt.executeQuery();		
			//rs객체에 값이 있다면
			if(rs.next()) {
				//employee객체에 Employee클래스 생성자를 통해 생성된 주소값을 대입
				employee = new Employee();
				//employee객체에 담긴 주소값의 set메서드에 SELECT해온 값을 대입
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
		//updateEmployeeForm.jsp 페이지에 employee로 리턴
		return employee;
	}
		
	
	// employeeList.jsp에서 메서드 호출시 입력한 searchValue값을 통해 테이블 행의수를 구하기 위한 메서드 int타입으로 리턴
	public int countEmployeeTable(String searchValue) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//int타입의 totalEmployee객체의 초기값을 0으로 설정
		int totalEmployee = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			//employeeList.jsp에서 입력한 값이 ""이라면
			if(searchValue.equals("")) {
				//employee테이블의 모든 행의 수를 구하고 total_records객체에 대입
				pstmt = conn.prepareStatement("SELECT COUNT(*) as total_records FROM employee");	
				
			//employeeList.jsp에서 입력한 값이 있다면
			} else {
				//employee테이블의 컬럼 employee_name이 ?인 사람의 모든 행의 수를 구하고 total_records객체에 대입
				//LIKE = 문자 패턴을 이용하여 조건에 만족하는 Data를 조회 %는 0개 이상의 문자로 길이와 상관이 없이 조건이 지정
				//검색한 값이 employee_name에 포함 된 모든 행의 수를 검색
				pstmt = conn.prepareStatement("SELECT COUNT(*) as total_records FROM employee WHERE employee_name LIKE ?");
				pstmt.setString(1, "%"+searchValue+"%");		
			}
			//쿼리 실행
			rs = pstmt.executeQuery();
			//다음 행이 있다면
			if(rs.next()) {
				//totalEmployee객체에 찾은 행의 수 total_records의 수를 대입
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
		//totalEmployee를 employeeList.jsp에 리턴
		return totalEmployee;			
	}
	

	//내장 객체 ArrayList의 List는 Employee타입으로 employee테이블의 해당 조건에 맞는 리스트를 출력하기 위한 메서드
	//int타입의 값2개와 String타입의 값 1개로 메서드 호출
	//리턴 데이터 타입은 ArrayList<Employee>이고 arrayListEmployee로 리턴한다
	public ArrayList<Employee> selectEmployeeByPage(int currentPage, int rowPerPage,String searchValue) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//생성자 메서드를 통해 ArrayList<Employee>()를 생성하고
		//ArrayList<Employee>클래스를 통해 생성된 객체 arrayListEmployee에 대입한다
		ArrayList<Employee> arrayListEmployee = new ArrayList<Employee>();
		
		//int타입의 startPage객체는 메서드 호출시 입력한 currentPage -1 * rowPerPage로 정해준다
		int startPage = (currentPage - 1) * rowPerPage;	
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			
			//만약 employeeList에서 searchValue값이 ""이라면
			if(searchValue.equals("")) {
				//employee테이블의 컬럼 employee_no의 오름차순으로 employee_no, employee_name, employee_age에 담긴 값을 출력한다
				//LIMIT ?값 startPage에 담긴 값부터 두번째 ?값 rowPerPage에 담긴 값만큼 출력한다
				pstmt = conn.prepareStatement("SELECT employee_no, employee_name, employee_age FROM employee ORDER BY employee_no DESC LIMIT ?, ?");
				pstmt.setInt(1, startPage);
				pstmt.setInt(2, rowPerPage);
			
			//만약 employeeList에서 searchValue값이 있다면
			} else {
				//employee_name이 LIKE =%searchValue%인 열의 값을 모두 출력한다
				pstmt = conn.prepareStatement("SELECT employee_no, employee_name, employee_age FROM employee WHERE employee_name LIKE ? ORDER BY employee_no DESC LIMIT ?, ?");
				pstmt.setString(1, "%"+searchValue+"%");
				pstmt.setInt(2, startPage);
				pstmt.setInt(3, rowPerPage);
			}
			//쿼리 실행
			rs = pstmt.executeQuery();
			//rs에 담긴 값이 있다면 그 수만큼 대입
			while(rs.next()) {
				//Employee 를 통해 생성된 객체 employee에 생성자 메서드를통해 생성된 Employee의 주소값을 대입
				Employee employee = new Employee();
				//employee에 담긴 주소값을 따라가 세팅
				employee.setEmployeeNo(rs.getInt("employee_no"));
				employee.setEmployeeName(rs.getString("employee_name"));
				employee.setEmployeeAge(rs.getInt("employee_age"));
				
				//리스트에 employee객체 자동으로 추가
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
		//arrayListEmployee를 employeeList.jsp에 리턴
		return arrayListEmployee;
	}
	
	
	//insertEmployee메서드는 Employee테이블에 한 행의 데이터(employee_name, employee_age)를 추가하기 위한 메서드
	//매개변수 Employee는 employee_name, employee_age데이터 값이 담겨있다
	public void insertEmployee(Employee employee) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/stemcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);		
			
			//employee테이블의 employee_name과 employee_age를 INSERT하기 위한 메서드 
			pstmt = conn.prepareStatement("INSERT INTO employee(employee_name, employee_age) VALUES (?,?)");
			//VALUES값 ?에 insertEmployeeAction.jsp페이지에서 받아온 값을 대입
			pstmt.setString(1, employee.getEmployeeName());
			pstmt.setInt(2, employee.getEmployeeAge());
			//쿼리 실행
			pstmt.executeUpdate();
					
		} catch(ClassNotFoundException x) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다 ");		
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "rs");}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "pstmt");}
			if (conn != null) try { conn.close(); } catch(SQLException e) {System.out.println(e.getMessage() + "conn");}
		}		
	}	
}