package book.dao;

import book.pojo.Order;

import java.util.List;

public interface OrderDao {
    public int saveOrder(Order order);
    public List<Order> queryOrders();
    public int changeOrderStatus(String orderId,Integer status);
    public List<Order> queryOrdersByUserId(Integer id);
}
