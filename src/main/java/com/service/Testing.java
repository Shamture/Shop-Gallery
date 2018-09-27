package com.service;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

public class Testing {

	public static void main(String[] args) throws NoSuchAlgorithmException, InvalidKeySpecException {
		/*
		 * String pass = "Produit2017";
		 * System.out.println(Crypteur.generateStorngPasswordHash(pass));
		 */
		System.out.println(new ItemServiceImpl().getLastitemId());
	}

}
