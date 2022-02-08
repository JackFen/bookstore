package book.dao.impl;

import book.dao.OrderDao;
import book.pojo.Order;

import java.util.List;

public class OrderDaoImpl extends BaseDao implements OrderDao {

    @Override
    public int saveOrder(Order order) {
        String sql="insert into t_order(`order_id`,`create_date`,`price`,`status`,`user_id`)values(?,?,?,?,?)";
        return update(sql,order.getOrderId(),order.getCreateTime(),order.getPrice(),order.getStatus(),order.getUserId());
    }

    @Override
    public List<Order> queryOrders() {
        String sql="select `order_id` orderid,`create_date` createTime,`price`,`status`,`user_id` userid from t_order";
        return queryForList(Order.class,sql);
    }

    @Override
    public int changeOrderStatus(String orderId,Integer status) {
        String sql="update t_order set`status`=? where order_id=?";
        return update(sql,status,orderId);
    }

    @Override
    public List<Order> queryOrdersByUserId(Integer userId) {
        String sql="select `order_id` orderid,`create_date` createTime,`price`,`status`,`user_id` userid from t_order where user_id=?";
        return queryForList(Order.class,sql,userId);
    }
}
