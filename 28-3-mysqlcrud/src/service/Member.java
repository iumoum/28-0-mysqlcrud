/*18.06.26 28기 정규룡*/
package service;

public class Member { // 클래스 이름
	private int memberNo;
	private String memberName;
	private int memberAge;
	/*각각의 변수들은 private 접근제어자 때문에 해당 클래스에서만 접근이 가능하다.
	그렇기 때문에 메서드에 public 접근제어자를 사용하여 어떤 클래스에서라도 접근 가능하게 해서 사용하는것*/
	
	public int getMemberNo() { // get메서드를 실행하면 실행한곳으로 memberNo값을 리턴한다.
		return memberNo;
	}
	public void setMemberNo(int memberNo) { // set메서드를 실행하면 입력변수의 값이 위의 지역변수에 대입된다.
		this.memberNo = memberNo;
	}
	public String getMemberName() { // get메서드를 실행하면 실행한곳으로 memberName값을 리턴한다.
		return memberName;
	}
	public void setMemberName(String memberName) { // set메서드를 실행하면 입력변수의 값이 위의 지역변수에 대입된다.
		this.memberName = memberName;
	}
	public int getMemberAge() { // get메서드를 실행하면 실행한곳으로 memberAge값을 리턴한다.
		return memberAge;
	}
	public void setMemberAge(int memberAge) { // set메서드를 실행하면 입력변수의 값이 위의 지역변수에 대입된다.
		this.memberAge = memberAge;
	}
	
	
}
