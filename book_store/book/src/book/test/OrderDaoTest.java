package book.test;

import book.dao.OrderDao;
import book.dao.impl.OrderDaoImpl;
import book.pojo.Book;
import book.pojo.Order;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.Date;

import static org.junit.Assert.*;

public class OrderDaoTest {
    OrderDao orderDao=new OrderDaoImpl();
    @Test
    public void saveOrder() {

        orderDao.saveOrder(new Order("1234",new Date(),new BigDecimal(100),0,1));
    }

    @Test
    public void queryOrders() {
        for (Order queryOrder:orderDao.queryOrders()){
            System.out.println(queryOrder);
        }
    }

    @Test
    public void changeOrderStatus() {
        orderDao.changeOrderStatus("16442309330991", 1);
    }

    @Test
    public void queryOrdersByUserId() {
    }
}