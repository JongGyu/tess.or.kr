package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





import DAO.ScheduleImpl;
import DTO.ScheduleBean;

public class ScheduleServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Function(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Function(request, response);
	}
	 

	protected void Function(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String actionMode = request.getParameter("actionMode");
		
		if(actionMode.equals("INS")){
			
			ScheduleBean bean = new ScheduleBean();
			
			StringTokenizer st = new StringTokenizer(request.getParameter("cal_date"), "-");
			
			int cnt = st.countTokens();
			String date[] = new String[cnt];
			
			for(int i = 0; i < date.length; i++){
				date[i] = st.nextToken();
			}
			
			bean.setYear(date[0]);
			bean.setMonth(date[1]);
			bean.setDay(date[2]);
			bean.setSubject(request.getParameter("cal_subject"));
			
			
			ScheduleImpl bi = new ScheduleImpl();
			bi.sInstert(bean);
			
			RequestDispatcher rd =
					request.getRequestDispatcher("/ScheduleServlet?actionMode=LIST");
			rd.forward(request, response);
			
			
		} else if(actionMode.equals("UPT")){ 
			
			ScheduleBean bean = new ScheduleBean();
			StringTokenizer st = new StringTokenizer(request.getParameter("sc_up_date"), "-");
			
			int cnt = st.countTokens();
			String date[] = new String[cnt];
			
			for(int i = 0; i < date.length; i++){
				date[i] = st.nextToken();
			}
			
			
			bean.setSeq(request.getParameter("sc_up_seq"));
			bean.setSubject(request.getParameter("sc_up_subject"));
			bean.setYear(date[0]);
			bean.setMonth(date[1]);
			bean.setDay(date[2]);
			
			ScheduleImpl bi = new ScheduleImpl();
			bi.sUpdate(bean);
			
			RequestDispatcher rd =
					request.getRequestDispatcher("/ScheduleServlet?actionMode=LIST");
			rd.forward(request, response);
			
			
			
			
			
		} else if(actionMode.equals("DEL")){
			
			String seq = request.getParameter("seq");
			ScheduleImpl bi = new ScheduleImpl();
			bi.sDelete(seq);
			
			RequestDispatcher rd =
					request.getRequestDispatcher("/ScheduleServlet?actionMode=LIST");
			rd.forward(request, response);
			
			
		} else if(actionMode.equals("LIST")){
			
			ScheduleImpl bi = new ScheduleImpl();
			
			ArrayList<ScheduleBean> list = bi.sList();
			request.setAttribute("list", list);
			
			RequestDispatcher rd =
					
					request.getRequestDispatcher("index.jsp?actionGroup=schedule");
					
			
			rd.forward(request, response);
			
		
			
		}
	}
}
