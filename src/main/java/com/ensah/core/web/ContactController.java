package com.ensah.core.web;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ensah.core.bo.Contact;
import com.ensah.core.bo.Groupe;
import com.ensah.core.services.IContactService;
import com.ensah.core.services.IGroupeService;

@Controller
public class ContactController
{
	protected final Logger LOGGER = Logger.getLogger(getClass());
	@Autowired
	IContactService serviceContact;
	@Autowired 
	IGroupeService serviceGroupe;
	
///ajouter contact
	

	@RequestMapping("/addContact")
	public String save(@Valid @ModelAttribute("contactModel") Contact contact , BindingResult bindingResult,Model model)
	{
		if (bindingResult.hasErrors()) 
		{
			model.addAttribute("errorMsg", "Les données sont invalides.");
			LOGGER.warn("Erreur de validation du formulaire");
		}
		else
		{
			model.addAttribute("infoMsg", "Personne ajouté avec succès");
			serviceContact.addContact(contact);
		}
		return "accueil";
		}
	
	//page d'accueil
	
	@RequestMapping("/")
	public String accueil(Model model)
	{
		model.addAttribute("contactModel", new Contact());
		return "accueil";
	}
	
	@RequestMapping("/afficherContacts")
     public String afficherContact(Model m)
     {
		List <Contact> contacts=serviceContact.contacts();
		m.addAttribute("contacts",contacts);
		return "affichageContacts";
     }
	
	//suprimer contat
	
	@RequestMapping("/suprimerContact")
    public String suprimerContact(@RequestParam("id") Long id,Model m )
    {
		serviceContact.suprimerContact(id);
		List <Contact> contacts=serviceContact.contacts();
		System.out.println(contacts.toString());
		m.addAttribute("contacts",contacts);
		return "affichageContacts";
		 }
	//redireger vers page de modefication contact
	
	@RequestMapping("/modifierrContact")
    public String modifierContact(@RequestParam("id") Long id,Model m )
    {
		Contact c = serviceContact.getContactById(Long.valueOf(id));
		m.addAttribute("contact",c);
		return "modifierContact";
		 }
	//enregestrer les modefications
	
	@RequestMapping("/validerModefication")
    public String ValidermodifierContact(@Valid @ModelAttribute("contact") Contact c , BindingResult bindingResult,Model model )
    {
		if (bindingResult.hasErrors()) 
		{
			model.addAttribute("errorMsg", "Les données sont invalides.");
			LOGGER.warn("Erreur de validation du formulaire");
             model.addAttribute("contact",c);	
			return "modifierContact";
		}
		else
		{
			model.addAttribute("infoMsg", "Personne ajouté avec succès");
			serviceContact.updateContact(c);
			return afficherContact(model);
		}

    }
	
	//recherche par le nom 
	@RequestMapping("/searchByNom")
    public String rechercherNom( @RequestParam("nomRecherche") String nom,Model model )
    {
		List<Contact> c = serviceContact.contactByNom(nom);
    model.addAttribute("contacts",c);
    return "affichageContacts";
    }
	
//recherche par le telephone
	
	@RequestMapping("/searchBytel")
    public String recherchertel( @RequestParam("numero") String numero , Model model )
{
		List<Contact> c=null;
	
		String numero2=numero.trim();
		
			c =serviceContact.contactBytelProf(numero2);
			
		if(c.isEmpty() )
		{
			
			c =serviceContact.contactBytelPers(numero2);
			 
			   
		}

model.addAttribute("contacts",c);

		return "affichageContacts";
	
}
	//rederiger vers creer groupe
	
	
	@RequestMapping("/creerGroupe")
	public String createGroupe(Model m)
	{
	List<Contact> c= serviceContact.tousContact();
		 m.addAttribute("contacts",c);
		Groupe g = new Groupe();
		m.addAttribute("groupe",g);
		return "formuleGroupe";
		
	}
	
	//ajouter groupe
	
	@RequestMapping("/EnregestrerGroup")
	public String ajouterGroupe(@RequestParam("nom") String nom, @RequestParam("selectedContacts")  String[] contactsSelectionnes ,Model m)
	{
       List<Contact> contacts =new ArrayList<>();
       for (String id : contactsSelectionnes)
       {
    	   Contact c = serviceContact.getContactById(Long.valueOf(id));
    	   contacts.add(c);
       }
       Groupe grp = new Groupe();
       grp.setNom(nom);
       grp.setContacts(contacts);
       serviceGroupe.ajouter(grp);
       List<Groupe> groupes=serviceGroupe.getGroup();
       m.addAttribute("groupes",groupes);
	return "afficherGroupe";
	}
	
	//rechercher groupe par nom
	
	@RequestMapping("/searchGroupByNom")
    public String rechercherGroupNom( @RequestParam("nomRecherche") String nom,Model model )
    {
		List<Groupe> g = serviceGroupe.groupeByNom(nom);
    model.addAttribute("groupes",g);
    return "afficherGroupe";
    }
	
	//suprimer groupe
	
	@RequestMapping("/suprimerGroupe")
    public String suprimerGrp(@RequestParam("id") Long id,Model m )
    {
		serviceGroupe.suprimerGroupe(id);
		List <Groupe> groupes=serviceGroupe.getGroup();
		m.addAttribute("groupes",groupes);
		return "afficherGroupe";
		 }
	
	//afficher groupes
	
	@RequestMapping("/afficherGroupe")
	public String afficherGroupe(Model m)
	{
		List <Groupe> groupes=serviceGroupe.getGroup();
		m.addAttribute("groupes",groupes);
		return "afficherGroupe";
	}
	
	
	//afficher les contacts d'un groupes 
	
	@RequestMapping("/ContactsGroupes")
    public String ContactsGroupes(@RequestParam("id") Long id,Model m )
    {
		
		Groupe grp = serviceGroupe.getGroupeId(id);
		List<Contact> contacts = grp.getContacts();
		m.addAttribute("infoMsg", grp.getNom());
		m.addAttribute("contacts",contacts);
		return "affichageContactsGroupe";
		
		 }
	}


