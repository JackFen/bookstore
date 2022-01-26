package book.utils;

import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.InvocationTargetException;

public class webUtils {
    public static void copyParamToBean(HttpServletRequest req, Object bean){
        try {
            System.out.println("注入之前："+bean);
            BeanUtils.populate(bean,req.getParameterMap());
            System.out.println("注入之后："+bean);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
