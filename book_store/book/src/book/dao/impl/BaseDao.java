package book.dao.impl;

import book.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public abstract class BaseDao {
    //使用DBUtils操作数据库
    private QueryRunner queryRunner=new QueryRunner();
    //update()方法用来执行Insert\Update\Delete语句
    //return 如果返回-1说明执行失败，返回其它表示影响的行数
    public int update(String sql,Object...args){
        Connection connection= JdbcUtils.getConnection();
        try {
            return queryRunner.update(connection,sql,args);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    /*
    * 查询返回一个javaBean的sql语句
    * type:返回的对象类型
    * sql:执行的sql语句
    * args:sql对应的参数值
    * <T>：返回的类型的泛型*/
    public <T>T queryForOne(Class<T>type, String sql,Object...args){
        Connection con=JdbcUtils.getConnection();
        try {
            return queryRunner.query(con,sql,new BeanHandler<T>(type),args);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    /*
     * 查询返回多个javaBean的sql语句
     * type:返回的对象类型
     * sql:执行的sql语句
     * args:sql对应的参数值
     * <T>：返回的类型的泛型*/
    public <T>List<T> queryForList(Class<T>type,String sql,Object...args){
        Connection con=JdbcUtils.getConnection();
        try {
            return queryRunner.query(con,sql,new BeanListHandler<T>(type),args);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    /*
    * * 查询一行一列的sql语句
     * sql:执行的sql语句
     * args:sql对应的参数值
     * */
    public Object queryForSingleValues(String sql,Object...args){
        Connection conn=JdbcUtils.getConnection();
        try {
            return queryRunner.query(conn,sql,new ScalarHandler(),args);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
