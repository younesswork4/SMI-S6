package tp2_JAVA;

public class stagiaire {
private String nom;
private float[] notes;

public String getNom() {
	return nom;
}
public void setNom(String nom) {
	this.nom = nom;
}
public float[] getNotes() {
	return notes;
}
public void setNotes(float[] notes) {
	this.notes = notes;
}
public stagiaire(String n,float[] nt) {
	nom=n;
	notes=nt;
}
public float calculerMoyenne() {
	float somme=0;
	int cmp=0;
	for (float current : notes) {
		somme=somme+current;
		cmp++;
		}
	return(somme/cmp);
}
public float trouverMax() {
	float max=notes[0];
	for (int i = 0; i < notes.length; i++) {
	if (max <= notes[i]) {
		max=notes[i];
	} 
	
	}
	return max;
		}
	public float trouverMin() {
		float min=notes[0];
		for (int i = 0; i < notes.length; i++) {
		 if (min >= notes[i]) {
			min=notes[i];
		}
			}return min;}
	
}


