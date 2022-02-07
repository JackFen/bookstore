package book.test;

import book.pojo.Cart;
import book.pojo.CartItem;
import book.service.OrderService;
import book.service.impl.OrderServiceImpl;
import org.junit.Test;

import java.math.BigDecimal;

import static org.junit.Assert.*;

public class OrderServiceTest {
    OrderService orderService=new OrderServiceImpl();
    @Test
    public void createOrder() {
        Cart cart=new Cart();
        cart.addItem(new CartItem("static/img/default.jpg",1,"这是书",1,new BigDecimal(1000),new BigDecimal(1000)));
        cart.addItem(new CartItem("static/img/default.jpg",2,"这是书1",1,new BigDecimal(1000),new BigDecimal(1000)));
        cart.addItem(new CartItem("static/img/default.jpg",3,"这是书2",1,new BigDecimal(100),new BigDecimal(100)));

        System.out.println("订单号是:"+orderService.createOrder(cart,1 ));
    }

    @Test
    public void showAllOrders() {
        System.out.println("订单有："+orderService.showAllOrders());
    }

    @Test
    public void senOrder() {
    }

    @Test
    public void showOrderDetail() {
        System.out.println("16441197240061订单的物品有:"+orderService.showOrderDetail("16441197240061"));
    }

    @Test
    public void showMyOrders() {
        System.out.println("用户id为1的所有订单为:"+orderService.showMyOrders(1));
    }

    @Test
    public void receiveOrder() {
    }
}