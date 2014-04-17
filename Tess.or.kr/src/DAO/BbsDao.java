package DAO;

import java.util.ArrayList;

import DTO.BbsBean;


public interface BbsDao  {
	public int bInstert(BbsBean bean);

	ArrayList<BbsBean> bList();

	int bUpdate(BbsBean bean);

	int bDelete(String seq);
}
