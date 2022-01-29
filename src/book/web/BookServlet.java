package book.web;

import book.pojo.Book;
import book.pojo.Page;
import book.service.BookService;
import book.service.impl.BookServiceImpl;
import book.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BookServlet extends BaseServlet {
    private BookService bookService=new BookServiceImpl();
    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNo=WebUtils.parseInt(req.getParameter("pageNo"),0 );
        pageNo+=1;
        //1.获取请求的参数==封装为Book对象
        Book book= WebUtils.copyParamToBean(req.getParameterMap(),new Book());
        //2.调用BookService.addBook()保存图书
        bookService.addBook(book);
        //3.跳到图书列表页面 如果使用请求转发，则当用户提交完请求，浏览器会记录下最后一次请求的全部信息，当按下F5,就会发起浏览器记录的最后一次请求，所以使用重定向
        resp.sendRedirect(req.getContextPath()+"/manager/bookServlet?action=page&pageNo="+req.getParameter("pageNo"));
    }
    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.获取请求转发的参数id
        int id=WebUtils.parseInt(req.getParameter("id"),0 );
        //2.调用bookService.deleteBookByid()删除图书
        bookService.deleteBookById(id);
        //3.重定向回图书管理列表页面
        resp.sendRedirect(req.getContextPath()+"/manager/bookServlet?action=page&pageNo="+req.getParameter("pageNo"));
    }
    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Book book=WebUtils.copyParamToBean(req.getParameterMap(),new Book());
        bookService.updateBook(book);
        resp.sendRedirect(req.getContextPath()+"/manager/bookServlet?action=page&pageNo="+req.getParameter("pageNo"));
    }
    protected void getBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.获取请求的参数图书编号
        int id=WebUtils.parseInt(req.getParameter("id"),0 );
        //2.调用bookService.queryBookById查询图书
        Book book=bookService.queryBookById(id);
        //3.保存图书到Request域中
        req.setAttribute("book",book );
        //4.请求转发到pages/manager/book_edit
        req.getRequestDispatcher("/pages/manager/book_edit.jsp").forward(req,resp );
    }
    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.通过BookService查询全部图书
        List<Book> books=bookService.queryBooks();
        //2.把全部图书保存到Request域中
        req.setAttribute("books", books);
        //3.请求转发到/pages/manager/book_manager.jsp页面
        req.getRequestDispatcher("/pages/manager/book_manager.jsp").forward(req, resp);
    }
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.获取请求的参数pageNo和pageSize
        int pageNo=WebUtils.parseInt(req.getParameter("pageNo"),1 );
        int pageSize=WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE );
        //2.调用BookService.page(pageNo,pageSize):Page对象
        Page<Book>page=bookService.page(pageNo,pageSize);
        //3.保存Page对象到Request域中
        req.setAttribute("page",page );
        //4.请求转发到pages/manager/book_manager.jsp页面
        req.getRequestDispatcher("/pages/manager/book_manager.jsp").forward(req,resp );
    }
}
