package tp2_JAVA;

public class Point {
	private double x,y;
	
	public double getX() {
		return x;
	}
	public double getY() {
		return y;
	}
	public void setX(double a) {
		x=a;
	}
	public void setY(double a) {
		y=a;
	}
	public String toString() {
		return ("("+x+" , "+y+")");
	}
	public Point(double x,double y) {
		this.x=x;
		this.y=y;
	}
	public Point(){
		x=0.0;
		y=0.0;	
	}
	public double calculerDistance(Point p) {
		double res=Math.sqrt(Math.pow(x-p.getX(),2)+Math.pow(y-p.getY(),2));
		return res;
		
	}
	public Point calculerMilieu(Point p) {
		Point aux=new Point();
		aux.x=(this.x+p.getX())/2;
		aux.y=(this.y+p.getY())/2;
		return aux;
		
	}
	
	
	

	
	public static void main(String[] args) {
		Point p1=new Point(2.5,4.5);
		Point p2=new Point(5.5,6.5);
		System.out.println(p1);
		System.out.println("Distance ="+p1.calculerDistance(p2));
		System.out.println("Milieu ="+p1.calculerMilieu(p2));
		
		
		
	}

}
