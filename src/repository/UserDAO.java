package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import domain.Users;



public class UserDAO {
		private static String driverName;
		private static String url;
		private static String pwd;
		private static String user;
		static{
			driverName ="com.mysql.jdbc.Driver";
			url = "jdbc:mysql://localhost:3306/blog?useUnicode=true&characterEncoding=utf-8";
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
				if(connection == null)
				{
					System.out.println("链接为空！");
				}else {
					System.out.println("链接不为空！");
				}
				return connection;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			System.out.println("链接notry");
			return null;
		}

		
		//////////////////判断连接是否成功
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
		
		////////////////////关闭连接对象
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
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		///////////////////////用户注册登录
public static boolean doRegiser(Users user) {
	Connection  connection  = null;
	connection = UserDAO.getConnection();
	PreparedStatement prstatement = null;
	PreparedStatement prstatement2 = null;
	ResultSet  resultSet = null;
	try {
		prstatement = connection.prepareStatement("SELECT * FROM users where user_id=?");
		prstatement.setString(1, user.getUser_id());
		resultSet = prstatement.executeQuery();
		if(resultSet.next()){
			System.out.println("输入ID已经存在,请重新输入!");
			System.out.println(user.getUser_id());
			return false;
		}else{
			prstatement2 = connection.prepareStatement("INSERT INTO users(user_id,username,password,email,phone,sex) VALUES(?,?,?,?,?,?)");
			prstatement2.setString(1,user.getUser_id() );
			prstatement2.setString(2, user.getUsername());
			prstatement2.setString(3,user.getPassword());
			prstatement2.setString(4, user.getEmail());
			prstatement2.setString(5, user.getPhone());
			prstatement2.setString(6, user.getSex());
			prstatement2.executeUpdate();
			return true;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		UserDAO.close(connection, prstatement, resultSet);
		UserDAO.close(connection, prstatement2, resultSet);

		
		
	}
	return false;
  }





///////////////////////用户登录检验
		public static boolean doLogin(Users user) {
			Connection  connection  = null;
			connection = DBUtils.getConnection();
			if(connection == null)
			{
				System.out.println("链接为空");
			}
			PreparedStatement prstatement = null;
			
			ResultSet  resultSet = null;
			try {
				prstatement = connection.prepareStatement("SELECT password FROM users where user_id=?");
				prstatement.setString(1,user.getUser_id());
				resultSet = prstatement.executeQuery();
				if(resultSet.next()){
					if(resultSet.getString("password").equals(user.getPassword())){
					System.out.println(user.getPassword());
					System.out.println(resultSet.getString("password"));
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
		
		
               
		/////////////////////用户的所有信息
				public static Users doQP(String user_id) {
					Connection  connection  = null;
					connection = DBUtils.getConnection();
					PreparedStatement prstatement = null;
					System.out.println(user_id);
					ResultSet  resultSet = null;
					try {
						prstatement = connection.prepareStatement("select users.user_id,users.username,users.password,users.sex,users.email,users.phone from users WHERE users.user_id=?");
						prstatement.setString(1, user_id);
						resultSet = prstatement.executeQuery();
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
						DBUtils.close(connection, prstatement, resultSet);
					}
					return null;
				
				}


}