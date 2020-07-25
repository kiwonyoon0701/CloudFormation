<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*,java.text.*,java.sql.*"%>
<html>
<head>
<title>test</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link title=menustyle href="../adminstyle.css" type="text/css" rel="stylesheet">
<script language="JavaScript">
<!--
 function MM_openBrWindow(theURL,winName,features){
 window.open(theURL,winName,features);
 }
//-->
</script>
</head>


<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="630" border="0" cellspacing="0" cellpadding="0">
<BR>
<HR>

 <%
        String DB_HOST_IP="10.100.101.191";
        String DB_URL = "jdbc:oracle:thin:@" + DB_HOST_IP + ":1521:salesdb";
        String DB_USER = "oshop";
        String DB_PASSWORD = "<PASSWORD>";
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String sql=null;

        try
        {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                //out.println("Oracle Database Connected!");
        }
        catch(SQLException e)
        {
                out.println(e);
        }

        String ServerIP = request.getLocalAddr();
        sql="select EMPNO, ENAME, JOB, SAL, HIREDATE from emp";

        stmt = con.createStatement();
        rs = stmt.executeQuery(sql);
        out.println ("<H1><center>Octank Employee Portal</H1><hr>");
        out.println("<TABLE border=2 align=center ><TR bgcolor=yellow> <TD>Employee Number</TD><TD>Employee Name</TD><TD>Job Title</TD><TD>Salary</TD><TD>Hire Date</TD>");

        while(rs.next())
        {
                String name=rs.getString("ENAME");
                String empno=rs.getString("EMPNO");
                String job=rs.getString("JOB");
                String mgr=rs.getString("SAL");
                String hiredate=rs.getString("HIREDATE");
                out.println("<TR>");
                out.println("<TD>"+empno+"</TD><TD>"+name+"</TD><TD>"+job+"</TD><TD>"+mgr+"</TD><TD>"+hiredate);
                out.println("</TR>");
        }

        out.println("</TABLE><HR>");
%>
<center><img src="employee.jpeg" width=550 height=400 alt="employees" style="float:center"></center>
<HR>
<%
        out.println("<B><U><Font size=4>WAS Server IP : " + ServerIP+"<BR><HR></font></U></B>");
    if(rs != null) rs.close();
    if(stmt != null)stmt.close();
    if(con != null)con.close();
 %>

</body>
</html>
root@ip-10-100-1-241:/var/lib/tomcat8/webapps/ROOT#