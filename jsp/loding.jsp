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
   <title>��ҵ�¼</title>
   </head>
  
   <body>
    <%
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MossFlowerDB", "root", "root");
    stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
     
    String strUser=request.getParameter("mail");
    String strPass=request.getParameter("pwd");
    
    //�û���Ϣ��ѯ
    String condition1="select user_tele from user where user_tele='"+strUser+"'";
    String userPasswd=null;
    rs=stmt.executeQuery(condition1);
 
    if(rs.next()){                                                                  /*������в��Ҹ��û�*/
    String condition2="select user_password from user where user_tele='"+strUser+"' and user_password='"+strPass+"'";
    rs=stmt.executeQuery(condition2);
         if(rs.next()){
         %>
         <script type="text/javascript">
         window.location.href="face.jsp?user_id=<%=strUser%>";
         </script>
        <%
          }
          else{
          %>
         <script type="text/javascript">
         alert("��������������������룡");
         window.location.href="loding.jsp";
        </script>
        <%
          }
    }                                                                     
    
    /*�������в���*/
    else{
     String condition3="select admin_account,admin_password from aadmin where admin_account='"+strUser+"'";
     String supplierPasswd=null;
     rs=stmt.executeQuery(condition3);
        if(rs.next()){
        String condition4="select admin_password from admin where admin_account='"+strUser+"' and admin_password='"+strPass+"'";
        rs=stmt.executeQuery(condition4);
           if(rs.next()){
           %>
           <script type="text/javascript">
           window.location.href="business.jsp?admin_id=<%=strUser%>";
           </script>
           <% 
          }
          else{
          %>
          <script type="text/javascript">
          alert("��������������������룡");
          window.location.href="loding.html";
          </script>
          <%
          }
       }                                                                                                    /*�����ڸ��û�*/
    else{
    %>
    <script type="text/javascript">
    alert("�����ڸ��û��������µ�¼��");
    window.location.href="lodin.html";
    </script>
      <% 
     }
   }
     
   rs.close();
   stmt.close();
   conn.close();

       %>
     <br>
     <div align="right">
     <p><a href="show.html">   ������ҳ     </a></p></div>
     
  </body>
</html>
