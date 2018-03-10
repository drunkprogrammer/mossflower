 <%@ page contentType="text/html;charset=GB2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*" %>
<%!Connection conn=null;
Statement stmt;
ResultSet rs;
 
String driverName="com.mysql.jdbc.Driver";
String user="root";
String pwd="root";
String url="jdbc:mysql://localhost:3306/MossFlowerDB";
 %>

<html>
   <head>
   <title>用户注册</title>
   </head>
  
   <body>
  <%
  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/MossFlowerDB", "root", "root");
    stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    
    String strUser_name=request.getParameter("phone");
    String strUser_password1=request.getParameter("phonepPassWord");
    String strUser_tele=request.getParameter("user_tele");
    String strUser_address=request.getParameter("user_address");
    
    strUser_name=new String(strUser_name.getBytes("ISO-8859-1"),"gb2312");
    strUser_address=new String(strUser_address.getBytes("ISO-8859-1"),"gb2312");
    
    String condition1="select user_tele from user where user_tele='"+strUser_tele+"'";
     if(rs.next()){                                                         /*在已有买家中查找是否有人已注册了该账号*/
    %>
    <script type="text/javascript">
     alert("该号码已被注册，请重新确认！");
     window.location.href="Uregister.html";
     exit(0);
    </script>
    <%
    }
     
   else{
      String sql="insert into user values (null,'"+strUser_name+"','"+strUser_password1+"','"+strUser_tele+"','"+strUser_address+"')";
      stmt.executeUpdate(sql);
     %>
     <script type="text/javascript">
      alert("注册成功！");
      window.location.href="face.html?user_id=<%=strUser_tele%>";
     </script>
  
     }
}
       rs.close();
       stmt.close();
       conn.close();
  </body>
</html>

