package book.test;

import book.dao.BookDao;
import book.dao.impl.BookDaoImpl;
import book.pojo.Book;
import book.pojo.Page;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.List;

import static org.junit.Assert.*;

public class BookDaoTest {
    private BookDao bookDao=new BookDaoImpl();
    @Test
    public void addBook() {
        bookDao.addBook(new Book(null,"这不是一本书","不知道",new BigDecimal(999),100,0,null));
    }

    @Test
    public void deleteBookById() {
        bookDao.deleteBookById(8);
    }

    @Test
    public void updateBook() {
        bookDao.updateBook(new Book(8,"难道这不是一本书吗","不知道",new BigDecimal(999),100,0,null));
    }

    @Test
    public void queryBookById() {
        System.out.println(bookDao.queryBookById(5));
    }

    @Test
    public void queryBooks() {
        for (Book queryBook:bookDao.queryBooks()){
            System.out.println(queryBook);
        }
    }
    @Test
    public void queryForPageTotalCount() {
        System.out.println(bookDao.queryForPageTotalCount());
    }

    @Test
    public void queryForPageItems() {
        for (Book book : bookDao.queryForPageItems(0, Page.PAGE_SIZE)) {
            System.out.println(book);
        }
    }

    @Test
    public void queryForPageTotalCountByPrice() {
        System.out.println(bookDao.queryForPageTotalCountByPrice(10,50 ));
    }

    @Test
    public void queryForPageItemsByPrice() {
        for (Book book : bookDao.queryForPageItemsByPrice(0, Page.PAGE_SIZE, 10, 50)) {
            System.out.println(book);
        }
    }
}