# Basic rule about SQL

1. Query
    1.Queries are case sensitive.
2. Processing of remark
    1. one line remark :    --  Contens
    2. Block reamark   :    /*
                                Contents
                            */
3. Processing of data
    1.Data processing is basically case-sensitive
         - example :
                select
                    *
                from
                    employees
                where
                    first_name = 'Steven';
        1. MySQL's default settings treat data as case-insensitive 
           - example : 
                select
                    *
                from
                    employees
                where
                    first_name = 'sTeven';
    1. Can be operated on a column
        1. Relational operator : The relationship between conditions and conditions
            1. AND :
            2. OR :
        2. Condition operator : Large-to-large comparison of values
            1. < :
            2. > :
            3. <= :
            4. >= :
        3. Equal comparison of values : Verify that the value of the logic is true or false
            1. = : true
            2. !=, <> : false
    2. Automatically transforms to numbers when parameters are substituted in character form if the data type in the column is numeric
*/