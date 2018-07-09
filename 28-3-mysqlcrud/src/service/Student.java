package service;

public class Student {
	private String name;
	private int age;
	private int countno;
	private int no;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		System.out.println(name +"<=setName");
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		System.out.println(age +"<=setage");
		this.age = age;
	}
	public int getCountno() {
		return countno;
	}
	public void setCountno(int countno) {
		this.countno = countno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		System.out.println(no);
		this.no = no;
	}
	

}
