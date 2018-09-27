package com.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Item")
public class Item {
	@Id
	@Column(name = "idItem")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String info;
	private String taille;
	private double prix;
	private int categorie;
	private String typeBois;
	private String nom;
	private String date;

	@Transient
	MultipartFile image;

	public Item() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getTaille() {
		return taille;
	}

	public void setTaille(String taille) {
		this.taille = taille;
	}

	public double getPrix() {
		return prix;
	}

	public void setPrix(double prix) {
		this.prix = prix;
	}

	public int getCategorie() {
		return categorie;
	}

	public void setCategorie(int category) {
		this.categorie = category;
	}

	public String getTypeBois() {
		return typeBois;
	}

	public void setTypeBois(String typeBois) {
		this.typeBois = typeBois;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

}
