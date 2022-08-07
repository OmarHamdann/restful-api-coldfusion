<cfscript>
    users=CacheGet(1, "allUsersTest")
    writeDump(users);
    abort;

</cfscript>