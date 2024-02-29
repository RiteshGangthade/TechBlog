package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	Connection con;
	
	public LikeDao(Connection con) {
		this.con = con;
	}

	public boolean insertLike(int pid,int uid) {
		boolean f=false;
		try {
		String query="insert into liked(pid,uid) values(?,?)";
		PreparedStatement ps=this.con.prepareStatement(query);
		ps.setInt(1, pid);
		ps.setInt(2, uid);
		ps.executeUpdate();
		f=true;
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
    public int countLike(int pid) {
    	int count=0;
    	try {
    		String q="select count(*) from liked where pid=?";
    		PreparedStatement pd=this.con.prepareStatement(q);
    		pd.setInt(1, pid);
    		ResultSet rs=pd.executeQuery();
    		if(rs.next()) {
    			count=rs.getInt("count(*)");
    			
    		}
    		
    	}catch (Exception e) {
			e.printStackTrace();
		}
    	return count;
    }
    
    public boolean isPostLiked(int pid,int uid) {
    	boolean f=false;
    	try {
    		PreparedStatement pd=this.con.prepareStatement("select * from liked where pid=? and uid=?");
    		pd.setInt(1, pid);
    		pd.setInt(2, uid);
    		ResultSet rs=pd.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return f;
    }
    public boolean deleteLiked(int pid,int uid) {
    	boolean f=false;
    	try {
    		PreparedStatement ps=this.con.prepareStatement("delete * from liked where pid=? and uid=?");
    		ps.setInt(1, pid);
    		ps.setInt(2, uid);
    		ps.executeUpdate();
    		f=true;
    		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	
    	
    	
    	
    	
    	return f;
    	
    }

}
