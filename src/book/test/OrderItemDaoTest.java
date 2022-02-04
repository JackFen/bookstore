package book.test;

import book.dao.OrderItemDao;
import book.dao.impl.OrderItemDaoImpl;
import book.pojo.OrderItem;
import org.junit.Test;

import java.math.BigDecimal;

import static org.junit.Assert.*;

public class OrderItemDaoTest {

    @Test
    public void saveOrderItem() {
        OrderItemDao orderItemDao=new OrderItemDaoImpl();
        orderItemDao.saveOrderItem(new OrderItem(null,"皮囊",1,new BigDecimal(100),new BigDecimal(100),"1234"));
        orderItemDao.saveOrderItem(new OrderItem(null,"书",1,new BigDecimal(100),new BigDecimal(100),"1234"));
        orderItemDao.saveOrderItem(new OrderItem(null,"书2",1,new BigDecimal(100),new BigDecimal(100),"1234"));
    }
}