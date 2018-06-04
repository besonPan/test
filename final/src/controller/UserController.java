package controller;

import java.util.ArrayList;
import java.util.List;

import model.F_user;
import service.UserService;

import com.jfinal.core.Controller;

public class UserController extends Controller {
	
	UserService userservice = new UserService();
	
	//用户登录
	public void login(){
		String username = getPara("username");
		String password = getPara("password");
		F_user user = new F_user();
		user = userservice.login(username);
		if(user != null){
			int role = user.get("role");
			if(user.get("password") != null && user.get("password").equals(password) && role == 0){
				setAttr("status", 0);
				setSessionAttr("user", user);
			}else if(user.get("password") != null && user.get("password").equals(password) && role == 1){
				setAttr("status", 1);
				setSessionAttr("user", user);
			}else{
				setAttr("status", -1);
			}			
		}
		renderJson();
	}
	
	//用户修改
	public void modify(){
		F_user u = getSessionAttr("user");
		String username = u.get("username");
		String password = getPara("password");
		String sex = getPara("sex");
		String address = getPara("address");
		String phone = getPara("phone");
		if(userservice.modify(username,password,sex,address,phone) == true){
			setAttr("code", 1);
			F_user user = new F_user();
			user = userservice.login(username);
			setSessionAttr("user", user);
		}else{
			setAttr("code", -1);
		}
		renderJson();
	}
	
	//用户查询
	public void check(){
		String username = getPara("username");
		if(username == null){
			username = "";
		}
		List userList = new ArrayList(); 
		userList = userservice.check(username);
		setAttr("userList", userList);
		render("/userCheck.jsp");
	}
	
	//用户删除
	public void deleteUser(){
		int userid = getParaToInt("userid");
		boolean result = userservice.deleteUser(userid);
		if(result){
			redirect("/user/check");
		}else{
			render("/error.jsp");
		}
	}
	
	//解除权限
	public void openUser(){
		int userid = getParaToInt("userid1");
		boolean result = userservice.openUser(userid);
		if(result){
			redirect("/user/check");
		}else{
			render("/error.jsp");
		}
	}
	//添加用户
	public void add(){
		String username = getPara("username");
		String password = getPara("password");
		String sex = getPara("sex");
		String address = getPara("address");
		String phone = getPara("phone");
		String role = getPara("role");
		if(userservice.add(username,password,sex,address,phone,role)){
			setAttr("code", 1);
		}else{
			setAttr("code", -1);
		}
		renderJson();
	}
	//...
	public void index(){
		renderText("...");
	}
	
}
