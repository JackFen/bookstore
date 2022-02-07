package book.test;

import book.dao.OrderItemDao;
import book.dao.impl.OrderItemDaoImpl;
import book.pojo.OrderItem;
import org.junit.Test;

import java.math.BigDecimal;

import static org.junit.Assert.*;

public class OrderItemDaoTest {
    OrderItemDao orderItemDao=new OrderItemDaoImpl();
    @Test
    public void saveOrderItem() {

        orderItemDao.saveOrderItem(new OrderItem(null,"皮囊",1,new BigDecimal(100),new BigDecimal(100),"1234"));
        orderItemDao.saveOrderItem(new OrderItem(null,"书",1,new BigDecimal(100),new BigDecimal(100),"1234"));
        orderItemDao.saveOrderItem(new OrderItem(null,"书2",1,new BigDecimal(100),new BigDecimal(100),"1234"));
    }

    @Test
    public void queryItemById() {
        System.out.println(orderItemDao.queryItemById("16441197240061"));
    }
}