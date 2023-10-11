package com.ensah.core.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ensah.core.bo.Contact;

public interface IContactDao extends JpaRepository<Contact, Long>, IContactDaoCustom 
{
	  List<Contact> findAllByOrderByNomAsc();
	  List<Contact> findAllByNom(String nom);
	  List<Contact> findAllByNumeroProfessionnel(String tel);
	  List<Contact> findAllByNumeroPersonnel(String tel);
	 List<Contact>  findAll();
	  
}
