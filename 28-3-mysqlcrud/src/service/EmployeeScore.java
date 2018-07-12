//2018-07-12 서연문
package service;

//employee_score 테이블의 각 컬럼에 데이터를 setter getter 하기위한 class파일
//직원의 이름을 참조하여 직원의 점수를 입력
public class EmployeeScore {
	
	//접근지정자 private에 해당 테이블의 데이터 유형에 맞는 데이터타입으로 employeeScoreNo, employeeNo, score 변수 생성
	//PRIMARY KEY = employeeScoreNo(AUTO_INCREMENT)
	//외래키 = employeeNo 참조테이블:employee 참조열:employeeNo
	private int employeeScoreNo;
	private int employeeNo;
	private int score;
	
	public int getEmployeeScoreNo() {
		return employeeScoreNo;
	}
	public void setEmployeeScoreNo(int employeeScoreNo) {
		this.employeeScoreNo = employeeScoreNo;
	}
	
	public int getEmployeeNo() {
		return employeeNo;
	}
	public void setEmployeeNo(int employeeNo) {
		this.employeeNo = employeeNo;
	}
	
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}	
}