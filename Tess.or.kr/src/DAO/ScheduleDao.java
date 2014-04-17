package DAO;

import java.util.ArrayList;



import DTO.ScheduleBean;

public interface ScheduleDao {

	int sInstert(ScheduleBean bean);

	ArrayList<ScheduleBean> sList();

	int sUpdate(ScheduleBean bean);

	int sDelete(String seq);

}
