package jupiter.cts.MySQLConector;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import org.apache.commons.lang.StringEscapeUtils;


public class MySqlConnector {
	public static Connection getMySQLConnection(String Param) throws FileNotFoundException {
		Properties props = new Properties();
		InputStream inputStream;
		Connection con = null;
		inputStream = new FileInputStream(new File(Param));
		try {
			props.load(inputStream);
			Class.forName(props.getProperty("MYSQL_DRIVER"));
			con=DriverManager.getConnection(props.getProperty("MYSQL_CON"),
					props.getProperty("MYSQL_USER"),
					props.getProperty("MYSQL_PSWRD"));
		} catch (IOException | ClassNotFoundException | SQLException e) {
			System.out.println("Unable to Load Properties file");
			e.printStackTrace();
		} 

		return con;
	}
	public int executeMySQL(String sqlfile,String paramfile) throws Throwable {

		BufferedReader br = new BufferedReader(new FileReader(sqlfile));

		StringBuilder sb = new StringBuilder();
		String line = br.readLine();

		while (line != null) {
			sb.append(line);
			sb.append(System.lineSeparator());
			line = br.readLine();
		}
		String content = sb.toString();
		String srcQuery=StringEscapeUtils.escapeJava(content.replace("\n"," ").replace("\r", ""));
		//String Query=StringEscapeUtils.escapeJava(srcQuery.replaceAll("\r",""));
		br.close();
		Connection con=MySqlConnector.getMySQLConnection(paramfile);
		Statement stm=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		;
		//Publish Query Result
		System.out.println("Running MySQL Query in "+sqlfile+" : "+"\n"+srcQuery);
		System.out.println();
		ResultSet rscnt=stm.executeQuery(srcQuery);
		 
		//Get Row Count from Result
		rscnt.last();		
		int resultcnt=rscnt.getRow();
		rscnt.beforeFirst();
		System.out.println(resultcnt+" Records Returned From Query...");
		 

		File MySQLoutfile=new File(sqlfile+"_"+"MySQLresult.csv");
		
		//Iterate through columns to print column name
		PrintWriter csvWriter = new PrintWriter(MySQLoutfile) ;
		        ResultSetMetaData meta = rscnt.getMetaData() ; 
		        int numberOfColumns = meta.getColumnCount() ; 
		        //String dataHeaders =  meta.getColumnName(1) ; 
		        
		        /*for (int i = 2 ; i < numberOfColumns + 1 ; i ++ ) { 
		                dataHeaders += "," + meta.getColumnName(i);
		        }
		        
		        csvWriter.println(dataHeaders) ;*/
		        while (rscnt.next()) {
		            String row = rscnt.getString(1) ;
		            
		            for (int i = 2 ; i < numberOfColumns + 1 ; i ++ ) {
		                row += "," + rscnt.getString(i);
		            }
		           
		        csvWriter.println(row) ;
		        }
		        csvWriter.close();
		 
		//Close Open MySQL Connection 
		con.close();
		return resultcnt;
	}
}
