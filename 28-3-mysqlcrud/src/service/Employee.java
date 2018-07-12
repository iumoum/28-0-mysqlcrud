//2018-07-12 서연문
package service;

//employee 테이블의 각 컬럼에 데이터를 setter getter 하기위한 class파일
//직원의 이름과 나이를 입력
public class Employee {
	
	//접근지정자 private(해당 클래스 내에서만 사용 가능)에 해당 테이블의 데이터 유형에 맞는 데이터타입으로 EmployeeNo, EmployeeName, EmployeeAge 변수 생성
	//PRIMARY KEY = employeeNo(AUTO_INCREMENT)
	private int employeeNo;
	private String employeeName;
	private int employeeAge;
	
	// getEmployeeNo set메서드로 설정된 값을 받아오는 메서드, 
	// 리턴 데이터 타입은 int 
	// 리턴 되는 값은 EmployeeNo 변수 내부에 담긴 값
	public int getEmployeeNo() {
		return employeeNo;
	}
	// setEmployeeNo변수내에 값을 설정하는 메서드
	// int형 데이터 타입
	// employeeNo매개변수에 입력받음 
	public void setEmployeeNo(int employeeNo) {
		this.employeeNo = employeeNo;
	}
	
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	
	public int getEmployeeAge() {
		return employeeAge;
	}
	public void setEmployeeAge(int employeeAge) {
		this.employeeAge = employeeAge;
	}	
}