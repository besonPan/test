package service;

import java.util.List;

import model.F_user;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class UserService {
	//登录
	public F_user login(String username){
		F_user user = new F_user();
		user = user.findFirst("select * from f_user where username = "+"'"+username+"'");
		if(user != null){
			return user;
		}
		return null;
	}
	//修改
	public boolean modify(String username, String password, String sex, String address, String phone){
		if(username != null && password != null){
			int result = Db.update("update f_user set password=?, sex=?, address=?, phone=? where username=?", new Object[]{password,sex,address,phone,username});
			if(result != 0){
				return true;
			}

		}
		return false;
	}
	//查询
	public List<Record> check(String username){
		List<Record> result = Db.find("select * from f_user where username like "+"'%"+username+"%'");
		if(result.size() > 0){
			return result;
		}
		return null;
	}
	//删除
	public boolean deleteUser(int userid){
		int result = Db.delete("delete from f_user where id=" + userid);
		if(result != 0){
			return true;
		}
		return false;
	}
	//解除权限
	public boolean openUser(int userid){
		int result = Db.update("update f_user set abandon=1 where id=" + userid);
		if(result != 0){
			return true;
		}
		return false;	
	}
	//添加
	public boolean add(String username, String password, String sex, String address, String phone, String role){
		if(username != null && password != null){
			Record user = new Record().set("username", username).set("password", password).set("sex",sex).set("address",address).set("phone", phone).set("role",role);
			boolean result = Db.save("f_user", user);
			return result;

		}
		return false;
	}
}
