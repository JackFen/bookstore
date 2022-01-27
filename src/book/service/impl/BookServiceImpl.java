package book.service.impl;

import book.dao.BookDao;
import book.dao.impl.BookDaoImpl;
import book.pojo.Book;
import book.service.BookService;

import java.util.List;

public  class BookServiceImpl implements BookService {
    private BookDao bookDao= new BookDaoImpl();
    @Override
    public void addBook(Book book) {
        bookDao.addBook(book);
    }

    @Override
    public void deleteBookById(Integer id) {
        bookDao.deleteBookById(id);
    }

    @Override
    public void updateBook(Book book) {
        bookDao.updateBook(book);
    }

    @Override
    public Book queryBookById(Integer id) {
        return bookDao.queryBookById(id);
    }

    @Override
    public List<Book> queryBooks() {
        return bookDao.queryBooks();
    }
}
