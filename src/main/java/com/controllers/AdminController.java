package com.controllers;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.beans.Contact;
import com.beans.Item;
import com.beans.Tableau;
import com.beans.User;
import com.service.CategoryService;
import com.service.CategoryTabService;
import com.service.ContactService;
import com.service.ItemService;
import com.service.Mail;
import com.service.TableauService;
import com.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ItemService itemService;
	@Autowired
	private CategoryService categService;
	@Autowired
	private UserService userService;
	@Autowired
	private TableauService tabService;
	@Autowired
	private CategoryTabService categTabService;
	@Autowired
	private ContactService contServ;

	@RequestMapping("/")
	public String adminHome() {
		return "AdminHome";
	}

	@InitBinder
	public void initialiseBinder(WebDataBinder binder) {
		binder.setDisallowedFields("id");

	}

	@RequestMapping("/creer-produit")
	public String createProduct(Model model, HttpServletRequest request) {
		model.addAttribute("newProduct", new Item());
		request.setAttribute("categs", categService.getListCategorys());
		return "CreerProduit";
	}

	@RequestMapping(value = "/creer-produit", method = RequestMethod.POST)
	public String pressesCreateProduct(@ModelAttribute("newProduct") @Valid Item item, BindingResult result,
			HttpServletRequest request) {
		MultipartFile file = item.getImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		try {
			itemService.createItem(item);
			int lastId = itemService.getLastitemId();
			file.transferTo(new File(rootDirectory + "/resources/images/produits/" + lastId + ".jpg"));
			System.err.println("transfer ave success");
			request.setAttribute("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("success", false);
		}
		request.setAttribute("categs", categService.getListCategorys());
		return "CreerProduit";

	}

	@RequestMapping("/gerer-compte")
	public String gererCompte() {

		return "GererCompte";
	}

	@RequestMapping(value = "/gerer-compte", method = RequestMethod.POST)
	public String parseGererCompte(HttpServletRequest request) {
		String pass = request.getParameter("password");
		HttpSession session = request.getSession();
		String login = (String) session.getAttribute("user");

		if (userService.authentifier(login, pass)) {
			String newPass = request.getParameter("new_password");
			User user = userService.getuserByLogin(login);
			user.setPassword(newPass);
			userService.updateuser(user);
			request.setAttribute("success", true);
		} else {
			request.setAttribute("success", false);
		}
		return "GererCompte";
	}

	@RequestMapping("/ajouter-tableau")
	public String ajouterTableau(Model model, HttpServletRequest request) {
		model.addAttribute("newtab", new Tableau());
		request.setAttribute("categs", categTabService.getList());
		return "AjouterTableau";
	}

	@RequestMapping(value = "/ajouter-tableau", method = RequestMethod.POST)
	public String parseAjoutertab(@ModelAttribute("newtab") @Valid Tableau tab, BindingResult result,
			HttpServletRequest request) {
		MultipartFile file = tab.getImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		try {
			tabService.ajouterTableau(tab);
			int lastId = tabService.getLastId();
			file.transferTo(new File(rootDirectory + "resources/images/tableau/" + lastId + ".jpg"));

			request.setAttribute("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("success", false);
		}
		request.setAttribute("categs", categTabService.getList());
		return "AjouterTableau";
	}

	@RequestMapping("/liste-contacts.xhtml")
	public String lsiteContact(HttpServletRequest request) {
		request.setAttribute("conts", contServ.getlistNonVue());
		return "ListeContacts";
	}

	@RequestMapping("/repondre-contact.xhtml")
	public String voirContact(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Contact cont = contServ.getContact(id);
		request.setAttribute("cont", cont);
		if (cont.getIdTab() > 0) {
			Tableau tab = tabService.getTableau(cont.getIdTab());
			request.setAttribute("tab", tab);
		} else {
			Item item = itemService.getItemById(cont.getIdProd());
			request.setAttribute("prod", item);
		}
		return "VoirContact";
	}

	@RequestMapping(value = "/repondre-contact.xhtml", method = RequestMethod.POST)
	public String sendAnswer(HttpServletRequest request) {
		String reponse = request.getParameter("reponse");
		Mail.SendAnswer(request.getParameter("email"), "Demande Achat", reponse);
		return "redirect:/admin/liste-contacts.xhtml";
	}

}
