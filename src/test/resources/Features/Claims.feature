Feature: Claims Update workflows which picks data from two sources and updates the Claim adjudication table
In order to get Claim adjudication updates I need data from batch and realtime sources to be integrated into my DW.
@prevalidation
  Scenario Outline: Verify the Target table load completion
    Given The target table "<tgt_tbl_nm>" is loaded and verified by running "<sql>"
     Then The target table count "<tgt_tbl_nm>" is "<tgt_tbl_rec_cnt>" and verified by running "<sql>"
  
    Examples: 
      | tgt_tbl_nm            | tgt_tbl_rec_cnt | sql                                                          | 
      | test.Clms_rev_agg_rep | 2               | src/test/resources/Test_Scripts/rep_branch_data_check.sql    | 
  @Mappingvalidation
  Scenario Outline: Verify the mapping to update Claims table
     Then No records for the column "<col_nm>" should be NULL when running "<sql>"
  
    Examples: 
      | col_nm          | sql                                                              | 
      | TransID         | src/test/resources/Test_Scripts/TransID_null_verify.sql		   | 
      | BranchID        | src/test/resources/Test_Scripts/BranchID_null_verify.sql         | 
      | AccountID       | src/test/resources/Test_Scripts/AccountID_data_check.sql         | 
  
