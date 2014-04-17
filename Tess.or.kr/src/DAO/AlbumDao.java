package DAO;

import java.util.ArrayList;

import DTO.AlbumBean;

public interface AlbumDao {

	ArrayList<AlbumBean> aList();

	int aInstert(AlbumBean bean);

	int aUpdate(AlbumBean bean);

	String topSelect(AlbumBean bean);

	int topUpdate(String seq);

	int aDelete(String seq);

}
