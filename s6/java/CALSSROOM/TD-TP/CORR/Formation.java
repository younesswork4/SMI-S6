package tp2_JAVA;

public class Formation {
	private String intitule ;
	private int nbrJours;
	private stagiaire[] stagiaires ;

	public String getIntitule() {
		return intitule;
	}
	public void setIntitule(String intitule) {
		this.intitule = intitule;
	}
	public int getNbrJours() {
		return nbrJours;
	}
	public void setNbrJours(int nbrJours) {
		this.nbrJours = nbrJours;
	}
	public stagiaire[] getStagiaires() {
		return stagiaires;
	}
	public void setStagiaires(stagiaire[] stagiaires) {
		this.stagiaires = stagiaires;
	}
	
	public Formation(String intitule, int nbrJours, stagiaire [] stagiaires) {
		this.intitule=intitule;
		this.nbrJours=nbrJours;
		this.stagiaires=stagiaires;
	}
public float calculerMoyenneFormation() {
	float sum=0;
	int cmp=0;
	for(int i=0;i<stagiaires.length;i++) {
		sum=sum+stagiaires[i].calculerMoyenne();
		cmp++;
	}
	return (sum/cmp);
}
public int getIndexMax() {
	int index=0;
	float max=stagiaires[0].trouverMax();
	for(int i=0;i<stagiaires.length;i++) {
		if(max < stagiaires[i].trouverMax())
		{max=stagiaires[i].trouverMax();
index=i;}
	}
	return index;
}
public void afficherNomMax() {
	
	
System.out.println(stagiaires[getIndexMax()].getNom());	
	
}
public void afficherMinMax() {
		
System.out.println(stagiaires[getIndexMax()].trouverMin());		
}
public void trouverMoyenneParNom(String nom) {
	for(int i=0;i<stagiaires.length;i++) {
		if (stagiaires[i].getNom()==nom);
		{System.out.println(stagiaires[i].calculerMoyenne());
			}
		}
	
	
}
}
