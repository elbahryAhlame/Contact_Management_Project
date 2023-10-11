package com.ensah.core.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ensah.core.bo.Contact;
import com.ensah.core.dao.IContactDao;

@Service
@Transactional
public class ContactServiseImpl implements IContactService
{
	@Autowired
	private IContactDao contactDao;
	public void addContact(Contact pcontact)
	{
		contactDao.save(pcontact);
		
	}
	@Override
	public List<Contact> contacts() {
		return contactDao.findAllByOrderByNomAsc();
	};
	
	public void suprimerContact(Long id)
	{
		contactDao.delete(getContactById(id));
	}
	@Override
	public Contact getContactById(Long di) {
		// TODO Auto-generated method stub
		return contactDao.findById(di).get();
	}
	@Override
	public void updateContact(Contact contact) {
		contactDao.save(contact);
	

	}
	@Override
	public List<Contact> contactByNom(String nom) {

		return contactDao.findAllByNom(nom);
	}
	@Override
	public List<Contact> contactBytelProf(String tel) {
		// TODO Auto-generated method stub
		System.out.println("im prof servise");
		return contactDao.findAllByNumeroProfessionnel(tel);
		

	}
	@Override
	public List<Contact> contactBytelPers(String tel) {
		// TODO Auto-generated method stub
		return contactDao.findAllByNumeroPersonnel(tel);
	}
	@Override
	public List<Contact> tousContact() {
		// TODO Auto-generated method stub
		return contactDao.findAll();
	}
	

		
	
	
}
