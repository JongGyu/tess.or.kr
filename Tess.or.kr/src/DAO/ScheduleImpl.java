package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;


import java.sql.ResultSet;
import java.util.ArrayList;






import DTO.ScheduleBean;
import Model.DBConnectionMgr;

public class ScheduleImpl implements ScheduleDao {
	
	@Override
	public int sInstert(ScheduleBean bean) {
		
		int res = 0;
		
		Connection cn = null;
		PreparedStatement  ps = null;
		
		DBConnectionMgr db = DBConnectionMgr.getInstance();
		
		try {
			cn = db.getConnection();
			
			String Isql = 
					"INSERT INTO calendar(subject, year, month, day, regdate)	"+
					"VALUES('"+bean.getSubject()+"',  			"+
							"'"+bean.getYear()+"', '"+bean.getMonth()+"', 				"+
							"'"+bean.getDay()+"', sysdate())							";
			
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
	public ArrayList<ScheduleBean> sList() {
		ArrayList<ScheduleBean> list = new ArrayList<ScheduleBean>();
		
		Connection cn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		DBConnectionMgr db = DBConnectionMgr.getInstance();
		
		try{
			cn = db.getConnection();
			
			String Ssql = 
				"SELECT seq, subject, content, year, LPAD(month, 2, '0') AS month, LPAD(day, 2, '0') AS day, regdate	"+	
				"FROM calendar																							"+
				"ORDER BY seq DESC																						";
			
			System.out.println(Ssql);
			ps = cn.prepareStatement(Ssql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				ScheduleBean bean = new ScheduleBean();
				bean.setSeq(rs.getString("seq"));
				bean.setSubject(rs.getString("subject"));
				bean.setYear(rs.getString("year"));
				bean.setMonth(rs.getString("month"));
				bean.setDay(rs.getString("day"));
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
	public int sUpdate(ScheduleBean bean) {
		int res = 0;
		
		Connection cn = null;
		PreparedStatement ps = null;
		DBConnectionMgr db = new DBConnectionMgr();
		
		try {
			cn = db.getConnection();
			
			String Usql = 	"UPDATE calendar SET				"+
							"subject = '"+bean.getSubject()+"', "+
							"year = '"+bean.getYear()+"',		"+
							"month = '"+bean.getMonth()+"',		"+
							"day = '"+bean.getDay()+"'			"+
							"WHERE seq = 	"+bean.getSeq()+" 	";
			
			System.out.println(Usql);
			ps = cn.prepareStatement(Usql);
			res = ps.executeUpdate();
			
		} catch (Exception e){
			e.printStackTrace();
			
		} finally {
			db.freeConnection(cn, ps);
		}
		
		
		return res;
		
	}

	@Override
	public int sDelete(String seq) {
		
		int res = 0;
		Connection cn = null;
		PreparedStatement ps = null;
		
		DBConnectionMgr db = new DBConnectionMgr();
		
		try{
			cn = db.getConnection();
			
			String dsql = "DELETE FROM calendar	"+
						  "WHERE seq = "+seq+"	";
			
			System.out.println(dsql);
			ps = cn.prepareStatement(dsql);
			res = ps.executeUpdate();
			
		} catch (Exception e){
			e.printStackTrace();
			
		} finally {
			db.freeConnection(cn, ps);
		}
		
		return res;
		
	}


}
