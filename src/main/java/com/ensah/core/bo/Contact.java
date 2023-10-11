package com.ensah.core.bo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Entity
public class Contact 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long idPersonne;
	
	@NotBlank(message = "This field is required")
	private String nom;
	
	@NotBlank(message = "This field is required")
	private String prenom;
	
	
	@NotBlank(message = "This field is required")
	@Pattern(regexp = "\\d{10}", message = "Invalid phone number")
	private String numeroPersonnel;
	
	
	@NotBlank(message = "This field is required")
	@Pattern(regexp = "\\d{10}", message = "Invalid phone number")
	private String numeroProfessionnel ;
	
	
	@NotBlank(message = "This field is required")
	private String genre;
	
	@Email(message = "Enter a valid email")
	@NotBlank(message = "This field is required")
	private String emailPersonnel;
	
	@Email(message = "Enter a valid email")
	@NotBlank(message = "This field is required")
	private String emailProfessionnel;

	@NotBlank(message = "This field is required")
   private String adresse;
	
	
	//nom
	public void setNom(String nom)
	{
		this.nom=nom;
	}
	public String getNom()
	{
		return nom;
	}
	//prenom
	public void setPrenom(String prenom)
	{
		this.prenom=prenom;
	}
	public String getPrenom()
	{
		return prenom;
	}
	//numeroPersonnel
	public void setNumeroPersonnel(String numPers)
	{
		this.numeroPersonnel=numPers;
	}
	public String getNumeroPersonnel()
	{
		return numeroPersonnel;
	}
	//numeroProfessionnel
	public void setNumeroProfessionnel(String numProf)
	{
		this.numeroProfessionnel=numProf;
	}
	public String getNumeroProfessionnel()
	{
		return numeroProfessionnel;
	}
	//gender
	public void setGenre(String gender)
	{
		this.genre=gender;
	}
	public String getGenre()
	{
		return genre;
	}
	//emailProf
	public void setEmailPersonnel(String email)
	{
		this.emailPersonnel=email;
	}
	public String getEmailPersonnel()
	{
		return emailPersonnel;
	}
	//emailProf
	
	
	public void setEmailProfessionnel(String email)
	{
		this.emailProfessionnel=email;
	}
	public String getEmailProfessionnel()
	{
		return emailProfessionnel;
	}
	//adresse
	public void setAdresse(String adresse) 
	{
		this.adresse=adresse;
	}
	public String getAdresse()
	{
		return adresse;
	}
	
	//id

	public long getIdPersonne()
	{
		return idPersonne;
	}
	public void setIdPersonne(long id)
	{
		this.idPersonne=id;
	}
	
	
	
	
	
	
	
	
	
	
}
