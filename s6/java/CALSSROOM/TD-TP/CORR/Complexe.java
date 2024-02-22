package tp2_JAVA;

public class Complexe {
	
	private final float re,im;
	
	 Complexe() {
		re=0;
		im=0;
	}
	 Complexe(float a,float b) {
		 re=a;
		 im=b;
	 }
	 Complexe( Complexe c) {
		 re=c.re;
		 im=c.im;
	 }
	 public String toString() {
		 return(re+"+i"+im);
	 }
	 public float getRe() {
		 return  re;
	 }
	public float getIm(){
	return im;
	}
	
 public  Complexe  addition(  Complexe c2) {
float re, im;
re =this.getRe()+c2.getRe();
im =this.getIm()+c2.getIm();
Complexe c=new Complexe(re,im);
return c; 
 } 
	
public  Complexe  soustraction(  Complexe c2) {
float re, im;
re =this.getRe()-c2.getRe();
im =this.getIm()-c2.getIm();
Complexe c=new Complexe(re,im);
return c; 
} 

public  Complexe  division(  Complexe c2) {
float re, im;
float div=(float)(Math.pow(c2.getRe(),2)+Math.pow(c2.getIm(),2));
re =((this.getRe()+c2.getRe())+(this.getIm()+c2.getIm()))/div;
im =(this.getIm()*c2.getRe()-this.getRe()*c2.getIm())/div;
Complexe c=new Complexe(re,im);
return c;}

public static Complexe  additionner(  Complexe c2,Complexe c1) {
float re, im;
re =c1.getRe()+c2.getRe();
im =c1.getIm()+c2.getIm();
Complexe c=new Complexe(re,im);
return c; 
} 

public float moudule() {
float re =	this.re*this.re;
float im=this.im*this.im;
return  ((float)Math.sqrt(re+im));
}

double argument() {
	
return Math.atan( re/im);}

	
public  Complexe  addition(  int n ) {
float re, im;
re =this.getRe()*n;
im =this.getIm()*n;
Complexe c=new Complexe(re,im);
return c; 
} 
public boolean equals(  Complexe c2) {

if(this.getRe()==c2.getRe() && this.getIm()==c2.getIm()) {
return true;}
return false;
}
}