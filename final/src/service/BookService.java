package service;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import model.F_book;
import model.F_user;



public class BookService {
	
	F_book book = new F_book();
	
	//查询图书
	public List<F_book> check(String bookname){
		List<F_book> list = new ArrayList<F_book>();
		String sql = "select * from f_book where isuse=1 and (name like "+"'%"+bookname+"%' or type like "+"'%"+bookname+"%')";
		list = book.find(sql);
		if(list.size() > 0){
			return list;
		}
		return null;
	}
	
	//借阅图书
	public F_book borrow(int bookid, int userid){
		book = book.findFirst("select * from f_book where isuse=1 and id = " + bookid);
		F_user user = new F_user();
		//user = user.findFirst("select * from f_user where id = " + userid);
		//int abandon = user.getInt("abandon");
		if(book != null){
			return book;
		}
		return null;
	}
	
	//查询已借图书
	public List<Record> result(int userid){
		String sql = "select * from f_borrowinfo fbi, f_book fb where fbi.userid = " + userid 
					+" and fbi.bookid = fb.id and fbi.isuse = 1 and fb.isuse=1";
		List<Record> list = Db.find(sql);
		if(list.size() > 0){
			return list;
		}
		return null;
	}
	
	//归还图书
	public boolean returnBook(int bookid){
		String sql = "update f_borrowinfo set isuse=0 where isuse=1 and bookid=" + bookid;
		String sql1 = "update f_book set status=1 where isuse=1 and status=0 and id=" + bookid;
		int result = Db.update(sql);
		int result1 = Db.update(sql1);
		Record r = Db.findFirst("select count(1) from f_borrowinfo where TO_DAYS(sysdate())>TO_DAYS(returndate) and isuse=1 and bookid=" + bookid);

		System.out.println(r);
		if(result != 0 && result1 != 0 && r.equals(0)){
			return true;
		}
		return false;
	}
	
	//删除图书
	public boolean deleteBook(int bookid){
		String sql = "update f_book set isuse=0 where status=1 and id=" + bookid;
		int result = Db.update(sql);
		if(result != 0){
			return true;
		}
		return false;
	}
	
	//添加图书
	public boolean addBook(String bookname, String author, String type, String press, String publishdate, String detail){
		if(bookname != null && author != null && type != null && press != null && publishdate != null && detail != null){
			Record book = new Record().set("name", bookname).set("author", author).set("type",type).set("press",press).set("publishdate", publishdate).set("detail",detail);
			boolean result = Db.save("f_book", book);
			return result;
		}
		return false;
	}
	
}
