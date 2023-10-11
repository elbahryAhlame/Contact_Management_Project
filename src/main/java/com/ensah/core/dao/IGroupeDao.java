package com.ensah.core.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ensah.core.bo.Groupe;

public interface IGroupeDao extends JpaRepository<Groupe, Long>, IGroupeDaoCustom 
{
List<Groupe> findByNom(String nom);
}
