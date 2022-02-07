package book.dao.impl;

import book.dao.OrderItemDao;
import book.pojo.OrderItem;

import java.util.List;

public class OrderItemDaoImpl extends BaseDao implements OrderItemDao {
    @Override
    public int saveOrderItem(OrderItem orderItem) {
        String sql="insert into t_order_item(`name`,`count`,`price`,`total_price`,`order_id`)values(?,?,?,?,?)";
        return update(sql,orderItem.getName(),orderItem.getCount(),orderItem.getPrice(),orderItem.getTotalPrice(),orderItem.getOrderId());
    }

    @Override
    public List<OrderItem> queryItemById(String orderId) {
        String sql="select `name`,`count`,`price`,`total_price` totalprice,`order_id` orderid from t_order_item where order_id=?";
        return  queryForList(OrderItem.class,sql,orderId);
    }
}
