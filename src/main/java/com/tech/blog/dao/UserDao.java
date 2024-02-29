package com.tech.blog.dao;

import com.tech.blog.entities.user;

import java.sql.*;

import com.tech.blog.entities.user;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}

	public boolean saveUser(user us) {

		boolean f = false;
		try {

			String query = "insert into user(name,email,passward,gender,about)values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, us.getName());
			pstmt.setString(2, us.getEmail());
			pstmt.setString(3, us.getPassward());
			pstmt.setString(4, us.getGender());
			pstmt.setString(5, us.getAbout());

			pstmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public user getUserByemailandpass(String email, String pass) {

		user us = null;

		try {
			String query = "select * from user where email=? and passward=?";
			PreparedStatement ptsmt = con.prepareStatement(query);

			ptsmt.setString(1, email);
			ptsmt.setString(2, pass);

			ResultSet rs = ptsmt.executeQuery();

			if (rs.next()) {
				us = new user();
				us.setName(rs.getString("name"));
				us.setIdl(rs.getInt("id"));
				us.setEmail(rs.getString("email"));
				us.setPassward(rs.getString("passward"));
				us.setGender(rs.getString("gender"));
				us.setAbout(rs.getString("about"));
				us.setDateTime(rs.getTimestamp("rdate"));
				//us.setProfile(rs.getString("profile"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return us;

	}

	public boolean updateUser(user us) {
		boolean f = false;
		try {

			String query = "update user set name=?,email=?,passward=?,about=? where id=?";
			PreparedStatement p = con.prepareStatement(query);
			p.setString(1, us.getName());
			p.setString(2, us.getEmail());
			p.setString(3, us.getPassward());
			p.setString(4, us.getAbout());
		
			p.setInt(5, us.getIdl());

			p.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
    public user getUserById(int userId) {
    	user u2=null;
    	try {
    		String query="select * from user where id=?";
    		PreparedStatement pt=con.prepareStatement(query);
    		pt.setInt(1, userId);
    		ResultSet rs=pt.executeQuery();
    		if(rs.next()) {
    			u2 = new user();
				u2.setName(rs.getString("name"));
				u2.setIdl(rs.getInt("id"));
				u2.setEmail(rs.getString("email"));
				u2.setPassward(rs.getString("passward"));
				u2.setGender(rs.getString("gender"));
				u2.setAbout(rs.getString("about"));
				u2.setDateTime(rs.getTimestamp("rdate"));	
    			
    		}
    		
			
		} catch (Exception e) {
		e.printStackTrace();
		}
    	
    	
    	return u2;
    }
}
