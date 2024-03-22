package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.xdevapi.Statement;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Posts;

public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>();
		try {
			String query = "select * from categories;";
			java.sql.Statement st = this.con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				int cid = rs.getInt("cid");
				String cname = rs.getString("name");
				String cdescription = rs.getString("description");
				Category c = new Category(cid, cname, cdescription);
				list.add(c);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean savePost(Posts p) {
		boolean f = false;
		try {
			String query = "insert into posts(pTitle,pContext,pCode,cid,userId) values(?,?,?,?,?)";
			PreparedStatement pt = con.prepareStatement(query);

			pt.setString(1, p.getpTitle());
			pt.setString(2, p.getpContext());
			pt.setString(3, p.getpCode());
			//pt.setString(4, p.getpPic());
			pt.setInt(4, p.getCid());
			pt.setInt(5, p.getUserId());

			pt.executeUpdate();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Posts> getAllPost() {
		List list = new ArrayList<>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from posts order by pDate desc;");
			ResultSet set = ps.executeQuery();
			while (set.next()) {
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContext = set.getString("pContext");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				int cid = set.getInt("cid");
				int userId = set.getInt("userId");
				Posts post = new Posts(pid, pTitle, pContext, pCode, pPic, pDate, cid, userId);

				list.add(post);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<Posts> getPostByCid(int c) {

		List list = new ArrayList<>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from posts where cid=?");
			// System.out.println(c);
			ps.setInt(1, c);
			ResultSet set = ps.executeQuery();
			while (set.next()) {
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContext = set.getString("pContext");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");

				int userId = set.getInt("userId");
				// System.out.println(c);
				Posts post = new Posts(pid, pTitle, pContext, pCode, pPic, pDate, c, userId);

				list.add(post);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public Posts getPostById(int pId) {
		Posts post = null;
		String query = "select * from posts where pid=?";
		try {
			PreparedStatement pt = this.con.prepareStatement(query);
			pt.setInt(1, pId);

			ResultSet rs = pt.executeQuery();

			if (rs.next()) {
				int pid = rs.getInt("pid");
				String pTitle = rs.getString("pTitle");
				String pContext = rs.getString("pContext");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp pDate = rs.getTimestamp("pDate");
				int cid = rs.getInt("cid");
				int userId = rs.getInt("userId");
				post = new Posts(pid, pTitle, pContext, pCode, pPic, pDate, cid, userId);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return post;
	}
}
