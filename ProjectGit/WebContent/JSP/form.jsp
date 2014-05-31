<%@page import="java.sql.*"%>
<html>
<form method="post" action="result.jsp">
<table>
<%
Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
Connection connection = DriverManager.getConnection("jdbc:oracle:thin:system/petrol70@localhost:1521/orcldemo");
Statement st=connection.createStatement();
//ResultSet rs=st.executeQuery("Select ques,op1,op2,op3,op4,ans from test");
ResultSet rs=st.executeQuery("select * from (select ques,op1,op2,op3,op4,ans from test order by dbms_random.value()) where rownum <= 3");
int i=1;
while(rs.next()){
%>
<tr><td><%=i%></td><td><%=rs.getString("ques")%></td><td><input type="radio" value="<%=rs.getString("op1")%>" name="radio<%=i%>"/><%=rs.getString("op1")%></td><td><input type="radio" value="<%=rs.getString("op2")%>" name="radio<%=i%>"/><%=rs.getString("op2")%></td><td><input type="radio" value="<%=rs.getString("op3")%>" name="radio<%=i%>"/><%=rs.getString("op3")%></td><td><input type="radio" value="<%=rs.getString("op4")%>" name="radio<%=i%>"/><%=rs.getString("op4")%></td></tr>
<!-- <input type="button" class="button" onclick="go('form.jsp')" value="Next"/> -->

<%
i++;
}
%>
<tr><td><input type="submit" value="submit"></td></tr>
</table>
</form>
</html>