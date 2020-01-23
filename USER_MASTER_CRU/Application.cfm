<cfsetting enableCFoutputOnly = "Yes">
<cfprocessingdirective pageencoding="UTF-8">
<cfcontent type="text/html; charset=UTF-8"> 

<!--- キャッシュ防止用ヘッダー、ファイルダウンロードやグラフ表示するところには設定しない --->
<cfif NOT( isDefined("header") AND header is "no_header" )>
	<cfheader name="Expires" value="Thu, 01 Dec 1994 16:00:00 GMT">
	<cfheader name="Pragma" value="no-cache">
	<cfheader name="Cache-Control" value= "no-store,no-cache,must-revalidate">
</cfif>

<!--- ******************* !! CAUTION !! ******************* --->
<!--- 同一サーバ上で複数のeLMを運用する場合には             --->
<!--- cfapplicationタグのname属性がサーバ内で一意になるよう --->
<!--- 変更すること                                          --->

<cfapplication
	name = "eLearningManager"
	sessionManagement = "Yes"
	sessionTimeout = #CreateTimeSpan(2, 0, 0, 0)#>

<!--- ################### ユーザー設定項目 ここから ################### --->

<!---アプリケーションタイトル設定--->
<cfset wholeTitle = "学習管理システム">

<!--- サーバー設定 --->

<!--- 
eLearning Managerの設置パス = SERVER_PATH/UPPER_FOLDER/eLM_FOLDER
 --->

<!--- SERVER_PATH --->
<cfset SERVER_PATH = "/var/www/html"> <!--- サーバールートに対応するディレクトリ --->

<!--- eLM_FOLDER --->
<cfset eLM_FOLDER = "eLM">

<!--- データベース設定 --->
<cfset DB_TYPE = "mysql">  <!--- (mssql|mysql) --->
<cfset application.DSN="eLM"> <!--- ColdFusion Administratorで設定したデータソース名 --->
<cfset application.DUN="eLM"> <!--- データベースユーザ名 --->
<cfset application.DUP="Poiuyt))0"> <!--- データベースパスワード --->
<cfset application.HOST="localhost"> <!--- データベースホスト: localhost 又は 外部サーバーIP と指定 --->

<!--- データベースバックアップ設定 --->
<cfset Application.targetDBNAME = "eLM">                         <!--- バックアップするデータベース名(通常はapplication.DSNと同じ) --->
<cfset Application.mysqldump_location = "/usr/bin/mysqldump"> <!--- [MySQL利用時のみ] mysqldumpのインストール場所 --->

<!--- メール設定 --->
<cfset application.MAIL_FROM="">   <!--- eLMから送信するメールのFROM --->
<cfset application.SMTP_SERVER=""> <!--- SMTPサーバ --->
<cfset application.POP_SERVER="">  <!--- [mini/オフライン版からの成績取込利用時のみ] POPサーバ --->
<cfset MAIL_USERID = "">           <!--- [mini/オフライン版からの成績取込利用時のみ] POPユーザID --->
<cfset MAIL_PASS = "">             <!--- [mini/オフライン版からの成績取込利用時のみ] POPパスワード --->

<!--- FlashPlayer設定 --->
<cfset Application.FlashVersion = 7> <!--- FlashPlayerの必要バージョン --->

<!--- rtmp設定 --->
<cfset Application.RTMP = "rtmp://fms.kiban.co.jp">

<!--- エラーハンドラ設定 --->
<!---
<cfset Application.ERROR_HANDLER="error_handler.cfm">
<cfset Application.ERROR_HANDLER_MAILTO="error@kiban.co.jp">
--->

<cfset application.eLM_TYPE = "ASP"> <!--- ASP版の場合は"ASP"を設定 --->

<!--- ################### ユーザー設定項目 ここまで ################### --->

<!--- SERVER_URLを自動生成 --->
<cfif IsDefined("CGI.HTTPS") and CGI.HTTPS eq "on">
	<cfset protocol = "https">
	<cfset is_secure_cookie	= "yes">
<cfelse>
	<cfset protocol = "http">
	<cfset is_secure_cookie	= "no">
</cfif>
<cfif CGI.SERVER_PORT eq 80 and protocol eq "http">
	<cfset port = "">
<cfelseif CGI.SERVER_PORT eq 443 and protocol eq "https">
	<cfset port = "">
<cfelse>
	<cfset port = ":#CGI.SERVER_PORT#">
</cfif>
<!--- pound+SSL利用時もしくはproxyなどでhttpsアクセスなのにサーバにはhttpでアクセスされCGIなどで情報が取得できない場合はtrueにする --->
<cfset use_pound_ssl = false>
<cfif use_pound_ssl>
	<cfset protocol = "https">
	<cfset is_secure_cookie = "yes">
</cfif>
<!--- STRAZ LB配下時用処理 --->
<cfif StructKeyExists(GetHttpRequestData().headers, "X-Forwarded-For") >
	<cfset REQUEST.remoteAddress = Trim(ListFirst(GetHttpRequestData().headers["X-Forwarded-For"]))>
	<cfif StructKeyExists(GetHttpRequestData().headers, "X-Forwarded-Proto") >
	<cfelse>
		<cfset protocol = "https">
		<cfset is_secure_cookie = "yes">
		<cfset port = "">
	</cfif>
<cfelseif StructKeyExists(GetHttpRequestData().headers, "X-Proxy-IP") >
	<cfset REQUEST.remoteAddress = Trim(ListFirst(GetHttpRequestData().headers["X-Proxy-IP"]))>
	<cfset protocol = "https">
	<cfset is_secure_cookie = "yes">
	<cfset port = "">
<cfelse>
	<cfset REQUEST.remoteAddress = CGI.REMOTE_ADDR >
</cfif>

<cfset SERVER_URL = "#protocol#://#CGI.SERVER_NAME##port#/">  <!--- サーバールートのURL --->

<!--- UPPER_FOLDERを自動生成 --->
<cfset TEMP_SCRIPT_NAME = #CGI.SCRIPT_NAME#>
<cfset TEMP_SCRIPT_NAME_ARR = ListToArray(#TEMP_SCRIPT_NAME#,"/")>
<cfset ARR_LEN = ArrayLen(TEMP_SCRIPT_NAME_ARR)>
<cfset CountVar = "1">
<cfset UPPER_FOLDER = "">
<cfloop index = "CountVar" from = "1" to = "#ARR_LEN#">
	<cfif TEMP_SCRIPT_NAME_ARR[CountVar] is "#eLM_FOLDER#" >
		<cfif CountVar is "1">
			<cfset UPPER_FOLDER = "">
		<cfelse>
			<cfloop index = "CountVar_IN" from = "#CountVar#" to = "2" step = "-1">
				<cfset UPPER_FOLDER = "#TEMP_SCRIPT_NAME_ARR[CountVar_IN-1]#/#UPPER_FOLDER#">
			</cfloop>
		
			<cfset UPPER_FOLDER = RemoveChars(UPPER_FOLDER, Len(UPPER_FOLDER),1)>
		</cfif>
	</cfif>
</cfloop>

<!--- コース格納先 --->
<cfset COURSE_FOLDER = "course">

<cfset DSN = application.DSN>

<cfset eLM_URL = SERVER_URL & "/" & UPPER_FOLDER & "/" & eLM_FOLDER>
<cfset eLM_PATH = SERVER_PATH & "/" & UPPER_FOLDER & "/" & eLM_FOLDER>

<cfset application.COURSE_URL = eLM_URL & "/" & COURSE_FOLDER>
<cfset application.COURSE_PATH = eLM_PATH & "/" & COURSE_FOLDER>

<cfset DEFAULT_GATEWAY= SERVER_URL & "flashservices/gateway">
<cfset DEFAULT_SCO_URL= eLM_URL & "/function">

<cfif UPPER_FOLDER eq ''>
	<cfset SERVICE_ADDRESS		= eLM_FOLDER & ".cfc">
	<cfset SERVICE_ADDRESS_ROOT	= eLM_FOLDER>
<cfelse>
	<cfset SERVICE_ADDRESS		= UPPER_FOLDER & "." & eLM_FOLDER & ".cfc">
	<cfset SERVICE_ADDRESS_ROOT	= UPPER_FOLDER & "." & eLM_FOLDER>
</cfif>
<cfset application.SERVICE_ADDRESS		= SERVICE_ADDRESS>
<cfset application.SERVICE_ADDRESS_ROOT	= SERVICE_ADDRESS_ROOT>
<!---レポート用ファイル生成先--->
<cfset REPORT_DIRECTORY = eLM_PATH & "/csv_data/">
<!---添付ファイル保存先指定--->
<cfset ATTACH_DIRECTORY = eLM_PATH & "/attach/">
<!---ログファイル保存先指定--->
<cfset LOG_DIRECTORY = eLM_PATH & "/logs/">
<!--- 外部ファイル名設定 --->
<cfset Application.SqlStringComponent = "eLM_sqlstrings_" & DB_TYPE>

<cfinclude template="lms_dao.cfm">
<cfinclude template="function.cfm">

<cfset eLM_URL = del_extra_slash(eLM_URL)>
<cfset application.eLM_URL = del_extra_slash(eLM_URL)>
<cfset eLM_PATH = del_extra_slash(eLM_PATH)>
<cfset application.eLM_PATH = del_extra_slash(eLM_PATH)>

<cfif isDefined("Application.ERROR_HANDLER")>
	<cferror type="exception" template="/#UPPER_FOLDER#/#eLM_FOLDER#/#Application.ERROR_HANDLER#">
</cfif>

<!--- iphone/ipadモード設定 --->
<cfset Application.isIphone = "false">
<cfif findNoCase("iphone", cgi.http_user_agent) or findNoCase("ipad", cgi.http_user_agent)>
	<cfset Application.isIphone = "true">
</cfif>

<cfsetting enableCFoutputOnly = "No">
