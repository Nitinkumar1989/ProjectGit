import java.sql.*;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;

public class GenreateJson {

	public static void main(String[] args) {
		
		 Connection conn = null;
			List<String> listofstate = new ArrayList<String>();
			List<String> op1 = new ArrayList<String>();
			List<String> op2 = new ArrayList<String>();
			List<String> op3 = new ArrayList<String>();
			List<String> op4 = new ArrayList<String>();
		  
			jsonbean jsb = new jsonbean();
		  try {
				FileWriter fw = new FileWriter("D:\\datajson.json");

		  Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
		  conn = DriverManager.getConnection("jdbc:oracle:thin:system/petrol70@localhost:1521/orcldemo");
		  Statement st=conn.createStatement();
		  ResultSet rs=st.executeQuery("select * from (select ques,op1,op2,op3,op4,ans from test order by dbms_random.value()) where rownum <= 3");
	   	int i=1;
	   	Gson gs = new Gson();

	
		
		while(rs.next()){
			listofstate.add(rs.getString("ques"));
			op1.add(rs.getString("op1"));
			op2.add(rs.getString("op2"));
			op3.add(rs.getString("op3"));
			op4.add(rs.getString("op4"));
		}
		
		jsb.setListofstate(listofstate);
		jsb.setOp1(op1);
		jsb.setOp2(op2);
		jsb.setOp3(op3);
		jsb.setOp4(op4);
		
		String json = gs.toJson(jsb);

		try{
			fw.write(json);
			fw.close();
		}catch(Exception ex){
			System.out.println(ex);
		}
		System.out.println(json);

		  System.out.println("Connected to the database");
		  conn.close();
		  System.out.println("Disconnected from database");
		  } catch (Exception e) {
		  e.printStackTrace();
		  }
	}

	
}
