package com.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.beans.Contact;
import com.beans.Item;
import com.beans.Tableau;
import com.service.CategoryService;
import com.service.CategoryTabService;
import com.service.ContactService;
import com.service.ItemService;
import com.service.TableauService;
import com.service.UserService;

@Controller
public class Main {

	@Autowired
	private UserService userService;
	@Autowired
	private CategoryService categService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private TableauService tabServ;
	@Autowired
	private CategoryTabService categTabServ;
	@Autowired
	private ContactService contServ;

	@RequestMapping("/")
	public String index(HttpServletRequest request) {
		request.setAttribute("categs", categService.getListCategorys());
		return "index";
	}

	@RequestMapping("/login.xhtml")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		if (request.getSession().getAttribute("user") != null) {
			return "redirect:/admin/";
		} else {
			request.setAttribute("categs", categService.getListCategorys());
			return "Login";
		}

	}

	@RequestMapping(value = "/login.xhtml", method = RequestMethod.POST)
	public String parseLogin(HttpServletRequest request) {
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		if (userService.authentifier(login, password)) {
			HttpSession session = request.getSession();
			session.setAttribute("type", "admin");
			session.setAttribute("user", login);
			return "redirect:/admin/";
		} else {
			request.setAttribute("failure", true);
		}

		return "Login";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/Produits.xhtml")
	public String listeproduits(HttpServletRequest request) {

		request.setAttribute("prods", itemService.getAllItems());
		request.setAttribute("categs", categService.getListCategorys());
		return "ListeProduits";
	}

	@RequestMapping("/Produits.xhtml/{cat}")
	public String listeproduitsCat(Model model, @PathVariable("cat") String cat, HttpServletRequest request) {
		int categorie = Integer.parseInt(cat);
		request.setAttribute("prods", itemService.getItemsByCategory(categorie));
		request.setAttribute("categs", categService.getListCategorys());
		return "ListeProduits";
	}

	@RequestMapping("/tableaux.xhtml")
	public String listeTableaux(HttpServletRequest request) {
		request.setAttribute("tabs", tabServ.getListTableau());
		request.setAttribute("categs", categTabServ.getList());
		return "ListeTableaux";
	}

	@RequestMapping("tableaux.xhtml/{cate}")
	public String listeTabCategorie(Model model, @PathVariable("cate") String cate, HttpServletRequest request) {
		int categ = Integer.parseInt(cate);
		request.setAttribute("tabs", tabServ.getListByCateg(categ));
		request.setAttribute("categs", categTabServ.getList());
		return "ListeTableaux";
	}

	@RequestMapping("/contact.xhtml")
	public String showContact(HttpServletRequest request) {
		String type = request.getParameter("type");
		if (null != type) {
			int id = Integer.parseInt(request.getParameter("id"));
			if (type.equals("tableau")) {
				Tableau tab = tabServ.getTableau(id);
				request.setAttribute("obj", tab);

			} else {
				Item item = itemService.getItemById(id);
				request.setAttribute("obj", item);
			}
		}
		return "Contact";
	}

	@RequestMapping(value = "/contact.xhtml", method = RequestMethod.POST)
	public String parseContact(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		String type = request.getParameter("type");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String email = request.getParameter("email");
		int nombre = Integer.parseInt(request.getParameter("quantite"));
		Contact cont = new Contact();
		if (type.equals("tableau"))
			cont.setIdTab(id);
		cont.setNom(nom);
		cont.setPrenom(prenom);
		cont.setEmail(email);
		cont.setQuantite(nombre);
		contServ.ajouterContact(cont);
		request.setAttribute("succes", true);
		return "Contact";
	}

}
