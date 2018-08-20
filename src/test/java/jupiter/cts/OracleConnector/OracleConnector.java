package jupiter.cts.OracleConnector;
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

public class OracleConnector {

	public static Connection getOracleConnection(String Param) throws FileNotFoundException {
		Properties props = new Properties();
		InputStream inputStream;
		Connection con = null;
		inputStream = new FileInputStream(new File(Param));

		try {
			props.load(inputStream);
			Class.forName(props.getProperty("ORA_DRIVER"));
			//Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection(props.getProperty("ORA_CON"),
					props.getProperty("ORA_USER"),
					props.getProperty("ORA_PSWRD"));
		} catch (IOException | ClassNotFoundException | SQLException e) {
			System.out.println("Unable to Load Properties file");
			e.printStackTrace();
		} 

		return con;
	}
	public int executeOracleSQL(String sqlfile,String paramfile) throws Throwable {

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
		Connection con=OracleConnector.getOracleConnection(paramfile);
		Statement stm=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		;
		//Publish Query Result
		System.out.println("Running Oracle Query in "+sqlfile+" : "+"\n"+srcQuery);
		System.out.println();
		ResultSet rscnt=stm.executeQuery(srcQuery);
		 
		//Get Row Count from Result
		rscnt.last();
		int resultcnt=rscnt.getRow();
		rscnt.beforeFirst();
		System.out.println(resultcnt+" Records Returned From Query...");
		 
		/*String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		File oraoutfile=new File(sqlfile+"_"+"oraresult"+"_"+timestamp+".csv");*/
		 
		//Publish output to csv file

		File oraoutfile=new File(sqlfile+"_"+"oraresult.csv");
		
		//Iterate through columns to print column name
		PrintWriter csvWriter = new PrintWriter(oraoutfile) ;
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
		 
		//Close Open Oracle Connection 
		con.close();
		return resultcnt;
	}
	public static void main(String[] args) {}
}
