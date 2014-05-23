package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.AlbumBean;
import Model.DBConnectionMgr;


public class AlbumImpl implements AlbumDao{

	
	@Override
	public ArrayList<AlbumBean> aList(){
		
		ArrayList<AlbumBean> list = new ArrayList<AlbumBean>();
		
		Connection cn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		DBConnectionMgr db = DBConnectionMgr.getInstance();
		
		try{
			cn = db.getConnection();
			
			String Ssql = "SELECT seq, subject, typ, grp,  photoname, regdate	"+
						  "FROM album											"+
						  "ORDER BY seq DESC									";
			
			System.out.println(Ssql);
			ps = cn.prepareStatement(Ssql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				AlbumBean bean = new AlbumBean();
				bean.setSeq(rs.getString("seq"));
				bean.setSubject(rs.getString("subject"));
				bean.setTyp(rs.getString("typ"));
				bean.setGrp(rs.getString("grp"));
				bean.setPhotoname(rs.getString("photoname"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setOnlysubject(rs.getString("regdate")+"."+rs.getString("subject"));
			
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
	public int aInstert(AlbumBean bean) {
		int res = 0;
		
		Connection cn = null;
		PreparedStatement ps = null;
		
		DBConnectionMgr db = DBConnectionMgr.getInstance();
		
		try{
			cn = db.getConnection();
			
			String Isql = 
					"INSERT INTO album(subject, typ, grp, photoname, regdate)		"+
					"VALUES('"+bean.getSubject()+"',  								"+
							"'photo', '"+bean.getGrp()+"', 				"+
							"'"+bean.getPhotoname()+"', sysdate())					";
			
			System.out.println(Isql);
			ps =  cn.prepareStatement(Isql);
			res = ps.executeUpdate();
			
			
		} catch (Exception e){
			e.printStackTrace();
			
		} finally {
			db.freeConnection(cn, ps);
		}
		
		
		return res;
		
	}

	
	@Override
	public int aUpdate(AlbumBean bean) {
		int res =  0;

		Connection cn = null;
		PreparedStatement ps = null;
		
		DBConnectionMgr db = DBConnectionMgr.getInstance();
		
		try{
			cn = db.getConnection();
			
			String Usql = 
					"UPDATE album SET "+
					"	grp = '"+bean.getGrp()+"', 	"+
					"	content = ?, 	"+
					"	filename = ?		"+
					"	WHERE seq = 	? 	";
				
			
			System.out.println(Usql);
			ps =  cn.prepareStatement(Usql);
			res = ps.executeUpdate();
			
			
		} catch (Exception e){
			e.printStackTrace();
			
		} finally {
			db.freeConnection(cn, ps);
		}
		
		return res;
		
	}

	
	@Override
	public String topSelect(AlbumBean bean) {
		String seq =  null;
		
		Connection cn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		DBConnectionMgr db = DBConnectionMgr.getInstance();
		
		try{
			cn = db.getConnection();
			
			String TOPsql = 
					"SELECT seq							"+
					"FROM album  						"+
					"WHERE grp = '"+bean.getGrp()+"'	"+
					"GROUP BY seq DESC LIMIT 1			";
				
			
			System.out.println(TOPsql);
			ps =  cn.prepareStatement(TOPsql);
			rs = ps.executeQuery();
			

			if (rs.next()) {
				seq = rs.getString("seq");
			}
			
			String TOPcopy =
					"INSERT INTO album(subject, typ, grp, photoname, regdate)	"+
					"VALUES('"+bean.getSubject()+"',  							"+
					"'photo', '"+bean.getGrp()+"', 								"+
					"'"+bean.getPhotoname()+"', sysdate())						";
			
			System.out.println(TOPcopy);
			ps =  cn.prepareStatement(TOPcopy);
			ps.executeUpdate();
			
			
		} catch (Exception e){
			e.printStackTrace();
			
		} finally {
			db.freeConnection(cn, ps);
		}
		
		
		return seq;
	}

	@Override
	public int topUpdate(String seq) {
		int res =  0;

		Connection cn = null;
		PreparedStatement ps = null;
		
		DBConnectionMgr db = DBConnectionMgr.getInstance();
		
		try{
			cn = db.getConnection();
			
			String Usql = 
					"UPDATE album SET 			"+
					" typ = 'album'				"+
					"	WHERE seq = '"+seq+"' 	";
				
			
			System.out.println(Usql);
			ps =  cn.prepareStatement(Usql);
			res = ps.executeUpdate();
			
			
			
			
		} catch (Exception e){
			e.printStackTrace();
			
		} finally {
			db.freeConnection(cn, ps);
		}
		
		return res;
		
	}


	@Override
	public int aDelete(String seq) {
		int res = 0;
		
		Connection cn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		DBConnectionMgr db = DBConnectionMgr.getInstance();
		
		try{
			cn = db.getConnection();
			
			String Dsql = 
					"DELETE FROM album		"+
					"WHERE seq = "+seq+"	";
			
			
			ps =  cn.prepareStatement(Dsql);
			ps.executeUpdate();
			
			
			
			
		} catch (Exception e){
			e.printStackTrace();
				
		} finally {
			db.freeConnection(cn, ps, rs);
		}
			
		
		return res;
		
	}

	
}
