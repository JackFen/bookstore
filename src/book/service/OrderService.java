package book.service;

import book.pojo.Cart;

public interface OrderService {
    public String createOrder(Cart cart,Integer userId);
}
