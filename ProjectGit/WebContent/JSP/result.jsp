<%@page import="java.sql.*"%>

<%
	String st[] = new String[3];
	for (int i = 0; i < st.length; i++) {
		int j = i + 1;
		st[i] = request.getParameter("radio" + j);
		System.out.println(st[i]);
	}
	Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
	Connection connection = DriverManager
			.getConnection("jdbc:oracle:thin:system/petrol70@localhost:1521/orcldemo");
	Statement stmt = connection.createStatement();
	ResultSet rs = stmt.executeQuery("select ans from ANSWERS");
	String ans = "";
	while (rs.next()) {
		ans += rs.getString("ans") + " ";
	}
	int count = 0;
	String answers[] = ans.split(" ");
	for (int i = 0; i < answers.length; i++) {
		for(int j = 0; j < st.length; j ++){
		if (st[j].equals(answers[i])) {
			count++;
		}
		}
	}
	out.println("Your " + count + " answers are correct");
%>