import java.sql.*;

public class samplejava {
	public static void main(String args[]) {
		String username = "smia076"; // "your UPI";
		String password = "smia076"; // "your password";
		String url = "jdbc:mysql://127.0.0.1:3306/stu_smia076_COMPSCI_351_C_S1_2020_A2_Q1"; // your database
		int hourExist = 0;
		int pmax = 0;
		int pmin =  0;
		// Loads the JDBC driver
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded");
			// Establishes a connection
			Connection conn = DriverManager.getConnection(url, username, password);
			System.out.println("Database connected");
			// Creates a statement
			Statement stmt = conn.createStatement();

			/************************PLease adapt the following code to complete Lab 9**********************/ 
			// Executes a statement
			String command = "SELECT COUNT(*)\n"+
							"FROM INFORMATION_SCHEMA.COLUMNS\n" +
							"WHERE table_schema = 'stu_smia076_COMPSCI_351_C_S1_2020_A2_Q1' AND table_name = 'PROJECT' AND column_name = 'Hours'";
			// Obtains the results as a set of rows
			//System.out.println(command);
			ResultSet result = stmt.executeQuery(command);
			result.next();
			hourExist = result.getInt(1);
			
			if (hourExist == 0)stmt.executeQuery("ALTER TABLE PROJECT ADD Hours FLOAT");
			
			String query = "SELECT MIN(Pnumber), MAX(Pnumber) FROM PROJECT";
			result = stmt.executeQuery(query);
			result.next();
			pmin = result.getInt(1);
			pmax = result.getInt(2);
			

			for(int i = pmin; i <= pmax; i++){
				String sumHour = String.format("SELECT SUM( Hours ) FROM WORKS_ON WHERE Pno = %d;", i);
				result = stmt.executeQuery(sumHour);
				result.next();
				String hours = result.getString(1);

				hours = hours != null ? hours : "0";
				String update = String.format("UPDATE PROJECT SET Hours = %s WHERE Pnumber = %d", hours, i);
				stmt.executeUpdate(update);
			}

			query = "SELECT * FROM PROJECT";
			result = stmt.executeQuery(query);
			while(result.next()){
				String pName = result.getString(1);
				String type = result.getInt(5) < 100 ? "Short" : "Long";
				System.out.printf("%s %s\n", pName, type);
			}

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}