package repository;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import domain.Users;
import domain.admin;
import domain.article;

//////////////////////建立连接
public class DBUtils {
		private static String driverName;
		private static String url;
		private static String pwd;
		private static String user;
		static{
			driverName ="com.mysql.jdbc.Driver";
			url = "jdbc:mysql://localhost:3306/blog?characterEncoding=utf8&useSSL=true";
			user= "root";
			pwd = "000000";
			try {
				Class.forName(driverName);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		public static Connection getConnection(){
			try {
				Connection connection =DriverManager.getConnection(url,user,pwd);
				return connection;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
	
		
		//////////////判断连接是否成功
		public static void check(Connection connection) {
			try {
				
				if(connection!=null){
					System.out.println("连接成功!");
				}else{
					System.out.println("连接失败!");
				}
			} catch (Exception e) {
			}
		}
		
		
		///////////////关闭连接对象
		public static void close(Connection connection,Statement statement,ResultSet rs){
			if(statement!=null){
				try {
					statement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(connection!=null){
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		

    ///////////管理员登录(从数据库中获取Id和密码是否与输入的对应)
		public static boolean adLogin(admin admin) {
			Connection  connection  = null;
			connection = DBUtils.getConnection();
			PreparedStatement prstatement = null;
			System.out.println(admin.getApwd());
			System.out.println(admin.getaId());
			ResultSet  resultSet = null;
			try {
				prstatement = connection.prepareStatement("SELECT apwd FROM admin where aId=?");
				prstatement.setString(1,admin.getaId());
				resultSet = prstatement.executeQuery();
				if(resultSet.next()){
					if(resultSet.getString("apwd").equals(admin.getApwd())){
					System.out.println(admin.getApwd());
					System.out.println(resultSet.getString("apwd"));
					System.out.println("账号与密码相匹配!");
					return true;
					}
				}else{
					
					return false;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				DBUtils.close(connection, prstatement, resultSet);
				
			}
			return false;
		}




	
		
                ////////管理员所看到的所有用户的基本信息
				public static List<Users> doUQuery() {
					Connection  connection  = null;
					PreparedStatement statement = null;
					ResultSet  resultSet = null;
					List<Users> list = new ArrayList<>();
					try {
						connection = DBUtils.getConnection();
						statement = connection.prepareStatement("select * from users");
						resultSet = statement.executeQuery();
						if(resultSet!=null){
							while(resultSet.next()){
								Users user = new Users();
								user.setUsername(resultSet.getString("username"));
								user.setUser_id(resultSet.getString("user_id"));
								user.setSex(resultSet.getString("sex"));
								user.setPassword(resultSet.getString("password"));
								list.add(user);
							}
							return list;
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally{
						DBUtils.close(connection, statement, resultSet);
					}
					return null;
				
				}
				
				
				
				
              /////////////////////////文章基本信息
				public static List<article> doCQuery() {
					Connection  connection  = null;
					PreparedStatement statement = null;
					ResultSet  resultSet = null;
					List<article> list = new ArrayList<>();
					try {
						connection = DBUtils.getConnection();
						statement = connection.prepareStatement("select * from article");
						resultSet = statement.executeQuery();
						if(resultSet!=null){
							while(resultSet.next()){
								article article = new  article();
								article.setArticle_id(resultSet.getString("article_id"));
								article.setTitle(resultSet.getString("title"));
								article.setContent(resultSet.getString("content"));
								article.setUser_id(resultSet.getString("user_id"));
								article.setImage(resultSet.getString("image"));
								list.add(article);
							}
							return list;
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally{
						DBUtils.close(connection, statement, resultSet);
					}
					return null;
				
				}
				
				
				
				
                   //////////////////////新增文章信息
				public static boolean doAddcomm(String article_id,String title,String content,String user_id,String image) {
					Connection  connection  = null;
					PreparedStatement statement = null;
					ResultSet  resultSet = null;
					
					try {
						connection = DBUtils.getConnection();
						statement = connection.prepareStatement("INSERT into article(article_id,title,content,user_id,image) VALUES(?,?,?,?,?)");
						statement.setString(1, article_id);
						statement.setString(2, title);
						statement.setString(3, content);
						statement.setString(4, user_id);
						statement.setString(5,image);
						statement.executeUpdate();
							return true;	
					} catch (Exception e) {
						e.printStackTrace();
					}finally{
						DBUtils.close(connection, statement, resultSet);
					}
					return false;
				
				}
				
				
				
		
				
                ///////////////////文章信息删除
				public static boolean doCDelete(String article_id) {
					Connection  connection  = null;
					PreparedStatement statement = null;
					ResultSet  resultSet = null;
					
					try {
						connection = DBUtils.getConnection();
						statement = connection.prepareStatement("delete from commodity WHERE article_id = ?");
						statement.setString(1, article_id);
						statement.executeUpdate();
						return true;
						
					} catch (Exception e) {
						
						e.printStackTrace();
					}finally{
						DBUtils.close(connection, statement, resultSet);
					}
					return false;
				
				}
				
				
				
				
               //////////////////用户基本信息
				public static Users doUQ(String user_id) {
					Connection  connection  = null;
					PreparedStatement statement= null;
					ResultSet  resultSet = null;
					System.out.println(user_id);
					try {
						connection = DBUtils.getConnection();
						statement = connection.prepareStatement("select users.user_id,users.username,users.password,users.sex,users.email,users.phone from users WHERE users.user_id=? ");
						statement.setString(1, user_id);
						resultSet = statement.executeQuery();
						if(resultSet!=null){
							while(resultSet.next()){
								Users users = new Users();
								users.setUsername(resultSet.getString("username"));
								users.setUser_id(resultSet.getString("user_id"));
								users.setSex(resultSet.getString("sex"));
								users.setPassword(resultSet.getString("password"));
								users.setEmail(resultSet.getString("email"));
								users.setPhone(resultSet.getString("phone"));	
								return users;
							}
						}else{
							return null;
							}
					} catch (Exception e) {
						e.printStackTrace();
					}finally{
						DBUtils.close(connection, statement, resultSet);
					}
					return null;
				
				}
				
                  ///////////////////用户信息更新
				public static boolean doUupdate(String user_id,String username,String email,String phone,String sex,String password) {
					Connection  connection  = null;
					PreparedStatement statement= null;
					ResultSet  resultSet = null;
					System.out.println(user_id);
					try {
						connection = DBUtils.getConnection();
						statement = connection.prepareStatement("UPDATE users SET users.username=?,users.password=?,users.sex=?,users.email=?,users.phone=? WHERE users.user_id=?");
						statement.setString(1, username);
						statement.setString(2, password);
						statement.setString(3, sex);
						statement.setString(4, email);
						statement.setString(5, phone);
						statement.setString(6, user_id);
						statement.executeUpdate();
						return true;	
					} catch (Exception e) {
						e.printStackTrace();
					}finally{
						DBUtils.close(connection, statement, resultSet);
					}
					return false;
				
				}

				
				
				
				
				
              ////////////////文章信息更新
				public static boolean doCupdate(String cId,String cname,String cate,float price,String writer) {
					Connection  connection  = null;
					PreparedStatement statement= null;
					ResultSet  resultSet = null;
					System.out.println(cId);
					System.out.println("cId:::::::::::"+cId);
					try {
						connection = DBUtils.getConnection();
						statement = connection.prepareStatement("UPDATE commodity SET cname=?,cate=? ,price=?,writer=? WHERE cId=?");
						statement.setString(1, cname);
						statement.setString(2, cate);
						statement.setFloat(3, price);
						statement.setString(4,writer);
						statement.setString(5, cId);
						statement.executeUpdate();
						return true;	
					} catch (Exception e) {
						e.printStackTrace();
					}finally{
						DBUtils.close(connection, statement, resultSet);
					}
					return false;
				
				}

				
}

