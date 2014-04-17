package Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;





import DAO.AlbumImpl;
import DAO.ScheduleImpl;
import DTO.AlbumBean;


public class AlbumServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Function(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Function(request, response);
	}

	protected void Function(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String actionMode = request.getParameter("actionMode");
		
		

		if (actionMode.equals("AINS")) {

			try{
				
				String mainimg = "0";
				if(request.getParameter("mainimg") != null){ mainimg = request.getParameter("mainimg"); };
				
				
				boolean isMultipart = ServletFileUpload.isMultipartContent(request);      
				
				if (isMultipart) {         
					File temporaryDir = new File("c:\\tmp\\");
					String realDir = getServletConfig().getServletContext().getRealPath("/album/");
					
					  DiskFileItemFactory factory = new DiskFileItemFactory();                                   
					  factory.setSizeThreshold(5 * 1024 * 1024);         
					  factory.setRepository(temporaryDir);
					  
					  ServletFileUpload upload = new ServletFileUpload(factory);     
					  
					  //최대 파일 크기(5M)
					  upload.setSizeMax(5 * 1024 * 1024);                                                            
					  List<FileItem> items = upload.parseRequest(request);     
					  
					  Iterator iter=items.iterator();              
					 
						 
					  String fileName = null;
					  String _in_subject = null;
							  
					  while(iter.hasNext()){
						  
					   FileItem fileItem = (FileItem) iter.next();   
					   
					   if(fileItem.isFormField()){                                                                               //업로드도니 파일이 text형태인지 다른 형태인지 체크
						   FileItem in_subject = (FileItem)items.get(0);
						   _in_subject = in_subject.getString("euc-kr");	
						   
						   
						   
					   } else{                                                                                                         //파일이면 이부분의 루틴을 탄다
						    if(fileItem.getSize()>0){ 
						    	//파일이 업로드 되었나 안되었나 체크 size>0이면 업로드 성공
						       
						    	String fieldName=fileItem.getFieldName();
						         fileName = fileItem.getName();
						        String contentType=fileItem.getContentType();
						        boolean isInMemory=fileItem.isInMemory();
						        long sizeInBytes=fileItem.getSize();
						        
						        File uploadedFile=new File(realDir,fileName);                                                   //실제 디렉토리에 fileName으로 카피 된다.
						        fileItem.write(uploadedFile);
						        fileItem.delete();
						        
						        
		
						    }
					   }
					  }
					  
					  AlbumBean bean = new AlbumBean();
					  
					   bean.setSubject(_in_subject);
					   bean.setPhotoname(fileName);
					   bean.setGrp(_in_subject);
					   
					   
					   AlbumImpl bi = new AlbumImpl();
					   bi.aInstert(bean);
					  
					   if(mainimg.equals("1")){
						   String seq = bi.topSelect(bean); 
						   bi.topUpdate(seq);
					   }
					   
					   
				}else{
					System.out.println("인코딩 타입이 multipart/form-data 가 아님.");
				}
				
			} catch (FileUploadException e){
				e.printStackTrace();
			
			} catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				RequestDispatcher rd = request.getRequestDispatcher("/AlbumServlet?actionMode=LIST");
				rd.forward(request, response);
			}
			
			
		} else if (actionMode.equals("AUINS")){
			
			AlbumBean bean = new AlbumBean();
			AlbumImpl bi = new AlbumImpl();
			
			bean.setGrp(request.getParameter("grp"));
			
			
			 
			 RequestDispatcher rd = request.getRequestDispatcher("/AlbumServlet?actionMode=LIST");
			 rd.forward(request, response);
			   

		} else if (actionMode.equals("UPT")) {

		} else if (actionMode.equals("DEL")) {
			
			String seq = request.getParameter("seq");
			AlbumImpl bi = new AlbumImpl();
			bi.aDelete(seq);
			
			RequestDispatcher rd = request.getRequestDispatcher("/AlbumServlet?actionMode=LIST");
			rd.forward(request, response);

		} else if (actionMode.equals("LIST")) {

			AlbumImpl bi = new AlbumImpl();

			ArrayList<AlbumBean> list = bi.aList();
			request.setAttribute("list", list);

			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);

		}

	}
}