<cfinclude template = "ini.cfm">

<cfset UserLogin = #form.AuthLogin#>
<cfset UserPassword = #form.AuthPassword#>

<cfif ((#UserLogin# != "") && (#UserPassword# != ""))>

	<cfquery name = "myQuery" datasource = "dampc2021">
		SELECT login FROM authorization WHERE login = <cfqueryparam value="#UserLogin#" cfsqltype="cf_sql_varchar">
	</cfquery>
	
	<cfoutput query = "myQuery">
		<cfloop list = "#myQuery.ColumnList#" index = "thisColumn">
			<cfset dbLogin = #myQuery[thisColumn][myQuery.CurrentRow]#>
		</cfloop>
	</cfoutput>

	<cfif #dbLogin# != ""> 

		<cfquery name = "myQuery" datasource = "dampc2021">
			SELECT password FROM authorization WHERE login = <cfqueryparam value="#UserLogin#" cfsqltype="cf_sql_varchar">
		</cfquery>
		
		<cfoutput query = "myQuery">
			<cfloop list = "#myQuery.ColumnList#" index = "thisColumn">
				<cfset dbPassword = #myQuery[thisColumn][myQuery.CurrentRow]#>
			</cfloop>
		</cfoutput>
	
		<cfif #dbPassword# is #UserPassword#>
			<cflocation url = #LoggedInPage#>
		<cfelse>
			<cfset errorMessage = "Password is incorrect">
			<cflocation url = "#ErrorPage#?error=#errorMessage#"> 
		</cfif>
	
	<cfelse>
		<cfset errorMessage = "Login is incorrect">
		<cflocation url = "#ErrorPage#?error=#errorMessage#"> 
	
	</cfif>


<cfelse>
	<cfset errorMessage = "Empty input value">
	<cflocation url = "error.cfm?error=#errorMessage#"> 
	
</cfif>
