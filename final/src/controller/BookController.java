package controller;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.taglibs.standard.lang.jstl.AndOperator;

import model.F_book;
import model.F_borrowInfo;
import model.F_user;

import service.BookService;

import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.upload.UploadFile;

public class BookController extends Controller{
	
	BookService service = new BookService();
	
	//查询图书
	public void check(){
		String bookname = getPara("bookname");
		List<F_book> bookList = service.check(bookname);
		if(bookList != null){
			setSessionAttr("bookList", bookList);
			redirect("/checkResult.jsp");
		}
	}
	
	//借阅图书
	public void borrow(){
		int bookid = getParaToInt("id");	
		F_user user = getSessionAttr("user");
		F_book book = new F_book();
		int status = 0;
		int userid = 0;
		int abandon = 0;
		if(user != null){
			userid = user.getInt("id");
			book = service.borrow(bookid,userid);
			status = book.getInt("status");
			abandon = user.getInt("abandon");
			if(abandon == 0){
				setAttr("back", 0);
				renderJson();
				return;
			}
		}
		if(book != null && status != 0){
			setAttr("back", 1);
			Db.update("update f_book set status = 0 where id = " + bookid);
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			calendar.add(Calendar.MONTH, 1); 
			Date returnDate = calendar.getTime();
			Record info = new Record().set("userid", userid).set("bookid", bookid).set("returndate", returnDate);
			Db.save("F_borrowinfo", info);
		}else{
			setAttr("back", -1);
		}
		renderJson();
	}
	
	//查询已借图书
	public void result(){
		F_user user = getSessionAttr("user");
		int userid = 0;
		if(user != null){
			userid = user.getInt("id");
			List<Record> abList = service.result(userid);
			if(abList != null){
				setSessionAttr("abList", abList);
				redirect("/borrow.jsp");
			}
		}
	}
	//归还图书
	public void returnBook(){
		int bookid = getParaToInt("bookid");
		F_user user = getSessionAttr("user");
		boolean pass = false;
		if(user != null){
			int userid = user.getInt("id");
			String sql2 = "update f_user set abandon=0 where 1=1 and id=" + userid;
			pass = service.returnBook(bookid);
			if(pass){
				setAttr("back", 1);
			}else{
				setAttr("back", -1);
				Db.update(sql2);
			}
			
		}
		renderJson();
	}
	//删除图书
	public void deleteBook(){
		int bookid = getParaToInt("id");
		boolean result = service.deleteBook(bookid);
		if(result){
			setAttr("back", 1);
		}else{
			setAttr("back", -1);
		}
		renderJson();
	}
	//添加图书
	public void addBook(){
		String bookname = getPara("bookname");
		String author = getPara("author");
		String type = getPara("type");
		String press = getPara("press");
		String publishdate = getPara("publishdate");
		String detail = getPara("detail");
		if(publishdate.equals("")){
			setAttr("code", -1);
			renderJson();
			return;
		}
		boolean result = service.addBook(bookname, author, type, press, publishdate, detail);
		if(result){
			setAttr("code", 1);
			//存入新增书
			Record br = Db.findFirst("select * from f_book where publishdate=" + "'" + publishdate + "'");
			if(br != null){
				setSessionAttr("br", br);
			}
		}else{
			setAttr("code", -1);
		}
		
		renderJson();
	}
	//上传
	public void upload(){
		//查询类型
		Record br = getSessionAttr("br");
		String type = br.getStr("type");
		int id = br.getInt("id");
		//上传
		UploadFile upfile = getFile("image");//JFinal规定getFile()必须最先执行
/*		File oldFile = new File(upfile.getOriginalFileName());
		if (oldFile.exists()) {
			oldFile.delete();		
		}else{*/
			switch(type){
			case "哲学": boolean result = upfile.getFile().renameTo(new File("/myeclipse/Workspaces/MyEclipse 10/final/WebRoot/images/a"+id+".jpg"));System.out.println(result);System.out.println(new File("a"+id+".jsp"));;break;
			case "文学": upfile.getFile().renameTo(new File("/myeclipse/Workspaces/MyEclipse 10/final/WebRoot/images/b"+id+".jpg"));break;
			case "科学与自然": upfile.getFile().renameTo(new File("/myeclipse/Workspaces/MyEclipse 10/final/WebRoot/images/c"+id+".jpg"));break;
			case "历史": upfile.getFile().renameTo(new File("/myeclipse/Workspaces/MyEclipse 10/final/WebRoot/images/d"+id+".jpg"));break;
			case "励志与成功": upfile.getFile().renameTo(new File("/myeclipse/Workspaces/MyEclipse 10/final/WebRoot/images/e"+id+".jpg"));break;
			case "法律": upfile.getFile().renameTo(new File("/myeclipse/Workspaces/MyEclipse 10/final/WebRoot/images/f"+id+".jpg"));break;
			case "心理": upfile.getFile().renameTo(new File("/myeclipse/Workspaces/MyEclipse 10/final/WebRoot/images/g"+id+".jpg"));break;
			case "政治与军事": upfile.getFile().renameTo(new File("/myeclipse/Workspaces/MyEclipse 10/final/WebRoot/images/h"+id+".jpg"));break;
			case "健康与养生": upfile.getFile().renameTo(new File("/myeclipse/Workspaces/MyEclipse 10/final/WebRoot/images/i"+id+".jpg"));break;
			case "计算机与互联网": upfile.getFile().renameTo(new File("/myeclipse/Workspaces/MyEclipse 10/final/WebRoot/images/j"+id+".jpg"));break;
			case "艺术": upfile.getFile().renameTo(new File("/myeclipse/Workspaces/MyEclipse 10/final/WebRoot/images/k"+id+".jpg"));break;
			case "儿童读物": upfile.getFile().renameTo(new File("/myeclipse/Workspaces/MyEclipse 10/final/WebRoot/images/l"+id+".jpg"));break;
			case "恋爱和婚姻": upfile.getFile().renameTo(new File("/myeclipse/Workspaces/MyEclipse 10/final/WebRoot/images/m"+id+".jpg"));break;
			}
			System.out.println(upfile.getUploadPath());
			System.out.println(upfile.getFileName());
		
		render("/addbook.jsp");
		
//		UploadFile uploadFile = getFile("image");//image为前台页面需要上传的内容
//		System.out.println(uploadFile.getFileName());//获取文件名
//		System.out.println(getPara("image"));
	}
	
}
