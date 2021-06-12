<cfinclude template = "ini.cfm">

<head>
    <meta charset="utf-8">
    <title>cfml study</title>
    <link rel="shortcut icon" href="favicon.ico"/>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="main.css">
</head>

<body>

<div class="container">
    <section id="AuthSection" class="AuthSection">
	    <p>Your <span class="ColoredText_Sub">LOGIN/PASSWORD</span></p>
        <div class="AuthGroup">
			
            <form <cfoutput>action=#AuthPage#</cfoutput> method="post" id="AuthForm">
                <div class="Auth_Sub">
					<input id="LoginInput" type="text" name="AuthLogin" placeholder="login" required>
				</div>
				<div class="Auth_Sub">
					<input id="PasswordInput" type="text" name="AuthPassword" placeholder="password" required>
				</div>
				<a href="#AuthSection" type="submit" id="AuthBT" class="AuthBT">SIGN IN</a>
            </form>
        </div>
    </section>
</div>

<script src="main.js"></script>
</body>
</html>
