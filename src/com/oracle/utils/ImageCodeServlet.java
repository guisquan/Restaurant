package com.oracle.utils;

import cn.liushao.servlet.BaseServlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "ImageCodeServlet", urlPatterns = "/ImageCodeServlet")
public class ImageCodeServlet extends BaseServlet {

    /**
     * 验证验证码
     */
    public String checkCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取从页面中接收到的验证码参数
        String checkCode = request.getParameter("codes");
        //从session域对象中获取验证码
        String sessionCode = (String) request.getSession().getAttribute("codes");
        //判断验证码是否相同
        if (checkCode.equalsIgnoreCase(sessionCode)) {
            response.getWriter().print("true");
        } else {
            response.getWriter().print("false");
        }
        return "";
    }

    public String showCheckCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("image/jpeg");
        //页面不缓存
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        //尺寸
        int width = 120;
        int height = 30;
        //图片
        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics graphics = bufferedImage.getGraphics();
        //绘制任何图形都要指定颜色
        graphics.setColor(getRandColor(200, 250));
        //设置图形为矩形
        graphics.fillRect(0, 0, width, height);
        //绘制边框
        graphics.setColor(Color.WHITE);
        graphics.drawRect(0, 0, width - 1, height - 1);
        Graphics2D graphics2d = (Graphics2D) graphics;
        //设置字体
        graphics2d.setFont(new Font("宋体", Font.BOLD, 18));
        String words = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz01234567989";
        Random random = new Random();
        //使用动态改变的字符串
        StringBuffer sb = new StringBuffer();
        //定义坐标
        int x = 10;
        for (int i = 0; i < 4; i++) {
            //随机颜色
            graphics2d.setColor(new Color(
                    20 + random.nextInt(110),
                    20 + random.nextInt(110),
                    20 + random.nextInt(110)
            ));
            double radian = (random.nextInt(60) - 30) * Math.PI / 180;
            int index = random.nextInt(words.length());
            char c = words.charAt(index);
            sb.append(c);
            graphics2d.rotate(radian, x, 20);
            graphics2d.drawString(String.valueOf(c), x, 20);
            graphics2d.rotate(-radian, x, 20);
            x += 30;
        }
        request.getSession().setAttribute("codes", sb.toString());
        //绘制干扰线
        graphics.setColor(getRandColor(160, 200));
        //坐标变量
        int x1;
        int x2;
        int y1;
        int y2;
        for (int i = 0; i < 50; i++) {
            x1 = random.nextInt(width);
            x2 = random.nextInt(width);
            y1 = random.nextInt(width);
            y2 = random.nextInt(width);
            graphics.drawLine(x1, y1, x2, y2);
        }
        graphics.dispose();
        ImageIO.write(bufferedImage, "jpg", response.getOutputStream());
        return "";
    }


    /**
     * @param fc 字体颜色
     * @param bc 背景颜色
     * @return
     */
    private Color getRandColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255) {
            fc = 255;
        }
        if (bc > 255) {
            bc = 255;
        }
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);

        return new Color(r, g, b);
    }


}
