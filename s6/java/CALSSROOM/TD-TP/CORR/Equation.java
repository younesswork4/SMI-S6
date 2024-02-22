package tp2_JAVA;
import java.util.Scanner;

public class Equation {
	static Scanner sc=new Scanner(System.in);
	
	private float a,b,c,delta;
	private Complexe s1,s2;
	Equation (float a,float b,float c){
		this.a=a;
		this.c=c;
		this.b=b;
		delta=(b*b)-4*a*c;
		
	}
	public void afficherDescriminant() {
		System.out.println("le discriminant = "+delta);
		
	}
public void resoudre() {
float	re=-b/2*a;
float im=(float)(Math.sqrt(-delta)/2*a);
s1=new Complexe(re,im);
s2=new Complexe(re,-im);
}
public void afficherSolutions() {
	System.out.println("les solutions de l'équation sont : ");
	System.out.println(s1);
	System.out.println(s2);
}
public static void main(String[] args) {
	System.out.println("tapez a");
	float a=sc.nextFloat();
	System.out.println("tapez b");
	float b=sc.nextFloat();
	System.out.println("tapez c");
	float c=sc.nextFloat();
	Equation e1=new Equation(a,b,c);
	e1.afficherDescriminant();
	e1.resoudre();
	e1.afficherSolutions();
	
	
}
}
