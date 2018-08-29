Feature: Validating all Extract, Transform and load scenearios for Bank Customer data.

  @structurevalidation
  Scenario Outline: Validating the column names in the target system.
    Given The target table "<tgt_tbl_nm>" is loaded and verified by running "<sql>"
    Then The target table count "<tgt_tbl_nm>" is "<tgt_tbl_rec_cnt>" and verified by running "<sql>"

    Examples: 
      | tgt_tbl_nm            | tgt_tbl_rec_cnt | sql                                                       |
      | test.Clms_rev_agg_rep |               2 | src/test/resources/Test_Scripts/rep_branch_data_check.sql |

  @Mappingvalidation
  Scenario Outline: Validating the mapping document to ensure all the information has been provided.
    Then No records for the column "<col_nm>" should be NULL when running "<sql>"

    Examples: 
      | col_nm    | sql                                                      |
      | TransID   | src/test/resources/Test_Scripts/TransID_null_verify.sql  |
      | BranchID  | src/test/resources/Test_Scripts/BranchID_null_verify.sql |
      | AccountID | src/test/resources/Test_Scripts/AccountID_data_check.sql |

  @validatingconstraints
  Scenario Outline: Validating the constraints and ensuring that they are applied on the expected tables.
    Given The target table "<tgt_tbl_nm>" is loaded and verified by running "<sql>"
    Then The target table count "<tgt_tbl_nm>" is "<tgt_tbl_rec_cnt>" and verified by running "<sql>"

    Examples: 
      | tgt_tbl_nm            | tgt_tbl_rec_cnt | sql                                                       |
      | test.Clms_rev_agg_rep |               2 | src/test/resources/Test_Scripts/rep_branch_data_check.sql |

  @Datacompletenessvalidation
  Scenario Outline: Validating the number of records in the source and the target systems.
    Then No records for the column "<col_nm>" should be NULL when running "<sql>"

    Examples: 
      | col_nm    | sql                                                      |
      | TransID   | src/test/resources/Test_Scripts/TransID_null_verify.sql  |
      | BranchID  | src/test/resources/Test_Scripts/BranchID_null_verify.sql |
      | AccountID | src/test/resources/Test_Scripts/AccountID_data_check.sql |

  @Datacorrectnessvalidation
  Scenario Outline: Validating misspelled or inaccurate data found in Target system.
    Given The target table "<tgt_tbl_nm>" is loaded and verified by running "<sql>"
    Then The target table count "<tgt_tbl_nm>" is "<tgt_tbl_rec_cnt>" and verified by running "<sql>"

    Examples: 
      | tgt_tbl_nm            | tgt_tbl_rec_cnt | sql                                                       |
      | test.Clms_rev_agg_rep |               2 | src/test/resources/Test_Scripts/rep_branch_data_check.sql |

  @Datatransformvalidation
  Scenario Outline: Validating the data transformation logic between source and target systems.
    Then No records for the column "<col_nm>" should be NULL when running "<sql>"

    Examples: 
      | col_nm    | sql                                                      |
      | TransID   | src/test/resources/Test_Scripts/TransID_null_verify.sql  |
      | BranchID  | src/test/resources/Test_Scripts/BranchID_null_verify.sql |
      | AccountID | src/test/resources/Test_Scripts/AccountID_data_check.sql |

  @Dataqualityvalidation
  Scenario Outline: Validating misspelled or inaccurate data found in Target system.
    Given The target table "<tgt_tbl_nm>" is loaded and verified by running "<sql>"
    Then The target table count "<tgt_tbl_nm>" is "<tgt_tbl_rec_cnt>" and verified by running "<sql>"

    Examples: 
      | tgt_tbl_nm            | tgt_tbl_rec_cnt | sql                                                       |
      | test.Clms_rev_agg_rep |               2 | src/test/resources/Test_Scripts/rep_branch_data_check.sql |

  @Duplicatevalidation
  Scenario Outline: Validating the duplicate values in the target system when data is coming from multiple columns from the source system
    Then No records for the column "<col_nm>" should be NULL when running "<sql>"

    Examples: 
      | col_nm    | sql                                                      |
      | TransID   | src/test/resources/Test_Scripts/TransID_null_verify.sql  |
      | BranchID  | src/test/resources/Test_Scripts/BranchID_null_verify.sql |
      | AccountID | src/test/resources/Test_Scripts/AccountID_data_check.sql |

  @Datevalidation
  Scenario Outline: Validating the field for various actions performed in ETL process.
    Then No records for the column "<col_nm>" should be NULL when running "<sql>"

    Examples: 
      | col_nm    | sql                                                      |
      | TransID   | src/test/resources/Test_Scripts/TransID_null_verify.sql  |
      | BranchID  | src/test/resources/Test_Scripts/BranchID_null_verify.sql |
      | AccountID | src/test/resources/Test_Scripts/AccountID_data_check.sql |
