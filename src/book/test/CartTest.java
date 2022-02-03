package book.test;

import book.pojo.Cart;
import book.pojo.CartItem;
import org.junit.Test;

import java.math.BigDecimal;

import static org.junit.Assert.*;

public class CartTest {

    @Test
    public void addItem() {
        Cart cart=new Cart();
        cart.addItem(new CartItem("static/img/default.jpg",1,"这是书",1,new BigDecimal(1000),new BigDecimal(1000)));
        cart.addItem(new CartItem("static/img/default.jpg",1,"这是书",1,new BigDecimal(1000),new BigDecimal(1000)));
        cart.addItem(new CartItem("static/img/default.jpg",2,"这是书2",1,new BigDecimal(100),new BigDecimal(100)));
        System.out.println(cart);
    }

    @Test
    public void deleteItem() {
        Cart cart=new Cart();
        cart.addItem(new CartItem("static/img/default.jpg",1,"这是书",1,new BigDecimal(1000),new BigDecimal(1000)));
        cart.addItem(new CartItem("static/img/default.jpg",1,"这是书",1,new BigDecimal(1000),new BigDecimal(1000)));
        cart.addItem(new CartItem("static/img/default.jpg",2,"这是书2",1,new BigDecimal(100),new BigDecimal(100)));
        cart.deleteItem(1);
        System.out.println(cart);
    }

    @Test
    public void clear() {
        Cart cart=new Cart();
        cart.addItem(new CartItem("static/img/default.jpg",1,"这是书",1,new BigDecimal(1000),new BigDecimal(1000)));
        cart.addItem(new CartItem("static/img/default.jpg",1,"这是书",1,new BigDecimal(1000),new BigDecimal(1000)));
        cart.addItem(new CartItem("static/img/default.jpg",2,"这是书2",1,new BigDecimal(100),new BigDecimal(100)));
        cart.clear();
        System.out.println(cart);
    }

    @Test
    public void updateCount() {
        Cart cart=new Cart();
        cart.addItem(new CartItem("static/img/default.jpg",1,"这是书",1,new BigDecimal(1000),new BigDecimal(1000)));
        cart.addItem(new CartItem("static/img/default.jpg",1,"这是书",1,new BigDecimal(1000),new BigDecimal(1000)));
        cart.addItem(new CartItem("static/img/default.jpg",2,"这是书2",1,new BigDecimal(100),new BigDecimal(100)));
        cart.updateCount(1, 10);
        System.out.println(cart);
    }
}