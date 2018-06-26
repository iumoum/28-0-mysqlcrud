package service;

public class student {
	private String name;
	private int age;
	
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

}
