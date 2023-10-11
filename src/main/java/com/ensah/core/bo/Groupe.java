package com.ensah.core.bo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;


@Entity
public class Groupe
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idGroup;
	
	
	@NotBlank(message = "This field is required")
	private String nom;
	
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinColumn(name = "id_groupe")
	private List<Contact> contacts = new ArrayList<Contact>();
	
	public void  setIdGroup(Long id)
	{
		this.idGroup=id;
	}
	public Long getIdGroup()
	{
		return idGroup;
	}
	//contact
	public void setContacts(List<Contact> c)
	{
		this.contacts=c;
	}
	public List<Contact> getContacts()
	{
		return contacts;
	}
	//nom
	
	
	public void setNom(String nom)
	{
		this.nom=nom;
	}
	public String getNom()
	{
		return nom;
	}
	
}
