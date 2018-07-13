//2018-07-13 서연문
package service;

//employee_addr 테이블의 각 컬럼에 데이터를 setter getter 하기위한 class파일
//직원의 이름을 참조하여 직원의 주소를 입력
public class EmployeeAddr {
	
	//접근지정자 private에 해당 테이블의 데이터 유형에 맞는 데이터타입으로 employeeAddrNo, employeeNo, employeeAddrContent 변수 생성
	//PRIMARY KEY = employeeAddrNo(AUTO_INCREMENT)
	//외래키 = employeeNo 참조테이블:employee 참조열:employeeNo
	private int employeeAddrNo;
	private int employeeNo;
	private String employeeAddrContent;
	
	public int getEmployeeAddrNo() {
		return employeeAddrNo;
	}
	public void setEmployeeAddrNo(int employeeAddrNo) {
		this.employeeAddrNo = employeeAddrNo;
	}
	
	public int getEmployeeNo() {
		return employeeNo;
	}
	public void setEmployeeNo(int employeeNo) {
		this.employeeNo = employeeNo;
	}
	
	public String getEmployeeAddrContent() {
		return employeeAddrContent;
	}
	public void setEmployeeAddrContent(String employeeAddrContent) {
		this.employeeAddrContent = employeeAddrContent;
	}
}