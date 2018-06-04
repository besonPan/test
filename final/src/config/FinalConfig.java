package config;

import java.io.File;

import model.F_book;
import model.F_borrowInfo;
import model.F_user;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;

import controller.BookController;
import controller.UserController;

public class FinalConfig extends JFinalConfig{

	@Override
	public void configConstant(Constants me) {
		loadPropertyFile("data-source.properties"); // 加载少量必要配置，随后可用getProperty(...)获取值
		me.setDevMode(true);
		me.setViewType(ViewType.JSP);
		me.setBaseUploadPath("/myeclipse/Workspaces/MyEclipse 10/final/WebRoot/images");// 配置文件上传路径
	}

	@Override
	public void configRoute(Routes me) {
		//配置访问路径
		me.add("/user", UserController.class, "/");
		me.add("/book", BookController.class, "/");
	}

	@Override
	public void configPlugin(Plugins me) {
		// 配置Druid数据库连接池插件
		DruidPlugin druidplugin = new DruidPlugin(getProperty("jdbcUrl"), getProperty("username"), getProperty("password"), "com.mysql.jdbc.Driver");
		me.add(druidplugin);
		// 配置ActiveahRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(druidplugin);
		me.add(arp);
		// 配置方言
		arp.setDialect(new MysqlDialect());
		arp.setShowSql(true);
		// 配置大小写不敏感
		arp.setContainerFactory(new CaseInsensitiveContainerFactory());
		// 配置映射
		arp.addMapping("f_user","id",F_user.class);
		arp.addMapping("f_book", "id",F_book.class);
		arp.addMapping("f_borrowinfo", "id", F_borrowInfo.class);
	}

	@Override
	public void configInterceptor(Interceptors me) {
		//me.add(new LoginInterceptor());
	}

	@Override
	public void configHandler(Handlers me) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void configEngine(Engine me) {
		// TODO Auto-generated method stub
		
	}

}
