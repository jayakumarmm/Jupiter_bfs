Feature: Validating all Extract, Transform and load scenearios for Bank Customer data.

  @structurevalidation
  Scenario Outline: Validating the column names in the target system.
    Given The target table "<tgt_tbl_nm>" column names are verified by running "<sql_2>"
    Then The target table "<tgt_tbl_nm>" is loaded and verified by running "<sql_1>"

    Examples: 
      | tgt_tbl_nm        | sql_1                                                     | sql_2                                                    |
      | banking.customers | src/test/resources/Test_Scripts/target_tbl_load_check.sql | src/test/resources/Test_Scripts/target_cols_nm_check.sql |

  @Mappingvalidation
  Scenario Outline: Validating the mapping document to ensure all the information has been provided.
    Then The target table "<tgt_tbl_nm>" mapping logics are verified by running "<sql_3>"

    Examples: 
      | tgt_tbl_nm        | sql_3                                                        |
      | banking.customers | src/test/resources/Test_Scripts/target_tbl_mapping_check.sql |

  @validatingconstraints
  Scenario Outline: Validating the constraints and ensuring that they are applied on the expected tables.
    Then The target table "<tgt_tbl_nm>" constraints are verified by running "<sql_4>"

    Examples: 
      | tgt_tbl_nm        | sql_4                                                            |
      | banking.customers | src/test/resources/Test_Scripts/target_tbl_constraints_check.sql |

  @Dataqualityvalidation
  Scenario Outline: Validating the non null columns in the target table
    Then No records for the column "<col_nm>" should be NULL when running "<sql_5>"

    Examples: 
      | col_nm        | sql_5                                                        |
      | customer_name | src/test/resources/Test_Scripts/CustomerName_null_verify.sql |
      | BranchID      | src/test/resources/Test_Scripts/BranchID_null_verify.sql     |

  @Datevalidation
  Scenario Outline: Validating the date fields for various actions performed in ETL process.
    Then Target table date column "<col_nm>" is validated by running "<sql_8>"

    Examples: 
      | col_nm        | sql_8                                                     |
      | customer_orig | src/test/resources/Test_Scripts/target_tbl_date_check.sql |

  @Duplicatevalidation
  Scenario Outline: Validating the duplicate values in the target system when data is coming from multiple columns from the source system
    Then The target table "<tgt_tbl_nm>" duplicate records are verified by running "<sql_6>"

    Examples: 
      | tgt_tbl_nm        | sql_6                                                          |
      | banking.customers | src/test/resources/Test_Scripts/target_tbl_duplicate_check.sql |

  @DataCompletenessvalidation
  Scenario Outline: Validating the total records between source and target system
    Then The target table "<tgt_tbl_nm>" data completeness is verified by running "<sql_7>"

    Examples: 
      | tgt_tbl_nm        | sql_7                                                         |
      | banking.customers | src/test/resources/Test_Scripts/target_tbl_complete_check.sql |
