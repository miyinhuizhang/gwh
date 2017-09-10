 <%@ page language="java" contentType="text/html; charset=utf-8" 
     pageEncoding="utf-8"%>
  <%@ page import="szys.*"%>
  <%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  %> 
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 <html>
   <head>
     <base href="<%=basePath%>">     
     <title>四则运算</title>
     <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
          <meta http-equiv="pragma" content="no-cache">
     <meta http-equiv="cache-control" content="no-cache">
     <meta http-equiv="expires" content="0">    
     <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
     <meta http-equiv="description" content="This is my page">
     <!--
     <link rel="stylesheet" type="text/css" href="styles.css">
     -->
   </head>   
   <body background="images/A2.jpg"> 
    <%
    int timugeshu=Integer.parseInt((String)request.getParameter("timugeshu"));
    String[] s=new String[timugeshu];
    float k[]=new float[timugeshu];
    math a=new math();
    request.setCharacterEncoding("UTF-8");
    String xuanze = request.getParameter("xuanze");
    String xuanze1 = request.getParameter("xuanze1");
    String xuanze2 = request.getParameter("xuanze2");
    String TopNumber,BaseNumber;
    TopNumber=request.getParameter("TopNumber");
    BaseNumber=request.getParameter("BaseNumber");
    a.SetValue(a.StrToNum(TopNumber),a.StrToNum(BaseNumber));
    if(xuanze!=null&&xuanze1!=null&&xuanze2!=null){
    if(xuanze.equals("1"))
    {
          a.SetValue1(1);
    }
    if(xuanze1.equals("3"))
    {
           a.SetValue2(1);
    }
    if(xuanze2.equals("5"))
    {
          a.SetValue3(1);
    }
 }
     %>
    <form action="Myjsp.jsp" method="post">
    <center>
    <%
      a.main(timugeshu);
      float temp;
      String[] se=new String[timugeshu];
      for(int i=0;i<timugeshu;i++){
      s[i]=a.cs(i);
      se[i]="name";
      se[i]=se[i]+i;
      k[i]=a.css(i);
      out.print("<tr>"+s[i]+"</tr>");
      out.println("<br>");
     
      
    %>   
    <input type="text" name=<%=se[i] %>><br>
    <%
        } 
         session.setAttribute( "v1",s);
         session.setAttribute( "v2",k); 
     %>
     <br><input type="submit" name="submit" value="提交">     
     <%    %>
      </center>
   </form>
   
   
    
     
   </body>
 </html>