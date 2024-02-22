package tp2_JAVA;

public class TroisPoints {
private Point premier,deuxieme,troisieme;
public Point getPremier() {
	return premier;
}
public Point getDeuxieme() {
	return deuxieme;
}
public Point getTroisieme() {
	return troisieme;
}
public void setPremier(Point p) {
	this.premier=p;
	
}
public void setDeuxieme(Point p) {
	this.deuxieme=p;
	
}
public void setTroisieme(Point p) {
	this.troisieme=p;
	
}
public TroisPoints(Point p1,Point p2,Point p3) {
	premier=p1;
	deuxieme=p2;
	troisieme=p3;
}
public static boolean sontAlignes(Point p1,Point p2,Point p3) {
	
double resAB=p1.calculerDistance(p2)	;
double resAC=p2.calculerDistance(p3);
double resBC=p3.calculerDistance(p3);
	if(resAB == resAC+resBC || resBC == resAC+resAB || resAC==resAB+resBC) {
		return true;}
			return false;
	
}
public static boolean estIsocele(Point p1,Point p2 ,Point p3) {
	double resAB=p1.calculerDistance(p2)	;
	double resAC=p1.calculerDistance(p3);
	double resBC=p2.calculerDistance(p3);
	if(resAB == resAC || resBC == resAC || resAB==resBC) {
		return true;}
			return false;	
	
}

public static void main(String[] args) {
	Point p1=new Point(2.5,4.5);
	Point p2=new Point(5.5,6.5);
	Point p3=new Point(5,6);
	System.out.println(p1);
	System.out.println(p2);
	System.out.println(p3);
	
	System.out.println("Milieu ="+p1.calculerMilieu(p2));
	System.out.println("Milieu ="+p1.calculerMilieu(p3));
	System.out.println("Milieu ="+p2.calculerMilieu(p3));
	System.out.println("Distance ="+p1.calculerDistance(p2));
	System.out.println("Distance ="+p1.calculerDistance(p3));
	System.out.println("Distance ="+p2.calculerDistance(p3));
	System.out.println("Aligne ="+sontAlignes(p1,p2,p3));	
	System.out.println("Isocele ="+estIsocele(p1,p2,p3));
	
	

	
	
}



}
