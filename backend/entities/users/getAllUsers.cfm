<cfscript>
    qry=queryExecute("select * from omar");
    CachePut(1, qry, createTimeSpan( 0, 0, 0, 10 ) , createTimeSpan( 0, 0, 0, 10 ), "allUsersTest")
    

</cfscript>