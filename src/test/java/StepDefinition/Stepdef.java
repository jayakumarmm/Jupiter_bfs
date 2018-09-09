package StepDefinition;

import java.util.Properties;

import org.junit.Assert;
import cucumber.api.java.en.*;
import jupiter.cts.OracleConnector.OracleConnector;
import jupiter.cts.MySQLConector.MySqlConnector;

public class Stepdef {
	
	String parampath=System.getProperty("paramdir");
	
	//String parampath = "C:/Users/431906/Documents/Jupiter_claims-master/jupter_demo/jupiter/jupiterclone_1_1/";
	@Then("^The target table \"([^\"]*)\" is loaded and verified by running \"([^\"]*)\"$")
	public void the_target_table_is_loaded_and_verified_by_running(String arg1, String arg2) throws Throwable  {
		System.out.println("started");
		System.out.println(System.getProperty("paramdir"));
		System.out.println("end");
		String sql=parampath+arg2;
	    String param=parampath+"JupiterParam";
		MySqlConnector con=new MySqlConnector();
	   int cnt=con.executeMySQL(sql,param);
	   if (cnt != 0){
		   System.out.println("Target Table "+arg1+" has been loaded");
		   System.out.println("TEST STEP SUCCESS");
	   }else{
		   System.out.println("TEST STEP FAILURE");
		   Assert.fail("Target Table "+arg1+" has not been loaded yet");
	   }
	}

	@Given("^The target table \"([^\"]*)\" column names are verified by running \"([^\"]*)\"$")
	public void the_target_table_count_is_and_verified_by_running(String arg1, String arg2) throws Throwable {
		 String sql=parampath+arg2;
		    String param=parampath+"JupiterParam";
		MySqlConnector con=new MySqlConnector();
		   int cnt=con.executeMySQL(sql,param);
		   if (cnt == 1){
			   //System.out.println("Target Table "+arg1+" has been loaded with "+arg2+" records");
			   System.out.println("TEST STEP SUCCESS");
		   }else{
			   System.out.println("TEST STEP FAILURE");
			   Assert.fail("Target Table "+arg1+" column are not created correctly");
		   }
	}
	
	
	@Then("^The target table \"([^\"]*)\" mapping logics are verified by running \"([^\"]*)\"$")
	public void the_target_table_mapping_is_verified_by_running(String arg1, String arg2) throws Throwable {
		 String sql=parampath+arg2;
		    String param=parampath+"JupiterParam";
		MySqlConnector con=new MySqlConnector();
		   int cnt=con.executeMySQL(sql,param);
		   if (cnt == 1){
			   //System.out.println("Target Table "+arg1+" has been loaded with "+arg2+" records");
			   System.out.println("TEST STEP SUCCESS");
		   }else{
			   System.out.println("TEST STEP FAILURE");
			   Assert.fail("Target Table "+arg1+" column are not created correctly");
		   }
	}
	
	@Then("^The target table \"([^\"]*)\" constraints are verified by running \"([^\"]*)\"$")
	public void the_target_table_constaints_is_verified_by_running(String arg1, String arg2) throws Throwable {
		 String sql=parampath+arg2;
		    String param=parampath+"JupiterParam";
		MySqlConnector con=new MySqlConnector();
		   int cnt=con.executeMySQL(sql,param);
		   if (cnt == 1){
			   //System.out.println("Target Table "+arg1+" has been loaded with "+arg2+" records");
			   System.out.println("TEST STEP SUCCESS");
		   }else{
			   System.out.println("TEST STEP FAILURE");
			   Assert.fail("Target Table "+arg1+" column are not created correctly");
		   }
	}

	@Then("^No records for the column \"([^\"]*)\" should be NULL when running \"([^\"]*)\"$")
	public void no_records_for_the_column_should_be_NULL_when_running(String arg1, String arg2) throws Throwable {
		String sql=parampath+arg2;
	    String param=parampath+"JupiterParam";
		MySqlConnector con=new MySqlConnector();
	   int cnt=con.executeMySQL(sql,param);
		   if (cnt == 0){
			   System.out.println("Column "+arg1+" has no NULL values");
			   System.out.println("TEST STEP SUCCESS");
		   }else{
			   System.out.println("TEST STEP FAILURE");
			   Assert.fail("Column "+arg1+" has NULL Values"); 
			   
		   }
	}
	
	
	@Then("^The target table \"([^\"]*)\" duplicate records are verified by running \"([^\"]*)\"$")
	public void the_target_table_duplicates_is_verified_by_running(String arg1, String arg2) throws Throwable {
		 String sql=parampath+arg2;
		    String param=parampath+"JupiterParam";
		MySqlConnector con=new MySqlConnector();
		   int cnt=con.executeMySQL(sql,param);
		   if (cnt != 1){
			   //System.out.println("Target Table "+arg1+" has been loaded with "+arg2+" records");
			   System.out.println("TEST STEP SUCCESS");
		   }else{
			   System.out.println("TEST STEP FAILURE");
			   Assert.fail("Target Table "+arg1+" column are not created correctly");
		   }
	}
	
	@Then("^The target table \"([^\"]*)\" data completeness is verified by running \"([^\"]*)\"$")
	public void the_target_table_complete_is_verified_by_running(String arg1, String arg2) throws Throwable {
		 String sql=parampath+arg2;
		    String param=parampath+"JupiterParam";
		MySqlConnector con=new MySqlConnector();
		   int cnt=con.executeMySQL(sql,param);
		   if (cnt == 1){
			   //System.out.println("Target Table "+arg1+" has been loaded with "+arg2+" records");
			   System.out.println("TEST STEP SUCCESS");
		   }else{
			   System.out.println("TEST STEP FAILURE");
			   Assert.fail("Target Table "+arg1+" column are not created correctly");
		   }
	}
	
	@Then("^Target table date column \"([^\"]*)\" is validated by running \"([^\"]*)\"$")
	public void the_target_table_date_is_verified_by_running(String arg1, String arg2) throws Throwable {
		 String sql=parampath+arg2;
		    String param=parampath+"JupiterParam";
		MySqlConnector con=new MySqlConnector();
		   int cnt=con.executeMySQL(sql,param);
		   if (cnt != 1){
			   //System.out.println("Target Table "+arg1+" has been loaded with "+arg2+" records");
			   System.out.println("TEST STEP SUCCESS");
		   }else{
			   System.out.println("TEST STEP FAILURE");
			   Assert.fail("Target Table "+arg1+" column are not created correctly");
		   }
	}
	
	
}
