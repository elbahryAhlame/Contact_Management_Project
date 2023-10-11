package com.ensah.core.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ensah.core.bo.Groupe;
import com.ensah.core.dao.IGroupeDao;

@Service
@Transactional
public class GroupeServiceImpl implements IGroupeService 
{
	@Autowired
    IGroupeDao groupeDao;
	@Override
	public void ajouter(Groupe grp)
	{
		groupeDao.save(grp);
		
		
	}
	@Override
	public List<Groupe> getGroup() {
		// TODO Auto-generated method stub
		return groupeDao.findAll();
	}
	@Override
	public List<Groupe> groupeByNom(String nom) {
		// TODO Auto-generated method stub
		return groupeDao.findByNom(nom);
	}
	@Override
	public void suprimerGroupe(Long id) {
		// TODO Auto-generated method stub
		
		groupeDao.delete(getGroupeId(id));
		
	}
	@Override
	public Groupe getGroupeId(Long id) 
	{
return groupeDao.findById(id).get();	
	}
	
}
