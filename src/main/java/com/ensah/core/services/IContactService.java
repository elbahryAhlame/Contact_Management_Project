package com.ensah.core.services;

import java.util.List;

import com.ensah.core.bo.Contact;

public interface IContactService
{
	public void addContact(Contact pcontact);
	public List<Contact> contacts();
	public void suprimerContact(Long id);
	public Contact getContactById(Long di);
	public void updateContact(Contact contact);
	public List<Contact> contactByNom(String nom);
	public List<Contact> contactBytelProf(String tel);
	public List<Contact> contactBytelPers(String tel);
	public List<Contact> tousContact();
}
