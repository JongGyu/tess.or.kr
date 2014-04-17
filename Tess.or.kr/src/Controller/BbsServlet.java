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

import DAO.BbsImpl;
import DTO.BbsBean;



public class BbsServlet extends HttpServlet{
	
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
			
			String grp = request.getParameter("grp");
			
			String grpname = null;
			if(grp.equals("notice")){	grpname = "��������"; }
			else if(grp.equals("fbb")){	grpname = "�����Խ���"; }
			else if(grp.equals("qna")){ grpname = "Q&A"; }
			else if(grp.equals("humor")){ grpname = "��Ȱ �� ����"; }
			
			try{
				boolean isMultipart = ServletFileUpload.isMultipartContent(request);      
				
				if (isMultipart) {         
					File temporaryDir = new File("c:\\tmp\\");
					String realDir = getServletConfig().getServletContext().getRealPath("/upload/");
					
					  DiskFileItemFactory factory = new DiskFileItemFactory();                                   
					  factory.setSizeThreshold(1 * 1024 * 1024);         
					  factory.setRepository(temporaryDir);
					  
					  ServletFileUpload upload = new ServletFileUpload(factory);     
					  
					  //�ִ� ���� ũ��(5M)
					  upload.setSizeMax(5 * 1024 * 1024);                                                            
					  List<FileItem> items = upload.parseRequest(request);     
					  
					  Iterator iter=items.iterator();       
						 
					  String fileName = null;
					  String _in_subject = null;
					  String _in_content = null;
					  String _in_name = null;
					  
					  BbsBean bean = new BbsBean();
					  BbsImpl bi = new BbsImpl();
					  
					  while(iter.hasNext()){
					   FileItem fileItem = (FileItem) iter.next();   
					   
					   
					   if(fileItem.isFormField()){                                                                               //���ε嵵�� ������ text�������� �ٸ� �������� üũ
                           // text���¸� if���� �ɸ�
						   FileItem in_subject = (FileItem)items.get(0);
						    _in_subject = in_subject.getString("euc-kr");		
						   
						   FileItem in_name = (FileItem)items.get(1);
						   _in_name = in_name.getString("euc-kr");
						    
						   FileItem in_content = (FileItem)items.get(2);
						    _in_content = in_content.getString("euc-kr");
						   _in_content = _in_content.replaceAll("\r\n", "<br>");
						   
						   bean.setSubject(_in_subject);
						   bean.setContent(_in_content);
						   bean.setName(_in_name);
						   bean.setGrp(grp);
						   bean.setGrpname(grpname);
						   
						 
							  
						
						   
					   } else{                                                                                                         //�����̸� �̺κ��� ��ƾ�� ź��
						    if(fileItem.getSize()>0){                                                                                 //������ ���ε� �Ǿ��� �ȵǾ��� üũ size>0�̸� ���ε� ����
						        String fieldName=fileItem.getFieldName();
						         fileName=fileItem.getName();
						        String contentType=fileItem.getContentType();
						        boolean isInMemory=fileItem.isInMemory();
						        long sizeInBytes=fileItem.getSize();
						        
						        bean.setSubject(_in_subject);
								bean.setContent(_in_content);
								bean.setName(_in_name);
								bean.setFilename(fileName);
								bean.setGrp(grp);
								bean.setGrpname(grpname);
								
								

								 File uploadedFile=new File(realDir,fileName);                                                   //���� ���丮�� fileName���� ī�� �ȴ�.
						         fileItem.write(uploadedFile);
						         fileItem.delete();

						    }
					   }
					  }
					  
					  bi.bInstert(bean);
					
					 
					 
						 
				}else{
					System.out.println("���ڵ� Ÿ���� multipart/form-data �� �ƴ�.");
				}
				
			} catch (FileUploadException e){
				e.printStackTrace();
			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				RequestDispatcher rd =
						request.getRequestDispatcher("/BbsServlet?actionMode=LIST");
				rd.forward(request, response);
			}
			
			
			
			
			
		} else if(actionMode.equals("UPT")){ 
			
			try{
				boolean isMultipart = ServletFileUpload.isMultipartContent(request);      
				
				if (isMultipart) {         
					File temporaryDir = new File("c:\\tmp\\");
					String realDir = getServletConfig().getServletContext().getRealPath("/upload/");
					
					  DiskFileItemFactory factory = new DiskFileItemFactory();                                   
					  factory.setSizeThreshold(1 * 1024 * 1024);         
					  factory.setRepository(temporaryDir);
					  
					  ServletFileUpload upload = new ServletFileUpload(factory);     
					  
					  //�ִ� ���� ũ��(5M)
					  upload.setSizeMax(5 * 1024 * 1024);                                                            
					  List<FileItem> items = upload.parseRequest(request);     
					  
					  Iterator iter=items.iterator();              
					  BbsBean bean = new BbsBean();
						 
					  
					  while(iter.hasNext()){
					   FileItem fileItem = (FileItem) iter.next();   
					   
					   
					   if(fileItem.isFormField()){                                                                               //���ε嵵�� ������ text�������� �ٸ� �������� üũ
                           // text���¸� if���� �ɸ�
						   
						   
						   FileItem up_seq = (FileItem)items.get(0);
						   String _up_seq = up_seq.getString("euc-kr");		
						   
						   FileItem up_subject = (FileItem)items.get(1);
						   String _up_subject = up_subject.getString("euc-kr");
						   
						   FileItem up_content = (FileItem)items.get(2);
						   String _up_content = up_content.getString("euc-kr");
						   _up_content = _up_content.replaceAll("\r\n", "<br>");
						   
						   bean.setSeq(_up_seq);
						   bean.setSubject(_up_subject);
						   bean.setContent(_up_content);
						   
						   
					   } else{                                                                                                         //�����̸� �̺κ��� ��ƾ�� ź��
						    if(fileItem.getSize()>0){                                                                                 //������ ���ε� �Ǿ��� �ȵǾ��� üũ size>0�̸� ���ε� ����
						        String fieldName=fileItem.getFieldName();
						        String fileName=fileItem.getName();
						        String contentType=fileItem.getContentType();
						        boolean isInMemory=fileItem.isInMemory();
						        long sizeInBytes=fileItem.getSize();
						        
						        bean.setFilename(fileName);
						      
						        
						        
						         File uploadedFile=new File(realDir,fileName);                                                   //���� ���丮�� fileName���� ī�� �ȴ�.
						         fileItem.write(uploadedFile);
						         fileItem.delete();
						    
						    }
					   }
					  }
					  
					  BbsImpl bi = new BbsImpl();
					  bi.bUpdate(bean);
						 
				}else{
					System.out.println("���ڵ� Ÿ���� multipart/form-data �� �ƴ�.");
				}
				
			} catch (Exception e){
				e.printStackTrace();
			}
			
			RequestDispatcher rd =
					request.getRequestDispatcher("/BbsServlet?actionMode=LIST");
			rd.forward(request, response);
		
			
		} else if(actionMode.equals("DEL")){
			
			String seq = request.getParameter("seq");
			
			BbsImpl bi = new BbsImpl();
			bi.bDelete(seq);
			
			RequestDispatcher rd =
					request.getRequestDispatcher("/BbsServlet?actionMode=LIST");
			rd.forward(request, response);
			
			
		
		
		
		} else if(actionMode.equals("LIST")){
			
			
				BbsImpl bi = new BbsImpl();
				
				ArrayList<BbsBean> list = bi.bList();
				request.setAttribute("list", list);
				
				RequestDispatcher rd =
						request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
				
			
			
		}
		
		
		
		
	}
	
}
