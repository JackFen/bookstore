package book.web;

import book.pojo.Book;
import book.pojo.Cart;
import book.pojo.CartItem;
import book.service.BookService;
import book.service.impl.BookServiceImpl;
import book.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CartServlet extends BaseServlet {
    private BookService bookService=new BookServiceImpl();
    protected void updateCount(HttpServletRequest req, HttpServletResponse resp)throws ServletException,IOException{
        //获取请求的参数，商品编号，商品数量
        int id=WebUtils.parseInt(req.getParameter("id"),0 );
        int count=WebUtils.parseInt(req.getParameter("count"), 1);
        Cart cart= (Cart) req.getSession().getAttribute("cart");
        if (cart!=null){
            //修改商品数量
            cart.updateCount(id,count );
            //重定向回原来的购物车展示页面
            resp.sendRedirect(req.getHeader("Referer"));
        }
    }
    protected void clear(HttpServletRequest req, HttpServletResponse resp)throws ServletException,IOException{
        //1.获取购物车对象
        Cart cart= (Cart) req.getSession().getAttribute("cart");
        if (cart!=null){
            //清空购物车
            cart.clear();
            //重定向回原来的购物车展示页面
            resp.sendRedirect(req.getHeader("Referer"));
        }
    }
    protected void deleteItem(HttpServletRequest req, HttpServletResponse resp)throws ServletException,IOException{
        //获取商品编号
        int id=WebUtils.parseInt(req.getParameter("id"),0 );
        //获取购物车对象
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart!=null){
            //删除了购物车商品项
            cart.deleteItem(id);
            //重定向回原来的购物车展示页面
            resp.sendRedirect(req.getHeader("Referer"));
        }
    }
    protected void addItem(HttpServletRequest req, HttpServletResponse resp)throws ServletException,IOException{
//        System.out.println("加入购物车");
//        System.out.println("商品编号："+req.getParameter("id"));
        //获取请求参数
        int id= WebUtils.parseInt(req.getParameter("id"), 0);
        //调用bookService.queryBookById(id):Book得到图书的信息
        Book book=bookService.queryBookById(id);
        //把图书信息，转换为CartItem商品项
        CartItem cartItem=new CartItem(book.getImgPath(),book.getId(),book.getName(),1,book.getPrice(),book.getPrice());
        //调用Cart.addItem(CartItem)；添加商品项
        Cart cart=(Cart) req.getSession().getAttribute("cart");
        if (cart==null){
             cart=new Cart();
             req.getSession().setAttribute("cart",cart );
        }
        cart.addItem(cartItem);
//        //最后一次添加商品的名称
//        req.getSession().setAttribute("lastName",cartItem.getName() );
        //重定向回商品所在的列表页面
        resp.sendRedirect(req.getHeader("Referer"));

    }
}
