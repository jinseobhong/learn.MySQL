# Basic rule about SQL

1. Query
    1.Queries are case sensitive.
2. Processing of remark
    1. one line remark :    --  Contens
    2. Block reamark   :    /*
                                Contents
                            */
3. Processing of data
    1. Data processing is basically case-sensitive
           <pre>
                <code>
                   select * from employees where first_name = 'Steven';
                </code>
            </pre>
   2. MySQL's default settings treat data as case-insensitive
          <pre>
              <code>
                 select * from employees where first_name = 'sTeven';
             </code>
         </pre>
    3. Can be operated on a column
        1. Relational operator : The relationship between conditions and conditions
            1. AND : Satisfying all conditions
            2. OR : If any one of the conditions is satisfied
        2. Condition operator : Large-to-large comparison of values
            1. < : Satisfied when A < B
            2. \> : Satisfied when A > B
            3. <= : Satisfied when A <= B
            4. \>= : Satisfied when A >= B
        3. Equal comparison of values : Verify that the value of the logic is true or false
            1. = : true
            2. !=, <> : false
    2. Automatically transforms to numbers when parameters are substituted in character form if the data type in the column is numeric
