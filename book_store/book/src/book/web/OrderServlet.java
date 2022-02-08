package book.web;

import book.pojo.Cart;
import book.pojo.Order;
import book.pojo.OrderItem;
import book.pojo.User;
import book.service.OrderService;
import book.service.impl.OrderServiceImpl;
import book.utils.JdbcUtils;
import book.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class OrderServlet extends BaseServlet {
    private OrderService orderService=new OrderServiceImpl();
    //生成订单
    protected void createOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       //先获取Cart购物车对象
        Cart cart= (Cart) req.getSession().getAttribute("cart");
        //获取Useid
        User loginUser= (User) req.getSession().getAttribute("user");
        if (loginUser==null){
            req.getRequestDispatcher("pages/user/login.jsp").forward(req,resp );
            return;
        }
        Integer userId=loginUser.getId();
        //调用orderService.createOrder(Cart,Uerid);生成订单
        String orderId = null;
            orderId = orderService.createOrder(cart,userId );
//        req.setAttribute("orderId",orderId );
//        //请求转发到/pages/cart/checkout.jsp
//        req.getRequestDispatcher("/pages/cart/checkout.jsp").forward(req,resp );
        req.getSession().setAttribute("orderId",orderId );
        resp.sendRedirect(req.getContextPath()+"/pages/cart/checkout.jsp");
    }
    //查看所有订单

    protected void showAllOrders(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //通过showAllOrders查询全部订单
        List<Order> orders=orderService.showAllOrders();
        //把全部订单保存到Resquest域中
        req.setAttribute("orders",orders );
        //请求转发到/pages/order/order.jsp页面
        req.getRequestDispatcher("/pages/order/order.jsp").forward(req,resp );
    }

    protected void showMyOrders(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //通过showMyOrders(Integer userId)查询订单
        int userId= WebUtils.parseInt(req.getParameter("userId"),0 );
        List<Order> orders=orderService.showMyOrders(userId);
        // 把全部订单保存到Request域中
        req.setAttribute("orders",orders );
        //请求转发到/pages/order/order.jsp页面
        req.getRequestDispatcher("/pages/order/order.jsp").forward(req,resp );
    }

    protected void showOrderDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //通过showOrderDetail()查询订单物品
        List<OrderItem> orderItems=orderService.showOrderDetail(req.getParameter("orderId"));
        // 把全部订单物品保存到Resquest域中
        req.setAttribute("orderItems",orderItems );
        //请求转发到/pages/order/orderItem.jsp页面
        req.getRequestDispatcher("/pages/order/orderItem.jsp").forward(req,resp );
    }

    protected void sendOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //通过订单号确定订单
        orderService.senOrder(req.getParameter("orderId"));
        //重定向到/pages/order/order.jsp页面
        resp.sendRedirect(req.getContextPath()+"/orderServlet?action=showAllOrders");
    }
    protected void receiveOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //通过订单号确定订单
        orderService.receiveOrder(req.getParameter("orderId"));
        //重定向到/pages/order/order.jsp页面
        resp.sendRedirect(req.getContextPath()+"/orderServlet?action=showAllOrders");
    }
}
