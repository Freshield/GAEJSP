package foo;

public class DiceRoller {
	public static String rollDice(String more){
		return ((int)((Math.random()*6)+1)+more);
	}

}
