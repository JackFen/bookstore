package book.service;

import book.pojo.Cart;
import book.pojo.Order;
import book.pojo.OrderItem;

import java.util.List;

public interface OrderService {
    public String createOrder(Cart cart,Integer userId);
    public List<Order> showAllOrders();
    public void senOrder(String orderId);
    public List<OrderItem> showOrderDetail(String orderId);
    public List<Order> showMyOrders(Integer userId);
    public void receiveOrder(String orderId);
}
