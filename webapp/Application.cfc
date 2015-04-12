component {

	this.name = hash( getCurrentTemplatePath() );
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,30,0);
	this.setClientCookies = true;

	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath( getCurrentTemplatePath() );
	COLDBOX_APP_MAPPING   = "";
	COLDBOX_CONFIG_FILE 	 = "";
	COLDBOX_APP_KEY 		 = "";
	this.javaSettings = { loadPaths = [ "lib" ], reloadOnChange = false };

	this.datasources["code_x"] = {
		  class: 'org.h2.Driver'
		, connectionString: 'jdbc:h2:webapp/db/code_x;MODE=MySQL'
	};

	this.defaultdatasource = "code_x";

	public boolean function onApplicationStart() {
		application.cbBootstrap = new coldbox.system.Bootstrap( COLDBOX_CONFIG_FILE, COLDBOX_APP_ROOT_PATH, COLDBOX_APP_KEY, COLDBOX_APP_MAPPING );
		application.cbBootstrap.loadColdbox();
		return true;
	}

	public boolean function onRequestStart( string targetPage) {

		if(structKeyExists(url, "dbreinit")) {
			var db = new query();
			db.setName("createTable");
			db.setSQL("
				DROP TABLE IF EXISTS loans;
				CREATE TABLE loans (
					`createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
					`name` VARCHAR(50)  NULL DEFAULT '',
					`address1` VARCHAR(255)  NULL DEFAULT '',
					`address2` VARCHAR(255)  NULL DEFAULT '',
					`city` VARCHAR(50)  NULL DEFAULT '',
					`state` VARCHAR(2)  NULL DEFAULT '',
					`zip` VARCHAR(10)  NULL DEFAULT '',
					`rate` int(11) DEFAULT 0,
					`amount` int(11) DEFAULT 0,
					`id` INT PRIMARY KEY
				);
				INSERT INTO loans (name, address1, city, state, zip, rate, amount)
				VALUES ('Bob', '123 Main St', 'Atlanta', 'GA', '32323', 666, 333443);
			");
			db.execute();
		}

		application.cbBootstrap.onRequestStart( arguments.targetPage );
		return true;

	}

	public void function onSessionStart() {
		application.cbBootStrap.onSessionStart();
	}

	public void function onSessionEnd( struct sessionScope, struct appScope ) {
		arguments.appScope.cbBootStrap.onSessionEnd( argumentCollection=arguments );
	}

	public boolean function onMissingTemplate( template ) {
		return application.cbBootstrap.onMissingTemplate( argumentCollection=arguments );
	}

}