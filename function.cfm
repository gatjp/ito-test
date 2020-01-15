<cfprocessingdirective pageencoding="UTF-8">
<!---ColdFusion のタイムアウト設定の上書--->
<cfobject component="#Application.SERVICE_ADDRESS#.table_lms_setting" name="lsObj">
<cfsetting requestTimeout="#lsObj.get_value('timeout')#">

<!--- 変数をApplicationスコープに変更 --->
<cfset Application.SERVER_URL = SERVER_URL>
<cfset Application.SERVER_PATH = SERVER_PATH>
<cfset Application.COURSE_FOLDER = COURSE_FOLDER>
<cfset Application.UPPER_FOLDER = UPPER_FOLDER>
<cfset Application.eLM_FOLDER = eLM_FOLDER>

<!--- スコープに関係ない関数集をインクルード  --->
<cfinclude template="function_safe.cfm">

<!--- relative_eLM_URL 作成 --->
<cftry>
	<cfset Application.SERVER_URL = SERVER_URL>
	<cfset _script_name = CGI.SCRIPT_NAME>
	<cfset _folder_name = "/" & UPPER_FOLDER & "/" & eLM_FOLDER & "/">
	<cfset _script_name = rereplacenocase(_script_name , "/+" , "/","all")>
	<cfset _folder_name = rereplacenocase(_folder_name , "/+" , "/","all")>
	<cfset _path_from_elm_root = rereplacenocase(_script_name , "^.*?#_folder_name#" , "" ,"all")>
	<cfset _slash_count = len(rereplacenocase(_path_from_elm_root,"[^/]","","all"))>
	<cfset _result = "./">
	<cfloop index="i" from="1" to="#_slash_count#">
		<cfset _result = _result & "../">
	</cfloop>
	<cfset relative_eLM_URL = _result>
	<cfcatch></cfcatch>
</cftry>

<cfscript>
// from qts
//Application.root = del_extra_slash("/" & UPPER_FOLDER & "/eLM/admin/tool/qts");		//アプリケーションルート(管理側)
//Application.userRoot = del_extra_slash("/" & UPPER_FOLDER & "/eLM/user/tool/qts");		//アプリケーションルート(ユーザ側)

Application.root = del_extra_slash("/" & UPPER_FOLDER & "/" & eLM_FOLDER & "/admin/tool/qts");		//アプリケーションルート(管理側)
Application.userRoot = del_extra_slash("/" & UPPER_FOLDER & "/" & eLM_FOLDER & "/user/tool/qts");		//アプリケーションルート(ユーザ側)

Application.css  = Application.root & "/css";			//スタイルシート
Application.img  = Application.root & "/images";		//画像
Application.lib  = Application.root & "/library";		//テンプレート
Application.tag  = Application.root & "/tag";			//カスタムタグ
Application.js   = Application.root & "/js";			//JavaScript

</cfscript>

<!---

関数名：fn_datetime
引数：タイムスタンプ型？
返り値 YYYY/MM/DD hh:mm:ss 形式の文字列 ( mysql,sql-serverに入る )

--->
<cffunction name="fn_datetime" output="No">
	<cfargument name="t" required="Yes">
	<cfreturn DateFormat( t , "yyyy/mm/dd") & ' ' & TimeFormat( t , "HH:mm:ss")>
</cffunction>

<cffunction name="fn_esc_comma" output="No" returntype="string">
	<cfargument name="str" required="yes" type="string">
	<cfreturn replace(str , ',' , '，' , 'all')>
</cffunction>

<cffunction name="fn_sort" output="Yes" returntype="array">
	<cfargument name="ary" required="yes" type="array">
	<cfset var ary_length=ArrayLen(ary)>
	<cfset var i = 0>
	<cfset var j = 0>
	<cfloop index="i" from="1" to="#ary_length-1#">
		<cfloop index="j" from="#i+1#" to="#ary_length#">
			<cfif fn_cmp(ary[i],ary[j]) eq -1>
				<cfset tmp = ary[i]>
				<cfset ary[i] = ary[j]>
				<cfset ary[j] = tmp>
			</cfif>
		</cfloop>
	</cfloop>
	<cfreturn ary>
</cffunction>

<cffunction name="fn_cmp" output="Yes" returntype="any">
	<cfargument name="a" required="yes" type="any">
	<cfargument name="b" required="yes" type="any">
	<cfset var tmp_a = javacast('int',"0"&rereplace(a,"[^0-9]","","all"))>
	<cfset var tmp_b = javacast('int',"0"&rereplace(b,"[^0-9]","","all"))>
	<cfif tmp_a lt tmp_b>
		<cfreturn  1>
	</cfif>
	<cfif tmp_a gt tmp_b>
		<cfreturn -1>
	</cfif>
	<cfreturn 0>
</cffunction>

<cffunction name="fn_sec2time" output="No" returntype="string">
	<cfargument name="sec" required="yes" type="any">

	<cfset var temp = ''>
	<cfset var s = 0>
	<cfset var m = 0>
	<cfset var h = 0>

	<cfif sec is "">
		<cfset sec = 0>
	</cfif>

	<cfset s = sec mod 60>
	<cfset temp = sec \ 60>
	<cfset m = temp mod 60>
	<cfset temp = temp \ 60>
	<cfset h = temp>

	<cfif s lt 10>
		<cfset s = '0' & s>
	</cfif>

	<cfif m lt 10>
		<cfset m = '0' & m>
	</cfif>

	<cfif h lt 10>
		<cfset h = '0' & h>
	</cfif>

	<cfreturn h & ':' & m & ':' & s>

</cffunction>
<cffunction name="fn_time2sec" output="Yes" returntype="numeric">
	<cfargument name="time" required="yes" type="string">

	<cfset var arr_time = listToArray(time, ":")>
	<cfset var sec = 0>
	<cfset var loopIndex = 0>
	<cfset var coefficient = 1>

	<cfloop index="loopIndex" from="#ArrayLen(arr_time)#" to="1" step="-1">
		<cfset sec = sec + arr_time[loopIndex] * coefficient>
		<cfset coefficient = coefficient * 60>
	</cfloop>

	<cfreturn sec>
</cffunction>

<!---////////////////////////////////////////
関数名	fn_get_period_date_string
引数1	受講期間タイプ
引数2	開始日
引数3	終了日
引数4	日数
戻り値	文字列
説明	受講期間タイプに応じた受講期間文字列を返す
/////////////////////////////////////////--->
<cffunction name="fn_get_period_date_string" access="public" output="No">
	<cfargument name="period_type" type="numeric" required="yes">
	<cfargument name="start_date" type="any" required="yes">
	<cfargument name="end_date" type="any" required="yes">
	<cfargument name="days" type="numeric" required="yes">
	<cfargument name="is_timeset" type="boolean" default="false">

	<cfset var period_date_string = ''>
	<cfset var start_date_time	= ''>
	<cfset var end_date_time	= ''>

	<cfswitch expression="#period_type#">
	<cfcase value="0">
		<cfset period_date_string = Session.termObj.get_term('eLM_fn_get_period_indefinite')>
	</cfcase>
	<cfcase value="1">
		<cfif is_timeset>
			<cfset start_date_time	= DateFormat(start_date, 'YYYY/MM/dd') & ' ' & TimeFormat(start_date, 'HH:mm:ss')>
			<cfset end_date_time	= DateFormat(end_date,   'YYYY/MM/dd') & ' ' & TimeFormat(end_date,   'HH:mm:ss')>
		<cfelse>
			<cfset start_date_time	= DateFormat(start_date, 'YYYY/MM/dd')>
			<cfset end_date_time	= DateFormat(end_date,   'YYYY/MM/dd')>
		</cfif>

		<cfset period_date_string = Session.termObj.get_term('eLM_fn_get_period_type1_1') & start_date_time
                                  & Session.termObj.get_term('eLM_fn_get_period_type1_2')
                                  & end_date_time
                                  & "　（" & DateDiff("d", start_date, end_date)+1 & Session.termObj.get_term('eLM_fn_get_period_type1_3') & "）">
	</cfcase>
	<cfcase value="2">
		<cfif is_timeset>
			<cfset start_date_time	= DateFormat(start_date, 'YYYY/MM/dd') & ' ' & TimeFormat(start_date, 'HH:mm:ss')>
		<cfelse>
			<cfset start_date_time	= DateFormat(start_date, 'YYYY/MM/dd')>
		</cfif>

		<cfset period_date_string = Session.termObj.get_term('eLM_fn_get_period_type2_1') & start_date_time
                                  & Session.termObj.get_term('eLM_fn_get_period_type2_2') & days & Session.termObj.get_term('eLM_fn_get_period_type2_3') & "　（"
                                  & DateFormat(DateAdd("d", days-1, start_date), "YYYY/MM/dd") &Session.termObj.get_term('eLM_fn_get_period_type2_4')  & "）">
	</cfcase>
	<cfcase value="3">
		<cfset period_date_string = Session.termObj.get_term('eLM_fn_get_period_type3_1') & days & Session.termObj.get_term('eLM_fn_get_period_type3_2')>
	</cfcase>
	<cfcase value="4">
		<cfset period_date_string = Session.termObj.get_term('eLM_fn_get_period_type4_1') & days & Session.termObj.get_term('eLM_fn_get_period_type4_2')>
	</cfcase>
	<cfdefaultcase>
		<cfset period_date_string = Session.termObj.get_term('eLM_fn_get_period_indefinite')>
	</cfdefaultcase>
	</cfswitch>

	<cfreturn period_date_string>

</cffunction>

<!---////////////////////////////////////////
関数名	fn_content_disposition
引数1	ファイル名	file_name	string	必須
引数2	拡張子		exp			string	必須
戻り値	なし
説明	IEとFireFoxのDL形式の際を埋めるためのラッパー関数
/////////////////////////////////////////--->
<cffunction name="fn_content_disposition" output="no" returntype="void">
	<cfargument name="file_name" type="string" required="yes">
	<cfargument name="exp" type="string" required="yes">

	<cfset var USER_AGENT = CGI.HTTP_USER_AGENT>

	<cfif Find( 'MSIE' , USER_AGENT) is not 0>
		<cfheader name="Content-Disposition" value="attachment;filename=#file_name#.#exp#" charset="Windows-31J">
		<cfheader name="Pragma" value="">
		<cfheader name="Cache-Control" value= "">
<!---			<cfheader name="Content-Disposition" value="attachment;filename=#URLEncodedFormat(file_name)#.#exp#" charset="UTF-8"> --->
	<cfelseif Find('Firefox' , USER_AGENT) is not 0>
		<cfheader name="Content-Disposition" value="attachment;filename=#chr(34)#=?UTF-8?B?#ToBase64(file_name & '.' & exp)#?=#chr(34)#" charset="UTF-8">
		<cfheader name="Pragma" value="">
		<cfheader name="Cache-Control" value= "">
	</cfif>

</cffunction>

<!---////////////////////////////////////////
関数名	fn_output_class_name
引数1	SCO種類		sco_kind	numeric	必須
引数2	クラスID	class_id	numeric	必須
戻り値	教材種別
説明	SCO種別は、1:SCO　2:アンケート　3:宿題
		クラスIDは、SCO種別が1のときに有効になり、
		1:学習教材　2:テストになります。
/////////////////////////////////////////--->
<cffunction name="fn_output_class_name" output="No" returntype="string">
	<cfargument name="sco_kind" type="numeric" required="yes">
	<cfargument name="class_id" type="numeric" required="yes">

	<cfset var ret_name = ''>

	<cfswitch expression="#arguments.sco_kind#">
		<cfcase value="1">
			<cfif arguments.class_id is 1>
				<cfset ret_name = Session.termObj.get_term('eLM_fn_output_class_name_type1')>
			<cfelse>
				<cfset ret_name = Session.termObj.get_term('eLM_fn_output_class_name_type2')>
			</cfif>
		</cfcase>

		<cfcase value="2">
			<cfset ret_name = Session.termObj.get_term('eLM_fn_output_class_name_type3')>
		</cfcase>

		<cfcase value="3">
			<cfset ret_name = Session.termObj.get_term('eLM_fn_output_class_name_type4')>
		</cfcase>
	</cfswitch>

	<cfreturn ret_name>

</cffunction>

<!---////////////////////////////////////////
関数名	fn_output_result_mark
引数1	回答結果文字列	arg_str	string	必須
戻り値	画面表示用記号
説明	回答結果文字列は、cmi.interactions.n.resultの
		5つのボキャブラリセット
			correct（正しい）
			wrong（間違い）
			unanticipated（予期しない回答）
			neutral（どっちつかず）
			x.x（CMIDecimal）
/////////////////////////////////////////--->
<cffunction name="fn_output_result_mark" output="No" returntype="string">
	<cfargument name="arg_str" type="string" required="yes">

	<cfset var ret_mark = ''>

	<cfif IsNumeric(arg_str)>
		<cfset ret_mark = arg_str>
	<cfelse>
		<cfswitch expression="#arguments.arg_str#">
		<cfcase value="correct">
			<cfset ret_mark = 'o'>
		</cfcase>
		<cfcase value="">
			<cfset ret_mark = 'x'>
		</cfcase>
		<cfcase value="incorrect">
			<cfset ret_mark = 'x'>
		</cfcase>
		<cfcase value="wrong">
			<cfset ret_mark = 'x'>
		</cfcase>
		<cfcase value="unanticipated">
			<cfset ret_mark = '?'>
		</cfcase>
		<cfcase value="neutral">
			<cfset ret_mark = '-'>
		</cfcase>
		<cfdefaultcase>
			<cfset ret_mark = arg_str>
		</cfdefaultcase>
		</cfswitch>
	</cfif>

	<cfreturn ret_mark>

</cffunction>

<!---////////////////////////////////////////
関数名	fn_dump
引数	ダンプしたいもの	arg any	必須
戻り値	なし
説明	cfdumpのラッパー関数
/////////////////////////////////////////--->
<cffunction name="fn_dump">
	<cfargument name="arg">
	<cfdump var="#arg#">
</cffunction>



<!---////////////////////////////////////////
関数名	fn_get_eLM_URL
引数	eLM_URL		eLM_URL string	必須
戻り値	URL文字列
説明	Application.cfmにApplication.INNER_URLが定義されているとき、
		eLM_URLのドメインをApplication.INNER_URLに変換して返します
/////////////////////////////////////////--->
<cffunction name="fn_get_eLM_URL" output="No" returntype="string">
	<cfargument name="str" type="string" required="no">

	<cfif IsDefined("Application.INNER_URL") and Application.INNER_URL is not "">
		<!---
		<cfset str = rereplace(str , 'https?://.+?/' , Application.INNER_URL & '/' , 'all')>
		--->
		<cfreturn Application.INNER_URL & '/' & Application.UPPER_FOLDER>
	</cfif>

	<cfreturn Application.SERVER_URL & '/' & Application.UPPER_FOLDER>
</cffunction>


<!---////////////////////////////////////////
関数名	fn_get_inc_filename
引数	ファイルネーム	 string	必須
戻り値	カスタマーネームを追加したファイル名
説明	ファイル名にカスタマーネームを
		追加して戻す。
		変換したインクルードファイルが存在しない場合は
		元のファイルネームを戻します。
/////////////////////////////////////////--->
<cffunction name="fn_get_inc_filename" output="NO" returntype="string">
	<cfargument name="filename" type="string" required="yes">

	<cfset var lsObj = ''>
	<cfset var cust_name = ''>
	<cfset var arr_filename = ListToArray(arguments.filename , '.')>
	<cfset var arr_location = ListToArray(Application.SERVER_PATH & CGI.SCRIPT_NAME , '/')>
	<cfset var first_char = Left(Application.SERVER_PATH , 1)>
	<cfset var count = ArrayLen(arr_location)>
	<cfset var mod_filename = ''>
	<cfset var file_path = ''>

	<cfobject component="#Application.SERVICE_ADDRESS#.table_lms_setting" name="lsObj">
	<cfset cust_name = lsObj.get_value('customer_name')>

	<cfset mod_filename = arr_filename[1] & '_' & cust_name & '.' & arr_filename[2]>
	<cfset arr_location[count] = mod_filename>

	<cfset file_path = IIF((first_char is '/') , DE('/') , DE('')) & ArrayToList(arr_location , '/')>

	<cfif fileExists(file_path)>
		<cfreturn mod_filename>
	<cfelse>
		<cfreturn arguments.filename>
	</cfif>

</cffunction>

<!--- ID、パスワードの記録 --->
<cfif refind("/admin/",CGI.SCRIPT_NAME)>
	<cfset _login_cookie_name="A_">
<cfelse>
	<cfset _login_cookie_name="U_">
</cfif>
<cffunction name="fn_id_remainder" output="yes" returntype="void">
	<cfargument name="elem" type="struct" required="yes">

	<cfif IsDefined("elem.id_check")>
		<cfcookie name="#_login_cookie_name#ID_CHECKED" value="1" expires="30" secure="#is_secure_cookie#">
	<cfelse>
		<cfcookie name="#_login_cookie_name#ID_CHECKED" value="" expires="30" secure="#is_secure_cookie#">
	</cfif>

	<cfif IsDefined("elem.pass_check")>
		<cfcookie name="#_login_cookie_name#PASS_CHECKED" value="1" expires="30" secure="#is_secure_cookie#">
	<cfelse>
		<cfcookie name="#_login_cookie_name#PASS_CHECKED" value="" expires="30" secure="#is_secure_cookie#">
	</cfif>

	<cfif IsDefined("elem.pass_check")>
		<cfcookie name="#_login_cookie_name#ID_REMINDED" value="#elem.j_username#" expires="30" secure="#is_secure_cookie#">
		<cfcookie name="#_login_cookie_name#PASS_REMINDED" value="#elem.j_password#" expires="30" secure="#is_secure_cookie#">
	<cfelseif IsDefined("elem.id_check")>
		<cfcookie name="#_login_cookie_name#ID_REMINDED" value="#elem.j_username#" expires="30" secure="#is_secure_cookie#">
		<cfcookie name="#_login_cookie_name#PASS_REMINDED" value="" expires="30" secure="#is_secure_cookie#">
	<cfelse>
		<cfcookie name="#_login_cookie_name#ID_REMINDED" value="" expires="30" secure="#is_secure_cookie#">
		<cfcookie name="#_login_cookie_name#PASS_REMINDED" value="" expires="30" secure="#is_secure_cookie#">
	</cfif>

</cffunction>

<!---////////////////////////////////////////
関数名	fn_this_file
戻り値	SCRIPT_NAME のファイル名のみ
/////////////////////////////////////////--->
<cffunction name="fn_this_file" output="No" returntype="string">
	<cfreturn rereplace( CGI.SCRIPT_NAME , ".*/" , "" )>
</cffunction>






<cfset mysession = structnew()>
<cfset mysession_loaded = false>
<cfset mysid = "">
<cfif refind("/admin/",CGI.SCRIPT_NAME)>
	<cfset cookie_name="MYASID">
<cfelse>
	<cfset cookie_name="MYUSID">
</cfif>
<cffunction name="fn_session_start">
	<cfif mysession_loaded>
		<cfreturn mysid>
	</cfif>
	<cfif isdefined("cookie.#cookie_name#") and evaluate("cookie.#cookie_name#") neq "" and evaluate("cookie.#cookie_name#") neq "false">
		<cfset mysid = evaluate("cookie.#cookie_name#")>
		<cfif REFind("[^0-9]", mysid) neq 0>
			<cfset mysid = dao_next_id()>
			<cfcookie name="#cookie_name#" value="#mysid#" secure="#is_secure_cookie#">
		</cfif>
	<cfelse>
		<cfset mysid = dao_next_id()>
		<cfcookie name="#cookie_name#" value="#mysid#" secure="#is_secure_cookie#">
	</cfif>
	<cfset Variables.TempSelectObj = dao_select("mysession")>
	<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "mysid", mysid)>
	<cfset Variables.TempSelectObj = dao_limit(Variables.TempSelectObj, 1)>
	<cfset Variables.TempSelectObj = dao_orderby(Variables.TempSelectObj, "serial desc")>
	<cfset qobject = dao_result("#application.DSN#", Variables.TempSelectObj)>

	<cfif qobject.recordcount neq 0>
		<cfobject component="#application.SERVICE_ADDRESS#.json" name="json">
		<cfset mysession = json.decode(qobject.data)>
		<cfif isDefined("mysession.login_user_id")>
			<cfif cookie_name is "MYASID">
				<cfset Session.admin_id = mysession["login_user_id"]>
			<cfelse>
				<cfset Session.user_id = mysession["login_user_id"]>
			</cfif>
		</cfif>
	<cfelse>
		<cfset mysession = structnew()>
	</cfif>
	<cfset mysession_loaded = true>
	<cfreturn mysid>
</cffunction>

<cffunction name="fn_session_commit">
	<cfargument name="logout_flg" default="0">
	<cfset var mysid = "">
	<cfif isdefined("cookie.#cookie_name#") and evaluate("cookie.#cookie_name#") neq "" and evaluate("cookie.#cookie_name#") neq "false">
		<cfset mysid = javacast("int",evaluate("cookie.#cookie_name#"))>
		<cfif mysid eq 0>
			<cfset mysid = dao_next_id()>
			<cfcookie name="#cookie_name#" value="#mysid#" secure="#is_secure_cookie#">
		</cfif>
	<cfelse>
		<cfset mysid = dao_next_id()>
		<cfcookie name="#cookie_name#" value="#mysid#" secure="#is_secure_cookie#">
	</cfif>

	<cfset row = structnew()>
	<cfset row.ins_time = javacast('int',GetTickCount()/1000)>
	<cfset row.mysid = mysid>
	<cfobject component="#application.SERVICE_ADDRESS#.json" name="json">
	<cfif arguments.logout_flg eq 1>
		<cfif IsDefined('mysession.lang_code_user')>
			<cfset mysession.lang_code_user = "">
		</cfif>
		<cfif IsDefined('mysession.lang_code_admin')>
			<cfset mysession.lang_code_admin = "">
		</cfif>
	</cfif>
	<cfset row.data = json.encode(mysession)>
	<cfset dao_insert_no_tran(Application.dsn,"mysession",row)>
	<cfreturn mysid>
</cffunction>

<cffunction name="fn_empty_session">
	<cfargument name="ckflg" type="string" required="yes">

	<cfset var mysid = "">

	<cfobject component="#application.SERVICE_ADDRESS#.json" name="json">

	<cfset mysid = dao_next_id()>
	<cfif ckflg eq "A">
		<cfset cookie.MYASID = mysid>
	<cfelse>
		<cfset cookie.MYUSID = mysid>
	</cfif>

	<cfset row = structnew()>
	<cfset row.ins_time = javacast('int',GetTickCount()/1000)>
	<cfset row.mysid = mysid>
	<cfset row.data = json.encode(StructNew())>
	<cfset dao_insert_no_tran(Application.dsn,"mysession",row)>

</cffunction>


<!---////////////////////////////////////////
関数名	fn_user_login_chk
引数	なし
戻り値	成功：空白　／　失敗：エラー番号
説明	user/login_chkの元に作成
/////////////////////////////////////////--->
<cffunction name="fn_user_login_chk">
	<cfargument name="auFlg" type="string" required="yes">
	<cfset var lang_code_related = "">
	<cfset var term_select = "">
	<cfset var loc_password = "">
    <cfset var q_user_logon = "">
    <cfset var session_id_safe = "">
    <cfset var umObj = CreateObject("component", "#Application.SERVICE_ADDRESS#.table_user_master") />
    <cfset var ullaObj = CreateObject("component", "#Application.SERVICE_ADDRESS#.table_user_logon_log_all") />
    <cfset var ObjSM = CreateObject("component", "#Application.SERVICE_ADDRESS#.send_mail") />
	<cfset mysession_loaded = false>
	<cfset cookie_name="MYUSID">
	<cfset fn_session_start()>

	<cfif IsDefined('form.term_select')>
		<cfset term_select = form.term_select>
	<cfelse>
		<cfset term_select = "default">
	</cfif>

	<cfif IsDefined('form.j_password')>
		<cfobject component="#Application.SERVICE_ADDRESS#.password_encryption" name="peObj">
		<cfset loc_password = peObj.encode(form.j_password)>
	</cfif>

	<!--- ユーザー認証 --->
	<cfobject component="#SERVICE_ADDRESS#.table_lms_setting" name="lsObj">
	<cfset customer_name = lsObj.get_value('customer_name')>
	<!--- 学習者の二重ログインモード (0：許可する|1：前ログイン優先モード|2：後ログイン優先モード)--->
	<cfset login_mode_user = lsObj.get_value('login_mode_user')>

	<cfif isDefined("URL.a") and isDefined("URL.b") >
		<cfset Form.j_username = URL.a>
		<cfset loc_password = URL.b>
		<cfset Form.term_select = "ja">
		<cfset term_select = "ja">
	</cfif>

	<cfset variables.err = "">

    <cfif StructKeyExists(form, "gl_back_url")>
        <cfset mysession.gl_back_url = form.gl_back_url>
    </cfif>

	<!---/////////////////////////////////////////
	すでに認証済みのユーザーがいるかどうかを確認
	//////////////////////////////////////////--->
	<cfif iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de("")) is not "">
		<cfif IsDefined("cgi.HTTP_IV_USER") and cgi.HTTP_IV_USER is not "">
			<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
			<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de(""))#")>
			<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "logon", "#cgi.HTTP_IV_USER#")>
			<cfset iv_user = dao_result("#Application.dsn#", Variables.TempSelectObj)>
		</cfif>

		<cfif IsDefined("iv_user") and iv_user.recordcount eq 0>
			<!---/////////////////////////////////////////
			ブラウザからiv-userが来ていて
			認証済みのユーザーと別ユーザなら
			一度ログオフさせて再認証
			//////////////////////////////////////////--->

			<cfset mysession.login_user_id = "">

		<cfelseif IsDefined("form.loginUserId")>
			<!---/////////////////////////////////////////
			認証済みのユーザーがいても、
			FlashからユーザーIDが来ていたら
			一度ログオフさせて再認証
			//////////////////////////////////////////--->

			<cfset mysession.login_user_id = "">

		<cfelseif IsDefined("form.j_username") and IsDefined("form.j_password") and IsDefined("form.term_select")>
			<!---/////////////////////////////////////////
			認証済みのユーザーがいても、
			j_usernameが来ていたら(これはログイン画面からしか来ない)
			一度ログオフさせて再認証
			//////////////////////////////////////////--->

			<!--- nameとpasswordの情報とセッション情報を比較 --->

			<cfset clearUFlg = false> <!--- 学習者クリアフラグ --->
			<cfset clearAFlg = false> <!--- 管理者クリアフラグ --->

			<!---- 入力されているユーザー情報をチェック ---->
			<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
			<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "logon", "#form.j_username#")>
			<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "password", "#loc_password#")>
			<cfset uLogin = dao_result("#Application.dsn#", Variables.TempSelectObj)>

			<!---- ほかの場所にログインしているかどうかチェック ---->
			<cfset mysession_login_user_id_safe=dao_escape(mysession.login_user_id)>
			<cfset mysession_login_user_id_safe=iif(isdefined("mysession_login_user_id_safe"),"mysession_login_user_id_safe",de(""))>
			<cfset mysession_login_user_id_safe=dao_escape(mysession_login_user_id_safe)>
			<cfset cookie_MYUSID_safe=dao_escape(cookie.MYUSID)>
		<!---	<cfset isNumericOrDie(cookie.MYUSID)>--->
			<cfquery name="already_check" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				select * from USER_LOGON
				where user_id = '#PreserveSingleQuotes(mysession_login_user_id_safe)#'
				and mysid != '#PreserveSingleQuotes(cookie_MYUSID_safe)#'
			</cfquery>

			<!---- 連携している管理者がいるかどうかチェック ---->
			<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_master" method="get_user_related_admin" returnVariable="uRelatedLogin">
				<cfinvokeargument name="user_id" value="#iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de(""))#">
			</cfinvoke>

			<!---- user_logonとmysession情報をクリアするかどうかの判断処理 ---->
			<cfif auFlg eq "U">
				<!---- 学習者画面から来た場合 ---->
				<cfif (uLogin.RecordCount is 1 and ( uLogin.user_type_id is 3 or uLogin.user_type_id is 4 ) and uLogin.user_id neq mysession.login_user_id ) or uLogin.RecordCount is 0 or already_check.recordcount neq 0 >
					<cfset clearUFlg = true>
				</cfif>

			<cfelse>
				<!---- 管理者画面から来た場合 ---->
				<cfif uLogin.RecordCount is 1 and uLogin.user_type_id is not 3 >

					<!---- 入力されたのは管理者のIDとパスの場合、連携している学習者がいたらクリア ---->
					<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_master" method="get_admin_related_user" returnVariable="uNewLogin">
						<cfinvokeargument name="admin_user_id" value="#uLogin.user_id#">
					</cfinvoke>
					<cfif uNewLogin.RecordCount neq 0>
						<cfset clearUFlg = true>
						<cfset clearAFlg = true>
					</cfif>
					<!---- 入力されたのは管理者のIDとパスの場合、連携管理者がいたらクリア ---->
					<cfif uLogin.user_id neq mysession.login_user_id and uRelatedLogin.RecordCount neq 0 >
						<cfset clearUFlg = true>
						<cfset clearAFlg = true>
					</cfif>

				<cfelseif uLogin.RecordCount is 1 and (uLogin.user_type_id is 3 or uLogin.user_type_id is 4)>
					<!---- 入力されたのは学習者のIDとパスの場合、連携している管理者がいたらクリア ---->
					<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_master" method="get_user_related_admin" returnVariable="aLogin">
						<cfinvokeargument name="user_id" value="#uLogin.user_id#">
					</cfinvoke>
					<cfif aLogin.RecordCount neq 0>
						<cfset clearUFlg = true>
						<cfset clearAFlg = true>
					</cfif>
					<!---- 入力されたのは学習者のIDとセッションID違っていたらクリア ---->
					<cfif uLogin.user_id neq mysession.login_user_id >
						<cfset clearAFlg = true>
					</cfif>

				</cfif>
			</cfif>

			<!---- 連携している管理者がいたら、管理者もクリアしていく ---->
			<cfif clearUFlg and uRelatedLogin.RecordCount neq 0>
				<cfset clearAFlg = true>
			</cfif>
			<cfif clearAFlg and uRelatedLogin.RecordCount neq 0>
				<cfset clearUFlg = true>
			</cfif>

			<!---- 学習者情報をクリア ---->
			<cfif clearUFlg >
				<cfset myusid_safe=dao_escape(cookie.MYUSID)>
				<cfquery name="q_delete_user" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					select user_id from USER_LOGON where mysid='#PreserveSingleQuotes(myusid_safe)#'
				</cfquery>
				<cfset fn_update_user_logon_log_all(q_delete_user.user_id, REQUEST.remoteAddress)>
				<!---- user_logonをクリア ---->
				<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_logon" method="del_logout_user" returnVariable="retval">
					<cfinvokeargument name="au_flg" value="U">
				</cfinvoke>
				<!---- mysessionクリア ---->
				<cfset mysession.login_user_id = "">
			</cfif>

			<!---- 管理者情報をクリア ---->
			<cfif clearAFlg >
				<!---- user_logonをクリア ---->
				<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_logon" method="del_logout_user" returnVariable="retval">
					<cfinvokeargument name="au_flg" value="A">
				</cfinvoke>
				<!---- mysessionクリア ---->
				<cfset fn_empty_session("A")>
			</cfif>

		<cfelse>
			<!---/////////////////////////////////////////
			認証済みユーザーがまだログインしているかを
			確認して、もしログオフまたは二重ログインしていたらログイン画面表示
			まだログイン中の場合はUSER_LOGONテーブルのmysidとlogon_timeを更新
			//////////////////////////////////////////--->

			<!---  二重ログイン判断処理 --->
			<cfif login_mode_user eq 1>
				<!---  二重ログインモードが1（後ログイン優先モード）の場合 --->
				<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_logon" method="logon_session_chk" returnVariable="retval">
					<cfinvokeargument name="user_id" value="#iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de(""))#">
					<cfinvokeargument name="mysession_id" value="#cookie.MYUSID#">
				</cfinvoke>
			<cfelse>
				<!---  二重ログインモードが1以外（前ログイン優先モード）の場合 --->
				<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_logon" method="logon_chk" returnVariable="retval">
					<cfinvokeargument name="user_id" value="#iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de(""))#">
				</cfinvoke>
			</cfif>

			<cfif retval>
				<cflock timeout=200 scope="Session" type="Exclusive">
				<!--- セッション情報からターム関係のオブジェクトがなくなっていたら再度インスタンス化 --->
					<cfif not IsDefined("Session.termObj")>

						<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
						<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de(""))#")>
						<cfset qGetUserInfo = dao_result("#Application.dsn#", Variables.TempSelectObj)>

						<cfobject component="#SERVICE_ADDRESS#.term" name="Session.termObj">
						<cfset mysession.lang_code_user=fn_termSelect(qGetUserInfo, term_select)>
						<cfset fn_update_lang_code_related(qGetUserInfo.user_id, mysession.lang_code_user, qGetUserInfo.user_type_id)>
						<cfset Session.termObj.init(mysession.lang_code_user)>
					</cfif>
				</cflock>

				<cfset mysession_login_user_id_safe=dao_escape(mysession.login_user_id)>
				<cfset mysession_login_user_id_safe=iif(isdefined("mysession_login_user_id_safe"),"mysession_login_user_id_safe",de(""))>
				<cfset mysession_login_user_id_safe=dao_escape(mysession_login_user_id_safe)>
				<cfset cookie_MYUSID_safe=dao_escape(cookie.MYUSID)>
				<!---<cfset isNumericOrDie(cookie.MYUSID)>--->
				<cfquery name="already_check" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					select * from USER_LOGON
					where user_id = '#PreserveSingleQuotes(mysession_login_user_id_safe)#'
					and mysid != '#PreserveSingleQuotes(cookie_MYUSID_safe)#'
				</cfquery>

				<cfif already_check.recordcount neq 0 and login_mode_user eq 0>
					<!--- 前ログイン優先モードでかつほかの場所でログインされている場合、ログイン画面でエラーメッセージを表示する。 --->
					<cfset variables.err = 3>

				<cfelse>
					<cfset row = structNew()>
					<cfset row.mysid = cookie.MYUSID>
					<cfset row.logon_time = dateformat(now() , "yyyy-mm-dd") & ' ' & timeformat(now() , "HH:mm:ss")>
					<cfset temp = dao_update_ex_no_tran(Application.dsn , 'USER_LOGON' , iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de("")) , row , 'user_id')>
				</cfif>

			<cfelse>
				<!---/////////////////////////////////////////
				認証済みユーザーのログイン情報が消えていたら、
				ログイン画面を表示するとともにログオフさせる。
				//////////////////////////////////////////--->

				<cfset variables.err = 3>

			</cfif>
		</cfif>
	</cfif>

	<cfif iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de("")) eq "">
		<!--- ログイン情報が送られてこない。 --->

		<cfif NOT ( IsDefined("form.j_username") and IsDefined("form.j_password") and IsDefined("form.term_select") ) >
			<!--- さらにフォームからのloginUserIdもこない(これはFlashの管理画面から来る。) ここで表示されるのが初期ログイン画面--->
			<cfif IsDefined("form.loginUserId")>

				<!--- フォームからのloginUserIdがきたので、すでにログイン済みかどうかチェック。 --->
				<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_logon" method="logon_chk" returnVariable="retval">
					<cfinvokeargument name="user_id" value="#form.loginUserId#">
				</cfinvoke>

				<cfif retval>
	            	<!--- (ここに処理はこない？) --->
					<!--- ユーザー情報を取得 --->
					<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
					<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#form.loginUserId#")>
					<cfset qGetUserInfo = dao_result("#Application.dsn#", Variables.TempSelectObj)>

					<cflock timeout=200 scope="Session" type="Exclusive">
						<!--- 一致したデータが存在した場合は、ログインユーザー情報を設定。さらに、ログインのログの時間を更新。 --->
						<cfset mysession.login_user_id = form.loginUserId >
						<cfobject component="#SERVICE_ADDRESS#.term" name="Session.termObj">
						<cfset mysession.lang_code_user=fn_termSelect(qGetUserInfo, term_select)>
						<cfset fn_update_lang_code_related(qGetUserInfo.user_id, mysession.lang_code_user, qGetUserInfo.user_type_id)>
						<cfset Session.termObj.init(mysession.lang_code_user)>
					</cflock>

					<cfset row = structNew()>
					<cfset row.mysid = cookie.MYUSID>
					<cfset row.logon_time = dateformat(now() , "yyyy-mm-dd") & ' ' & timeformat(now() , "HH:mm:ss")>
					<cfset temp = dao_update_ex_no_tran(Application.dsn , 'USER_LOGON' , form.loginUserId , row , 'user_id')>

					<!--- LOGON_LOG更新 --->
					<cfset fn_logging_logon(mysession.login_user_id, 0)>

				<cfelse>
					<!--- 一致したデータがないので、ログイン画面に遷移。 --->
					<cfset variables.err = 0>
				</cfif>

			<cfelseif IsDefined("cgi.HTTP_IV_USER") and cgi.HTTP_IV_USER is not "">
				<!--- 同時ログイン数制限をチェック --->
				<cfif check_current_users() eq false>
					<cfset variables.err = 7>
					<cfreturn variables.err>
				</cfif>

				<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
				<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "logon", "#cgi.HTTP_IV_USER#")>
				<cfset qGetUserInfo = dao_result("#Application.dsn#", Variables.TempSelectObj)>
	            <cfif qGetUserInfo.recordCount eq 0>
					<cfset variables.err = 3>
					<cfreturn variables.err>
	            </cfif>

				<!--- タームコード周りの処理 --->

				<cflock timeout=200 scope="Session" type="Exclusive">
				<!--- 一致したデータが存在した場合は、セッション情報を設定 --->
					<cfset mysession.login_user_id = qGetUserInfo.user_id>

					<cfobject component="#SERVICE_ADDRESS#.term" name="Session.termObj">
					<cfset mysession.lang_code_user=fn_termSelect(qGetUserInfo, term_select)>
					<cfset fn_update_lang_code_related(qGetUserInfo.user_id, mysession.lang_code_user, qGetUserInfo.user_type_id)>
					<cfset Session.termObj.init(mysession.lang_code_user)>
				</cflock>

				<cfset cookie_MYUSID_safe=dao_escape(cookie.MYUSID)>
			<!---	<cfset isNumericOrDie(cookie.MYUSID)>--->
				<cfquery name="already_check" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					select * from USER_LOGON
					where user_id = #qGetUserInfo.user_id#
					and mysid != '#PreserveSingleQuotes(cookie_MYUSID_safe)#'
				</cfquery>
				<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_logon" method="logon_chk" returnVariable="retval">
					<cfinvokeargument name="user_id" value="#qGetUserInfo.user_id#">
				</cfinvoke>

				<cfif retval and already_check.recordcount neq 0 and login_mode_user eq 0>
					<!--- 前ログイン優先モードでかつほかの場所でログインされている場合、ログイン画面でエラーメッセージを表示する。 --->
					<cfset variables.err = 5>

				<cfelse>
					<!--- 該当管理者のログインログが残っている場合は削除 --->
					<cfset temp = dao_delete_ex(Application.dsn , 'USER_LOGON' , qGetUserInfo.user_id , 'user_id')>

					<!--- ログインログを作成 --->
					<cfset row = structNew()>
					<cfset row.mysid = cookie.MYUSID>
					<cfset row.user_id = qGetUserInfo.user_id>
					<cfset row.course_id = ''>
					<cfset row.logon_time = dateformat(now() , "yyyy-mm-dd") & ' ' & timeformat(now() , "HH:mm:ss")>

					<cfset temp = dao_insert_ex(Application.dsn , 'USER_LOGON' , row , 'user_id')>

					<!--- LOGON_LOG更新 --->
					<cfset fn_logging_logon(mysession.login_user_id, 0)>
				</cfif>

			<cfelse>
					<cfset variables.err = 3>
				<cfif isDefined("cont") and cont is "logout">
					<cfset variables.err = 3>
				</cfif>
			</cfif>

		<cfelse>

			<cfset fn_id_remainder(form)>	<!--- ID,パスワードの記録 --->

			<!--- ログイン情報が送られてきた。 --->
			<cfif form.j_username IS "" OR form.j_password IS "">
				<!--- nameかpasswordの情報がない場合はログイン画面を表示 --->
				<cfset variables.err = 1>
				<cfreturn variables.err>
			</cfif>

			<!--- nameとpasswordの両方の情報を持っている場合は、クエリ発行 --->
  			<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
  			<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "logon", "#form.j_username#")>
  			<cfset qLogin = dao_result("#Application.dsn#", Variables.TempSelectObj)>

			<cfset userChk = true>
			<cfif auFlg eq "A" and qLogin.RecordCount is 1>
				<!--- 管理者ログイン画面から来た場合、連携している管理者がいるかどうかもチェック --->
				<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_master" method="get_user_related_admin" returnVariable="aLogin">
					<cfinvokeargument name="user_id" value="#qLogin.user_id#">
				</cfinvoke>
				<cfif aLogin.RecordCount eq 0>
					<cfset userChk = false>
				</cfif>
			</cfif>

			<!---LDAP認証 user側：Spec2、Spec10--->
			<cfset use_ldap = lsObj.get_value("ldap.use_ldap")>

			<cfif customer_name eq 'nikon'>
				<cfif qLogin.number_1 eq 1>
					<cfset use_ldap = 1>
				<cfelse>
					<cfset use_ldap = 0>
				</cfif>
			</cfif>

			<cfif lsObj.get_value('sso.use_sso')>
				<cfset ssoObj				= CreateObject('component', Application.SERVICE_ADDRESS & '.sso')>
				<cfset sso_default_password	= ssoObj.get_sso_default_password()>
				<cfif form.j_password eq sso_default_password>
					<cfset qLogin.password	= sso_default_password>
				</cfif>
			</cfif>

			<cfif use_ldap neq 0>
				<cfset ldap_cert_struct		= StructNew()>
				<cfset ldap.server			= lsObj.get_value("ldap.server")>
				<cfset ldap.cert_info_user	= lsObj.get_value("ldap.cert_info_user")>
				<cfset ldap.account			= lsObj.get_value("ldap.account")>
				<cfset ldap.domain_name		= lsObj.get_value("ldap.domain_name")>
				<cfset ldap_account_arr		= ListToArray(ldap.account, chr(10))>

				<cfloop index="i" from="1" to="#ArrayLen(ldap_account_arr)#">
					<cfset place_at_equal	= Find("=", ldap_account_arr[i])>
					<cfset eLM_item_name	= Trim(Mid(ldap_account_arr[i], 1, place_at_equal-1))>
					<cfset ldap_item_name	= Trim(Mid(ldap_account_arr[i], place_at_equal+1, Len(ldap_account_arr[i])))>
					<cfset ldap_cert_struct["#eLM_item_name#"] = ldap_item_name>
				</cfloop>

				<cfif ldap.domain_name eq "">
					<!--- LDAP --->
					<cfif customer_name eq "aist">
						<cfset ldap_admin_name		= lsObj.get_value("ldap.ldap_admin_name")>
						<cfset ldap_password		= lsObj.get_value("ldap.ldap_password")>
						<cfset filter_str = "loginId=" & form.j_username >
						<cfset att_str = "uid,aistAccountStatus" >
						<cfldap server="#ldap.server#" action="query" name="q_ldap_login_user" start="#ldap.cert_info_user#" scope="onelevel" attributes="#att_str#" username="#ldap_admin_name#" password="#ldap_password#" filter="#filter_str#">
						<cfif q_ldap_login_user.aistAccountStatus neq 1 >
							<cfset variables.err = 10>
							<cfreturn variables.err>
						<cfelse>
				  			<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
				  			<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "logon", "#q_ldap_login_user.uid#")>
				  			<cfset qLogin = dao_result("#Application.dsn#", Variables.TempSelectObj)>
							<cfset auth_info.principal = ldap_cert_struct.uid & "=" & q_ldap_login_user.uid & "," & ldap.cert_info_user>
						</cfif>
					<cfelse>
						<cfset auth_info.principal = ldap_cert_struct.logon & "=" & form.j_username & "," & ldap.cert_info_user>
					</cfif>
				<cfelse>
					<!--- Active Directory --->
					<cfset auth_info.principal = form.j_username & "@" & ldap.domain_name>
				</cfif>

				<!--- LDAP/AD認証の処理 --->
				<cfset auth_info.server		= "ldap://" & ldap.server>
				<cfset auth_info.password	= loc_password>
				<cfset auth_info.secAuth	= "simple">
				<cfset resStruct			= ldap_auth(auth_info)>
				<cfif resStruct.authFlg eq 0>
					<cfset variables.err = 2>
					<cfreturn variables.err>
				</cfif>
				<!--- LDAP/ADにユーザ情報があるが、DB.USER_MASTERにはレコードが無い場合の処理 --->
				<cfif qLogin.RecordCount eq 0 and resStruct.authFlg neq 0>
					<cfset variables.err = 8>
					<cfreturn variables.err>
				</cfif>

				<cfset qLogin.password = loc_password>
			</cfif>
			<!---LDAP認証 user側終わり：Spec2、Spec10--->

            <cfif qLogin.recordCount neq 0>
                <cfif umObj.is_on_password_lock()>
                    <cfif qLogin.password neq loc_password and qLogin.user_type_id eq 3>
                        <cfset umObj.incr_n_password_fail(qLogin.user_id) />
                        <cfif umObj.is_over_password_lock_limit(qLogin.user_id, true)>
                            <cfset umObj.lock_account(qLogin.user_id) />
                            <cfset ObjSM.send_alert_password_lock(qLogin.user_id) />
                        </cfif>
                    </cfif>

                    <cfif umObj.is_over_password_lock_limit(qLogin.user_id)>
                        <cfset variables.err = 9 />
                        <cfreturn variables.err />
                    </cfif>
                </cfif>
            </cfif>

			<cfif userChk and qLogin.RecordCount is 1 and ( qLogin.user_type_id is 3 or qLogin.user_type_id is 4 ) and compare( qLogin.password , loc_password ) eq 0 >	    <!--- ユーザーのみ --->

				<cfif qLogin.flag_stop is 1>
                    <cfif umObj.is_on_password_lock() and umObj.is_over_password_lock_limit(qLogin.user_id)>
                        <!--- パスワードロックのときのエラーコードを発行 --->
                        <cfset variables.err = 9 />
                    <cfelse>
					    <!--- 利用停止中ならログイン画面へ --->
					    <cfset variables.err = 4 />
                    </cfif>
				<cfelseif customer_name eq 'hikari' and qLogin.text_1 is 1>
					    <!--- 利用期限きれ中ならログイン画面へ利用停止と同じエラー処理 --->
					    <cfset variables.err = 4 />
				<cfelse>
                    <cfif umObj.is_on_password_lock()>
                        <cfset umObj.clear_n_password_fail(qLogin.user_id) />
                        <cfset mysession.latest_logon_date = ullaObj.get_latest_logon_date(qLogin.user_id) />
                    </cfif>
					<!--- タームコード周りの処理 --->
					<cflock timeout=200 scope="Session" type="Exclusive">
					<!--- 一致したデータが存在した場合は、セッション情報を設定 --->
						<cfset mysession.login_user_id = qLogin.user_id>
						<cfobject component="#SERVICE_ADDRESS#.term" name="Session.termObj">
						<cfset mysession.lang_code_user=fn_termSelect(qLogin, term_select)>
						<cfset fn_update_lang_code_related(qLogin.user_id, mysession.lang_code_user, qLogin.user_type_id)>
						<cfset Session.termObj.init(mysession.lang_code_user)>
					</cflock>

					<cfset cookie_MYUSID_safe=dao_escape(cookie.MYUSID)>--->
					<cfquery name="already_check" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
						select * from USER_LOGON
						where user_id = '#qLogin.user_id#'
						and mysid != '#PreserveSingleQuotes(cookie_MYUSID_safe)#'
					</cfquery>

					<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_logon" method="logon_chk" returnVariable="retval">
						<cfinvokeargument name="user_id" value="#qLogin.user_id#">
					</cfinvoke>

					<cfif retval and already_check.recordcount neq 0 and login_mode_user eq 0>
						<!--- 前ログイン優先モードでかつほかの場所でログインされている場合、ログイン画面でエラーメッセージを表示する。 --->
						<cfset variables.err = 5>

					<cfelse>
						<!--- 同時ログイン数のチェック --->
						<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_logon" method="check_logon_count" returnVariable="retval">
							<cfinvokeargument name="user_id" value="#qLogin.user_id#">
						</cfinvoke>

						<cfif retval>
							<!--- 後ログイン優先時の蹴りだされ時刻の記録 --->
							<cfset check_user_id_safe=dao_escape(mysession.login_user_id)>
							<cfquery name="q_not_login" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
								select count(*) as count from USER_LOGON where user_id='#PreserveSingleQuotes(check_user_id_safe)#'
							</cfquery>
							<cfif q_not_login.count eq 1>
								<cfset fn_update_user_logon_log_all(qLogin.user_id, REQUEST.remoteAddress, 'user')>

								<!--- 連携している管理者のログアウト時刻記録 --->
								<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_master" method="get_user_related_admin" returnVariable="uLogin">
									<cfinvokeargument name="user_id" value="#qLogin.user_id#">
								</cfinvoke>

								<cfif uLogin.recordcount eq 1>
									<cfset fn_update_user_logon_log_all_related(uLogin.user_id, REQUEST.remoteAddress, 'admin')>
								</cfif>
							</cfif>

							<!--- 該当管理者のログインログが残っている場合は削除 --->
							<cfset temp = dao_delete_ex(Application.dsn , 'USER_LOGON' , qLogin.user_id , 'user_id')>

							<!--- ログインログを作成 --->
							<cfset row = structNew()>
							<cfset row.mysid = cookie.MYUSID>
							<cfset row.user_id = qLogin.user_id>
							<cfset row.course_id = '0'>
							<cfset row.logon_time = dateformat(now() , "yyyy-mm-dd") & ' ' & timeformat(now() , "HH:mm:ss")>

							<cfset temp = dao_insert_ex(Application.dsn , 'USER_LOGON' , row , 'user_id')>

							<!--- LOGON_LOG更新 --->
							<cfset fn_logging_logon(mysession.login_user_id, 0)>

						<cfelse>
							<!--- ログイン失敗　－＞　ログイン画面へ --->
							<cfset variables.err = 7>

						</cfif>
					</cfif>
				</cfif>

			<cfelse>
				<!--- 一致したデータが無い場合は、ログイン画面をそのまま出すことにする(ついでにログアウトさせる) --->
				<cfset variables.err = 2>

			</cfif>
		</cfif>
	</cfif>

	<cfif variables.err neq "" >
		<cfreturn variables.err>
	</cfif>

	<cfif iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de("")) is not "">
		<cflogout>
		<cflogin>
		<cfloginuser
			name="#mysession.login_user_id#"
			Password = ""
			roles="">
		</cflogin>
	</cfif>

	<cfset fn_session_commit()>

	<!--- 学習者が連携している管理者がいたら同時ログイン--->
	<cfif iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de("")) is not "" >

		<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_master" method="get_user_related_admin" returnVariable="aLogin">
			<cfinvokeargument name="user_id" value="#mysession.login_user_id#">
		</cfinvoke>

		<cfif aLogin.recordcount eq 1>
			<!--- 管理者セッション情報を設定 --->
			<cfset mysession_loaded = false>
			<cfset cookie_name="MYASID">
			<cfif IsDefined('mysession.lang_code_user') and mysession.lang_code_user neq "">
				<cfset lang_code_related = mysession.lang_code_user>
			<cfelseif IsDefined('mysession.lang_code_admin') and mysession.lang_code_admin neq "">
				<cfset lang_code_related = mysession.lang_code_admin>
			</cfif>
			<cfset fn_session_start()>

			<!--- 該当管理者のログインログが残っている場合は削除
			<cfset temp = dao_delete_ex(Application.dsn , 'USER_LOGON' , aLogin.user_id , 'user_id')>
			--->
			<!--- ログインログを作成 --->
			<cfset row = structNew()>
			<cfset row.mysid = cookie.MYASID>
			<cfset row.user_id = aLogin.user_id>
			<cfset row.course_id = '0'>
			<cfset row.logon_time = dateformat(now() , "yyyy-mm-dd") & ' ' & timeformat(now() , "HH:mm:ss")>

			<cfquery name="already_logon_check" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				select * from USER_LOGON
				where user_id = '#row.user_id#'
				and mysid = '#row.mysid#'
			</cfquery>

			<cfset temp = dao_put('USER_LOGON' , row , 'user_id')>

			<cfif already_logon_check.recordcount eq "0">
				<!--- LOGON_LOG更新 --->
				<cfset fn_logging_logon(aLogin.user_id, 0)>
			</cfif>

			<cfset mysession.login_user_id = aLogin.user_id>
			<cfset mysession.lang_code_admin = lang_code_related>
			<cfset mysession.lang_code_user = lang_code_related>
			<cfset fn_session_commit()>
			<cfset cookie_name="MYUSID">
			<cfset mysession.login_user_id = aLogin.related_user_id>
		</cfif>
	</cfif>

	<cfreturn variables.err>

</cffunction>

<!---////////////////////////////////////////
関数名	fn_admin_login_chk
引数	なし
戻り値	成功：空白　／　失敗：エラー番号
説明	元のadmin/login_chkの元に作成
/////////////////////////////////////////--->
<cffunction name="fn_admin_login_chk">
	<cfargument name="auFlg" type="string" required="yes">
	<cfset var loginUserLogon="">
	<cfset var loginUserLogon_safe="">
	<cfset var lang_code_related = "">
	<cfset var term_select = "">
	<cfset var loc_password = "">
    <cfset var umObj = CreateObject("component", "#Application.SERVICE_ADDRESS#.table_user_master") />
    <cfset var ObjSM = CreateObject("component", "#Application.SERVICE_ADDRESS#.send_mail") />


	<cfif IsDefined('form.term_select')>
		<cfset term_select = form.term_select>
	<cfelse>
		<cfset term_select = "default">
	</cfif>

	<cfif IsDefined('form.j_password')>
		<cfobject component="#Application.SERVICE_ADDRESS#.password_encryption" name="peObj">
		<cfset loc_password = peObj.encode(form.j_password)>
	</cfif>


	<cfset mysession_loaded = false>
	<cfset cookie_name="MYASID">
	<cfif IsDefined('mysession.lang_code_admin')>
		<cfset lang_code_related = mysession.lang_code_admin>
	</cfif>
	<cfset fn_session_start()>
	<cfif lang_code_related neq "">
		<cfset mysession.lang_code_admin = lang_code_related>
	</cfif>

	<cfobject component="#SERVICE_ADDRESS#.table_lms_setting" name="lsObj">
	<cfset customer_name = lsObj.get_value('customer_name')>

	<!--- 管理者の二重ログインモード (0：許可する|1：前ログイン優先モード|2：後ログイン優先モード)--->
	<cfset login_mode_admin = lsObj.get_value('login_mode_admin')>

	<cfset variables.err = "">

	<!--- ユーザー認証 --->
	<!--- loginUserIdは和歌山用に流用 --->
	<cfif customer_name eq "wakayama">
		<cfif IsDefined("loginUserLogon")>
			<cfset loginUserLogon_safe=dao_escape(loginUserLogon)>
			<cfquery name="q_user" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				select * from USER_MASTER where logon = '#PreserveSingleQuotes(loginUserLogon_safe)#'
			</cfquery>
			<cfif q_user.recordcount eq 1>
				<cfif hash(q_user.password) eq hashpw>
					<cfset form.j_username = q_user.logon>
					<cfset loc_password = q_user.password>
					<cfset form.term_select = "default">
					<cfset term_select = "default">
				</cfif>
			</cfif>
		</cfif>
	</cfif>

	<!---/////////////////////////////////////////
	すでに認証済みのユーザーがいるかどうかを確認
	//////////////////////////////////////////--->
	<cfif iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de("")) is not "">
		<cfif IsDefined("loginUserId")>
			<!---/////////////////////////////////////////
			認証済みのユーザーがいても、
			FlashからユーザーIDが来ていたら
			一度ログオフさせて再認証
			//////////////////////////////////////////--->

			<cfset mysession.login_user_id = "">

		<cfelseif IsDefined("form.j_username") and IsDefined("form.j_password") and IsDefined("form.term_select")>
			<!---/////////////////////////////////////////
			認証済みのユーザーがいても、
			j_usernameが来ていたら(これはログイン画面からしか来ない)
			一度ログオフさせて再認証
			//////////////////////////////////////////--->

			<!--- nameとpasswordの情報とセッション情報を比較 --->

			<cfset clearUFlg = false> <!--- 学習者クリアフラグ --->
			<cfset clearAFlg = false> <!--- 管理者クリアフラグ --->

			<!---- 入力されているユーザー情報をチェック ---->
			<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
			<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "logon", "#form.j_username#")>
			<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "password", "#loc_password#")>
			<cfset uLogin = dao_result("#Application.dsn#", Variables.TempSelectObj)>

			<!---- ほかの場所にログインしているかどうかチェック ---->
			<cfset mysession_login_user_id_safe=dao_escape(mysession.login_user_id)>
			<cfset mysession_login_user_id_safe=iif(isdefined("mysession_login_user_id_safe"),"mysession_login_user_id_safe",de(""))>
			<cfset mysession_login_user_id_safe=dao_escape(mysession_login_user_id_safe)>
			<cfset cookie_MYASID_safe=dao_escape(cookie.MYASID)>
			<!---<cfset isNumericOrDie(cookie.MYASID)>--->
			<cfquery name="already_check" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				select * from USER_LOGON
				where user_id = '#PreserveSingleQuotes(mysession_login_user_id_safe)#'
				and mysid != '#PreserveSingleQuotes(cookie_MYASID_safe)#'
			</cfquery>

			<!---- 連携している学習者がいるかどうかチェック ---->
			<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_master" method="get_admin_related_user" returnVariable="uRelatedLogin">
				<cfinvokeargument name="admin_user_id" value="#iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de(""))#">
			</cfinvoke>

			<!---- user_logonとmysession情報をクリアするかどうかの判断処理 ---->
			<cfif auFlg eq "A">
				<!---- 管理者画面から来た場合 ---->
				<cfif (uLogin.RecordCount is 1 and uLogin.user_type_id is not 3 and uLogin.user_id neq mysession.login_user_id ) or uLogin.RecordCount is 0 or already_check.RecordCount neq 0 >
					<cfset clearAFlg = true>
				</cfif>
			<cfelse>
				<!---- 学習者画面から来た場合 ---->
				<cfif uLogin.RecordCount is 1 and (uLogin.user_type_id is 3 or uLogin.user_type_id is 4) >

					<!---- 入力されたのは学習者のIDとパスの場合、連携している管理者がいたらクリア ---->
					<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_master" method="get_user_related_admin" returnVariable="aLogin">
						<cfinvokeargument name="user_id" value="#uLogin.user_id#">
					</cfinvoke>
					<cfif aLogin.RecordCount neq 0>
						<cfset clearUFlg = true>
						<cfset clearAFlg = true>
					</cfif>
					<!---- 入力されたのは学習者のIDとパスの場合、連携学習者がいたらクリア ---->
					<cfif uLogin.user_id neq mysession.login_user_id and uRelatedLogin.RecordCount neq 0 >
						<cfset clearUFlg = true>
						<cfset clearAFlg = true>
					</cfif>

				<cfelseif uLogin.RecordCount is 1 and uLogin.user_type_id is not 3 >
					<!---- 入力されたのは管理者のIDとパスの場合、連携している学習者がいたらクリア ---->
					<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_master" method="get_admin_related_user" returnVariable="uNewLogin">
						<cfinvokeargument name="admin_user_id" value="#uLogin.user_id#">
					</cfinvoke>
					<cfif uNewLogin.RecordCount neq 0>
						<cfset clearUFlg = true>
						<cfset clearAFlg = true>
					</cfif>
					<cfif uRelatedLogin.RecordCount neq 0>
						<cfset clearUFlg = true>
						<cfset clearAFlg = true>
					</cfif>
					<!---- 入力されたのは管理者のIDとセッションID違っていたらクリア ---->
					<cfif uLogin.user_id neq mysession.login_user_id >
						<cfset clearUFlg = true>
					</cfif>
				</cfif>
			</cfif>

			<!---- 連携している学習者がいたら、学習者もクリアしていく ---->
			<cfif clearAFlg and uRelatedLogin.RecordCount neq 0>
				<cfset clearUFlg = true>
			</cfif>
			<cfif clearUFlg and uRelatedLogin.RecordCount neq 0>
				<cfset clearAFlg = true>
			</cfif>

			<!---- 管理者情報をクリア ---->
			<cfif clearAFlg >
				<cfset myasid_safe=dao_escape(cookie.MYASID)>
				<cfquery name="q_delete_user" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					select user_id from USER_LOGON where mysid='#PreserveSingleQuotes(myasid_safe)#'
				</cfquery>
				<cfset fn_update_user_logon_log_all(q_delete_user.user_id, REQUEST.remoteAddress)>
				<!---- user_logonをクリア ---->
				<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_logon" method="del_logout_user" returnVariable="retval">
					<cfinvokeargument name="au_flg" value="A">
				</cfinvoke>
				<!---- mysessionクリア ---->
				<cfset mysession.login_user_id = "">
			</cfif>

			<!---- 学習者情報をクリア ---->
			<cfif clearUFlg >
				<!---- user_logonをクリア ---->
				<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_logon" method="del_logout_user" returnVariable="retval">
					<cfinvokeargument name="au_flg" value="U">
				</cfinvoke>
				<!---- mysessionクリア ---->
				<cfset fn_empty_session("U")>
			</cfif>

		<cfelse>
			<!---/////////////////////////////////////////
			認証済みユーザーがまだログインしているかを
			確認して、もしログオフしていたらログイン画面表示
			まだログイン中の場合はUSER_LOGONテーブルの
			logon_timeを更新
			//////////////////////////////////////////--->

			<!--- 二重ログイン判断処理 --->
			<cfif login_mode_admin eq 1>
				<!---  二重ログインモードが1（後ログイン優先モード）の場合 --->
				<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_logon" method="logon_session_chk" returnVariable="retval">
					<cfinvokeargument name="user_id" value="#iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de(""))#">
					<cfinvokeargument name="mysession_id" value="#cookie.MYASID#">
				</cfinvoke>
			<cfelse>
				<!---  二重ログインモードが1以外（前ログイン優先モード）の場合 --->
				<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_logon" method="logon_chk" returnVariable="retval">
					<cfinvokeargument name="user_id" value="#iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de(""))#">
				</cfinvoke>
			</cfif>

			<cfif retval>

				<cflock timeout=200 scope="Session" type="Exclusive">
				<!--- セッション情報からターム関係のオブジェクトがなくなっていたら再度インスタンス化 --->
					<cfif not IsDefined("Session.termObj")>

						<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
						<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de(""))#")>
						<cfset qGetUserInfo = dao_result("#Application.dsn#", Variables.TempSelectObj)>

						<cfobject component="#SERVICE_ADDRESS#.term" name="Session.termObj">
						<cfset mysession.lang_code_admin=fn_termSelect(qGetUserInfo, term_select)>
						<cfset fn_update_lang_code_related(qGetUserInfo.user_id, mysession.lang_code_admin, qGetUserInfo.user_type_id)>
						<cfset Session.termObj.init(mysession.lang_code_admin)>
					</cfif>
				</cflock>

				<cfset mysession_login_user_id_safe=dao_escape(mysession.login_user_id)>
				<cfset mysession_login_user_id_safe=iif(isdefined("mysession_login_user_id_safe"),"mysession_login_user_id_safe",de(""))>
				<cfset mysession_login_user_id_safe=dao_escape(mysession_login_user_id_safe)>
				<cfset cookie_MYASID_safe=dao_escape(cookie.MYASID)>
				<!---<cfset isNumericOrDie(cookie.MYASID)>--->
				<cfquery name="already_check" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					select * from USER_LOGON
					where user_id = '#PreserveSingleQuotes(mysession_login_user_id_safe)#'
					and mysid != '#PreserveSingleQuotes(cookie_MYASID_safe)#'
				</cfquery>

				<cfif already_check.recordcount neq 0 and login_mode_admin eq 0>
					<!--- 同じIDが別の場所からログインされました。 --->
					<cfset variables.err = 3>

				<cfelse>
					<!--- USER_LOGON更新 --->
					<cfset row = structNew()>
					<cfset row.mysid = cookie.MYASID>
					<cfset row.logon_time = dateformat(now() , "yyyy-mm-dd") & ' ' & timeformat(now() , "HH:mm:ss")>
					<cfset temp = dao_update_ex_no_tran(Application.dsn , 'USER_LOGON' , iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de("")) , row , 'user_id')>
				</cfif>

			<cfelse>
				<!---/////////////////////////////////////////
				認証済みユーザーのログイン情報が消えていたら、
				ログイン画面を表示するとともにログオフさせる。
				//////////////////////////////////////////--->
				<cfset variables.err = 3>

			</cfif>
		</cfif>
	</cfif>

	<cfif iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de("")) eq "">
		<!--- ログイン情報が送られてこない。 --->
		<cfif NOT ( IsDefined("form.j_username") and IsDefined("form.j_password") and IsDefined("form.term_select") ) >

			<!--- さらにフォームからのloginUserIdもこない(これはFlashの管理画面から来る。) ここで表示されるのが初期ログイン画面--->
			<cfif not IsDefined("loginUserId")>
				<cfset variables.err = 0>
				<cfreturn variables.err>
			</cfif>

			<!--- フォームからのloginUserIdがきたので、すでにログイン済みかどうかチェック。 --->
			<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_logon" method="logon_chk" returnVariable="retval">
				<cfinvokeargument name="user_id" value="#loginUserId#">
			</cfinvoke>

			<cfif retval>

				<!--- ユーザー情報を取得 --->
				<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
				<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#loginUserId#")>
				<cfset qGetUserInfo = dao_result("#Application.dsn#", Variables.TempSelectObj)>

				<cflock timeout=200 scope="Session" type="Exclusive">
					<!--- 一致したデータが存在した場合は、ログインユーザー情報を設定。さらに、ログインのログの時間を更新。 --->
					<cfset mysession.login_user_id = loginUserId>

					<cfobject component="#SERVICE_ADDRESS#.term" name="Session.termObj">
					<cfset mysession.lang_code_admin=fn_termSelect(qGetUserInfo, term_select)>
					<cfset fn_update_lang_code_related(qGetUserInfo.user_id, mysession.lang_code_admin, qGetUserInfo.user_type_id)>
					<cfset Session.termObj.init(mysession.lang_code_admin)>
				</cflock>

				<cfset row = structNew()>
				<cfset row.mysid = cookie.MYASID>
				<cfset row.logon_time = dateformat(now() , "yyyy-mm-dd") & ' ' & timeformat(now() , "HH:mm:ss")>

				<cfset temp = dao_update_ex_no_tran(Application.dsn , 'USER_LOGON' , loginUserId , row , 'user_id')>

				<!--- LOGON_LOG更新 --->
				<cfset fn_logging_logon(mysession.login_user_id, 1)>

			<cfelse>
				<!--- 一致したデータがないので、ログイン画面に遷移。 --->
				<cfset variables.err = 0>

			</cfif>

		<cfelse>

			<cfset fn_id_remainder(form)>	<!--- ID,パスワードの記録 --->

			<!--- ログイン情報が送られてきた。 --->
			<cfif form.j_username IS "" OR form.j_password IS "">
				<!--- nameかpasswordの情報がない場合はログイン画面を表示 --->
				<cfset variables.err = 1>

			<cfelse>
				<!--- nameとpasswordの両方の情報を持っている場合は、クエリ発行 --->

				<!--- 管理者ログイン画面から来た場合、そのユーザーの情報のみチェック --->
				<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
				<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "logon", "#form.j_username#")>
				<cfset qLogin = dao_result("#Application.dsn#", Variables.TempSelectObj)>

				<cfset userChk = true>
				<cfif auFlg eq "U" and qLogin.RecordCount is 1>
					<!--- 学習者ログイン画面から来た場合、連携している学習者がいるかどうかもチェック --->
					<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_master" method="get_admin_related_user" returnVariable="uLogin">
						<cfinvokeargument name="admin_user_id" value="#qLogin.user_id#">
					</cfinvoke>
					<cfif uLogin.RecordCount eq 0>
						<cfset userChk = false>
					</cfif>
				</cfif>

				<!---LDAP認証 admin側：Spec2, Spec10。認証ロジックの実装だけはしておいた。--->
				<cfif lsObj.get_value("ldap.use_ldap_admin") eq 1>
					<cfset ldap_cert_struct		= StructNew()>
					<cfset ldap.server			= lsObj.get_value("ldap.server")>
					<cfset ldap.cert_info_user	= lsObj.get_value("ldap.cert_info_user")>
					<cfset ldap.account			= lsObj.get_value("ldap.account")>
					<cfset ldap.domain_name		= lsObj.get_value("ldap.domain_name")>
					<cfset ldap_account_arr		= ListToArray(ldap.account, chr(10))>

					<cfloop index="i" from="1" to="#ArrayLen(ldap_account_arr)#">
						<cfset place_at_equal	= Find("=", ldap_account_arr[i])>
						<cfset eLM_item_name	= Trim(Mid(ldap_account_arr[i], 1, place_at_equal-1))>
						<cfset ldap_item_name	= Trim(Mid(ldap_account_arr[i], place_at_equal+1, Len(ldap_account_arr[i])))>
						<cfset ldap_cert_struct["#eLM_item_name#"] = ldap_item_name>
					</cfloop>

					<cfif ldap.domain_name eq "">
						<!--- LDAP --->
						<cfset auth_info.principal = ldap_cert_struct.logon & "=" & form.j_username & "," & ldap.cert_info_user>
					<cfelse>
						<!--- Active Directory --->
						<cfset auth_info.principal = form.j_username & "@" & ldap.domain_name>
					</cfif>
					<cfset auth_info.server		= "ldap://" & ldap.server>
					<cfset auth_info.password	= loc_password>
					<cfset auth_info.secAuth	= "simple">
					<cfset resStruct			= ldap_auth(auth_info)>
					<cfif resStruct.authFlg eq 0>
						<cfset variables.err = 2>
						<cfreturn variables.err>
					</cfif>
					<cfset qLogin.password = loc_password>
				</cfif>
				<!---LDAP認証 admin側終わり：Spec2, Spec10。認証ロジックの実装だけはしておいた。--->

                <cfif qLogin.recordCount neq 0>
                    <cfif umObj.is_on_password_lock()>
                        <cfif qLogin.password neq loc_password and qLogin.user_type_id neq 3>
                            <cfset umObj.incr_n_password_fail(qLogin.user_id) />
                            <cfif umObj.is_over_password_lock_limit(qLogin.user_id, true)>
                                <cfset umObj.lock_account(qLogin.user_id) />
                                <cfset ObjSM.send_alert_password_lock(qLogin.user_id) />
                            </cfif>
                        </cfif>

                        <cfif umObj.is_over_password_lock_limit(qLogin.user_id)>
                            <cfset variables.err = 9 />
                            <cfreturn variables.err />
                        </cfif>
                    </cfif>
                </cfif>

				<cfif userChk and qLogin.RecordCount is 1 and qLogin.user_type_id is not 3 and compare( qLogin.password , loc_password ) eq 0>

                    <cfif qLogin.flag_stop is 1>
                        <cfif umObj.is_on_password_lock() and umObj.is_over_password_lock_limit(qLogin.user_id)>
                            <!--- パスワードロックのときのエラーコードを発行 --->
                            <cfset variables.err = 9 />
                        <cfelse>
                            <!--- 利用停止中ならログイン画面へ --->
                            <cfset variables.err = 4 />
                        </cfif>
                        <cfreturn variables.err />
                    </cfif>

                    <cfif umObj.is_on_password_lock()>
                        <cfset umObj.clear_n_password_fail(qLogin.user_id) />
                        <cfset mysession.latest_logon_date = ullaObj.get_latest_logon_date(qLogin.user_id) />
                    </cfif>

					<!--- 二重ログイン判断処理 --->
					<cfset cookie_MYASID_safe=dao_escape(cookie.MYASID)>
					<!---<cfset isNumericOrDie(cookie.MYASID)>--->
					<cfquery name="already_check" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
						select * from USER_LOGON
						where user_id = '#qLogin.user_id#'
						and mysid != '#PreserveSingleQuotes(cookie_MYASID_safe)#'
					</cfquery>

					<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_logon" method="logon_chk" returnVariable="retval">
						<cfinvokeargument name="user_id" value="#qLogin.user_id#">
					</cfinvoke>

					<cfif retval and already_check.recordcount neq 0 and login_mode_admin eq 0>
						<!--- 前ログイン優先モードでかつほかの場所でログインされている場合、ログイン画面でエラーメッセージを表示する。 --->
						<cfset variables.err = 5>

					<cfelse>
						<!--- タームコード周りの処理 --->
						<cflock timeout=200 scope="Session" type="Exclusive">
						<!--- 一致したデータが存在した場合は、セッション情報を設定 --->
							<cfset mysession.login_user_id = qLogin.user_id>

							<cfobject component="#SERVICE_ADDRESS#.term" name="Session.termObj">
							<cfset mysession.lang_code_admin=fn_termSelect(qLogin, term_select)>
							<cfset fn_update_lang_code_related(qLogin.user_id, mysession.lang_code_admin, qLogin.user_type_id)>
							<cfset Session.termObj.init(mysession.lang_code_admin)>
						</cflock>

						<!--- 後ログイン優先時の蹴りだされ時刻の記録 --->
						<cfset check_user_id_safe=dao_escape(mysession.login_user_id)>
						<cfquery name="q_not_login" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
							select count(*) as count from USER_LOGON where user_id='#PreserveSingleQuotes(check_user_id_safe)#'
						</cfquery>
						<cfif q_not_login.count eq 1>
							<cfset fn_update_user_logon_log_all(qLogin.user_id, REQUEST.remoteAddress)>

							<!--- 連携している学習者のログアウト時刻記録 --->
							<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_master" method="get_admin_related_user" returnVariable="uLogin">
								<cfinvokeargument name="admin_user_id" value="#qLogin.user_id#">
							</cfinvoke>

							<cfif uLogin.recordcount eq 1>
								<cfset fn_update_user_logon_log_all_related(uLogin.user_id, REQUEST.remoteAddress, 'user')>
							</cfif>
						</cfif>
						<!--- 該当管理者のログインログが残っている場合は削除 --->
						<cfset temp = dao_delete_ex(Application.dsn , 'USER_LOGON' , qLogin.user_id , 'user_id')>

						<!--- ログインログを作成 --->
						<cfset row = structNew()>
						<cfset row.mysid = cookie.MYASID>
						<cfset row.user_id = qLogin.user_id>
						<cfset row.course_id = '0'>
						<cfset row.logon_time = dateformat(now() , "yyyy-mm-dd") & ' ' & timeformat(now() , "HH:mm:ss")>

						<cfset temp = dao_insert_ex(Application.dsn , 'USER_LOGON' , row , 'user_id')>

						<!--- LOGON_LOG更新 --->
						<cfset fn_logging_logon(mysession.login_user_id, 1)>
					</cfif>

				<cfelse>
					<!--- 一致したデータが無い場合は、ログイン画面をそのまま出すことにする(ついでにログアウトさせる) --->
					<cfset variables.err = 2>

				</cfif>
			</cfif>
		</cfif>
	</cfif>

	<cfif variables.err neq "" >
		<cfreturn variables.err>
	</cfif>

	<cfif iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de("")) is not "">
		<cflogout>
		<cflogin>
		<cfloginuser
			name="#mysession.login_user_id#"
			Password = ""
			roles="">
		</cflogin>
	</cfif>
	<cfset fn_session_commit()>

	<!--- 管理者が連携している学習者がいたら同時ログイン--->
	<cfif iif(isdefined("mysession.login_user_id"),"mysession.login_user_id",de("")) is not "">

		<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_master" method="get_admin_related_user" returnVariable="uLogin">
			<cfinvokeargument name="admin_user_id" value="#mysession.login_user_id#">
		</cfinvoke>

		<cfif uLogin.recordcount eq 1>
			<!--- 学習者セッション情報を設定 --->

			<cfset mysession_loaded = false>
			<cfset cookie_name="MYUSID">
			<cfif IsDefined('mysession.lang_code_admin') and mysession.lang_code_admin neq "">
				<cfset lang_code_related = mysession.lang_code_admin>
			<cfelseif IsDefined('mysession.lang_code_user') and mysession.lang_code_user neq "">
				<cfset lang_code_related = mysession.lang_code_user>
			</cfif>
			<cfset fn_session_start()>

			<!--- ログインログを作成 --->
			<cfset row = structNew()>
			<cfset row.mysid = cookie.MYUSID>
			<cfset row.user_id = uLogin.user_id>
			<cfset row.course_id = '0'>
			<cfset row.logon_time = dateformat(now() , "yyyy-mm-dd") & ' ' & timeformat(now() , "HH:mm:ss")>

			<cfquery name="already_logon_check" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				select * from USER_LOGON
				where user_id = '#row.user_id#'
				and mysid = '#row.mysid#'
			</cfquery>

			<cfset temp = dao_put('USER_LOGON' , row , 'user_id')>

			<cfif already_logon_check.recordcount eq "0">
				<!--- LOGON_LOG更新 --->
				<cfset fn_logging_logon(uLogin.user_id, 1)>
			</cfif>

			<cfset mysession.login_user_id = uLogin.user_id>
			<cfset mysession.lang_code_user = lang_code_related>
			<cfset mysession.lang_code_admin = lang_code_related>
			<cfset fn_session_commit()>

			<cfset cookie_name="MYASID">
			<cfset mysession.login_user_id = uLogin.admin_id>

		</cfif>
	</cfif>

	<cfreturn variables.err>

</cffunction>

<!---
タームコードがdefaultの場合はuser_infoの
lang_codeをリターン
defaultではない場合は、
タームコードを保存してそのままリターン
--->
<cffunction name="fn_termSelect" output="No" returntype="string">
	<cfargument name="user_info" type="query" required="yes">
	<cfargument name="term_code" type="string" required="yes">

	<cfset var row = structNew()>
	<cfset var chk_code = "">

	<cfif arguments.term_code is 'default'>
		<cfreturn arguments.user_info.lang_code>
	<cfelse>
		<cfset tmObj = createObject("component", Application.SERVICE_ADDRESS & '.table_term_master')>
		<cfif StructKeyExists(cookie, "lang_code")>
			<cfset chk_code	= tmObj.check_and_get_lang_code(cookie.lang_code)>
			<cfif cookie.lang_code eq chk_code>
				<cfreturn cookie.lang_code>
			</cfif>
		</cfif>
		<cfset row.lang_code = tmObj.check_and_get_lang_code(term_code)>
		<cfset dao_update_ex_no_tran(Application.dsn , 'USER_MASTER' , arguments.user_info.user_id , row , 'user_id')>
		<cfset ReleaseComObject(tmObj)>
		<cfreturn row.lang_code>
	</cfif>

</cffunction>

<!--- ログイン履歴記録 (追加 20070205 tanaka) --->
<cffunction name="fn_logging_logon" access="private" output="no" returntype="void">
	<cfargument name="UserID" type="numeric">
	<cfargument name="AUflg" type="numeric">
	<cfset var CGI_REMOTE_ADDR_safe=dao_escape(REQUEST.remoteAddress)>

<!--- ログインIPと日時を追加する --->
<!--- ここでは GetAuthUser()を使わずに UserID を使ってユーザー情報を取得 --->
	<cfset now = now()>
	<cfquery name="user_log" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
		INSERT INTO USER_LOGON_LOG_ALL (user_id, logon_ip, logon_date, logout_date)
		VALUES ('#UserID#', '#PreserveSingleQuotes(CGI_REMOTE_ADDR_safe)#', '#dateformat(now,"YYYY-MM-DD")# #timeformat(now,"H:m:s")#', '#dateformat(now,"YYYY-MM-DD")# #timeformat(now,"H:m:s")#');
	</cfquery>

	<!--- 当該ユーザーのログイン履歴があるかチェック --->
	<cfset Variables.TempSelectObj = dao_select("USER_LOGON_LOG")>
	<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#UserID#")>
	<cfset q_get_logon_log = dao_result("#application.DSN#", Variables.TempSelectObj)>

	<cfif AUflg eq 0>
		<!--- ユーザからきた場合--->
		<cfset com = "user/#Application.SqlStringComponent#">
	<cfelse>
		<!--- 管理者からきた場合--->
		<cfset com = "admin/#Application.SqlStringComponent#">
	</cfif>

	<cfif q_get_logon_log.recordcount gt 0>

		<!--- ログイン履歴がある場合は履歴更新 --->
		<cfinvoke component = "#com#" method="login_chk_cfm_001" returnVariable="__TempQueryString">
			<cfinvokeargument name="arg001" value="#UserID#">
		</cfinvoke>
		<cfquery name="logging_update" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			#PreserveSingleQuotes(Variables.__TempQueryString)#
		</cfquery>
	<cfelse>
		<!--- ログイン履歴がない場合は履歴作成 --->
		<cfinvoke component = "#com#" method="login_chk_cfm_002" returnVariable="__TempQueryString">
			<cfinvokeargument name="arg001" value="#UserID#">
		</cfinvoke>
		<cfquery name="logging_insert" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			#PreserveSingleQuotes(Variables.__TempQueryString)#
		</cfquery>
	</cfif>
</cffunction>

<cffunction name="fn_update_user_logon_log_all">
	<cfargument name="user_id" type="string" required="yes">
	<cfargument name="logon_ip" type="string" required="yes">

	<cfset var now = now()>
	<cfset var user_id_safe=dao_escape(user_id)>
	<cfset var logon_ip_safe=dao_escape(logon_ip)>

	<cfif user_id eq ''>
		<cfreturn false>
	</cfif>

	<cfquery name="q_max_serial" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
		select max(serial) as serial from USER_LOGON_LOG_ALL where user_id='#PreserveSingleQuotes(user_id_safe)#'
	</cfquery>

	<cfif q_max_serial.serial neq ''>
		<cfquery name="q_update_user_logon_log_all" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			update	USER_LOGON_LOG_ALL
			set logon_ip='#PreserveSingleQuotes(logon_ip_safe)#', logout_date=#now#
			where user_id='#PreserveSingleQuotes(user_id_safe)#'
				and serial=#q_max_serial.serial#
		</cfquery>
	</cfif>

	<cfreturn true>
</cffunction>

<cffunction name="fn_update_user_logon_log_all_related">
	<cfargument name="user_id" type="string" required="yes">
	<cfargument name="logon_ip" type="string" required="yes">
	<cfargument name="au_flag" type="string" required="yes">

	<cfif au_flag eq 'admin'>
		<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_master" method="get_admin_related_user" returnVariable="u_login">
			<cfinvokeargument name="admin_user_id" value="#user_id#">
		</cfinvoke>
		<cfif u_login.RecordCount neq 0>
			<cfset fn_update_user_logon_log_all(u_login.user_id, logon_ip)>
		</cfif>
	<cfelse>
		<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_master" method="get_user_related_admin" returnVariable="a_login">
			<cfinvokeargument name="user_id" value="#user_id#">
		</cfinvoke>
		<cfif a_login.RecordCount neq 0>
			<cfset fn_update_user_logon_log_all(a_login.user_id, logon_ip)>
		</cfif>
	</cfif>
	<cfset fn_update_user_logon_log_all(user_id, logon_ip)>
</cffunction>

<cffunction name="fn_getVirtualPath">
	<cfargument name="url" type="string" required="yes">
	<cfset vpath = REReplaceNoCase(url, "^https?\:\/\/[^/]+", "")>
	<cfreturn vpath>
</cffunction>

<cffunction name="fn_requestend">
	<cfinclude template="OnRequestEnd.cfm">
	<cfabort>
</cffunction>

<cffunction name="getLabel">
	<cfargument name="labelType" type="string" required="yes">
	<cfargument name="value" type="string" required="yes">
	<cfset var labelType_safe=dao_escape(labelType)>
	<cfset var value_safe=dao_escape(value)>
	<cfquery name="label" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
		select label_value from LABEL_MASTER where label_type='#PreserveSingleQuotes(labelType_safe)#' and label_key='#PreserveSingleQuotes(value_safe)#'
	</cfquery>
	<cfreturn label.label_value>
</cffunction>

<cffunction name="getURLParameters">
	<cfargument name="paramStruct" required="yes">
	<cfset str="">
	<cfloop collection="#paramStruct#" item="item">
		<cfset str = str & "&#item#=#paramStruct[item]#">
	</cfloop>
	<cfreturn str>
</cffunction>

<!--- タームを簡単に使えるようにするためのエイリアス --->
<cffunction name="t" output="no">
	<cfargument name="term_code" required="yes">
	<cfparam name="term_path" default="">
	<cfreturn Session.termObj.get_term(term_path & term_code)>
</cffunction>

<!--- Sessionの有無でタームの呼び出しを切り替える --->
<cffunction name="fn_session_get_term" output="no">
	<cfargument name="term_code" required="yes">
	<cfargument name="embed_params" required="no">
	<cfset var lang_code = ''>
	<cfset var lsObj = ''>
	<cfset var termObj = ''>

	<cfif not isDefined("Session.termObj")>
		<cfobject component="#SERVICE_ADDRESS#.table_lms_setting" name="lsObj">
		<cfobject component="#SERVICE_ADDRESS#.term" name="termObj">
		<cfset lang_code = getDefaultLangCode()>
		<cfset termObj.init(lang_code)>
		<cfset Session.termObj = termObj >
	</cfif>

	<cfif IsDefined('embed_params')>
		<!--- 埋め込める変数はとりあえず1つだけを仮定。増やしたければget_termの引数を配列か構造体に変える --->
		<cfreturn Session.termObj.get_term(term_code, embed_params)>
	<cfelse>
		<cfreturn Session.termObj.get_term(term_code)>
	</cfif>
</cffunction>

<cffunction name="getUserTypeID">
	<cfquery name="user" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
		select user_type_id from USER_MASTER where user_id = '#GetAuthUser()#'
	</cfquery>
	<cfreturn user.user_type_id>
</cffunction>

<!--- PathやURLから不要な/を削除 --->
<cffunction name="del_extra_slash" access="public">
	<cfargument name="arg_string" type="string" required="true">

	<cfset temp_string = arg_string>

	<cfset temp_string = replace(temp_string,"://",":\\")>

	<cfset temp_string = replace(temp_string, "////", "/", "all")>
	<cfset temp_string = replace(temp_string, "///", "/", "all")>
	<cfset temp_string = replace(temp_string, "//", "/", "all")>

	<cfset temp_string = replace(temp_string, ":\\", "://")>

	<cfreturn temp_string>
</cffunction>

<!---
半角文字の幅をwidth、全角文字の幅を１として打ち出すLeft関数をexLeftと命名
--->
<cffunction name="exLeft" output="no">
	<cfargument name="name">
	<cfargument name="maxnum">
	<cfargument name="width" default="0.5">
	<cfset num = #CountNumber(name,width)#>
	<cfset len = Len(name)>
	<cfset flag = 0>

	<cfif num GT maxnum >
		<cfloop index = "i"   from = "1"   to = #len#   step = "1">
		<cfset rename = Left(name, len - 1)>
		<cfif #CountNumber(rename,width)# LESS THAN OR EQUAL TO maxnum>
			<cfreturn rename>
		</cfif>
		</cfloop>
	<cfelse>
	<cfreturn name>
	</cfif>
</cffunction>

<!---
半角全角を区別するCountNumber関数
半角文字、半角スペース、すべての句読記号文字
(! # S % & ` ( ) * + , - . / : ; < = > ? @ [ / ] ^ _ { | } )はwidthでカウント
--->
<cffunction name="CountNumber" access="private" output="no" >
	<cfargument name="argname">
	<cfargument name="width">
	<cfset num = 0>
	<cfset len = Len(argname)>

	<cfloop   index = "i"   from = "1"   to = #len#   step = "1">
	<cfif #REFind("[mMW]", "#Mid(argname, i, 1)#")# is 1>
		<cfset num = num + width + 0.3>
	<cfelseif #REFind("[w]", "#Mid(argname, i, 1)#")# is 1>
		<cfset num = num + width + 0.2>
	<cfelseif #REFind("[a-z0-9 ]", "#Mid(argname, i, 1)#")# is 1>
		<cfset num = num + width - 0.1>
	<cfelseif #REFind("[A-Z]", "#Mid(argname, i, 1)#")# is 1>
		<cfset num = num + width + 0.15>
	<cfelseif #REFind("[ぁ-ぉァ-ォっッゃ-ょャ-ョ]", "#Mid(argname, i, 1)#")# is 1>
		<cfset num = num + width + 0.3>
	<cfelseif #REFind("[[:punct:]]", "#Mid(argname, i, 1)#")# is 1>
		<cfset num = num + width>
	<cfelse>
		<cfset num = num + 1>
	</cfif>
	</cfloop>
	<cfreturn num>
</cffunction>

<!---
QuotedCSV 出力用
--->
<cffunction name = "double_quote" output="no">
	<cfargument name="value" require="true">
	<cfset value = replace(value,"""","""""","all")>
	<cfset value = """" & value & """">
	<cfreturn value>
</cffunction>

<cfscript>
   function fn_unzipFile(zipFilePath, outputPath) {

       var zipFile = ""; // ZipFile
       var entries = ""; // Enumeration of ZipEntry
       var entry = ""; // ZipEntry
       var fil = ""; //File
       var filOutStream = "";
       var bufOutStream = "";
       var nm = "";
       var pth = "";
       var lenPth = "";

       ////zipFile = createObject("java", "java.util.zip.ZipFile");
	   zipFile = createObject("java", "org.apache.tools.zip.ZipFile");
       zipFile.init(zipFilePath);

       ////entries = zipFile.entries();
	   entries = zipFile.getEntries();

       while(entries.hasMoreElements()) {
           entry = entries.nextElement();

           if(NOT entry.isDirectory()) {
               nm = entry.getName();

               lenPth = len(nm) - len(getFileFromPath(nm));

               if (lenPth) {
                   pth = outputPath & left(nm, lenPth);
                } else {
                   pth = outputPath;
                }

               if (NOT directoryExists(pth)) {
                   fil = createObject("java", "java.io.File");
                   fil.init(pth);
                   fil.mkdirs();
                }

               filOutStream = createObject(
                  "java",
                  "java.io.FileOutputStream");

               filOutStream.init(outputPath & nm);

               bufOutStream = createObject(
                  "java",
                  "java.io.BufferedOutputStream");

               bufOutStream.init(filOutStream);

               copyInputStream(
                  zipFile.getInputStream(entry),
                  bufOutStream);
            }
        }

       zipFile.close();
    }

    function copyInputStream(inStream, outStream) {

       var buffer = repeatString(" ",1024).getBytes();
       var l = inStream.read(buffer);

       while(l GTE 0) {
           outStream.write(buffer, 0, l);
           l = inStream.read(buffer);
        }
       inStream.close();
       outStream.close();
    }

   function fn_unzip4jFile(zipFilePath, outputPath) {

		var zipFile = ""; // ZipFile
		zipFile = createObject('java', 'net.lingala.zip4j.core.ZipFile').init(zipFilePath); 
		//zipFile.setFileNameCharset("Windows-31J");
	    zipFile.extractAll(outputPath);
	    
    }
</cfscript>

<!--- タスクの実行ログを残す/過去100件のみ --->
<cffunction name="task_log">
	<cfargument name="taskName">
	<cfif not isDefined("Application.task_log." & taskName)>
		<cfset Application.task_log[taskName] = ArrayNew(1)>
	</cfif>
	<cfset ArrayAppend(Application.task_log[taskName],now())>
	<cfloop condition = "arrayLen(Application.task_log[taskName]) gt 100">
		<cfset arrayDeleteAt(Application.task_log[taskName],1)>
	</cfloop>
</cffunction>

<!---////////////////////////////////////////
関数名	operating_log
引数1	なし
戻り値	なし
説明	/logsにログを書き出す
/////////////////////////////////////////--->
<cffunction name="operating_log">
	<cfset log_cont_after=ArrayNew(1)>	<!---追加項目のうち、後方一致用の配列--->
	<cfset log_cont_after[1]="id">
	<cfset log_cont_after[2]="no">

	<cfset log_cont=ArrayNew(1)>	<!---追加項目用の配列--->
	<cfset log_cont[1]="cont">
	<cfset log_cont[2]="cont2">
	<cfset log_cont[3]="count">
	<cfset log_cont[4]="hdnControl">
	<cfset log_cont[5]="mode">
	<cfset log_cont[6]="serial">
	<cfset log_cont[7]="status">

	<!---書き出し必須項目--->
	<cfset host_name="#CGI.HTTP_HOST#">
	<cfset script_name="#CGI.SCRIPT_NAME#">
	<cfset temp_cgi_query_string="#CGI.QUERY_STRING#">
	<cfset now_login_user = GetAuthUser()>
	<cfif temp_cgi_query_string eq "">
		<cfset query_script_name="">
	<cfelse>
		<cfset query_script_name="?#CGI.QUERY_STRING#">
	</cfif>
	<cfset url_name="http://#host_name##script_name##query_script_name#">
	<cfset access_IP=#REQUEST.remoteAddress#>
	<cfset txt_prereq="USER_ID;#now_login_user#,IP;#access_IP#,URL;#url_name#">

	<cfset txt="">	<!---ログに入れるテキストの保管庫--->

	<!---あとでidとnoの書き出し用に使う--->
	<cfset arr_form_key_name=StructKeyArray(form)>
	<cfset len_arr_form_key=ArrayLen(arr_form_key_name)>
	<cfset arr_url_key_name=StructKeyArray(url)>
	<cfset len_arr_url_key=ArrayLen(arr_url_key_name)>

	<cfloop index="i" from="1" to="#ArrayLen(log_cont_after)#">	<!---後方一致項目、idとnoの切り出し--->
		<cfloop index="j" from="1" to="#len_arr_form_key#">	<!---送られてくる構造体のうち、まずformから調査。form.内に書き出したい項目があるか？--->
			<cfset last_two_char=Right(arr_form_key_name[j], 2)>	<!---指示された条件、後方一致を調べるために後ろの二文字（idもしくはno）を切り出す--->
			<cfif REFindNoCase("#log_cont_after[i]#", "#last_two_char#") is not 0>
				<cfset temp_txt=StructFindKey(#form#, "#arr_form_key_name[j]#")>
				<cfset txt="#txt##Mid('#temp_txt[1].path#', 2, Len(temp_txt[1].path))#;#temp_txt[1].value#,">
			</cfif>
		</cfloop>
		<cfloop index="j" from="1" to="#len_arr_url_key#">	<!---送られてくる構造体のうち、urlを調査。url.内に書き出したい項目があるか？--->
			<cfset last_two_char=Right(arr_url_key_name[j], 2)>
			<cfif REFindNoCase("#log_cont_after[i]#", "#last_two_char#") is not 0>
				<cfset temp_txt=StructFindKey(#url#, "#arr_url_key_name[j]#")>
				<cfset txt="#txt##Mid('#temp_txt[1].path#', 2, Len(temp_txt[1].path))#;#temp_txt[1].value#,">
			</cfif>
		</cfloop>
	</cfloop>
	<cfloop index="i" from="1" to="#ArrayLen(log_cont)#">	<!---id、no、IP、URL以外--->
		<cfset temp_struct=StructFindKey(#form#, "#log_cont[i]#")>
		<cfif #ArrayIsEmpty(temp_struct)# is false>
			<cfset temp_txt=StructFindKey(#form#, "#log_cont[i]#")>
			<cfset txt="#txt##Ucase(Mid('#temp_txt[1].path#', 2, Len(temp_txt[1].path)))#;#temp_txt[1].value#,">	<!---#temp_txt[1].path#だけだと、たとえば.contのようにはじめにピリオドが入ってしまう。Midはそれを切っただけ。--->
		</cfif>
		<cfset temp_struct=StructFindKey(#url#, "#log_cont[i]#")>
		<cfif #ArrayIsEmpty(temp_struct)# is false>
			<cfset temp_txt=StructFindKey(#url#, "#log_cont[i]#")>
			<cfset txt="#txt##Ucase(Mid('#temp_txt[1].path#', 2, Len(temp_txt[1].path)))#;#temp_txt[1].value#,">
		</cfif>
	</cfloop>
	<cfset txt="#txt##txt_prereq#">	<!---USER_ID、IP、URLを書き出し--->
	<cflog file="operation" application="yes" text="#txt#">
</cffunction>

<!---////////////////////////////////////////
関数名	audit_log
引数1	なし
戻り値	なし
説明	/監査証跡ログを書き出す
利用例： target_idには文字列と配列両方使用可能
<cfset log_id_ary = ArrayNew(1)>
<cfset dummy = ArrayAppend(log_id_ary, user_id)>
<cfset audit_log(now_login_user, "add", "user", user_id)>
<cfset audit_log(now_login_user, "edit", "user", log_id_ary)>
/////////////////////////////////////////--->
<cffunction name="audit_log">
	<cfargument name="admin_id" default="" >
	<cfargument name="action_type" default="" >
	<cfargument name="target_type" default="" >
	<cfargument name="target_id" >

	<cfset txt="">	<!---ログに入れるテキストの保管庫--->
	<cfset target_id_list ="">

	<cfif not IsArray(target_id) >
		<cfset target_id_list = target_id >
	<cfelse>
		<cfset target_id_list = ArrayToList(target_id, ',') >
	</cfif>

	<cfif target_id_list is not "" >
		<cfset txt="admin_id:[#admin_id#]">
		<cfset txt="#txt#" & chr(9) & "action_type:[#action_type#]">
		<cfset txt="#txt#" & chr(9) & "target_type:[#target_type#]">
		<cfset txt="#txt#" & chr(9) & "target_id:[#target_id_list#]">
		<cflog file="audit" application="yes" text="#txt#">
	</cfif>

</cffunction>

<!---////////////////////////////////////////
関数名	output_title
引数1	なし
戻り値	string
説明	htmlのtitle用の文字列を書き出す
/////////////////////////////////////////--->
<cffunction name="output_title">
	<cfargument name="lang_code">

	<cfobject component="#SERVICE_ADDRESS#.term" name="termObj">
	<cfset termObj.init(lang_code)>
	<cfreturn termObj.get_term('wholeTitle:ja=eLearning Manager 4U')>
</cffunction>

<!---
関数名	fn_update_lang_code_related
引数1	user_id
引数2	lang_code
戻り値	なし
説明	連携ユーザの言語と連携管理者の言語を一致させる
--->
<cffunction name="fn_update_lang_code_related">
	<cfargument name="user_id">
	<cfargument name="lang_code">
	<cfargument name="user_type_id">
	<cfargument name="flag_login_chk" default="0">

	<cfset var related_user_id = "">
	<cfset var update_flag = 0>
	<cfset var q_set_lang_code = "">
	<cfset var lang_code_safe	= dao_escape(lang_code)>

	<cfif arguments.user_type_id eq 3>
		<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_master" method="get_user_related_admin" returnVariable="aLogin">
			<cfinvokeargument name="user_id" value="#arguments.user_id#">
		</cfinvoke>
		<cfset related_user_id = aLogin.user_id>
		<cfset update_flag = aLogin.recordCount>
	<cfelse>
		<cfinvoke component="#application.SERVICE_ADDRESS#.table_user_master" method="get_admin_related_user" returnVariable="uLogin">
			<cfinvokeargument name="admin_user_id" value="#arguments.user_id#">
		</cfinvoke>
		<cfset related_user_id = uLogin.user_id>
		<cfset update_flag = uLogin.recordCount>
	</cfif>

	<cfif update_flag eq 1>
		<cfquery name="q_set_lang_code" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			UPDATE	USER_MASTER
			SET		lang_code = '#PreserveSingleQuotes(lang_code_safe)#'
			WHERE	user_id = #related_user_id#
		</cfquery>
	</cfif>

	<cfif flag_login_chk eq 1>
		<cfset isNumericOrError(arguments.user_id)>
		<cfquery name="q_set_lang_code" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			UPDATE	USER_MASTER
			SET		lang_code = '#PreserveSingleQuotes(lang_code_safe)#'
			WHERE	user_id = #arguments.user_id#
		</cfquery>
	</cfif>

	<cfreturn update_flag>
</cffunction>

<!---
関数名	ldap_auth
引数1	auth_info
戻り値	ログイン成否フラグauthFlgと、失敗時のStackTraceからなる構造体。
説明	ActiveDirectoryとのログイン認証用関数。適切な場所にLdapAuthを含むjarファイルを置く必要がある。
--->
<cffunction name="ldap_auth">
	<cfargument name="auth_info">
	<cfset var resStruct = StructNew()>

	<cfset resStruct.authFlg = "">
	<cfset resStruct.stackTrace = "">
	<cfset ldapAuthObj = CreateObject("java", "LdapAuth")>
	<cfset ldapAuthObj.init()>
	<cfset ldapAuthObj.setData(auth_info.server, auth_info.principal, auth_info.password, auth_info.secAuth)>
	<cfset ldapAuthObj.runAuth()>
	<cfset resStruct.authFlg = ldapAuthObj.authFlg>
	<cfset resStruct.stackTrace = ldapAuthObj.strStackTrace>
	<cfreturn resStruct>
</cffunction>

<!--- For CSRF --->
<cfif lsObj.get_value("csrf.use")>
	<cfset csrf_redirect(cgi.HTTP_REFERER, cgi.SCRIPT_NAME)>
</cfif>

<!--- Application.cfmは設定ファイルとして使うのでここに書く --->
<cfset fn_session_start()>
<!--- 言語選択プルダウンでの言語変更用ロジック。2010/02/19/時点で学習者にしかないので、そのつもりで書いたロジック。 --->
<cfif IsDefined('lang_select') and lang_select neq "-">
	<cfquery name="qGetUserInfo" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
		SELECT user_id, user_type_id, lang_code FROM USER_MASTER WHERE user_id = #GetAuthUser()#
	</cfquery>
	<cfset mysession.lang_code_user = fn_termSelect(qGetUserInfo, lang_select)>
	<cfset update_flag = fn_update_lang_code_related(qGetUserInfo.user_id, mysession.lang_code_user, qGetUserInfo.user_type_id)>
	<cfif update_flag eq 1>
		<cfset mysession.lang_code_admin = mysession.lang_code_user>
	</cfif>
	<cfset Session.termObj.init(mysession.lang_code_user)>
	<cfset fn_session_commit()>
</cfif>
