package DAO;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.BbsBean;
import Model.DBConnectionMgr;

public class BbsImpl implements BbsDao {
	
	

	@Override
	public int bInstert(BbsBean bean) {
	
		int res = 0;
		
		Connection cn = null;
		PreparedStatement  ps = null;
		
		DBConnectionMgr db = DBConnectionMgr.getInstance();
		
		String name = null;
		
		if(bean.getGrp().equals("notice")){	name = "admin"; }
		else { name = bean.getName(); }
		
		try {
			cn = db.getConnection();
			
			String Isql = 
					"INSERT INTO bbs(subject, name, content, filename, grp, grpname, regdate)	"+
					"VALUES(?, ?, ?, ?, ?, ?, sysdate())										";
			
			System.out.println(Isql);
			ps =  cn.prepareStatement(Isql);
			ps.setString(1, bean.getSubject());
			ps.setString(2, name);
			ps.setString(3, bean.getContent());
			ps.setString(4, bean.getFilename());
			ps.setString(5, bean.getGrp());
			ps.setString(6, bean.getGrpname());
			res = ps.executeUpdate();
			
			
		} catch (Exception e){
			e.printStackTrace();
			
		} finally {
			db.freeConnection(cn, ps);
			
		}
		
		return res;
	}
	
	@Override
	public ArrayList<BbsBean> bList(){
		ArrayList<BbsBean> list = new ArrayList<BbsBean>();
		
		Connection cn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		DBConnectionMgr db = DBConnectionMgr.getInstance();
		
		try{
			cn = db.getConnection();
			
			String Ssql = "SELECT seq, subject, name, content, filename, grp, grpname, regdate	"+
						  "FROM bbs																"+
						  "ORDER BY seq DESC													";
			
			System.out.println(Ssql);
			ps = cn.prepareStatement(Ssql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				BbsBean bean = new BbsBean();
				bean.setSeq(rs.getString("seq"));
				bean.setSubject(rs.getString("subject"));
				
				if(rs.getString("name").equals("admin")){ bean.setName("°ü¸®ÀÚ"); } 
				else { bean.setName(rs.getString("name")); }
				
				if(rs.getString("content") != null){ bean.setContent(rs.getString("content").replaceAll("\u0020", "&nbsp;")); }
				
				bean.setFilename(rs.getString("filename"));
				bean.setGrp(rs.getString("grp"));
				bean.setGrpname(rs.getString("grpname"));
				bean.setRegdate(rs.getString("regdate"));
				list.add(bean);
			}
			
			
		} catch (Exception e){
			e.printStackTrace();
			
		} finally {
			db.freeConnection(cn, ps, rs);
		}
		
		
		return list;
	}

	
	@Override
	public int bUpdate(BbsBean bean) {
		
		int res=0;
		
		Connection cn = null;
		PreparedStatement ps = null;
		DBConnectionMgr db = new DBConnectionMgr();
		
		try {
			cn = db.getConnection();
			
			
			if(bean.getFilename() != null){
				String usql = "UPDATE bbs SET	"+
							  "subject = ?, 	"+
							  "content = ?, 	"+
							  "filename = ?		"+
							  "WHERE seq = 	? 	";
				
				ps = cn.prepareStatement(usql);
				ps.setString(1, bean.getSubject());
				ps.setString(2, bean.getContent().replaceAll("\u0020", "&nbsp;"));
				ps.setString(3, bean.getFilename());
				ps.setString(4, bean.getSeq());
			
			} else {
				String usql = "UPDATE bbs SET	"+
							  "subject = ?, 	"+
							  "content = ?, 	"+
							  "WHERE seq = 	? 	";
				
				ps = cn.prepareStatement(usql);
				ps.setString(1, bean.getSubject());
				ps.setString(2, bean.getContent().replaceAll("\u0020", "&nbsp;"));
				ps.setString(3, bean.getSeq());
				
			}
			
			
			res = ps.executeUpdate();
			
		} catch (Exception e){
			e.printStackTrace();
			
		} finally {
			db.freeConnection(cn, ps);
		}
		
		return res;
	}

	@Override
	public int bDelete(String seq) {
		
		int res = 0;
		Connection cn = null;
		PreparedStatement ps = null;
		
		DBConnectionMgr db = new DBConnectionMgr();
		
		try{
			cn = db.getConnection();
			
			String dsql = "DELETE FROM bbs	"+
						  "WHERE seq = ?	";
			
			System.out.println(dsql);
			ps = cn.prepareStatement(dsql);
			ps.setString(1, seq);
			res = ps.executeUpdate();
			
		} catch (Exception e){
			e.printStackTrace();
			
		} finally {
			db.freeConnection(cn, ps);
		}
		
		
		return res;
		
	}

}
