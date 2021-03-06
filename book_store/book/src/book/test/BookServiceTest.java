package book.test;

import book.pojo.Book;
import book.pojo.Page;
import book.service.BookService;
import book.service.impl.BookServiceImpl;
import org.junit.Test;

import java.math.BigDecimal;

import static org.junit.Assert.*;

public class BookServiceTest {
    private BookService bookService=new BookServiceImpl();
    @Test
    public void addBook() {
        bookService.addBook(new Book(null,"这是一本书","你猜",new BigDecimal(100),100,0,null));
    }

    @Test
    public void deleteBookById() {
        bookService.deleteBookById(9);
    }

    @Test
    public void updateBook() {
        bookService.updateBook(new Book(9,"这不是一本书","你猜",new BigDecimal(100),100,0,null));
    }

    @Test
    public void queryBookById() {
        System.out.println(bookService.queryBookById(5));
    }

    @Test
    public void queryBooks() {
        for (Book queryBook:bookService.queryBooks()){
            System.out.println(queryBook);
        }
    }
    @Test
    public void page(){
        System.out.println(bookService.page(1, Page.PAGE_SIZE ));
    }

    @Test
    public void pageByPrice() {
        System.out.println(bookService.pageByPrice(1,Page.PAGE_SIZE ,10 ,60 ));
    }
}