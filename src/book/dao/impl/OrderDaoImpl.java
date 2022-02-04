package book.dao.impl;

import book.dao.OrderDao;
import book.pojo.Order;

public class OrderDaoImpl extends BaseDao implements OrderDao {

    @Override
    public int saveOrder(Order order) {
        String sql="insert into t_order(`order_id`,`create_date`,`price`,`status`,`user_id`)values(?,?,?,?,?)";
        return update(sql,order.getOrderId(),order.getCreateTime(),order.getPrice(),order.getStatus(),order.getUserId());
    }
}
