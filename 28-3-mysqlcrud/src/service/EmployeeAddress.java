//2018-07-12 서연문
package service;

//employee_address 테이블의 각 컬럼에 데이터를 setter getter 하기위한 class파일
//직원의 이름을 참조하여 직원의 주소를 입력
public class EmployeeAddress {
	
	//접근지정자 private에 해당 테이블의 데이터 유형에 맞는 데이터타입으로 employeeAddressNo, employeeNo, employeeAddressContent 변수 생성
	//PRIMARY KEY = employeeAddressNo(AUTO_INCREMENT)
	//외래키 = employeeNo 참조테이블:employee 참조열:employeeNo
	private int employeeAddressNo;
	private int employeeNo;
	private String employeeAddressContent;
	
	public int getEmployeeAddressNo() {
		return employeeAddressNo;
	}
	public void setEmployeeAddressNo(int employeeAddressNo) {
		this.employeeAddressNo = employeeAddressNo;
	}
	
	public int getEmployeeNo() {
		return employeeNo;
	}
	public void setEmployeeNo(int employeeNo) {
		this.employeeNo = employeeNo;
	}
	
	public String getEmployeeAddressContent() {
		return employeeAddressContent;
	}
	public void setEmployeeAddressContent(String employeeAddressContent) {
		this.employeeAddressContent = employeeAddressContent;
	}
}