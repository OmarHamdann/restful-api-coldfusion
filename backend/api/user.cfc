

component rest="true" restpath="/user" returnformat="JSON"  returnType="any" securejson="false"
{


			//get all users
			remote function GetUser() returntype="any" returnformat="JSON" httpmethod="GET"
			{
				
				qry=queryExecute("select * from Omar");
				newQry=serializeJSON(qry)
				dataQry=deserializeJSON(newqry).DATA
				
				if(qry.recordcount){
					return serializeJSON({message:"success",result:dataQry});
					} 
					else{
					return serializeJSON({message:"failure"});
					} 
			}

			//create new user
			remote any function createUser ( string args restargsource="Form") returnformat="JSON"  securejson="false" httpmethod="POST"

				{
			
				 Data = deserializeJSON(arguments.args)

				
				queryExecute("INSERT INTO Omar VALUES ('#Data.FirstName#', '#Data.LastName#', '#Data.Password#' , '#Data.date#')" ,{},{datasource='root',result="result"});

			
				if(structKeyExists(result, "IDENTITYCOL")){
					return serializeJSON({message:"success",result:result});
					} 
					else{
					return serializeJSON({message:"failure"});
					} 
				}		
	

				// //delete user
				remote any function deleteUserbyId () returnformat="JSON"  securejson="false" httpmethod="DELETE"

				{
			
				//  userId = arguments.id
				
				 
				
				queryExecute("DELETE FROM Omar WHERE ID= '4911'" ,{},{datasource='root',result="result"});

			
				if(structKeyExists(result, "SQL")){
					return serializeJSON({message:"success",result:result});
					} 
					else{
					return serializeJSON({message:"failure"});
					} 
				}		

				

				//update user
				remote any function updateUserbyId ( string args restargsource="Form" ,string id restargsource="Form") returnformat="JSON"  securejson="false" httpmethod="PUT"

				{
			
					Data = deserializeJSON(arguments.args)
					userId = arguments.id
					
					queryExecute("UPDATE Omar set FirstName='#Data.FirstName#', LastName='#Data.LastName#', Password='#Data.Password#' , date='#Data.date#' where ID='#userId#'" ,{},{datasource='root',result="result"});
					

			
				if(structKeyExists(result, "SQL")){
					return serializeJSON({message:"success",result:result});
					} 
					else{
					return serializeJSON({message:"failure"});
					} 
				}	

				


	


				// remote any function deleteUser(numeric userid restargsource="Path") httpmethod="DELETE" restpath="{userid}"
				// 		{
				// 			var response = "";
				// 			var qry = new Query();
				// 			var userQry = "";

				// 			qry.setSQl("delete from Omar where id = :userid");
				// 			qry.addParam(name="userid", value="#arguments.userid#", cfsqltype="cf_sql_numeric");
				// 			userQry = qry.execute().getPrefix();

				// 			if(userQry.recordcount)
				// 			{
				// 				response = "User Deleted";
				// 			} else {
				// 				throw(type="Restsample.UserNotFoundError", errorCode='404', detail='User not found');
				// 			}

				// 			return response;
				// 		}  
}

