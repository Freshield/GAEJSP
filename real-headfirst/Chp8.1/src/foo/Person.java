package foo;

import foo.Dog;

public class Person {
	
	private String name;
	
	private Dog dog;
	
	public void setName(String n){
		name = n;
	}
	
	public String getName(){
		return name;
	}
	
	public Dog getDog(){
		return dog;
	}
	
	public void setDog(Dog dd){
		dog = dd;
		
	}

}
