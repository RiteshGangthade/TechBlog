package com.tech.blog.entities;

import java.sql.*;

public class user {
	private int idl;
	private String name;
	private String email;
	private String passward;
	private String gender;
	private String about;
	private Timestamp dateTime;
	private String profile;

	public user(int idl, String name, String email, String passward, String gender, String about, Timestamp dateTime) {
		super();
		this.idl = idl;
		this.name = name;
		this.email = email;
		this.passward = passward;
		this.gender = gender;
		this.about = about;
		this.dateTime = dateTime;
	}

	public user(String name, String email, String passward, String gender, String about) {
		super();
		this.name = name;
		this.email = email;
		this.passward = passward;
		this.gender = gender;
		this.about = about;

	}

	public user() {
		this.idl = idl;
		this.name = name;
		this.email = email;
		this.passward = passward;
		this.gender = gender;
		this.about = about;
		this.dateTime = dateTime;
	}

	public void setIdl(int idl) {
		this.idl = idl;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassward(String passward) {
		this.passward = passward;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}

	public int getIdl() {
		return idl;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getPassward() {
		return passward;
	}

	public String getGender() {
		return gender;
	}

	public String getAbout() {
		return about;
	}

	public Timestamp getDateTime() {
		return dateTime;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getProfile() {
		return profile;
	}

}
