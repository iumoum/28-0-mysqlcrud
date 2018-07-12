//2018-07-12 서연문
package service;

//Employee클래스와 EmployeeScore클래스를 한번에 
//employee테이블과 employee_score테이블을 INNER JOIN하기 위한 클래스
public class EmployeeAndScore {
	
	
	private Employee employee;
	private EmployeeScore employeeScore;
	
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	public EmployeeScore getEmployeeScore() {
		return employeeScore;
	}
	public void setEmployeeScore(EmployeeScore employeeScore) {
		this.employeeScore = employeeScore;
	}	
}