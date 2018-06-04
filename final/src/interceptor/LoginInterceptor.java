package interceptor;

import model.F_user;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

/*public class LoginInterceptor implements Interceptor{

	@Override
	public void intercept(Invocation inv) {
		//全局拦截器...
		Controller controller = inv.getController(); 
		System.out.println("全局拦截器...");
		System.out.println(inv.getActionKey());
		//不是登录页面才进入拦截器
			if(inv.getActionKey().contains("login")){
				inv.invoke();
			}else{
				//没有登录，跳转到登录页面
				F_user user = controller.getSessionAttr("user");
				if(user != null){
		            inv.invoke();
				}else{
					System.out.println("当前用户还未登录");
					controller.redirect("/login");
				}
			}

		
	}

}
*/