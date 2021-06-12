<cfinclude template = "ini.cfm">

<cfif isDefined("form.AuthLogin") && isDefined("form.AuthPassword")>
	<cfset UserLogin = #form.AuthLogin#>
	<cfset UserPassword = #form.AuthPassword#>
<cfelse>
	<cfset errorMessage = "Input error. Try agaim">
	<cflocation url = "#ErrorPage#?error=#errorMessage#"> 
</cfif>

<cfif ((#UserLogin# NEQ "") && (#UserPassword# NEQ ""))>

	<cfquery name = "myQuery" datasource = "dampc2021">
		SELECT login 
		FROM authorization 
		WHERE login = <cfqueryparam value="#UserLogin#" cfsqltype="cf_sql_varchar">
	</cfquery>
	
	
	<cfloop list = "#myQuery.ColumnList#" index = "thisColumn">
		<cfset dbLogin = #myQuery[thisColumn][myQuery.CurrentRow]#>
	</cfloop>
	

	<cfif #dbLogin# NEQ ""> 

		<cfquery name = "myQuery" datasource = "dampc2021">
			SELECT password 
			FROM authorization 
			WHERE login = <cfqueryparam value="#UserLogin#" cfsqltype="cf_sql_varchar">
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
