package com.ensah.core.services;

import java.util.List;

import com.ensah.core.bo.Groupe;

public interface IGroupeService 
{
	   public void ajouter(Groupe grp);
	   public List<Groupe> getGroup();
	   public List<Groupe> groupeByNom(String nom);
	   public void suprimerGroupe(Long id);
	   public Groupe getGroupeId(Long id);

}
