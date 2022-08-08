package com.zhexun.util;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.Queue;

public class JDBCUtil {
    private static Queue<Connection> pool=new LinkedList<>();

    private static Driver driver;
    //在加载这个类时会自动执行static代码块的代码，这块代码只会在加载这个类的时候执行（即只会执行一次）
    static {
        try {
            driver=new com.mysql.cj.jdbc.Driver();
            //注册驱动类
            DriverManager.registerDriver(driver);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    private static String url="jdbc:mysql://localhost:3306/revolution_times?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false&allowPublicKeyRetrieval=true";
    private static String user="root";
    private static String password="123456";

    /**
     * 获取一个数据库连接池
     * @return 数据库连接
     */
        public static synchronized Connection getConnection(){
        if (pool.size()==0){
            try {
                return DriverManager.getConnection(url,user,password);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return pool.poll();
    }

    /**
     * 将用完的连接放回连接池
     * @param connection 要释放的连接
     */
    public static synchronized void release(Connection connection){
        pool.add(connection);
    }
}