<cfprocessingdirective pageencoding="UTF-8">
<cfsetting enablecfoutputonly="yes" requestTimeOut="3600">

<cfinclude template="menu.cfm">
<cfset menu.setCode("user")>

<!---///////////////////////////////////////
インクルード
////////////////////////////////////////--->
<cfinclude template="../../function.cfm">

<!---///////////////////////////////////////
ユーザー認証
////////////////////////////////////////--->
<cfinclude template="../../login_chk.cfm">

<!---///////////////////////////////////////
コントローラ
////////////////////////////////////////--->
<cfparam name="mode" default="init">
<cfset variables.mode = mode>

<cfparam name="from" default="">
<cfset variables.from = from>

<cfif IsDefined("form.BACK2U")>
	<cfset variables.mode = 'u'>
</cfif>

<cfif IsDefined("form.BACK2UR")>
	<cfset variables.mode = 'ur'>
</cfif>

<cfif IsDefined("form.BACK2UR2")>
	<cfset variables.mode = 'ur2'>
</cfif>

<cfif IsDefined("form.BACK2UR2H")>
	<cfset variables.mode = 'ur2h'>
</cfif>

<cfif IsDefined("form.BACK2C")>
	<cfset variables.mode = 'c'>
</cfif>
<cfif variables.mode eq 'BACK2C'>
	<cfset variables.mode = 'c'>
</cfif>

<cfif IsDefined("form.BACK2S")>
	<cfset variables.mode = 's'>
</cfif>
<cfif variables.mode eq 'BACK2S'>
	<cfset variables.mode = 's'>
</cfif>

<cfif IsDefined("form.BACK2CR")>
	<cfset variables.mode = 'cr'>
</cfif>

<cfif IsDefined("form.BACK2SR")>
	<cfset variables.mode = 'sr'>
</cfif>

<cfif IsDefined("form.BACK2CR2")>
	<cfset variables.mode = 'cr2'>
</cfif>

<cfif IsDefined("form.BACK2CR2H")>
	<cfset variables.mode = 'cr2h'>
</cfif>

<cfif IsDefined("form.BACK2CG")>
	<cfset variables.mode = 'cg'>
</cfif>

<cfif variables.mode eq	'BACK2CG'>
	<cfset variables.mode = 'cg'>
</cfif>

<cfif IsDefined("form.BACK2SG")>
	<cfset variables.mode = 'sg'>
</cfif>

<cfif variables.mode eq	'BACK2SG'>
	<cfset variables.mode = 'sg'>
</cfif>

<cfparam name="Session.result_graph_u" default="none">
<cfif IsDefined("form.graph_u")>
	<cfset Session.result_graph_u = form.graph_u>
</cfif>
<cfif IsDefined("url.graph_u")>
	<cfset Session.result_graph_u = url.graph_u>
</cfif>

<cfparam name="Session.result_graph_c" default="none">
<cfif IsDefined("form.graph_c")>
	<cfset Session.result_graph_c = form.graph_c>
</cfif>
<cfif IsDefined("url.graph")>
	<cfset Session.result_graph_c = url.graph>
</cfif>

<cfparam name="Session.result_graph_s" default="none">
<cfif IsDefined("form.graph_s")>
	<cfset Session.result_graph_s = form.graph_s>
</cfif>
<cfif IsDefined("url.graph")>
	<cfset Session.result_graph_s = url.graph>
</cfif>

<!---///////////////////////////////////////
変数初期化
////////////////////////////////////////--->
<cfparam name="u_count" default="1">
<cfset variables.u_count = u_count>

<cfparam name="ur_count" default="1">
<cfset variables.ur_count = ur_count>

<cfparam name="ur2_count" default="1">
<cfset variables.ur2_count = ur2_count>

<cfparam name="c_count" default="1">
<cfset variables.c_count = c_count>

<cfparam name="cr_count" default="1">
<cfset variables.cr_count = cr_count>

<cfparam name="cr2_count" default="1">
<cfset variables.cr2_count = cr2_count>

<cfparam name="status" default="">
<cfset variables.status = status>

<cfset now_login_user = GetAuthUser()>

<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id" , #now_login_user#)>
<cfset admin_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
<cfset bg_color = "##E4E4E4">
<cfset user_type_id = getUserTypeID() />

<!---///////////////////////////////////////
パラメータ
////////////////////////////////////////--->
<cfset params = StructNew()>
<cfset params_add_mode = StructNew()>
<cfset params_for_search = StructNew()>
<cfset params_for_status = StructNew()>

<cfif not isDefined("Session.report3")>
	<cfset Session.report3 = structNew()>
	<cfset Session.report3.u_search_word = ''>
	<cfset Session.report3.u_search_group = ''>
	<cfset Session.report3.u_search_course = ''>
	<cfset Session.report3.c_search_word = ''>
	<cfset Session.report3.c_search_label = ''>
	<cfset Session.report3.c_search_group = ''>
</cfif>

<cfparam name="c_search_label" default="">
<cfset variables.c_search_label = c_search_label>

<cfparam name="c_search_group" default="">
<cfset variables.c_search_group = c_search_group>

<cfparam name="c_search_word" default="">
<cfset variables.c_search_word = c_search_word>

<cfif IsDefined("form.c_search_clear") or variables.mode is "u">
	<cfset variables.c_search_label = "">
	<cfset variables.c_search_group = "">
	<cfset variables.c_search_word = "">
	<cfset Session.report3.c_search_word = "">
	<cfset Session.report3.c_search_group = "">
	<cfset Session.report3.c_search_label = "">
</cfif>

<cfif IsDefined("form.c_search_graoh_clear")>
	<cfset variables.c_search_group = "">
	<cfset variables.c_search_label = "">
	<cfset variables.c_search_word = "">
</cfif>

<cfparam name="u_search_word" default="">
<cfset variables.u_search_word = u_search_word>

<cfparam name="u_search_group" default="">
<cfset variables.u_search_group = u_search_group>

<cfparam name="u_search_course" default="">
<cfset variables.u_search_course = u_search_course>

<cfparam name="u_search_val1" default="">
<cfset variables.u_search_val1 = u_search_val1>

<cfif IsDefined("form.u_search")>
	<cfset Session.report3.u_search_word = u_search_word>
	<cfset Session.report3.u_search_group = u_search_group>
	<cfset Session.report3.u_search_course = u_search_course>
</cfif>

<cfif IsDefined("form.c_search")>
	<cfset Session.report3.c_search_word = c_search_word>
	<cfset Session.report3.c_search_label = c_search_label>
	<cfset Session.report3.c_search_group = c_search_group>
</cfif>

<cfif IsDefined("form.u_search_clear") or variables.mode is "c">
	<cfset variables.u_search_word = "">
	<cfset variables.u_search_group = "">
	<cfset variables.u_search_course = "">
	<cfset variables.u_search_val1 = "">
	<cfset Session.report3.u_search_word = u_search_word>
	<cfset Session.report3.u_search_group = u_search_group>
	<cfset Session.report3.u_search_course = u_search_course>
</cfif>

<!---///////////////////////////////////////
コンポーネント初期化
////////////////////////////////////////--->
<cfobject component="#SERVICE_ADDRESS#.table_course_label_master" name="clmObj">
<cfobject component="#SERVICE_ADDRESS#.table_course_master" name="cmObj">
<cfobject component="#SERVICE_ADDRESS#.table_group_master" name="gmObj">
<cfobject component="#SERVICE_ADDRESS#.table_user_master" name="umObj">
<cfobject component="#SERVICE_ADDRESS#.table_course_progress" name="cpObj">
<cfobject component="#SERVICE_ADDRESS#.table_sco_progress" name="spObj">
<cfobject component="#SERVICE_ADDRESS#.table_sco_master" name="smObj">
<cfobject component="#SERVICE_ADDRESS#.table_assign" name="asObj">
<cfobject component="#SERVICE_ADDRESS#.make_course_list" name="mclObj">
<cfobject component="#SERVICE_ADDRESS#.ApiSql" name="apisql">

<cfobject component="#SERVICE_ADDRESS#.table_admin_menu_auth" name="objAMA">
<cfset menu_auth = objAMA.get_admin_menu_auth_struct(now_login_user)>

<cfobject component="#SERVICE_ADDRESS#.table_menu_auth_master" name="objMAM">
<cfset menu_list = objMAM.get_menu_auth_master_struct()>

<cfobject component="#SERVICE_ADDRESS#.table_lms_setting" name="lsObj">
<cfset customer_name	= lsObj.get_value('customer_name')>
<cfset indication_type	= lsObj.get_value('indication_type')>
<cfset c_assign_num		= lsObj.get_value('course.assign_number')>
<cfset c_score_by_group	= lsObj.get_value('course.score_by_group')>
<cfset page_size		= lsObj.get_value('pager.default_unit')>
<cfset rec_csv_download	= lsObj.get_value('record.csv_download')>
<cfset data_hidden		= StructNew()>

<cfif c_score_by_group eq 1 or customer_name eq "sato">
	<cfset flag_score_by_group = true>
<cfelse>
	<cfset flag_score_by_group = false>
</cfif>

<cfobject component="#SERVICE_ADDRESS#.json" name="objJSON">
<cfobject component="#SERVICE_ADDRESS#.table_group_construct" name="objGC">

<!---///////////////////////////////////////
成績クリア処理
////////////////////////////////////////--->
<cfif IsDefined("URL.clear_result") and IsDefined("URL.uid") and IsDefined("URL.cid")>
	<cfset temp_user_id = URL.uid>
	<cfset temp_course_id = URL.cid>

	<!---  数値型の値をチェックする --->
	<cfset isNumericOrError( temp_user_id )>
	<cfset isNumericOrError( temp_course_id )>

	<cfif IsDefined("URL.sid")>
		<!--- SCO単位で成績削除 --->
		<cfset temp_sco_id = URL.sid>

		<!---  数値型の値をチェックする --->
		<cfset isNumericOrError( temp_sco_id )>

		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			delete from SCO_PROGRESS
			where course_id = '#temp_course_id#' and user_id = '#temp_user_id#' and sco_id = '#temp_sco_id#'
		</cfquery>
		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			delete from SCO_PROGRESS_RECORD
			where course_id = '#temp_course_id#' and user_id = '#temp_user_id#' and sco_id = '#temp_sco_id#'
		</cfquery>
		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			delete from ITEMS
			where course_id = '#temp_course_id#' and user_id = '#temp_user_id#' and sco_id = '#temp_sco_id#'
		</cfquery>
		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			delete from HW_FILE
			where course_id = '#temp_course_id#' and user_id = '#temp_user_id#' and sco_id = '#temp_sco_id#'
		</cfquery>

		<!--- 監査証跡ログに書き出す(admin_id, action_type, target_type, target_id) --->
		<cfset log_id_ary = ArrayNew(1)>
		<cfset dummy = ArrayAppend(log_id_ary, temp_course_id)>
		<cfset dummy = ArrayAppend(log_id_ary, temp_sco_id)>
		<cfset dummy = ArrayAppend(log_id_ary, temp_user_id)>
		<cfset audit_log(now_login_user, "delete", "progress_sco", log_id_ary)>

		<!--- SCO単位でアンケートの回答を削除する --->
		<cfquery name="ans" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
		select enquete_id from SCO_MASTER where sco_id = '#temp_sco_id#'
		</cfquery>

		<cfset DEL_ACCOUNT = GetAuthUser() >
		<cfset ENQUETE_NO = ans.enquete_id >

		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			update T_ANSWER set
			DEL_FLG = 1 , DEL_DATE = current_timestamp, DEL_ACCOUNT = '#DEL_ACCOUNT#'
			where ENQUETE_NO = '#ENQUETE_NO#' and ANSWER_ACCOUNT = '#temp_user_id#'
		</cfquery>

		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			update T_ANSWER_DETAIL set
			DEL_FLG = 1, DEL_DATE = current_timestamp, DEL_ACCOUNT = '#DEL_ACCOUNT#'
			where ENQUETE_NO = '#ENQUETE_NO#' and ANSWER_CODE IN
			(SELECT ANSWER_CODE FROM T_ANSWER WHERE ENQUETE_NO = '#ENQUETE_NO#' AND ANSWER_ACCOUNT = '#temp_user_id#')
		</cfquery>

		<!--- SCO単位の場合はステータスと進捗率の再計算が必要 --->
		<cfset UserArray      = ArrayNew(1)>
		<cfset CourseArray    = ArrayNew(1)>
		<cfset UserArray[1]   = temp_user_id>
		<cfset CourseArray[1] = temp_course_id>
		<!--- COURSE_PROGRESS_RECORDを更新 --->
		<cfinvoke component="#SERVICE_ADDRESS#.table_course_progress_record"
		          method="set_course_progress_record"
		          user_id="#UserArray#"
		          course_id="#CourseArray#">
		<!--- COURSE_PROGRESSを更新 --->
		<cfset apisql.changescore(temp_user_id, temp_course_id)>
		<cfset apisql.changestatus(temp_user_id, temp_course_id)>
		<cfquery name="upd" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			UPDATE COURSE_PROGRESS SET
			course_count = (SELECT #dao_ifnull()#(SUM(lecture_count), 0) FROM SCO_PROGRESS_RECORD WHERE user_id = '#temp_user_id#' AND course_id = '#temp_course_id#' AND type = 1),
			eLM_total_time = (select #dao_ifnull()#(sum(eLM_session_time), 0) FROM SCO_PROGRESS WHERE user_id = '#temp_user_id#' AND course_id = '#temp_course_id#')
			WHERE course_id = '#temp_course_id#' and user_id = '#temp_user_id#'
		</cfquery>
		<!--- COURSE_PROGRESS_RECORDを更新 --->
		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			select COUNT(*) as num from SCO_PROGRESS
			where course_id = '#temp_course_id#' and user_id = '#temp_user_id#'
		</cfquery>
		<cfif result.num eq 0>
			<cfquery name="upd" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				UPDATE COURSE_PROGRESS_RECORD SET course_status = 'not attempted'
				WHERE course_id = '#temp_course_id#' and user_id = '#temp_user_id#' and type IN (1, 2)
			</cfquery>
			<cfquery name="upd" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				UPDATE COURSE_PROGRESS SET
				start_date = NULL, change_date = NULL
				WHERE course_id = '#temp_course_id#' and user_id = '#temp_user_id#'
			</cfquery>
		</cfif>
	<cfelse>
		<!--- コース単位で成績削除 --->
		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			delete from COURSE_PROGRESS
			where course_id = '#temp_course_id#' and user_id = '#temp_user_id#'
		</cfquery>
		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			delete from COURSE_PROGRESS_RECORD
			where course_id = '#temp_course_id#' and user_id = '#temp_user_id#'
		</cfquery>
		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			delete from SCO_PROGRESS
			where course_id = '#temp_course_id#' and user_id = '#temp_user_id#'
		</cfquery>
		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			delete from SCO_PROGRESS_RECORD
			where course_id = '#temp_course_id#' and user_id = '#temp_user_id#'
		</cfquery>
		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			delete from ITEMS
			where course_id = '#temp_course_id#' and user_id = '#temp_user_id#'
		</cfquery>
		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			delete from HW_FILE
			where course_id = '#temp_course_id#' and user_id = '#temp_user_id#'
		</cfquery>

	 	<!--- 監査追跡ログに書き出す --->
		<cfset log_id_ary = ArrayNew(1)>
		<cfset dummy = ArrayAppend(log_id_ary, temp_course_id)>
		<cfset dummy = ArrayAppend(log_id_ary, temp_user_id)>
		<cfset audit_log(now_login_user, "delete", "progress_course", log_id_ary)>

		<!--- コース単位でアンケートの回答を削除する --->

		<cfquery name="ans" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			select SCO_MASTER.enquete_id from CONSTRUCT
			inner join SCO_MASTER on SCO_MASTER.sco_id = CONSTRUCT.sco_id
			inner join COURSE_MASTER on COURSE_MASTER.course_id = CONSTRUCT.course_id
			where COURSE_MASTER.course_id = '#temp_course_id#' and SCO_MASTER.enquete_id != ''
		</cfquery>

		<cfset DEL_ACCOUNT = GetAuthUser() >

		<cfloop query="ans">
			<cfquery name="ans_code" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				SELECT ANSWER_CODE FROM T_ANSWER WHERE ENQUETE_NO = #ans.enquete_id# AND ANSWER_ACCOUNT = '#temp_user_id#'
			</cfquery>

			<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				update T_ANSWER set
				DEL_FLG = 1, DEL_DATE = current_timestamp , DEL_ACCOUNT = '#DEL_ACCOUNT#'
				where ENQUETE_NO = #ans.enquete_id# and ANSWER_ACCOUNT = '#temp_user_id#'
			</cfquery>

			<cfset ENQUETE_NO = ans.enquete_id>

			<cfloop query="ans_code">
				<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					update T_ANSWER_DETAIL set
					DEL_FLG = 1, DEL_DATE = current_timestamp, DEL_ACCOUNT = '#DEL_ACCOUNT#'
					where ENQUETE_NO = '#ENQUETE_NO#' and ANSWER_CODE = '#ans_code.ANSWER_CODE#'
				</cfquery>
			</cfloop>
		</cfloop>
	</cfif>
	
<cfelseif IsDefined("URL.clear_sco_record") and IsDefined("URL.lec_cnt") and IsDefined("URL.uid") and IsDefined("URL.sid2") and IsDefined("URL.cid")>
	<!---  単独の履歴を削除する場合 --->

	<cfset temp_user_id = URL.uid>
	<cfset temp_lec_cnt = URL.lec_cnt>
	<cfset temp_sid = URL.sid2>
	<cfset temp_course_id = URL.cid>
	
	<!---  数値型の値をチェックする --->
	<cfset isNumericOrError( temp_user_id )>
	<cfset isNumericOrError( temp_course_id )>
	<cfset isNumericOrError( temp_sid )>
	<cfset isNumericOrError( temp_lec_cnt )>
	
	<!---  削除対象の学習履歴を取得する --->
	<cfquery name="get_delSCO" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
		select * from SCO_PROGRESS
		where course_id = '#temp_course_id#' and user_id = '#temp_user_id#' and sco_id = '#temp_sid#' and lecture_count = '#temp_lec_cnt#'
	</cfquery>

	<cfif get_delSCO.recordcount gt 0 >
		<cfset del_time = get_delSCO.eLM_session_time>

		<!---  削除する前にSCO情報をGET --->
		<cfquery name="getSCOIFO" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			select * from SCO_PROGRESS where course_id = '#temp_course_id#' and user_id = '#temp_user_id#' and sco_id = '#temp_sid#' and lecture_count = '#temp_lec_cnt#'
		</cfquery>
		<!---  対象の学習履歴を削除する --->
		<cfquery name="del_SCO" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			delete from SCO_PROGRESS
			where course_id = '#temp_course_id#' and user_id = '#temp_user_id#' and sco_id = '#temp_sid#' and lecture_count = '#temp_lec_cnt#'
		</cfquery>
		<!---  対象学習履歴以後の履歴を更新する（累計時間と学習回数） --->
		<cfquery name="upd_SCO" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			update SCO_PROGRESS set lecture_count =  lecture_count - 1, eLM_total_time = eLM_total_time - '#del_time#'
			where course_id = '#temp_course_id#' and user_id = '#temp_user_id#' and sco_id = '#temp_sid#' and lecture_count > '#temp_lec_cnt#' and eLM_total_time > '#del_time#'
		</cfquery>
		<!---  クイズ回答情報を削除と更新 --->
		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			delete from ITEMS
			where course_id = '#temp_course_id#' and user_id = '#temp_user_id#' and sco_id = '#temp_sid#' and lecture_count = '#temp_lec_cnt#'
		</cfquery>
		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			update ITEMS set lecture_count =  lecture_count - 1
			where course_id = '#temp_course_id#' and user_id = '#temp_user_id#' and sco_id = '#temp_sid#' and lecture_count > '#temp_lec_cnt#'
		</cfquery>
		<!---  宿題提出情報を削除 --->
		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			delete from HW_FILE
			where lecture_count = '#temp_lec_cnt#' and user_id = '#temp_user_id#' and sco_id = '#temp_sid#'
		</cfquery>
		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			update HW_FILE set lecture_count =  lecture_count - 1
			where user_id = '#temp_user_id#' and sco_id = '#temp_sid#' and lecture_count > '#temp_lec_cnt#'
		</cfquery>
		<!---  アンケート回答情報を削除 --->
		<cfquery name="ans" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			select enquete_id, url from SCO_MASTER where sco_id = '#temp_sid#'
		</cfquery>

		<cfset DEL_ACCOUNT = GetAuthUser() >
		<cfset ENQUETE_NO = ans.enquete_id >
		
		<cfif FindNoCase("qts" , ans.url) neq 0>
			<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				update T_ANSWER set
				DEL_FLG = 1 , DEL_DATE = current_timestamp, DEL_ACCOUNT = '#DEL_ACCOUNT#'
				where ENQUETE_NO = '#ENQUETE_NO#' and ANSWER_ACCOUNT = '#temp_user_id#' and ANSWER_CODE = '#getSCOIFO.suspend#'
			</cfquery>

			<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				update T_ANSWER_DETAIL set
				DEL_FLG = 1, DEL_DATE = current_timestamp, DEL_ACCOUNT = '#DEL_ACCOUNT#'
				where ENQUETE_NO = '#ENQUETE_NO#' AND ANSWER_ACCOUNT = '#temp_user_id#' AND ANSWER_CODE = '#getSCOIFO.suspend#'
			</cfquery>
		</cfif>

		<!--- SCO_PROGRESS_RECORDのデータ更新 --->
		<cfquery name="cnt_SCO" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			select * from SCO_PROGRESS	where course_id = '#temp_course_id#' and user_id = '#temp_user_id#' and sco_id = '#temp_sid#'
		</cfquery>
		<cfif cnt_SCO.recordcount eq 0>
			<!--- SCO_PROGRESSに該当履歴がなければ、SCO_PROGRESS_RECORDのデータも削除 --->
			<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				delete from SCO_PROGRESS_RECORD
				where course_id = '#temp_course_id#' and user_id = '#temp_user_id#' and sco_id = '#temp_sid#'
			</cfquery>
		<cfelse>		
		<!--- SCO_PROGRESS_RECORDのデータ再計算更新 --->
			<cfinvoke component="#SERVICE_ADDRESS#.table_sco_progress_record"
			          method="set_sco_progress_record"
			          user_id="#temp_user_id#"
			          course_id="#temp_course_id#"
			          sco_id="#temp_sid#"
			>
		</cfif>
		
		<!--- COURSE_PROGRESS_RECORDのデータ更新 --->
		<cfset UserArray = ArrayNew(1)>
		<cfset CourseArray = ArrayNew(1)>
		<cfset UserArray[1] = temp_user_id>
		<cfset CourseArray[1] = temp_course_id>
		<cfinvoke component="#SERVICE_ADDRESS#.table_course_progress_record"
		          method="set_course_progress_record"
		          user_id="#UserArray#"
		          course_id="#CourseArray#"
		>

		<!--- COURSE_PROGRESSを更新 --->
		<cfquery name="upd" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			UPDATE COURSE_PROGRESS SET
			course_count = (SELECT #dao_ifnull()#(SUM(lecture_count), 0) FROM SCO_PROGRESS_RECORD WHERE user_id = '#temp_user_id#' AND course_id = '#temp_course_id#' AND type = 1),
			eLM_total_time = (select #dao_ifnull()#(sum(eLM_session_time), 0) FROM SCO_PROGRESS WHERE user_id = '#temp_user_id#' AND course_id = '#temp_course_id#')
			WHERE course_id = '#temp_course_id#' and user_id = '#temp_user_id#'
		</cfquery>

		<!--- SCO_PROGRESS には０件の場合、初期化 --->
		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			select COUNT(*) as num from SCO_PROGRESS
			where course_id = '#temp_course_id#' and user_id = '#temp_user_id#'
		</cfquery>
		<cfif result.num eq 0>
			<cfquery name="upd" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				UPDATE COURSE_PROGRESS_RECORD SET course_status = 'not attempted'
				WHERE course_id = '#temp_course_id#' and user_id = '#temp_user_id#' and type IN (1, 2)
			</cfquery>
			<cfquery name="upd" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				UPDATE COURSE_PROGRESS SET
				start_date = NULL, change_date = NULL
				WHERE course_id = '#temp_course_id#' and user_id = '#temp_user_id#'
			</cfquery>
		</cfif>

		<!--- 監査証跡ログに書き出す(admin_id, action_type, target_type, target_id) --->
		<cfset log_id_ary = ArrayNew(1)>
		<cfset dummy = ArrayAppend(log_id_ary, temp_course_id)>
		<cfset dummy = ArrayAppend(log_id_ary, temp_sid)>
		<cfset dummy = ArrayAppend(log_id_ary, temp_user_id)>
		<cfset dummy = ArrayAppend(log_id_ary, temp_lec_cnt)>
		<cfset audit_log(now_login_user, "delete", "progress_sco_record", log_id_ary)>

	</cfif>
</cfif>

<!---///////////////////////////////////////
CSV作成（サーバ上にCSVを作成）
////////////////////////////////////////--->
<cfswitch expression="#variables.mode#">
	<!---// コース単位→成績表示→CSV（テスト教材解答） //--->
	<cfcase value="c_csv_response_all">
		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>

		<cfif variables.u_search_group is "-1">
			<cfset variables.u_search_group = "">
		</cfif>

		<cfsetting enablecfoutputonly="yes" requestTimeOut="3600">
		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>
		<cfset temp_course_id_list = "#variables.course_id#">

		<!--- SCO情報 --->
		<cfset q_sco = smObj.get_sco_query_by_course_id(variables.course_id, 1)>
		<cfquery name="q_sco" dbtype="query">
			SELECT * FROM q_sco WHERE class_id = 2 AND sco_kind = 1
		</cfquery>
		<cfif q_sco.recordcount is 0>
			<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_quiz_undefined:ja=本コースにはテストが登録されていません。')#</cfoutput>
			<cfabort>
		</cfif>

		<cfset temp_sco_id_list = ValueList(q_sco.sco_id, ",")>
		<cfset arr_temp = ArrayNew(1)>
		<cfset arr_info = ArrayNew(2)>
		<cfset row_count = 0>

		<cfflush interval="50">
		<cfset csv_name = 'eLM_result006_' & dateFormat(now() , "yyyymmdd") & timeFormat(now() , "HHmmss") & '.csv'>
		<cfset de = lsObj.get_value("csv.delimiter")>

		<cfheader name="Content-Disposition" value="attachment;filename=#csv_name#">
		<cfheader name="Pragma" value="">
		<cfheader name="Cache-Control" value= "">
		<cfcontent type="text/csv; charset=#lsObj.get_value("csv.charset")#" reset="no">

		<!--- すぐダウンロードダイアログが表示されるよう、SQL実行前に出力 --->
		<cfoutput>#double_quote('eLearningManager')##de##double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_title:ja=テスト教材　解答一覧'))##de##de##double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_output_date:ja=出力日時'))##de##double_quote(DateFormat(Now(),"yyyy-mm-dd") & " " & TimeFormat(Now(),"HH:mm:ss"))##chr(10)##chr(10)#</cfoutput>
		<cfset temp_csv_col_arr = arrayNew(1)>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_1:ja=姓')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_2:ja=名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_3:ja=姓（ふりがな）')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_4:ja=名（ふりがな）')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_5:ja=ユーザーID')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_6:ja=メールアドレス')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_22:ja=グループ名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_7:ja=コース名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_8:ja=教材名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_9:ja=教材種別')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_10:ja=成績')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_11:ja=学習回数')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_12:ja=点数')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_13:ja=開始日時')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_14:ja=終了日時')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_15:ja=学習時間')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_16:ja=問題番号')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_17:ja=問題ID')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_18:ja=回答')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_19:ja=正答')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_20:ja=判定')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_col_21:ja=連番')))>
		<cfset temp_csv_col_str = ArrayToList(temp_csv_col_arr,#de#)>
		<cfoutput>#temp_csv_col_str#</cfoutput>
		<cfoutput>#chr(10)#</cfoutput>

		<!--- 受講者抽出と解答抽出の2重ループで回す --->
		<cfset user_list = umObj.get_user_list_ex(now_login_user, customer_name, variables.u_search_word, variables.course_id, variables.u_search_group)>

		<cfif customer_name eq "sonylife">
			<!--- ソニー生命用絞込み --->
			<cfif variables.u_search_val1 neq "">
				<cfswitch expression="#variables.u_search_val1#">
				<cfcase value="1"><!--- 一次履修者 --->
					<cfset str_where = "text_3 like '111%' OR text_3 like '101%' OR text_3 like '110%' ">
				</cfcase>
				<cfcase value="2"><!--- 二次履修者 --->
					<cfset str_where = "text_3 like '100%' ">
				</cfcase>
				<cfcase value="3"><!--- 必須履修者 --->
					<cfset str_where = "text_3 like '0001%' ">
				</cfcase>
				<cfcase value="4"><!--- 任意履修者 --->
					<cfset str_where = "text_3 like '0000%' ">
				</cfcase>
				<cfdefaultcase>
					<cfset str_where = "1=1 ">
				</cfdefaultcase>
				</cfswitch>
				<cfquery name="user_list_2" dbtype="query">
					SELECT * FROM user_list.list WHERE #PreserveSingleQuotes(str_where)#
				</cfquery>
				<cfset temp_user_id_list = ValueList(user_list_2.user_id, ",")>
			<cfelse>
				<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>
			</cfif>
		<cfelse>
			<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>
		</cfif>

		<cfif temp_user_id_list eq "">
			<cfset temp_user_id_list = "0">
		</cfif>

		<cfset user_array = ListToArray(temp_user_id_list)>
		<cfset course_array = ListToArray(temp_course_id_list)>

		<!--- ステータスによる絞込み --->
		<cfset arr_user_id = make_result_array_for_status( user_array, course_array, variables.status )>

		<cfif ArrayLen(arr_user_id) eq 0 >
			<cfset temp_user_id_list = "0">
		<cfelse>
			<cfset temp_user_id_list = ArrayToList(arr_user_id)>
		</cfif>

		<cfset last_sco_id = -99>
		<cfset last_sco_lecture_count = -99>
		<cfset last_user_id = -99>
		<cfset item_count = 0>

		<cfset item_count = 0>
		<cfset isNumericOrError(variables.course_id)>
		<cfset sql = "
			SELECT usr.user_id, usr.logon, usr.last_name, usr.first_name, usr.last_name_furi, usr.first_name_furi, usr.mailaddress,
			       spg.*, sco.sco_name, sco.class_id, sco.sco_kind,
			       it.entry_count, it.id, it.user_response, it.correct_responses_json, it.result
			FROM SCO_MASTER sco
			INNER JOIN CONSTRUCT con ON sco.sco_id = con.sco_id
			INNER JOIN SCO_PROGRESS spg ON con.course_id = spg.course_id AND sco.sco_id = spg.sco_id
			INNER JOIN ITEMS it ON spg.user_id = it.user_id AND spg.course_id = it.course_id AND spg.sco_id = it.sco_id AND spg.lecture_count = it.lecture_count
			INNER JOIN USER_MASTER usr ON it.user_id = usr.user_id
			WHERE con.course_id = #variables.course_id# AND sco.sco_id IN (" & temp_sco_id_list & ") AND spg.user_id IN (" & temp_user_id_list & ")
			ORDER BY usr.last_name, usr.first_name, usr.logon, con.order_no, spg.lecture_count
		">
		<cfquery name="qGetProgress" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			#PreserveSingleQuotes(sql)#
		</cfquery>
		<cfloop query = "qGetProgress">
			<cfset cur_sco_id = sco_id>
			<cfset cur_sco_lecture_count = lecture_count>
			<cfset cur_user_id = user_id>

			<!--- ユーザーの所属グループ情報 --->
			<cfset group_info = gmObj.get_group_name_by_user_id(user_id, 1)>

			<cfif (cur_sco_id eq last_sco_id) and (cur_sco_lecture_count eq last_sco_lecture_count) and (cur_user_id eq last_user_id)>
				<cfset item_count = item_count + 1>
			<cfelse>
				<cfset item_count = 1>
			</cfif>
			<cfset row_count = row_count + 1>

			<cfoutput>#double_quote(last_name)##de##double_quote(first_name)##de##double_quote(last_name_furi)##de##double_quote(first_name_furi)##de##double_quote(logon)##de##double_quote(mailaddress)##de##double_quote(group_info)##de#</cfoutput>
			<cfoutput>#double_quote(str_course_name)##de#</cfoutput>
			<cfoutput>#double_quote(sco_name)##de##double_quote(getScoTypeString(class_id, sco_kind))##de#</cfoutput>
			<cfoutput>#double_quote(status2str(status))##de##double_quote(lecture_count)##de##double_quote(score)##de##double_quote(DateFormat(start_date , 'yyyy/mm/dd') & ' ' & TimeFormat(start_date , 'HH:mm:ss'))##de##double_quote(DateFormat(end_date , 'yyyy/mm/dd') & ' ' & TimeFormat(end_date , 'HH:mm:ss'))##de##double_quote(fn_sec2time(eLM_session_time))##de#</cfoutput>

			<cfset str_correct_response = "">
			<cfif correct_responses_json neq "">
				<cfset temp_correct_response = objJSON.decode(correct_responses_json)>
				<cfloop index="ArrayIndex" from="1" to="#ArrayLen(temp_correct_response)#">
					<cfif str_correct_response eq "">
						<cfset str_correct_response = temp_correct_response[ArrayIndex].pattern>
					<cfelse>
						<cfset str_correct_response = str_correct_response & "|" & temp_correct_response[ArrayIndex].pattern>
					</cfif>
				</cfloop>
			</cfif>
			<cfoutput>#double_quote(item_count)##de##double_quote(id)##de##double_quote(user_response)##de##double_quote(str_correct_response)##de##double_quote(fn_output_result_mark(result))##de##double_quote(entry_count + 1)##chr(10)#</cfoutput>

			<cfset last_sco_id = cur_sco_id>
			<cfset last_sco_lecture_count = cur_sco_lecture_count>
			<cfset last_user_id = cur_user_id>
		</cfloop>
		<cfabort>
		<cfset variables.mode = "cr">
	</cfcase>
</cfswitch>

<!---///////////////////////////////////////
画面制御
////////////////////////////////////////--->
<cfswitch expression="#variables.mode#">
	<cfcase value="init">
		<cfset Session.report3 = structNew()>
		<cfset Session.report3.u_search_word = ''>
		<cfset Session.report3.u_search_group = ''>
		<cfset Session.report3.u_search_course = ''>
		<cfset Session.report3.c_search_word = ''>
		<cfset Session.report3.c_search_label = ''>
		<cfset Session.report3.c_search_group = ''>
		<cflocation url="index.cfm?mode=u">
	</cfcase>
	<!---// ユーザー単位 //--->
	<cfcase value="u">
		<!--- パラメータのセット --->
		<cfset params.u_search_word = Session.report3.u_search_word>
		<cfset params.u_search_group = Session.report3.u_search_group>
		<cfset params.u_search_course = Session.report3.u_search_course>
		<cfset params_add_mode = StructCopy(params)>
		<cfset params_add_mode.mode = "u">
		<!--- グループリスト作成 --->
		<cfset variables.group_option_list = get_group_option_list(params.u_search_group)>

		<!--- コースリスト作成 --->
		<cfset course_list = cmObj.get_course_list(now_login_user)>
		<cfset variables.course_option_list = ''>
		<cfloop query="course_list">
			<cfset variables.course_option_list = variables.course_option_list & '<option value="' & course_id & '"' & iif((course_id is params.u_search_course) , de("selected") , de("")) & '>' & course_name & '</option>' & chr(10)>
		</cfloop>

		<!--- ユーザー検索 --->
		<cfset user_result = umObj.get_user_list_ex(now_login_user , customer_name , Session.report3.u_search_word , Session.report3.u_search_course , Session.report3.u_search_group, variables.u_count+page_size-1)>
		<cfset user_list = user_result.list>
		<cfset user_count = user_result.count>

		<!--- パンくずリストの生成 --->
		<cfset strTopicPath = makeTopicPath(variables.mode)>

		<cfsetting enablecfoutputonly="no">
		<cfinclude template="inc_u_select.cfm">
	</cfcase>

	<!---// ユーザー単位→成績表示 //--->
	<cfcase value="ur">
		<cfset isNumericOrError(uid)>
		<cfparam name="uid" default="-1">
		<cfset variables.user_id = uid>

		<cfif isDefined("c_search_graph_clear")>
			<cfset variables["c_search_word"] = "">
			<cfset variables["c_search_label"] = "">
			<cfset variables["c_search_group"] = "">
		</cfif>

		<!--- パラメータのセット --->
		<cfset params_for_search.uid = variables.user_id>
		<cfset params_for_search.status = variables.status>

		<cfset params_for_status.uid = variables.user_id>
		<cfset params_for_status.u_search_word = variables.u_search_word>
		<cfset params_for_status.u_search_group = variables.u_search_group>
		<cfset params_for_status.u_search_course = variables.u_search_course>
		<cfset params_for_status.c_search_word = variables.c_search_word>
		<cfset params_for_status.c_search_label = variables.c_search_label>
		<cfset params_for_status.c_search_group = variables.c_search_group>

		<cfset params.uid = variables.user_id>
		<cfset params.status = variables.status>
		<cfset params.u_search_word = variables.u_search_word>
		<cfset params.u_search_group = variables.u_search_group>
		<cfset params.u_search_course = variables.u_search_course>
		<cfset params.c_search_word = variables.c_search_word>
		<cfset params.c_search_label = variables.c_search_label>
		<cfset params.c_search_group = variables.c_search_group>

		<cfset params_add_mode = StructCopy(params)>
		<cfset params_add_mode.mode = "ur">

		<cfset data_hidden			= Duplicate(params)>
		<cfset data_hidden.u_count	= u_count>
		<cfset data_hidden.ur_count	= ur_count>
		<cfset hidden_str			= struct2hidden(data_hidden)>

		<!--- コースラベル取得 --->
		<cfset qGetLabelInfo = clmObj.get_course_label_query()>

		<!--- グループリスト作成 --->
		<cfset variables.group_option_list = get_group_option_list(params.c_search_group)>

		<!--- ユーザー情報 --->
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id" , variables.user_id)>
		<cfset user_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset str_user_name = user_info.last_name & "　" & user_info.first_name>
		<cfset str_user_logon = user_info.logon>

		<cfset temp_user_id_list = "#variables.user_id#">

		<!--- コース取得 --->
		<!---<cfset course_list = cmObj.get_course_query_by_user_id(variables.user_id)>--->
		<cfset course_list = cmObj.get_course_query_for_search(now_login_user, variables.c_search_label, variables.c_search_word, variables.c_search_group)>
		<cfset temp_course_id_list = ValueList(course_list.course_id, ",")>

		<cfset user_array = ListToArray(temp_user_id_list)>
		<cfset course_array = ListToArray(temp_course_id_list)>

		<!--- 成績を取得 --->
		<cfset result_array = make_result_array_for_course(user_array , course_array , variables.status)>

		<!--- パンくずリストの生成 --->
		<cfset strTopicPath = makeTopicPath(variables.mode)>

		<cfsetting enablecfoutputonly="no">
		<cfinclude template="inc_u_result.cfm">
	</cfcase>

	<!---// ユーザー単位→成績表示→詳細 //--->
	<cfcase value="ur2">
		<cfparam name="uid" default="-1">
		<cfset variables.user_id = uid>

		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>

		<cfparam name="gid" default="-1">
		<cfset variables.group_id = gid>

		<cfparam name="sid" default="-1">

		<cfif IsDefined('u_search_sco')>
			<cfset variables.sco_id=u_search_sco>
			<cfset variables.u_search_sco=u_search_sco>
		<cfelse>
			<cfset variables.sco_id=sid>
			<cfset variables.u_search_sco=sid>
		</cfif>

		<!---  数値型の値をチェックする --->
		<cfset isNumericOrError( variables.user_id )>
		<cfset isNumericOrError( variables.course_id )>

		<!--- パラメータのセット --->
		<cfset params_for_search.uid = variables.user_id>
		<cfset params_for_search.cid = variables.course_id>
		<cfset params_for_search.status = variables.status>

		<cfset params_for_status.uid = variables.user_id>
		<cfset params_for_status.cid = variables.course_id>
		<cfset params_for_status.u_search_word = variables.u_search_word>
		<cfset params_for_status.u_search_group = variables.u_search_group>
		<cfset params_for_status.u_search_course = variables.u_search_course>
		<cfset params_for_status.c_search_word = variables.c_search_word>
		<cfset params_for_status.c_search_label = variables.c_search_label>
		<cfset params_for_status.c_search_group = variables.c_search_group>

		<cfset params.uid = variables.user_id>
		<cfset params.cid = variables.course_id>
		<cfset params.status = variables.status>
		<cfset params.u_search_word = variables.u_search_word>
		<cfset params.u_search_group = variables.u_search_group>
		<cfset params.u_search_course = variables.u_search_course>
		<cfset params.c_search_word = variables.c_search_word>
		<cfset params.c_search_label = variables.c_search_label>
		<cfset params.c_search_group = variables.c_search_group>

		<cfset params_add_mode = StructCopy(params)>
		<cfset params_add_mode.mode = "ur2">

		<cfset data_hidden				= Duplicate(params)>
		<cfset data_hidden.gid			= gid>
		<cfset data_hidden.sid			= sid>
		<cfset data_hidden.u_search_sco	= u_search_sco>

		<cfif mode eq "ur2">
			<cfset data_hidden.u_count		= u_count>
			<cfset data_hidden.ur_count		= ur_count>
			<cfset data_hidden.ur2_count	= ur2_count>
		<cfelseif mode eq "cr2">
			<cfset data_hidden.c_count		= c_count>
			<cfset data_hidden.cr_count		= cr_count>
			<cfset data_hidden.cr2_count	= cr2_count>
		</cfif>

		<cfset hidden_str	= struct2hidden(data_hidden)>

		<!--- ユーザー情報 --->
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id" , variables.user_id)>
		<cfset user_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset str_user_name = user_info.last_name & "　" & user_info.first_name>
		<cfset str_user_logon = user_info.logon>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>

		<cfset temp_user_id_list = "#variables.user_id#">
		<cfset temp_course_id_list = "#variables.course_id#">

		<cfset user_array = ListToArray(temp_user_id_list)>
		<cfset course_array = ListToArray(temp_course_id_list)>

		<!--- 成績を取得 --->
		<cfset result_array = make_result_array(user_array , course_array, indication_type)>

		<cfif ArrayLen(result_array) gt 0>
			<cfset ArrayDeleteAt(result_array, 1)>	<!--- コースの成績を削除 --->
		</cfif>

		<!--- SCOの階層表示準備 --->
		<cfset courseObj = cmObj.get_course_info(variables.course_id)>
		<cfset temp = mclObj.init(variables.course_id)>
		<cfset mclObj.make_order_no()><!--- order_noをきれいに保つため --->
		<cfset courseConst = mclObj.getDisplayData()>
		<cfset Arr_tableCont = make_tableCont(courseConst)>

		<!--- SCOの表示アイコンを成績アイコンに変換 --->
		<cfloop index="LoopIndex" from="1" to="#ArrayLen(Arr_tableCont)#">
			<cfswitch expression="#result_array[LoopIndex][15]#">
			<cfcase value="not attempted">
				<cfset Arr_tableCont[LoopIndex] = Replace(Arr_tableCont[LoopIndex], "SCO_STATUS", "not_attempted")>
			</cfcase>
			<cfcase value="incomplete">
				<cfset Arr_tableCont[LoopIndex] = Replace(Arr_tableCont[LoopIndex], "SCO_STATUS", "incomplete")>
			</cfcase>
			<cfcase value="completed">
				<cfset TempSelectObj=dao_select("SCO_MASTER")>
				<cfset TempSelectObj=dao_eq(TempSelectObj, "sco_id", "#result_array[LoopIndex][13]#")>
				<cfset q_sco_master=dao_result("#application.DSN#", TempSelectObj)>
				<cfif q_sco_master.class_id eq 2>
					<cfset Arr_tableCont[LoopIndex] = Replace(Arr_tableCont[LoopIndex], "SCO_STATUS", "incomplete")>
				<cfelse>
					<cfset Arr_tableCont[LoopIndex] = Replace(Arr_tableCont[LoopIndex], "SCO_STATUS", "completed")>
				</cfif>
			</cfcase>
			<cfcase value="failed">
				<cfset Arr_tableCont[LoopIndex] = Replace(Arr_tableCont[LoopIndex], "SCO_STATUS", "failed")>
			</cfcase>
			<cfcase value="passed">
				<cfset Arr_tableCont[LoopIndex] = Replace(Arr_tableCont[LoopIndex], "SCO_STATUS", "passed")>
			</cfcase>
			<cfdefaultcase>
				<cfset Arr_tableCont[LoopIndex] = Replace(Arr_tableCont[LoopIndex], "SCO_STATUS", "not_attempted")>
			</cfdefaultcase>
			</cfswitch>
		</cfloop>

		<!--- SCOの学習回数をmax(SCO_PROGRESS.lecture_count)からcount(SCO_PROGRESS.*)に変換--->
		<cfloop index="LoopIndex" from="1" to="#ArrayLen(result_array)#">
			<cfif result_array[LoopIndex][13] neq "">
				<cfset isNumericOrError(variables.user_id)>
				<cfset isNumericOrError(variables.course_id)>
				<cfquery name="q_getSPCount" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					select count(*) as lc from SCO_PROGRESS where user_id = #variables.user_id# and course_id = #variables.course_id# and sco_id = #result_array[LoopIndex][13]# and lecture_count <> -1
				</cfquery>
				<cfset result_array[LoopIndex][6] = q_getSPCount.lc>
			</cfif>
		</cfloop>

		<!--- パンくずリストの生成 --->
		<cfset strTopicPath = makeTopicPath(variables.mode)>

		<cfsetting enablecfoutputonly="no">
		<cfinclude template="inc_u_result_detail.cfm">
	</cfcase>

	<!---// コース・教材単位 コース選択 //--->
	<cfcase value="c">
		<!--- パラメータのセット --->
		<cfset params_for_search.status = variables.status>

		<cfset params.status = variables.status>
		<cfset params.c_search_word = Session.report3.c_search_word>
		<cfset params.c_search_label = Session.report3.c_search_label>
		<cfset params.c_search_group = Session.report3.c_search_group>

		<cfset params_add_mode = StructCopy(params)>
		<cfset params_add_mode.mode = "c">

		<!--- コースラベル取得 --->
		<cfset qGetLabelInfo = clmObj.get_course_label_query()>

		<!--- グループリスト作成 --->
		<cfset variables.group_option_list = get_group_option_list(params.c_search_group)>

		<!--- ラベル構成取得 --->
		<cfset Variables.TempSelectObj = dao_select("LABEL_CONSTRUCT")>
		<cfset q_label_construct = dao_result("#application.DSN#", Variables.TempSelectObj)>

		<!--- コース割り当て取得（USER_MASTERに存在するUSER_IDのみ） --->
		<cfset Variables.__TempQueryString = "
			SELECT 		A.*
			FROM 		USER_MASTER as UM, ASSIGN as A
			WHERE 		UM.user_type_id = 3
			AND 		UM.user_id = A.user_id
		">
		<cfquery name="q_assign" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			#PreserveSingleQuotes(Variables.__TempQueryString)#
		</cfquery>

		<!--- 全コース割り当てのユーザー取得 --->
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_type_id" , "3")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "flag_all_course" , "1")>
		<cfset q_user_all_course = dao_result("#application.DSN#", Variables.TempSelectObj)>

		<cfset TempSelectObj=dao_select("USER_MASTER")>
		<cfset TempSelectObj=dao_eq(TempSelectObj, "user_id", now_login_user)>
		<cfset q_data_now_login_user=dao_result("#application.DSN#", TempSelectObj)>

		<!--- コース取得 --->
		<cfset course_list = cmObj.get_course_query_for_search(now_login_user, Session.report3.c_search_label, Session.report3.c_search_word, Session.report3.c_search_group)>

		<cfset count_all_course = course_list.recordcount>

		<!--- パンくずリストの生成 --->
		<cfset strTopicPath = makeTopicPath(variables.mode)>

		<cfsetting enablecfoutputonly="no">
		<cfinclude template="inc_c_select.cfm">
	</cfcase>

	<!---// コース・教材単位 教材選択//--->
	<cfcase value="s">
		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>

		<!--- パラメータのセット --->
		<cfset params.c_search_word = Session.report3.c_search_word>
		<cfset params.c_search_label = Session.report3.c_search_label>
		<cfset params.c_search_group = Session.report3.c_search_group>
		<cfset params_add_mode = StructCopy(params)>
		<cfset params_add_mode.mode = "s">

		<cfset data_hidden					= Duplicate(params)>
		<cfset data_hidden.cid				= cid>
		<cfset data_hidden.u_search_word	= u_search_word>
		<cfset data_hidden.u_search_group	= u_search_group>
		<cfset data_hidden.u_search_course	= u_search_course>
		<cfset data_hidden.c_count			= c_count>
		<cfset data_hidden.cr_count			= cr_count>
		<cfset data_hidden.status			= status>
		<cfset hidden_str					= struct2hidden(data_hidden)>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>
		<cfset assign_count     = asObj.count_assigned_users(variables.course_id, -1, now_login_user)>
		<cfset assign_count_all = asObj.count_assigned_users(variables.course_id, -1)>

		<!--- SCOの階層表示準備 --->
		<cfset courseObj = cmObj.get_course_info(variables.course_id)>
		<cfset temp = mclObj.init(variables.course_id)>
		<cfset mclObj.make_order_no()><!--- order_noをきれいに保つため --->
		<cfset courseConst = mclObj.getDisplayData()>
		<cfset Arr_tableCont = make_tableCont(courseConst)>
		<!--- SCOの表示アイコンを変換 --->
		<cfloop index="LoopIndex" from="1" to="#ArrayLen(Arr_tableCont)#">
			<cfset Arr_tableCont[LoopIndex] = Replace(Arr_tableCont[LoopIndex], "SCO_STATUS", "not_attempted")>
		</cfloop>

		<!--- SCOの種別表示準備 --->
		<cfset Arr_scoTypeString = arrayNew(1)>
		<cfloop query = "courseConst">
			<cfset typeString = "">
			<cfif courseConst.sco_type eq 1>
				<cfset typeString = getScoTypeString(courseConst.class_id, courseConst.sco_kind)>
			</cfif>
			<cfset ArrayAppend(Arr_scoTypeString, typeString)>
		</cfloop>


		<!--- パンくずリストの生成 --->
		<cfset strTopicPath = makeTopicPath(variables.mode)>

		<cfsetting enablecfoutputonly="no">
		<cfinclude template="inc_s_select.cfm">
	</cfcase>

	<!---// コース・教材単位→成績表示(SCO単位) //--->
	<cfcase value="sr">
		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>
		<cfparam name="sid" default="-1">
		<cfset variables.sco_id = sid>

		<cfif IsDefined("u_search_sco")>
			<cfset variables.u_search_sco = u_search_sco>
			<cfset variables.sco_id = u_search_sco>
		<cfelse>
			<cfset variables.u_search_sco = sid>
		</cfif>

		<cfset variables.group_id=-1>
		<cfparam name="gid" default="-1">
		<cfif (lsObj.get_value('course.score_by_group') eq 1 or lsObj.get_value('customer_name') eq 'sato') and gid neq -1>
			<cfset variables.group_id = gid>
			<cfset variables.u_search_group = gid>
			<cfset params_for_status.u_search_sco = variables.u_search_sco>
			<cfset params.u_search_sco = variables.u_search_sco>
			<cfset temp_course_id_list = "#variables.course_id#">
		</cfif>

		<cfif isDefined("u_search_course_clear")>
			<cfset variables["u_search_word"] = "">
			<cfset variables["u_search_label"] = "">
			<cfset variables["u_search_group"] = "">
		</cfif>

		<!---  数値型の値をチェックする --->
		<cfset isNumericOrError( variables.sco_id )>
		<cfset isNumericOrError( variables.course_id )>

		<!--- パラメータのセット --->
		<cfset params_for_search.cid = variables.course_id>
		<cfset params_for_search.sid = variables.sco_id>
		<cfset params_for_search.status = variables.status>

		<cfset params_for_status.cid = variables.course_id>
		<cfset params_for_status.sid = variables.sco_id>
		<cfset params_for_status.u_search_word = variables.u_search_word>
		<cfset params_for_status.u_search_group = variables.u_search_group>
		<cfset params_for_status.u_search_course = variables.u_search_course>
		<cfset params_for_status.c_search_word = variables.c_search_word>
		<cfset params_for_status.c_search_label = variables.c_search_label>
		<cfset params_for_status.c_search_group = variables.c_search_group>
		<cfset params_for_status.u_search_val1 = variables.u_search_val1>

		<cfset params.gid = variables.group_id>
		<cfset params.cid = variables.course_id>
		<cfset params.sid = variables.sco_id>
		<cfset params.status = variables.status>
		<cfset params.u_search_word = variables.u_search_word>
		<cfset params.u_search_group = variables.u_search_group>
		<cfset params.u_search_course = variables.u_search_course>
		<cfset params.c_search_word = variables.c_search_word>
		<cfset params.c_search_label = variables.c_search_label>
		<cfset params.c_search_group = variables.c_search_group>
		<cfset params.u_search_val1 = variables.u_search_val1>

		<cfset params_add_mode = StructCopy(params)>
		<cfset params_add_mode.mode = "sr">

		<cfset data_hidden				= Duplicate(params)>
		<cfset data_hidden.c_count		= c_count>
		<cfset data_hidden.cr_count		= cr_count>
		<cfset data_hidden.cr2_count	= cr2_count>
		<cfset hidden_str				= struct2hidden(data_hidden)>

		<cfset StructDelete(data_hidden, "gid")>
		<cfset data_hidden.u_search_val1	= u_search_val1>
		<cfset data_hidden.c_count			= c_count>
		<cfset data_hidden.cr_count			= cr_count>
		<cfset hidden_str1					= struct2hidden(data_hidden)>

		<!--- グループリスト作成 --->
		<cfset variables.group_option_list = get_group_option_list(variables.u_search_group)>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>
		<cfset assign_count     = asObj.count_assigned_users(variables.course_id, -1, now_login_user, variables.group_id)>
		<cfset assign_count_all = asObj.count_assigned_users(variables.course_id, -1, -1, variables.group_id)>

		<cfset temp_course_id_list = "#variables.course_id#">

		<!--- SCO情報 --->
		<cfset Variables.TempSelectObj = dao_select("SCO_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "sco_id" , variables.sco_id)>
		<cfset sco_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset str_sco_name = sco_info.sco_name>
		<cfset str_sco_type = getScoTypeString(sco_info.class_id, sco_info.sco_kind)>

		<cfset is_quiz = false>
		<cfif sco_info.class_id eq 2 and ( sco_info.sco_kind eq 1 or sco_info.sco_kind eq 3 )>
			<cfset is_quiz = true>
		</cfif>


		<!--- ユーザー取得 --->
		<cfif variables.u_search_group eq -1>
			<cfset user_list = umObj.get_user_list_ex(now_login_user, customer_name, variables.u_search_word, variables.course_id)>
		<cfelse>
			<cfset user_list = umObj.get_user_list_ex(now_login_user, customer_name, variables.u_search_word, variables.course_id, variables.u_search_group)>
		</cfif>

		<cfif customer_name eq "sonylife">
			<!--- ソニー生命用絞込み --->
			<cfif variables.u_search_val1 neq "">
				<cfswitch expression="#variables.u_search_val1#">
				<cfcase value="1"><!--- 一次履修者 --->
					<cfset str_where = "text_3 like '111%' OR text_3 like '101%' OR text_3 like '110%' ">
				</cfcase>
				<cfcase value="2"><!--- 二次履修者 --->
					<cfset str_where = "text_3 like '100%' ">
				</cfcase>
				<cfcase value="3"><!--- 必須履修者 --->
					<cfset str_where = "text_3 like '0001%' ">
				</cfcase>
				<cfcase value="4"><!--- 任意履修者 --->
					<cfset str_where = "text_3 like '0000%' ">
				</cfcase>
				<cfdefaultcase>
					<cfset str_where = "1=1 ">
				</cfdefaultcase>
				</cfswitch>
				<cfquery name="user_list_2" dbtype="query">
					SELECT * FROM user_list.list WHERE #PreserveSingleQuotes(str_where)#
				</cfquery>
				<cfset temp_user_id_list = ValueList(user_list_2.user_id, ",")>
			<cfelse>
				<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>
			</cfif>
		<cfelse>
			<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>
		</cfif>

		<cfset user_array = ListToArray(temp_user_id_list)>
		<cfset course_array = ListToArray(temp_course_id_list)>

		<!--- 成績を取得 --->
		<!--- この時点で、ユーザリストはソート済みである --->
		<cfset result = make_result_array_for_sco(user_array, sco_id, status, variables.cr_count)>
		<cfset result_array = result.array>
		<cfset result_count = result.count>
		<cfset graph_struct = result.graph_struct>

		<!--- SCOの学習回数をmax(SCO_PROGRESS.lecture_count)からcount(SCO_PROGRESS.*)に変換--->
		<cfloop index="LoopIndex" from="1" to="#ArrayLen(result_array)#">
			<cfif result_array[LoopIndex][13] neq "">
				<cfset isNumericOrError(variables.course_id)>
				<cfset isNumericOrError(variables.sco_id)>
				<cfquery name="q_getSPCount" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					select count(*) as lc from SCO_PROGRESS where user_id = #result_array[LoopIndex][13]# and course_id = #variables.course_id# and sco_id = #variables.sco_id# and lecture_count <> -1
				</cfquery>
				<cfset result_array[LoopIndex][6] = q_getSPCount.lc>
			</cfif>
		</cfloop>

		<!--- パンくずリストの生成 --->
		<cfif lsObj.get_value('course.score_by_group') eq 1 or lsObj.get_value('customer_name') eq 'sato'>
			<cfset strTopicPath = makeTopicPath('sgr')>
		<cfelse>
			<cfset strTopicPath = makeTopicPath(variables.mode)>
		</cfif>

		<cfsetting enablecfoutputonly="no">
		<cfinclude template="inc_s_result.cfm">
	</cfcase>

	<!---// コース・教材単位→成績表示(コース単位) //--->
	<cfcase value="cr">
		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>

		<cfset variables.group_id=-1>
		<cfparam name="gid" default="-1">
		<cfif (lsObj.get_value('course.score_by_group') eq 1 or lsObj.get_value('customer_name') eq 'sato') and gid neq -1>
			<cfset variables.group_id = gid>
			<cfset variables.u_search_group = gid>
		</cfif>

		<cfparam name="sid" default="-1">
		<cfset variables.sco_id = sid>

		<cfif isDefined("u_search_course_clear")>
			<cfset variables["u_search_word"] = "">
			<cfset variables["u_search_label"] = "">
			<cfset variables["u_search_group"] = "">
		</cfif>

		<!---  数値型の値をチェックする --->
		<cfset isNumericOrError( variables.course_id )>

		<!--- パラメータのセット --->
		<cfset params_for_search.cid = variables.course_id>
		<cfset params_for_search.status = variables.status>

		<cfset params_for_status.cid = variables.course_id>
		<cfset params_for_status.u_search_word = variables.u_search_word>
		<cfset params_for_status.u_search_group = variables.u_search_group>
		<cfset params_for_status.u_search_course = variables.u_search_course>
		<cfset params_for_status.c_search_word = variables.c_search_word>
		<cfset params_for_status.c_search_label = variables.c_search_label>
		<cfset params_for_status.c_search_group = variables.c_search_group>
		<cfset params_for_status.u_search_val1 = variables.u_search_val1>

		<cfset params.gid = variables.group_id>
		<cfset params.cid = variables.course_id>
		<cfset params.status = variables.status>
		<cfset params.u_search_word = variables.u_search_word>
		<cfset params.u_search_group = variables.u_search_group>
		<cfset params.u_search_course = variables.u_search_course>
		<cfset params.c_search_word = variables.c_search_word>
		<cfset params.c_search_label = variables.c_search_label>
		<cfset params.c_search_group = variables.c_search_group>
		<cfset params.u_search_val1 = variables.u_search_val1>

		<cfset params_add_mode = StructCopy(params)>
		<cfset params_add_mode.mode = "cr">

		<cfset data_hidden			= Duplicate(params)>
		<cfset data_hidden.c_count	= c_count>
		<cfset data_hidden.cr_count	= cr_count>
		<cfset hidden_str			= struct2hidden(data_hidden)>

		<!--- グループリスト作成 --->
		<cfset variables.group_option_list = get_group_option_list(variables.u_search_group)>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>
		<cfset temp_course_id_list = "#variables.course_id#">
		<cfset assign_count     = asObj.count_assigned_users(variables.course_id, -1, now_login_user, variables.group_id)>
		<cfset assign_count_all = asObj.count_assigned_users(variables.course_id, -1, -1, variables.group_id)>

		<!--- ユーザー取得 --->
		<cfif variables.u_search_group eq -1>
			<cfset user_list = umObj.get_user_list_ex(now_login_user, customer_name, variables.u_search_word, variables.course_id)>
		<cfelse>
			<cfset user_list = umObj.get_user_list_ex(now_login_user, customer_name, variables.u_search_word, variables.course_id, variables.u_search_group)>
		</cfif>

		<cfif customer_name eq "sonylife">
			<!--- ソニー生命用絞込み --->
			<cfif variables.u_search_val1 neq "">
				<cfswitch expression="#variables.u_search_val1#">
				<cfcase value="1"><!--- 一次履修者 --->
					<cfset str_where = "text_3 like '111%' OR text_3 like '101%' OR text_3 like '110%' ">
				</cfcase>
				<cfcase value="2"><!--- 二次履修者 --->
					<cfset str_where = "text_3 like '100%' ">
				</cfcase>
				<cfcase value="3"><!--- 必須履修者 --->
					<cfset str_where = "text_3 like '0001%' ">
				</cfcase>
				<cfcase value="4"><!--- 任意履修者 --->
					<cfset str_where = "text_3 like '0000%' ">
				</cfcase>
				<cfdefaultcase>
					<cfset str_where = "1=1 ">
				</cfdefaultcase>
				</cfswitch>
				<cfquery name="user_list_2" dbtype="query">
					SELECT * FROM user_list.list WHERE #PreserveSingleQuotes(str_where)#
				</cfquery>
				<cfset temp_user_id_list = ValueList(user_list_2.user_id, ",")>
			<cfelse>
				<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>
			</cfif>
		<cfelse>
			<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>
		</cfif>

		<cfset user_array = ListToArray(temp_user_id_list)>
		<cfset course_array = ListToArray(temp_course_id_list)>

		<!--- 成績を取得 --->
		<cfset result_array = make_result_array_for_course(user_array , course_array , variables.status, 1)>

		<!--- パンくずリストの生成 --->
		<cfif lsObj.get_value('course.score_by_group') eq 1 or lsObj.get_value('customer_name') eq 'sato'>
			<cfset strTopicPath = makeTopicPath('cgr')>
		<cfelse>
			<cfset strTopicPath = makeTopicPath(variables.mode)>
		</cfif>

		<cfsetting enablecfoutputonly="no">
		<cfinclude template="inc_c_result.cfm">
	</cfcase>

	<!---// コース全体→グループ集計　2009.01.30//--->
	<cfcase value="cg">
		<cfset q_g1 = objGC.get_group_list_no_hier(now_login_user)>
		<cfset q_g3 = objGC.get_group_list_hier(now_login_user)>

		<cfparam name="uid" default="-1">
		<cfset variables.user_id = uid>

		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>

		<cfparam name="sid" default="-1">
		<cfset variables.sco_id = sid>

		<!---  数値型の値をチェックする --->
		<cfset isNumericOrError( variables.course_id )>

		<!--- パラメータのセット --->
		<cfset params_for_search.uid = variables.user_id>
		<cfset params_for_search.cid = variables.course_id>
		<cfset params_for_search.status = variables.status>

		<cfset params_for_status.uid = variables.user_id>
		<cfset params_for_status.cid = variables.course_id>
		<cfset params_for_status.u_search_word = variables.u_search_word>
		<cfset params_for_status.u_search_group = variables.u_search_group>
		<cfset params_for_status.u_search_course = variables.u_search_course>
		<cfset params_for_status.c_search_word = variables.c_search_word>
		<cfset params_for_status.c_search_label = variables.c_search_label>
		<cfset params_for_status.c_search_group = variables.c_search_group>

		<cfset params.uid = variables.user_id>
		<cfset params.cid = variables.course_id>
		<cfset params.status = variables.status>
		<cfset params.u_search_word = variables.u_search_word>
		<cfset params.u_search_group = variables.u_search_group>
		<cfset params.u_search_course = variables.u_search_course>
		<cfset params.c_search_word = variables.c_search_word>
		<cfset params.c_search_label = variables.c_search_label>
		<cfset params.c_search_group = variables.c_search_group>

		<cfset params_add_mode = StructCopy(params)>
		<cfset params_add_mode.mode = "cg">

		<cfset data_hidden					= Duplicate(params)>
		<cfset data_hidden.sid				= sid>
		<cfset data_hidden.u_search_val1	= u_search_val1>
		<cfset data_hidden.c_count			= c_count>
		<cfset data_hidden.cr_count			= cr_count>
		<cfset StructDelete(data_hidden, "uid")>
		<cfset hidden_str					= struct2hidden(data_hidden)>

		<!--- ユーザー情報 --->
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id" , variables.user_id)>
		<cfset user_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset str_user_name = user_info.last_name & "　" & user_info.first_name>
		<cfset str_user_logon = user_info.logon>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>

		<cfset temp_user_id_list = "#variables.user_id#">
		<cfset temp_course_id_list = "#variables.course_id#">

		<cfset user_array = ListToArray(temp_user_id_list)>
		<cfset course_array = ListToArray(temp_course_id_list)>

		<!--- 成績を取得 --->
		<cfset result_array = make_result_array(user_array , course_array, indication_type)>

		<cfif ArrayLen(result_array) gt 0>
			<cfset ArrayDeleteAt(result_array, 1)>	<!--- コースの成績を削除 --->
		</cfif>

		<!--- SCOの階層表示準備 --->
		<cfset courseObj = cmObj.get_course_info(variables.course_id)>
		<cfset temp = mclObj.init(variables.course_id)>
		<cfset mclObj.make_order_no()><!--- order_noをきれいに保つため --->
		<cfset courseConst = mclObj.getDisplayData()>
		<cfset Arr_tableCont = make_tableCont(courseConst)>

		<!--- パンくずリストの生成 --->
		<cfset strTopicPath = makeTopicPath(variables.mode)>

		<cfsetting enablecfoutputonly="no">
		<cfinclude template="inc_c_group.cfm">
	</cfcase>

	<!---// 教材→グループ集計　2009.01.30//--->
	<cfcase value="sg">
		<cfset q_g1 = objGC.get_group_list_no_hier(now_login_user)>
		<cfset q_g3 = objGC.get_group_list_hier(now_login_user)>

		<cfparam name="uid" default="-1">
		<cfset variables.user_id = uid>

		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>

		<cfparam name="sid" default="-1">
		<cfset variables.sco_id = sid>

		<cfif IsDefined('u_search_sco')>
			<cfset variables.u_search_sco=u_search_sco>
			<cfset variables.sco_id=u_search_sco>
			<cfset sid=u_search_sco>
		<cfelse>
			<cfset variables.u_search_sco=sid>
		</cfif>

		<!--- パラメータのセット --->
		<cfset params_for_search.uid = variables.user_id>
		<cfset params_for_search.cid = variables.course_id>
		<cfset params_for_search.status = variables.status>

		<cfset params_for_status.uid = variables.user_id>
		<cfset params_for_status.cid = variables.course_id>
		<cfset params_for_status.u_search_word = variables.u_search_word>
		<cfset params_for_status.u_search_group = variables.u_search_group>
		<cfset params_for_status.u_search_course = variables.u_search_course>
		<cfset params_for_status.c_search_word = variables.c_search_word>
		<cfset params_for_status.c_search_label = variables.c_search_label>
		<cfset params_for_status.c_search_group = variables.c_search_group>

		<cfset params.uid = variables.user_id>
		<cfset params.cid = variables.course_id>
		<cfset params.status = variables.status>
		<cfset params.u_search_word = variables.u_search_word>
		<cfset params.u_search_group = variables.u_search_group>
		<cfset params.u_search_course = variables.u_search_course>
		<cfset params.c_search_word = variables.c_search_word>
		<cfset params.c_search_label = variables.c_search_label>
		<cfset params.c_search_group = variables.c_search_group>

		<cfset params_add_mode = StructCopy(params)>
		<cfset params_add_mode.mode = "sg">

		<cfset data_hidden			= Duplicate(params)>
		<cfset data_hidden.sid		= sid>
		<cfset data_hidden.c_count	= c_count>
		<cfset data_hidden.cr_count	= cr_count>
		<cfset StructDelete(data_hidden, "uid")>
		<cfset hidden_str			= struct2hidden(data_hidden)>

		<!--- ユーザー情報 --->
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id" , variables.user_id)>
		<cfset user_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset str_user_name = user_info.last_name & "　" & user_info.first_name>
		<cfset str_user_logon = user_info.logon>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>

		<cfset temp_user_id_list = "#variables.user_id#">
		<cfset temp_course_id_list = "#variables.course_id#">

		<cfset user_array = ListToArray(temp_user_id_list)>
		<cfset course_array = ListToArray(temp_course_id_list)>

		<!--- SCO情報 --->
		<cfset Variables.TempSelectObj = dao_select("SCO_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "sco_id" , variables.sco_id)>
		<cfset sco_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset str_sco_name = sco_info.sco_name>

		<!--- 成績を取得 --->
		<cfset result_array = make_result_array(user_array , course_array, indication_type)>

		<cfif ArrayLen(result_array) gt 0>
			<cfset ArrayDeleteAt(result_array, 1)>	<!--- コースの成績を削除 --->
		</cfif>

		<!--- SCOの階層表示準備 --->
		<cfset courseObj = cmObj.get_course_info(variables.course_id)>
		<cfset temp = mclObj.init(variables.course_id)>
		<cfset mclObj.make_order_no()><!--- order_noをきれいに保つため --->
		<cfset courseConst = mclObj.getDisplayData()>
		<cfset Arr_tableCont = make_tableCont(courseConst)>

		<!--- パンくずリストの生成 --->
		<cfset strTopicPath = makeTopicPath(variables.mode)>

		<cfsetting enablecfoutputonly="no">
		<cfinclude template="inc_s_group.cfm">	<!--- ur2と共用 --->
	</cfcase>

	<!---// コース・教材単位→成績表示→詳細 //--->
	<cfcase value="cr2">
		<cfparam name="uid" default="-1">
		<cfset variables.user_id = uid>

		<cfparam name="gid" default="-1">
		<cfset variables.group_id = gid>

		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>

		<cfparam name="sid" default="-1">
		<cfset variables.sco_id = sid>
		<cfif IsDefined('u_search_sco')>
			<cfset variables.u_search_sco=u_search_sco>
		<cfelse>
			<cfset variables.u_search_sco=sid>
		</cfif>

		<!---  数値型の値をチェックする --->
		<cfset isNumericOrError( variables.user_id )>
		<cfset isNumericOrError( variables.course_id )>

		<!--- パラメータのセット --->
		<cfset params_for_search.uid = variables.user_id>
		<cfset params_for_search.cid = variables.course_id>
		<cfset params_for_search.status = variables.status>

		<cfset params_for_status.uid = variables.user_id>
		<cfset params_for_status.cid = variables.course_id>
		<cfset params_for_status.u_search_word = variables.u_search_word>
		<cfset params_for_status.u_search_group = variables.u_search_group>
		<cfset params_for_status.u_search_sco = variables.u_search_sco>
		<cfset params_for_status.u_search_course = variables.u_search_course>
		<cfset params_for_status.c_search_word = variables.c_search_word>
		<cfset params_for_status.c_search_label = variables.c_search_label>
		<cfset params_for_status.c_search_group = variables.c_search_group>

		<cfset params.uid = variables.user_id>
		<cfset params.gid = variables.group_id>
		<cfset params.cid = variables.course_id>
		<cfset params.status = variables.status>
		<cfset params.u_search_word = variables.u_search_word>
		<cfset params.u_search_group = variables.u_search_group>
		<cfset params.u_search_course = variables.u_search_course>
		<cfset params.u_search_sco = variables.u_search_sco>
		<cfset params.c_search_word = variables.c_search_word>
		<cfset params.c_search_label = variables.c_search_label>
		<cfset params.c_search_group = variables.c_search_group>

		<cfset data_hidden				= Duplicate(params)>
		<cfset data_hidden.gid			= gid>
		<cfset data_hidden.sid			= sid>
		<cfset data_hidden.u_search_sco	= u_search_sco>

		<cfif mode eq "ur2">
			<cfset data_hidden.u_count		= u_count>
			<cfset data_hidden.ur_count		= ur_count>
			<cfset data_hidden.ur2_count	= ur2_count>
		<cfelseif mode eq "cr2">
			<cfset data_hidden.c_count		= c_count>
			<cfset data_hidden.cr_count		= cr_count>
			<cfset data_hidden.cr2_count	= cr2_count>
		</cfif>

		<cfset hidden_str	= struct2hidden(data_hidden)>

		<cfset params_add_mode = StructCopy(params)>
		<cfset params_add_mode.mode = "cr2">

		<!--- ユーザー情報 --->
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id" , variables.user_id)>
		<cfset user_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset str_user_name = user_info.last_name & "　" & user_info.first_name>
		<cfset str_user_logon = user_info.logon>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>

		<cfset temp_user_id_list = "#variables.user_id#">
		<cfset temp_course_id_list = "#variables.course_id#">

		<cfset user_array = ListToArray(temp_user_id_list)>
		<cfset course_array = ListToArray(temp_course_id_list)>

		<!--- 成績を取得 --->
		<cfset result_array = make_result_array(user_array , course_array, indication_type)>

		<cfif ArrayLen(result_array) gt 0>
			<cfset ArrayDeleteAt(result_array, 1)>	<!--- コースの成績を削除 --->
		</cfif>

		<!--- SCOの階層表示準備 --->
		<cfset courseObj = cmObj.get_course_info(variables.course_id)>
		<cfset temp = mclObj.init(variables.course_id)>
		<cfset mclObj.make_order_no()><!--- order_noをきれいに保つため --->
		<cfset courseConst = mclObj.getDisplayData()>
		<cfset Arr_tableCont = make_tableCont(courseConst)>

		<!--- SCOの表示アイコンを成績アイコンに変換 --->
		<cfloop index="LoopIndex" from="1" to="#ArrayLen(Arr_tableCont)#">
			<cfswitch expression="#result_array[LoopIndex][15]#">
			<cfcase value="not attempted">
				<cfset Arr_tableCont[LoopIndex] = Replace(Arr_tableCont[LoopIndex], "SCO_STATUS", "not_attempted")>
			</cfcase>
			<cfcase value="incomplete">
				<cfset Arr_tableCont[LoopIndex] = Replace(Arr_tableCont[LoopIndex], "SCO_STATUS", "incomplete")>
			</cfcase>
			<cfcase value="completed">
				<cfset TempSelectObj=dao_select("SCO_MASTER")>
				<cfset TempSelectObj=dao_eq(TempSelectObj, "sco_id", "#result_array[LoopIndex][13]#")>
				<cfset q_sco_master=dao_result("#application.DSN#", TempSelectObj)>

				<cfif q_sco_master.class_id eq 1>
					<cfset Arr_tableCont[LoopIndex] = Replace(Arr_tableCont[LoopIndex], "SCO_STATUS", "completed")>
				<cfelse>
					<cfset Arr_tableCont[LoopIndex] = Replace(Arr_tableCont[LoopIndex], "SCO_STATUS", "incomplete")>
				</cfif>
			</cfcase>
			<cfcase value="failed">
				<cfset Arr_tableCont[LoopIndex] = Replace(Arr_tableCont[LoopIndex], "SCO_STATUS", "failed")>
			</cfcase>
			<cfcase value="passed">
				<cfset Arr_tableCont[LoopIndex] = Replace(Arr_tableCont[LoopIndex], "SCO_STATUS", "passed")>
			</cfcase>
			<cfdefaultcase>
				<cfset Arr_tableCont[LoopIndex] = Replace(Arr_tableCont[LoopIndex], "SCO_STATUS", "not_attempted")>
			</cfdefaultcase>
			</cfswitch>
		</cfloop>

		<!--- SCOの学習回数をmax(SCO_PROGRESS.lecture_count)からcount(SCO_PROGRESS.*)に変換--->
		<cfloop index="LoopIndex" from="1" to="#ArrayLen(result_array)#">
			<cfif result_array[LoopIndex][13] neq "">
				<cfset isNumericOrError(variables.user_id)>
				<cfset isNumericOrError(variables.course_id)>
				<cfset isNumericOrError(result_array[LoopIndex][13])>
				<cfquery name="q_getSPCount" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					select count(*) as lc from SCO_PROGRESS where user_id = #variables.user_id# and course_id = #variables.course_id# and sco_id = #result_array[LoopIndex][13]# and lecture_count <> -1
				</cfquery>
				<cfset result_array[LoopIndex][6] = q_getSPCount.lc>
			</cfif>
		</cfloop>

		<!--- パンくずリストの生成 --->
		<cfset strTopicPath = makeTopicPath(variables.mode)>

		<cfsetting enablecfoutputonly="no">
		<cfinclude template="inc_u_result_detail.cfm">	<!--- ur2と共用 --->
	</cfcase>

	<!---// ユーザー単位→成績表示→詳細→学習履歴 //--->
	<!---// コース単位→成績表示→詳細→学習履歴 //--->
	<cfcase value="ur2h,cr2h">
		<cfparam name="uid" default="-1">
		<cfset variables.user_id = uid>

		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>

		<cfparam name="sid2" default="-1">
		<cfset variables.sco_id2 = sid2>
		<cfparam name="sid" default="-1">
		<cfset variables.sco_id = sid>

		<cfparam name="gid" default="-1">
		<cfset variables.gid = gid>

		<!---  数値型の値をチェックする --->
		<cfset isNumericOrError( variables.user_id )>
		<cfset isNumericOrError( variables.sco_id2 )>

		<!--- パラメータのセット --->
		<cfset params.uid = variables.user_id>
		<cfset params.cid = variables.course_id>
		<cfset params.status = variables.status>
		<cfset params.u_search_word = variables.u_search_word>
		<cfset params.u_search_group = variables.u_search_group>
		<cfset params.u_search_course = variables.u_search_course>
		<cfset params.c_search_word = variables.c_search_word>
		<cfset params.c_search_label = variables.c_search_label>
		<cfset params.c_search_group = variables.c_search_group>

		<cfset data_hidden		= Duplicate(params)>
		<cfset data_hidden.sid	= sid>
		<cfset data_hidden.sid2	= sid2>
		<cfset data_hidden.gid	= gid>
		<cfif mode eq "ur2h">
			<cfset data_hidden.u_count		= u_count>
			<cfset data_hidden.ur_count		= ur_count>
			<cfset data_hidden.ur2_count	= ur2_count>
		<cfelseif mode eq "cr2h">
			<cfset data_hidden.c_count		= c_count>
			<cfset data_hidden.cr_count		= cr_count>
			<cfset data_hidden.cr2_count	= cr2_count>
		</cfif>
		<cfset hidden_str	= struct2hidden(data_hidden)>

		<!--- ユーザー情報 --->
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id" , variables.user_id)>
		<cfset user_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset str_user_name = user_info.last_name & "　" & user_info.first_name>
		<cfset str_user_logon = user_info.logon>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>

		<!--- SCO情報 --->
		<cfset Variables.TempSelectObj = dao_select("SCO_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "sco_id" , variables.sco_id2)>
		<cfset sco_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset str_sco_name = sco_info.sco_name>
		<cfset str_sco_type = getScoTypeString(sco_info.class_id, sco_info.sco_kind)>

		<!--- 成績取得 --->
		<cfset isNumericOrError(variables.sco_id2)>
		<cfset isNumericOrError(variables.user_id)>
		<cfif sco_info.sco_kind eq 3>
			<!--- 宿題の場合、コメント情報取得 --->
			<cfinvoke component="#Application.SqlStringComponent#" method="hw_scoprogress_001" returnVariable="__TempQueryString">
				<cfinvokeargument name="arg001" value="#variables.user_id#">
				<cfinvokeargument name="arg002" value="#variables.sco_id2#">
			</cfinvoke>
			<cfquery name="qGetScoProgress" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				#PreserveSingleQuotes(__TempQueryString)#
			</cfquery>
		<cfelse>
			<cfquery name="qGetScoProgress" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				SELECT 		SP.*, SM.class_id, SM.sco_kind, SM.flg_score
				FROM 		SCO_PROGRESS AS SP, SCO_MASTER AS SM
				WHERE 		SP.sco_id = #variables.sco_id2# AND SP.user_id = #variables.user_id# AND lecture_count != -1
							AND SP.sco_id = SM.sco_id
				ORDER BY 	lecture_count desc
			</cfquery>
		</cfif>

		<!--- パンくずリストの生成 --->
		<cfset strTopicPath = makeTopicPath(variables.mode)>

		<cfsetting enablecfoutputonly="no">
		<cfinclude template="inc_sco_history.cfm">	<!--- cr2hと共用 --->
	</cfcase>

	<!---// ユーザー単位→成績表示→詳細→回答内容 //--->
	<!---// コース単位→成績表示→詳細→回答内容 //--->
	<cfcase value="ur2t,cr2t">
		<cfparam name="uid" default="-1">
		<cfset variables.user_id = uid>

		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>

		<cfparam name="sid" default="-1">
		<cfset variables.sco_id = sid>
		<cfparam name="sid2" default="-1">
		<cfset variables.sco_id2 = sid2>

		<cfparam name="gid" default="-1">
		<cfset variables.gid = gid>

		<cfparam name="lc" default="0">
		<cfset variables.lecture_count = lc>

		<!---  数値型の値をチェックする --->
		<cfset isNumericOrError( variables.user_id )>
		<cfset isNumericOrError( variables.sco_id2 )>
		<cfset isNumericOrError( variables.lecture_count )>

		<!--- パラメータのセット --->
		<cfset params.uid = variables.user_id>
		<cfset params.cid = variables.course_id>
		<cfset params.status = variables.status>
		<cfset params.u_search_word = variables.u_search_word>
		<cfset params.u_search_group = variables.u_search_group>
		<cfset params.u_search_course = variables.u_search_course>
		<cfset params.c_search_word = variables.c_search_word>
		<cfset params.c_search_label = variables.c_search_label>
		<cfset params.c_search_group = variables.c_search_group>

		<cfset data_hidden		= Duplicate(params)>
		<cfset data_hidden.from	= from>
		<cfset data_hidden.sid	= sid>
		<cfset data_hidden.sid2	= sid2>
		<cfset data_hidden.lc	= lecture_count>
		<cfset data_hidden.gid	= gid>

		<cfif mode eq "ur2t">
			<cfset data_hidden.u_count		= u_count>
			<cfset data_hidden.ur_count		= ur_count>
			<cfset data_hidden.ur2_count	= ur2_count>
		<cfelseif mode eq "cr2t">
			<cfset data_hidden.c_count		= c_count>
			<cfset data_hidden.cr_count		= cr_count>
			<cfset data_hidden.cr2_count	= cr2_count>
		</cfif>

		<cfset hidden_str		= struct2hidden(data_hidden)>

		<!--- ユーザー情報 --->
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id" , variables.user_id)>
		<cfset user_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset str_user_name = user_info.last_name & "　" & user_info.first_name>
		<cfset str_user_logon = user_info.logon>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>

		<!--- SCO情報 --->
		<cfset Variables.TempSelectObj = dao_select("SCO_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "sco_id" , variables.sco_id2)>
		<cfset sco_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset str_sco_name = sco_info.sco_name>
		<cfset str_sco_type = getScoTypeString(sco_info.class_id, sco_info.sco_kind)>

		<!--- SCO成績取得 --->
		<cfset isNumericOrError(variables.sco_id2)>
		<cfset isNumericOrError(variables.user_id)>
		<cfset isNumericOrError(variables.lecture_count)>
		<cfquery name="qGetScoProgress" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			SELECT 		SP.*, SM.class_id, SM.sco_kind, SM.flg_score
			FROM 		SCO_PROGRESS AS SP, SCO_MASTER AS SM
			WHERE 		SP.sco_id = #variables.sco_id2# AND SP.user_id = #variables.user_id# AND SP.lecture_count = #variables.lecture_count#
						AND SP.sco_id = SM.sco_id
		</cfquery>

		<!--- TEST成績取得 --->
		<cfquery name="qGetItems" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			SELECT 		IT.*
			FROM 		ITEMS AS IT
			WHERE 		IT.sco_id = #variables.sco_id2# AND IT.user_id = #variables.user_id# AND IT.lecture_count = #variables.lecture_count#
			ORDER BY entry_count
		</cfquery>

		<cfif sco_info.sco_kind eq 3>
			<!--- 宿題の場合、コメント情報取得 --->
			<cfquery name="qGetHWFile" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				SELECT 		HW.*
				FROM 		HW_FILE AS HW
				WHERE 		HW.sco_id = #variables.sco_id2# AND HW.user_id = #variables.user_id# AND HW.lecture_count = #variables.lecture_count#
			</cfquery>
		</cfif>

		<!--- パンくずリストの生成 --->
		<cfset strTopicPath = makeTopicPath(variables.mode)>

		<cfsetting enablecfoutputonly="no">
		<cfinclude template="inc_test_detail.cfm">	<!--- cr2tと共用 --->
	</cfcase>

	<!--- 以下、CSV出力関連 --->
	<!---// ユーザー単位→成績表示→CSV //--->
	<cfcase value="u_csv">
		<cfparam name="uid" default="-1">
		<cfset variables.user_id = uid>

		<!--- ユーザー情報 --->
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id" , variables.user_id)>
		<cfset user_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset str_user_name = user_info.last_name & "　" & user_info.first_name>
		<cfset str_user_logon = user_info.logon>

		<cfset temp_user_id_list = "#variables.user_id#">

		<!--- コース取得 --->
		<!---<cfset course_list = cmObj.get_course_query_by_user_id(variables.user_id)>--->
		<cfset course_list = cmObj.get_course_query_for_search(now_login_user, variables.c_search_label, variables.c_search_word, variables.c_search_group)>
		<cfset temp_course_id_list = ValueList(course_list.course_id, ",")>

		<cfset user_array = ListToArray(temp_user_id_list)>
		<cfset course_array = ListToArray(temp_course_id_list)>

		<!--- 成績を取得 --->
		<cfset result_array = make_result_array_for_course(user_array , course_array , variables.status)>

		<!--- CSVに変換&出力 --->
		<cfset csv_name = 'eLM_result001_' & dateFormat(now() , "yyyymmdd") & timeFormat(now() , "HHmmss") & '.csv'>
		<cfset csv_data = result2csv(6, result_array, csv_name)>
	</cfcase>

	<!---// コース単位→成績表示→CSV //--->
	<cfcase value="c_csv">
		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>

		<cfif variables.u_search_group is "-1">
			<cfset variables.u_search_group = "">
		</cfif>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>

		<cfset temp_course_id_list = "#variables.course_id#">

		<!--- ユーザー取得 --->
		<cfset user_list = umObj.get_user_list_ex(now_login_user, customer_name, variables.u_search_word, variables.course_id, variables.u_search_group)>

		<cfif customer_name eq "sonylife">
			<!--- ソニー生命用絞込み --->
			<cfif variables.u_search_val1 neq "">
				<cfswitch expression="#variables.u_search_val1#">
				<cfcase value="1"><!--- 一次履修者 --->
					<cfset str_where = "text_3 like '111%' OR text_3 like '101%' OR text_3 like '110%' ">
				</cfcase>
				<cfcase value="2"><!--- 二次履修者 --->
					<cfset str_where = "text_3 like '100%' ">
				</cfcase>
				<cfcase value="3"><!--- 必須履修者 --->
					<cfset str_where = "text_3 like '0001%' ">
				</cfcase>
				<cfcase value="4"><!--- 任意履修者 --->
					<cfset str_where = "text_3 like '0000%' ">
				</cfcase>
				<cfdefaultcase>
					<cfset str_where = "1=1 ">
				</cfdefaultcase>
				</cfswitch>
				<cfquery name="user_list_2" dbtype="query">
					SELECT * FROM user_list.list WHERE #PreserveSingleQuotes(str_where)#
				</cfquery>
				<cfset temp_user_id_list = ValueList(user_list_2.user_id, ",")>
			<cfelse>
				<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>
			</cfif>
		<cfelse>
			<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>
		</cfif>

		<cfset user_array = ListToArray(temp_user_id_list)>
		<cfset course_array = ListToArray(temp_course_id_list)>

		<!--- 成績を取得 --->
		<cfset result_array = make_result_array_for_course(user_array , course_array , variables.status, "", 1)>

		<!--- CSVに変換&出力 --->
		<cfset csv_name = 'eLM_result001_' & dateFormat(now() , "yyyymmdd") & timeFormat(now() , "HHmmss") & '.csv'>
		<cfset csv_data = result2csv(1, result_array, csv_name)>
	</cfcase>

	<!---// コース単位→成績表示→CSV（初回解答） //--->
	<cfcase value="c_csv_fa">
		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>

		<cfif variables.u_search_group is "-1">
			<cfset variables.u_search_group = "">
		</cfif>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>

		<cfset temp_course_id_list = "#variables.course_id#">

		<!--- SCO情報 --->
		<cfset q_sco = smObj.get_sco_query_by_course_id(variables.course_id, 1)>
		<cfquery name="q_sco" dbtype="query">
			SELECT * FROM q_sco WHERE class_id = 2 AND sco_kind = 1
		</cfquery>
		<cfset temp_sco_id_list = ValueList(q_sco.sco_id, ",")>

		<!--- ユーザー取得 --->
		<cfset user_list = umObj.get_user_list_ex(now_login_user, customer_name, variables.u_search_word, variables.course_id, variables.u_search_group)>
		<!---<cfset user_id_list = ValueList(user_list.list.user_id, "|")>--->
		<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>

		<cfset arr_temp = ArrayNew(1)>
		<cfset arr_info = ArrayNew(2)>
		<cfset row_count = 0>

		<!--- コース情報 --->
		<cfset arr_temp[11] = variables.course_id>
		<cfset arr_temp[12] = course_info.course_name>
		<cfset arr_temp[13] = ''>
		<cfset arr_temp[14] = ''>
		<cfset arr_temp[15] = ''>
		<cfset arr_temp[16] = ''>
		<cfset arr_temp[17] = ''>
		<cfset arr_temp[18] = ''>
		<cfset arr_temp[19] = ''>
		<cfset arr_temp[20] = ''>

		<cfloop query="user_list.list">
			<cfset cur_user_id = user_id>

			<!--- ユーザー情報 --->
			<cfset arr_temp[1] = user_id>
			<cfset arr_temp[2] = logon>
			<cfset arr_temp[3] = last_name>
			<cfset arr_temp[4] = first_name>
			<cfset arr_temp[5] = last_name_furi>
			<cfset arr_temp[6] = first_name_furi>
			<cfset arr_temp[7] = mailaddress>
			<cfset arr_temp[8] = ''>
			<cfset arr_temp[9] = ''>
			<cfset arr_temp[10] = ''>

			<cfloop query="q_sco">
				<cfset cur_sco_id = sco_id>

				<!--- SCO情報 --->
				<cfset arr_temp[21] = sco_id>
				<cfset arr_temp[22] = sco_name>
				<cfset arr_temp[23] = getScoTypeString(class_id, sco_kind)>
				<cfset arr_temp[24] = ''>
				<cfset arr_temp[25] = ''>
				<cfset arr_temp[26] = ''>
				<cfset arr_temp[27] = ''>
				<cfset arr_temp[28] = ''>
				<cfset arr_temp[29] = ''>
				<cfset arr_temp[30] = ''>

				<!--- SCO成績取得 --->
				<cfquery name="qGetScoProgress" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					SELECT 		SP.*
					FROM 		SCO_PROGRESS AS SP
					WHERE 		SP.sco_id = #cur_sco_id#
						AND 	SP.user_id = #cur_user_id#
						AND 	(SP.status = 'failed' OR SP.status = 'passed')
					ORDER BY 	lecture_count
				</cfquery>

				<cfset cur_sco_lecture_count = qGetScoProgress.lecture_count>

				<!--- SCO成績 --->
				<cfset arr_temp[31] = qGetScoProgress.lecture_count>
				<cfset arr_temp[32] = DateFormat(qGetScoProgress.start_date , 'yyyy/mm/dd') & ' ' & TimeFormat(qGetScoProgress.start_date , 'HH:mm:ss')>
				<cfset arr_temp[33] = DateFormat(qGetScoProgress.end_date , 'yyyy/mm/dd') & ' ' & TimeFormat(qGetScoProgress.end_date , 'HH:mm:ss')>
				<cfset arr_temp[34] = fn_sec2time(qGetScoProgress.eLM_session_time)>
				<cfset arr_temp[35] = status2str(qGetScoProgress.status)>
				<cfset arr_temp[36] = qGetScoProgress.score>
				<cfset arr_temp[37] = ''>
				<cfset arr_temp[38] = ''>
				<cfset arr_temp[39] = ''>
				<cfset arr_temp[40] = ''>

				<cfif qGetScoProgress.recordcount gt 0>

					<!--- TEST成績取得 --->
					<cfquery name="qGetItems" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
						SELECT 		IT.*
						FROM 		ITEMS AS IT
						WHERE 		IT.sco_id = #cur_sco_id# AND IT.user_id = #cur_user_id# AND IT.lecture_count = #cur_sco_lecture_count#
					</cfquery>

					<cfset item_count = 0>
					<cfloop query="qGetItems">
						<cfset row_count = row_count + 1>
						<cfset item_count = item_count + 1>

						<cfloop index="arr_loop" from="1" to="#ArrayLen(arr_temp)#">
							<cfset arr_info[row_count][arr_loop] = arr_temp[arr_loop]>
						</cfloop>

						<cfset str__correct_response = "">
						<cfif correct_responses_json neq "">
							<cfset temp_correct_response = objJSON.decode(correct_responses_json)>
							<cfloop index="ArrayIndex" from="1" to="#ArrayLen(temp_correct_response)#">
								<cfif str__correct_response eq "">
									<cfset str__correct_response = temp_correct_response[ArrayIndex].pattern>
								<cfelse>
									<cfset str__correct_response = str__correct_response & "|" & temp_correct_response[ArrayIndex].pattern>
								</cfif>
							</cfloop>
						</cfif>

						<!--- 回答内容 --->
						<cfset arr_info[row_count][41] = item_count>
						<cfset arr_info[row_count][42] = id>
						<cfset arr_info[row_count][43] = user_response>
						<cfset arr_info[row_count][44] = str__correct_response>
						<cfset arr_info[row_count][45] = fn_output_result_mark(result)>
					</cfloop>
				</cfif>

			</cfloop>
		</cfloop>

		<!--- CSVに変換&出力 --->
		<cfset csv_name = 'eLM_result005_' & dateFormat(now() , "yyyymmdd") & timeFormat(now() , "HHmmss") & '.csv'>
		<cfset csv_data = result2csv(3, arr_info, csv_name)>

	</cfcase>

	<!---// コース単位→成績表示→CSV（教材成績） //--->
	<cfcase value="c_csv_sco_list">

<cfsilent>
		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>

		<cfif variables.u_search_group is "-1">
			<cfset variables.u_search_group = "">
		</cfif>

		<cfsetting enablecfoutputonly="No" requestTimeOut="3600">
		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>

		<cfset temp_course_id_list = "#variables.course_id#">

		<!--- ユーザー取得 --->
		<cfset user_list = umObj.get_user_list_ex(now_login_user, customer_name, variables.u_search_word, variables.course_id, variables.u_search_group)>

		<cfif customer_name eq "sonylife">
			<!--- ソニー生命用絞込み --->
			<cfif variables.u_search_val1 neq "">
				<cfswitch expression="#variables.u_search_val1#">
				<cfcase value="1"><!--- 一次履修者 --->
					<cfset str_where = "text_3 like '111%' OR text_3 like '101%' OR text_3 like '110%' ">
				</cfcase>
				<cfcase value="2"><!--- 二次履修者 --->
					<cfset str_where = "text_3 like '100%' ">
				</cfcase>
				<cfcase value="3"><!--- 必須履修者 --->
					<cfset str_where = "text_3 like '0001%' ">
				</cfcase>
				<cfcase value="4"><!--- 任意履修者 --->
					<cfset str_where = "text_3 like '0000%' ">
				</cfcase>
				<cfdefaultcase>
					<cfset str_where = "1=1 ">
				</cfdefaultcase>
				</cfswitch>
				<cfquery name="user_list_2" dbtype="query">
					SELECT * FROM user_list.list WHERE #PreserveSingleQuotes(str_where)#
				</cfquery>
				<cfset temp_user_id_list = ValueList(user_list_2.user_id, ",")>
			<cfelse>
				<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>
			</cfif>
		<cfelse>
			<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>
		</cfif>
		<cfset arr_user_id = ListToArray(temp_user_id_list)>

		<cfset user_array = arr_user_id>
		<cfset course_array = ListToArray(temp_course_id_list)>

		<!--- ステータスによる絞込み --->
		<cfset arr_user_id = make_result_array_for_status( user_array, course_array, variables.status )>

</cfsilent>

		<!--- 受講者抽出と解答抽出の2重ループで回す --->
		<cfif temp_course_id_list eq "" or  temp_user_id_list eq "">
			<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_user_undefined:ja=本コースには受講者が登録されていません。')#</cfoutput>
			<cfabort>
		<cfelse>
			<cfset de = lsObj.get_value("csv.delimiter")>

			<cfset csv_name = 'eLM_result017_' & dateFormat(now() , "yyyymmdd") & timeFormat(now() , "HHmmss") & '.csv'>
			<cfheader name="Content-Disposition" value="attachment;filename=#csv_name#">
			<cfheader name="Pragma" value="">
			<cfheader name="Cache-Control" value= "">
			<cfcontent type="text/csv; charset=#lsObj.get_value("csv.charset")#" reset="no">
			<cfflush>

			<!---  数値型の値をチェックする --->
			<cfset isNumericOrError( temp_course_id_list )>

			<!--- すぐダウンロードダイアログが表示されるよう、SQL実行前に出力 --->
			<cfoutput>#double_quote("eLearningManager")##de##double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_2_title:ja=教材学習成績一覧'))##de##de##double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_2_output_date:ja=出力日時'))##de##double_quote(DateFormat(Now(),"yyyy-mm-dd") & " " & TimeFormat(Now(),"HH:mm:ss"))##chr(10)##chr(10)#</cfoutput>
			<cfset temp_csv_col_arr = arrayNew(1)>
			<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_2_col_1:ja=姓')))>
			<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_2_col_2:ja=名')))>
			<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_2_col_3:ja=姓（ふりがな）')))>
			<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_2_col_4:ja=名（ふりがな）')))>
			<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_2_col_5:ja=ユーザーID ')))>
			<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_2_col_6:ja=メールアドレス')))>
			<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_2_col_7:ja=コース名')))>
			<cfset temp_csv_col_str = ArrayToList(temp_csv_col_arr,#de#)>
			<cfoutput>#temp_csv_col_str#</cfoutput>

			<cfquery name="qGetScoList" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				SELECT SM.sco_name, C.order_no
				FROM   SCO_MASTER AS SM, CONSTRUCT AS C
				WHERE  C.course_id = #temp_course_id_list#
				AND    SM.sco_id = C.sco_id
				AND    SM.sco_type = 1
				ORDER BY C.order_no
			</cfquery>
			<cfloop query="qGetScoList">
				<cfoutput>#de##double_quote(sco_name)#</cfoutput>
			</cfloop>
			<cfoutput>#chr(10)#</cfoutput>

			<cfloop index="i" from="1" to="#arrayLen(arr_user_id)#">
				<cfset isNumericOrError(arr_user_id[i])>
				<cfset tempSql = "
					SELECT  UM.user_id, SM.sco_id, logon, last_name, first_name, last_name_furi, first_name_furi, mailaddress,
					        #dao_ifnull()#(SP.lecture_count, 0) AS lecture_count,
					        #dao_ifnull()#(SP.status, 'not attempted') AS status
					FROM USER_MASTER UM
					INNER JOIN SCO_MASTER SM ON 1=1
					INNER JOIN CONSTRUCT C ON SM.sco_id = C.sco_id
					LEFT JOIN SCO_PROGRESS SP ON UM.user_id = SP.user_id AND
					                             SM.sco_id = SP.sco_id AND 
					                             SP.lecture_count <> -1
					LEFT JOIN SCO_PROGRESS_RECORD SPR ON SPR.type = 2 AND SP.user_id = SPR.user_id AND
					                                     SP.sco_id = SPR.sco_id AND
					                                     SP.lecture_count = SPR.lecture_count
					WHERE UM.user_id = #arr_user_id[i]# AND
					      C.course_id = #temp_course_id_list# AND
					      SM.sco_type = 1 AND (SPR.type = 2 OR SP.lecture_count IS NULL)
					ORDER BY C.order_no
				">
				<cfquery name="qGetScoProgress" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					#PreserveSingleQuotes(tempSql)#
				</cfquery>
				<cfset RowCount = 0>
				<cfloop query="qGetScoProgress">
					<cfset RowCount = RowCount + 1>
					<cfif RowCount eq 1>
						<cfoutput>#'"' & last_name & '"' & de & '"' & first_name & '"' & de & '"' & last_name_furi & '"' & de & '"' & first_name_furi & '"' & de & '"' & logon & '"' & de & '"' & mailaddress & '"'#</cfoutput>
						<cfoutput># de & '"' & str_course_name & '"'#</cfoutput>
					</cfif>
					<cfoutput># de & '"' & status2str(status) & '"'#</cfoutput>
				</cfloop>
				<cfoutput>#chr(10)#</cfoutput>
			</cfloop>
			<cfabort>
		</cfif>

	</cfcase>

	<!---// コース単位→成績表示→CSV（テスト点数分布） //--->
	<cfcase value="c_csv_test_score">
		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>
		<cfset course_id_safe = dao_escape(variables.course_id)>

<cfsilent>

		<cfif variables.u_search_group is "-1">
			<cfset variables.u_search_group = "">
		</cfif>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>
		<cfset temp_course_id_list = "#variables.course_id#">

		<!--- ユーザー取得 --->
		<cfset user_list = umObj.get_user_list_ex(now_login_user, customer_name, variables.u_search_word, variables.course_id, variables.u_search_group)>
		<cfif customer_name eq "sonylife">
			<!--- ソニー生命用絞込み --->
			<cfif variables.u_search_val1 neq "">
				<cfswitch expression="#variables.u_search_val1#">
				<cfcase value="1"><!--- 一次履修者 --->
					<cfset str_where = "text_3 like '111%' OR text_3 like '101%' OR text_3 like '110%' ">
				</cfcase>
				<cfcase value="2"><!--- 二次履修者 --->
					<cfset str_where = "text_3 like '100%' ">
				</cfcase>
				<cfcase value="3"><!--- 必須履修者 --->
					<cfset str_where = "text_3 like '0001%' ">
				</cfcase>
				<cfcase value="4"><!--- 任意履修者 --->
					<cfset str_where = "text_3 like '0000%' ">
				</cfcase>
				<cfdefaultcase>
					<cfset str_where = "1=1 ">
				</cfdefaultcase>
				</cfswitch>
				<cfquery name="user_list_2" dbtype="query">
					SELECT * FROM user_list.list WHERE #PreserveSingleQuotes(str_where)#
				</cfquery>
				<cfset temp_user_id_list = ValueList(user_list_2.user_id, ",")>
			<cfelse>
				<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>
			</cfif>
		<cfelse>
			<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>
		</cfif>
</cfsilent>

		<!--- 表示タイプ取得 --->
		<cfinvoke component="#SERVICE_ADDRESS#.table_lms_setting"
		          method="get_value"
		          param_name="indication_type"
		          returnVariable="type"
		>

		<cfif temp_user_id_list eq "" >
			<cfset temp_user_id_list = "0">
		</cfif>

		<!--- 成績による絞り込み 有効な絞り込みの場合のみ処理する --->
		<cfif variables.status neq ''>
			<cfswitch expression="#variables.status#">
			<cfcase value="not_attempted,not attempted">
				<cfset cond_status = "course_status = 'not attempted'">
			</cfcase>
			<cfcase value="incomplete">
				<cfset cond_status = "course_status = 'incomplete'">
			</cfcase>
			<cfcase value="completed">
				<cfset cond_status = "course_status = 'completed'">
			</cfcase>
			<cfdefaultcase>
				<cfset cond_status = "">
			</cfdefaultcase>
			</cfswitch>
			<cfif cond_status neq ''>
				<cfquery name="qGetUsers" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					SELECT U.USER_ID
					FROM USER_MASTER AS U
					INNER JOIN COURSE_MASTER C  ON C.COURSE_ID = '#preserveSingleQuotes(course_id_safe)#'
					LEFT JOIN COURSE_PROGRESS_RECORD CPR ON CPR.COURSE_ID = C.COURSE_ID AND CPR.USER_ID = U.USER_ID AND CPR.TYPE = #type#
					WHERE U.USER_ID IN (#temp_user_id_list#)
					      AND #preserveSingleQuotes(cond_status)#
					ORDER BY U.LAST_NAME_FURI, U.FIRST_NAME_FURI, U.LOGON
				</cfquery>
				<cfset temp_user_id_list = ValueList(qGetUsers.user_id, ",")>
			</cfif>
		</cfif>

		<cfif temp_user_id_list eq "" >
			<cfset temp_user_id_list = "0">
		</cfif>

		<!--- 点数情報を取得 --->
		<cfset isNumericOrError(type)>
		<cfquery name="qResults" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			SELECT S.SCO_ID, SP.SCORE
			FROM USER_MASTER U
			INNER JOIN COURSE_MASTER C ON C.COURSE_ID = #preserveSingleQuotes(course_id_safe)#
			INNER JOIN CONSTRUCT CO ON C.COURSE_ID = CO.COURSE_ID
			INNER JOIN SCO_MASTER S ON CO.SCO_ID = S.SCO_ID AND
			                           S.SCO_TYPE = 1 AND
			                           S.CLASS_ID = 2 /*クイズ教材のみ*/
			INNER JOIN SCO_PROGRESS_RECORD SPR ON U.USER_ID   = SPR.USER_ID   AND
			                                      C.COURSE_ID = SPR.COURSE_ID AND
			                                      S.SCO_ID    = SPR.SCO_ID    AND
			                                      SPR.TYPE    = #type#
			INNER JOIN SCO_PROGRESS SP ON SPR.USER_ID       = SP.USER_ID   AND
			                              SPR.COURSE_ID     = SP.COURSE_ID AND
			                              SPR.SCO_ID        = SP.SCO_ID    AND
			                              SPR.LECTURE_COUNT = SP.LECTURE_COUNT
			WHERE U.USER_ID IN (#temp_user_id_list#)
		</cfquery>
		<cfquery name="qScoOrder" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			SELECT S.SCO_ID, S.SCO_NAME, S.MAX_SCORE, CO.ORDER_NO
			FROM COURSE_MASTER C
			INNER JOIN CONSTRUCT CO ON C.COURSE_ID = CO.COURSE_ID
			INNER JOIN SCO_MASTER S ON CO.SCO_ID = S.SCO_ID AND
			                           S.SCO_TYPE = 1 AND
			                           S.CLASS_ID = 2 /*クイズ教材のみ*/
			WHERE C.COURSE_ID = #preserveSingleQuotes(course_id_safe)#
			ORDER BY CO.ORDER_NO
		</cfquery>

		<cfif qScoOrder.recordcount is 0>
			<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_quiz_undefined:ja=本コースにはテストが登録されていません。')#</cfoutput>
			<cfabort>
		</cfif>

		<cfset sResults = StructNew()><!--- 度数分布表の配列 --->
		<cfloop query = "qScoOrder">
			<cfset sResults[qScoOrder.sco_id] = StructNew()>
			<cfset sResults[qScoOrder.sco_id].sco_id      = qScoOrder.sco_id>
			<cfset sResults[qScoOrder.sco_id].sco_name    = qScoOrder.sco_name>
			<cfset sResults[qScoOrder.sco_id].data_array  = ArrayNew(1)>
			<cfset sResults[qScoOrder.sco_id].granularity = 5>
			<cfset sResults[qScoOrder.sco_id].max_score   = qScoOrder.max_score>
		</cfloop>
		<cfloop query = "qResults">
			<cfif isnumeric(qResults.score)>
				<cfset target = int(qResults.score / sResults[qResults.sco_id].granularity) + 1>
				<cfloop condition="ArrayLen(sResults[qResults.sco_id].data_array) lt target">
					<cfset ArrayAppend(sResults[qResults.sco_id].data_array, 0)>
				</cfloop>
				<cfset sResults[qResults.sco_id].data_array[target] = sResults[qResults.sco_id].data_array[target] + 1>
			</cfif>
		</cfloop>

		<cfset resultArr = ArrayNew(1)>
		<cfloop query="qScoOrder">
			<cfset ArrayAppend(resultArr, sResults[qScoOrder.sco_id])>
		</cfloop>
		<!--- CSVに変換 --->
		<cfset csv_name = 'eLM_result019_' & dateFormat(now() , "yyyymmdd") & timeFormat(now() , "HHmmss") & '.csv'>
		<cfset csv_data = freqtable2csv(resultArr, csv_name)>
	</cfcase>

	<!---// コース単位→成績表示→CSV（受講時間解析） //--->
	<cfcase value="c_csv_time">
		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>

		<cfif variables.u_search_group is "-1">
			<cfset variables.u_search_group = "">
		</cfif>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>
		<cfset temp_course_id_list = "#variables.course_id#">

		<!--- ユーザー取得 --->
		<cfset user_list = umObj.get_user_list_ex(now_login_user, customer_name, variables.u_search_word, variables.course_id, variables.u_search_group)>
		<cfif customer_name eq "sonylife">
			<!--- ソニー生命用絞込み --->
			<cfif variables.u_search_val1 neq "">
				<cfswitch expression="#variables.u_search_val1#">
				<cfcase value="1"><!--- 一次履修者 --->
					<cfset str_where = "text_3 like '111%' OR text_3 like '101%' OR text_3 like '110%' ">
				</cfcase>
				<cfcase value="2"><!--- 二次履修者 --->
					<cfset str_where = "text_3 like '100%' ">
				</cfcase>
				<cfcase value="3"><!--- 必須履修者 --->
					<cfset str_where = "text_3 like '0001%' ">
				</cfcase>
				<cfcase value="4"><!--- 任意履修者 --->
					<cfset str_where = "text_3 like '0000%' ">
				</cfcase>
				<cfdefaultcase>
					<cfset str_where = "1=1 ">
				</cfdefaultcase>
				</cfswitch>
				<cfquery name="user_list_2" dbtype="query">
					SELECT * FROM user_list.list WHERE #PreserveSingleQuotes(str_where)#
				</cfquery>
				<cfset temp_user_id_list = ValueList(user_list_2.user_id, ",")>
			<cfelse>
				<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>
			</cfif>
		<cfelse>
			<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>
		</cfif>

		<cfset user_array = ListToArray(temp_user_id_list)>
		<cfset course_array = ListToArray(temp_course_id_list)>

		<!--- ステータスによる絞込み --->
		<cfset arr_user_id = make_result_array_for_status( user_array, course_array, variables.status )>

		<!--- SCO情報を取得 --->
		<cfset qGetScoProgress = spObj.get_sco_progress_query_by_user_id(arr_user_id , course_array)>
		<cfquery name="qGetProgress" dbtype="query">
			select * from qGetScoProgress order by order_no, sco_id
		</cfquery>

		<cfset resultArr = ArrayNew(1)><!--- 受講時間分析表の配列 --->
		<cfset current_sco_id = -1>
		<cfloop query = "qGetProgress">
			<cfif qGetProgress.sco_id neq current_sco_id>
				<cfif current_sco_id neq -1>
					<cfset ArrayAppend(resultArr, freqStruct)>
				</cfif>
				<cfset current_sco_id = qGetProgress.sco_id>
				<cfset freqStruct = StructNew()><!--- 1教材分の時間分析表 --->
				<cfset freqStruct.sco_id        = qGetProgress.sco_id>
				<cfset freqStruct.sco_name      = qGetProgress.sco_name>
				<cfset freqStruct.user_count    = 0>
				<cfset freqStruct.total_time    = 0>
				<cfset freqStruct.lecture_count = 0>
			</cfif>

			<cfif qGetProgress.lecture_count neq 0>
				<cfset freqStruct.user_count = freqStruct.user_count + 1>
				<cfset freqStruct.total_time = freqStruct.total_time + fn_time2sec(qGetProgress.eLM_total_time)>
				<cfset freqStruct.lecture_count = freqStruct.lecture_count + qGetProgress.m_lc>
			</cfif>
		</cfloop>
		<cfif current_sco_id neq -1>
			<cfset ArrayAppend(resultArr, freqStruct)>
		</cfif>

		<!--- CSVに変換&出力 --->
		<cfset csv_name = 'eLM_result018_' & dateFormat(now() , "yyyymmdd") & timeFormat(now() , "HHmmss") & '.csv'>
		<cfset csv_data = timetable2csv(resultArr, csv_name)>
	</cfcase>

	<!---// ユーザー単位→成績表示→詳細→CSV //--->
	<!---// コース単位→成績表示→詳細→CSV //--->
	<cfcase value="u2_csv,c2_csv">
		<cfparam name="uid" default="-1">
		<cfset variables.user_id = uid>

		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>

		<cfif variables.u_search_group is "-1">
			<cfset variables.u_search_group = "">
		</cfif>

		<!--- ユーザー情報 --->
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id" , variables.user_id)>
		<cfset user_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset str_user_name = user_info.last_name & "　" & user_info.first_name>
		<cfset str_user_logon = user_info.logon>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>

		<cfset temp_user_id_list = "#variables.user_id#">
		<cfset temp_course_id_list = "#variables.course_id#">

		<cfset user_array = ListToArray(temp_user_id_list)>
		<cfset course_array = ListToArray(temp_course_id_list)>

		<!--- 成績を取得 --->
		<cfset result_array = make_result_array(user_array , course_array, indication_type)>

		<cfif ArrayLen(result_array) gt 0>
			<cfset ArrayDeleteAt(result_array, 1)>	<!--- コースの成績を削除 --->
		</cfif>

		<!--- SCOの学習回数をmax(SCO_PROGRESS.lecture_count)からcount(SCO_PROGRESS.*)に変換--->
		<cfloop index="LoopIndex" from="1" to="#ArrayLen(result_array)#">
			<cfif result_array[LoopIndex][13] neq "">
				<cfset isNumericOrError(variables.user_id)>
				<cfset isNumericOrError(variables.course_id)>
				<cfquery name="q_getSPCount" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					select count(*) as lc from SCO_PROGRESS where user_id = #variables.user_id# and course_id = #variables.course_id# and sco_id = #result_array[LoopIndex][13]# and lecture_count <> -1
				</cfquery>
				<cfset result_array[LoopIndex][6] = q_getSPCount.lc>
			</cfif>
		</cfloop>

		<!--- CSVに変換&出力 --->
		<cfset csv_name = 'eLM_result002_' & dateFormat(now() , "yyyymmdd") & timeFormat(now() , "HHmmss") & '.csv'>
		<cfset csv_data = result2csv(2, result_array, csv_name)>
	</cfcase>

	<!---// ユーザー単位→成績表示→詳細→学習履歴→CSV //--->
	<!---// コース単位→成績表示→詳細→学習履歴→CSV //--->
	<cfcase value="u2h_csv,c2h_csv">
		<cfparam name="uid" default="-1">
		<cfset variables.user_id = uid>
		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>
		<cfparam name="sid" default="-1">
		<cfset variables.sco_id = sid>
		<cfparam name="sid2" default="-1">
		<cfset variables.sco_id2 = sid2>

		<!---  数値型の値をチェックする --->
		<cfset isNumericOrError( variables.sco_id2 )>
		<cfset isNumericOrError( variables.user_id )>

		<cfif variables.u_search_group is "-1">
			<cfset variables.u_search_group = "">
		</cfif>

		<cfset arr_info = ArrayNew(1)>

		<!--- ユーザー情報 --->
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id" , variables.user_id)>
		<cfset user_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset arr_info[1] = user_info.user_id>
		<cfset arr_info[2] = user_info.logon>
		<cfset arr_info[3] = user_info.last_name>
		<cfset arr_info[4] = user_info.first_name>
		<cfset arr_info[5] = user_info.last_name_furi>
		<cfset arr_info[6] = user_info.first_name_furi>
		<cfset arr_info[7] = user_info.mailaddress>
		<cfset arr_info[8] = ''>
		<cfset arr_info[9] = ''>
		<cfset arr_info[10] = ''>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset arr_info[11] = course_info.course_id>
		<cfset arr_info[12] = course_info.course_name>
		<cfset arr_info[13] = ''>
		<cfset arr_info[14] = ''>
		<cfset arr_info[15] = ''>
		<cfset arr_info[16] = ''>
		<cfset arr_info[17] = ''>
		<cfset arr_info[18] = ''>
		<cfset arr_info[19] = ''>
		<cfset arr_info[20] = ''>

		<!--- SCO情報 --->
		<cfset Variables.TempSelectObj = dao_select("SCO_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "sco_id" , variables.sco_id2)>
		<cfset sco_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset arr_info[21] = sco_info.sco_id>
		<cfset arr_info[22] = sco_info.sco_name>
		<cfset arr_info[23] = getScoTypeString(sco_info.class_id, sco_info.sco_kind)>
		<cfset arr_info[24] = sco_info.sco_kind >

		<!--- 成績取得 --->
		<cfset isNumericOrError(variables.sco_id2)>
		<cfset isNumericOrError(variables.user_id)>
		<cfif sco_info.sco_kind eq 3>
			<!--- 宿題の場合、コメント情報取得 --->
			<cfinvoke component="#Application.SqlStringComponent#" method="hw_scoprogress_001" returnVariable="__TempQueryString">
				<cfinvokeargument name="arg001" value="#variables.user_id#">
				<cfinvokeargument name="arg002" value="#variables.sco_id2#">
			</cfinvoke>
			<cfquery name="qGetScoProgress" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				#PreserveSingleQuotes(__TempQueryString)#
			</cfquery>
		<cfelse>
			<cfquery name="qGetScoProgress" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				SELECT 		SP.*, SM.class_id, SM.sco_kind, SM.flg_score
				FROM 		SCO_PROGRESS AS SP, SCO_MASTER AS SM
				WHERE 		SP.sco_id = #variables.sco_id2# AND SP.user_id = #variables.user_id# AND lecture_count != -1
							AND SP.sco_id = SM.sco_id
				ORDER BY 	lecture_count desc
			</cfquery>
		</cfif>

		<!--- CSVに変換&出力 --->
		<cfset csv_name = 'eLM_result003_' & dateFormat(now() , "yyyymmdd") & timeFormat(now() , "HHmmss") & '.csv'>
		<cfset csv_data = resultquery2csv(1, arr_info, qGetScoProgress, csv_name)>
	</cfcase>

	<!---// ユーザー単位→成績表示→詳細→回答内容→CSV //--->
	<!---// コース単位→成績表示→詳細→回答内容→CSV //--->
	<cfcase value="u2t_csv,c2t_csv">
		<cfparam name="uid" default="-1">
		<cfset variables.user_id = uid>
		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>
		<cfparam name="sid" default="-1">
		<cfset variables.sco_id = sid>
		<cfparam name="sid2" default="-1">
		<cfset variables.sco_id2 = sid2>
		<cfparam name="lc" default="0">
		<cfset variables.lecture_count = lc>

		<!---  数値型の値をチェックする --->
		<cfset isNumericOrError( variables.sco_id2 )>
		<cfset isNumericOrError( variables.user_id )>
		<cfset isNumericOrError( variables.lecture_count )>

		<cfif variables.u_search_group is "-1">
			<cfset variables.u_search_group = "">
		</cfif>

		<cfset arr_info = ArrayNew(1)>

		<!--- ユーザー情報 --->
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id" , variables.user_id)>
		<cfset user_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset arr_info[1] = user_info.user_id>
		<cfset arr_info[2] = user_info.logon>
		<cfset arr_info[3] = user_info.last_name>
		<cfset arr_info[4] = user_info.first_name>
		<cfset arr_info[5] = user_info.last_name_furi>
		<cfset arr_info[6] = user_info.first_name_furi>
		<cfset arr_info[7] = user_info.mailaddress>
		<cfset arr_info[8] = ''>
		<cfset arr_info[9] = ''>
		<cfset arr_info[10] = ''>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset arr_info[11] = course_info.course_id>
		<cfset arr_info[12] = course_info.course_name>
		<cfset arr_info[13] = ''>
		<cfset arr_info[14] = ''>
		<cfset arr_info[15] = ''>
		<cfset arr_info[16] = ''>
		<cfset arr_info[17] = ''>
		<cfset arr_info[18] = ''>
		<cfset arr_info[19] = ''>
		<cfset arr_info[20] = ''>

		<!--- SCO情報 --->
		<cfset Variables.TempSelectObj = dao_select("SCO_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "sco_id" , variables.sco_id2)>
		<cfset sco_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset arr_info[21] = sco_info.sco_id>
		<cfset arr_info[22] = sco_info.sco_name>
		<cfset arr_info[23] = getScoTypeString(sco_info.class_id, sco_info.sco_kind)>

		<!--- SCO成績取得 --->
		<cfquery name="qGetScoProgress" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			SELECT 		SP.*, SM.class_id, SM.sco_kind, SM.flg_score
			FROM 		SCO_PROGRESS AS SP, SCO_MASTER AS SM
			WHERE 		SP.sco_id = #variables.sco_id2# AND SP.user_id = #variables.user_id# AND SP.lecture_count = #variables.lecture_count#
						AND SP.sco_id = SM.sco_id
		</cfquery>
		<cfset arr_info[24] = status2str(qGetScoProgress.status)>
		<cfset arr_info[25] = variables.lecture_count & #Session.termObj.get_term('eLM_admin_course_report3_csv_3_times:ja=回目')#>
		<cfif qGetScoProgress.flag_get_score is 1>
			<cfset arr_info[26] = qGetScoProgress.score>
		<cfelse>
			<cfset arr_info[26] = "---">
		</cfif>
		<cfset arr_info[27] = DateFormat(qGetScoProgress.start_date , 'yyyy/mm/dd') & ' ' & TimeFormat(qGetScoProgress.start_date , 'HH:mm')>
		<cfset arr_info[28] = DateFormat(qGetScoProgress.end_date , 'yyyy/mm/dd') & ' ' & TimeFormat(qGetScoProgress.end_date , 'HH:mm')>>
		<cfset arr_info[29] = fn_sec2time(qGetScoProgress.eLM_total_time)>
		<cfset arr_info[30] = sco_info.sco_kind >

		<!--- TEST成績取得 --->
		<cfquery name="qGetItems" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			SELECT 		IT.*
			FROM 		ITEMS AS IT
			WHERE 		IT.sco_id = #variables.sco_id2# AND IT.user_id = #variables.user_id# AND IT.lecture_count = #variables.lecture_count#
		</cfquery>

		<cfif sco_info.sco_kind eq 3>
			<!--- 宿題の場合、コメント情報取得 --->
			<cfset arr_info[31] = "" >
			<cfquery name="qGetHWFile" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				SELECT 		HW.*
				FROM 		HW_FILE AS HW
				WHERE 		HW.sco_id = #variables.sco_id2# AND HW.user_id = #variables.user_id# AND HW.lecture_count = #variables.lecture_count#
			</cfquery>
			<cfif qGetHWFile.recordcount neq "0">
				<cfset arr_info[31] = qGetHWFile.admin_comment >
			</cfif>
		</cfif>

		<!--- CSVに変換&出力 --->
		<cfset csv_name = 'eLM_result004_' & dateFormat(now() , "yyyymmdd") & timeFormat(now() , "HHmmss") & '.csv'>
		<cfset csv_data = resultquery2csv(2, arr_info, qGetItems, csv_name)>
	</cfcase>

	<cfcase value="s_csv_sco_basic">

		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>
		<cfparam name="sid" default="-1">
		<cfset variables.sco_id = sid>

		<cfif variables.u_search_group is "-1">
			<cfset variables.u_search_group = "">
		</cfif>

		<!--- パラメータのセット --->
		<cfset params_for_search.cid = variables.course_id>
		<cfset params_for_search.sid = variables.sco_id>
		<cfset params_for_search.status = variables.status>

		<cfset params_for_status.cid = variables.course_id>
		<cfset params_for_status.sid = variables.sco_id>
		<cfset params_for_status.u_search_word = variables.u_search_word>
		<cfset params_for_status.u_search_group = variables.u_search_group>
		<cfset params_for_status.u_search_course = variables.u_search_course>
		<cfset params_for_status.c_search_word = variables.c_search_word>
		<cfset params_for_status.c_search_label = variables.c_search_label>
		<cfset params_for_status.c_search_group = variables.c_search_group>
		<cfset params_for_status.u_search_val1 = variables.u_search_val1>

		<cfset params.cid = variables.course_id>
		<cfset params.sid = variables.sco_id>
		<cfset params.status = variables.status>
		<cfset params.u_search_word = variables.u_search_word>
		<cfset params.u_search_group = variables.u_search_group>
		<cfset params.u_search_course = variables.u_search_course>
		<cfset params.c_search_word = variables.c_search_word>
		<cfset params.c_search_label = variables.c_search_label>
		<cfset params.c_search_group = variables.c_search_group>
		<cfset params.u_search_val1 = variables.u_search_val1>

		<cfset params_add_mode = StructCopy(params)>
		<cfset params_add_mode.mode = "sr">

		<!--- グループリスト作成 --->
		<cfset variables.group_option_list = get_group_option_list(variables.u_search_group)>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>

		<cfset temp_course_id_list = "#variables.course_id#">

		<!--- SCO情報 --->
		<cfset Variables.TempSelectObj = dao_select("SCO_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "sco_id" , variables.sco_id)>
		<cfset sco_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset str_sco_name = sco_info.sco_name>
		<cfset str_sco_type = getScoTypeString(sco_info.class_id, sco_info.sco_kind)>

		<!--- ユーザー取得 --->
		<cfset user_list = umObj.get_user_list_ex(now_login_user, customer_name, variables.u_search_word, variables.course_id, variables.u_search_group)>

		<cfif customer_name eq "sonylife">
			<!--- ソニー生命用絞込み --->
			<cfif variables.u_search_val1 neq "">
				<cfswitch expression="#variables.u_search_val1#">
				<cfcase value="1"><!--- 一次履修者 --->
					<cfset str_where = "text_3 like '111%' OR text_3 like '101%' OR text_3 like '110%' ">
				</cfcase>
				<cfcase value="2"><!--- 二次履修者 --->
					<cfset str_where = "text_3 like '100%' ">
				</cfcase>
				<cfcase value="3"><!--- 必須履修者 --->
					<cfset str_where = "text_3 like '0001%' ">
				</cfcase>
				<cfcase value="4"><!--- 任意履修者 --->
					<cfset str_where = "text_3 like '0000%' ">
				</cfcase>
				<cfdefaultcase>
					<cfset str_where = "1=1 ">
				</cfdefaultcase>
				</cfswitch>
				<cfquery name="user_list_2" dbtype="query">
					SELECT * FROM user_list.list WHERE #PreserveSingleQuotes(str_where)#
				</cfquery>
				<cfset temp_user_id_list = ValueList(user_list_2.user_id, ",")>
			<cfelse>
				<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>
			</cfif>
		<cfelse>
			<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>
		</cfif>

		<cfset user_array = ListToArray(temp_user_id_list)>
		<cfset course_array = ListToArray(temp_course_id_list)>

		<!--- 成績を取得 --->
		<cfset result = make_result_array_for_sco(user_array , sco_id, status)>
		<cfset result_array = result.array>

		<!--- SCOの学習回数をmax(SCO_PROGRESS.lecture_count)からcount(SCO_PROGRESS.*)に変換--->
		<cfloop index="LoopIndex" from="1" to="#ArrayLen(result_array)#">
			<cfif result_array[LoopIndex][13] neq "">
				<cfset isNumericOrError(variables.course_id)>
				<cfset isNumericOrError(variables.sco_id)>
				<cfquery name="q_getSPCount" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					select count(*) as lc from SCO_PROGRESS where user_id = #result_array[LoopIndex][13]# and course_id = #variables.course_id# and sco_id = #variables.sco_id# and lecture_count <> -1
				</cfquery>
				<cfset result_array[LoopIndex][6] = q_getSPCount.lc>
			</cfif>
		</cfloop>

		<cfset delim = lsObj.get_value("csv.delimiter")>
		<cfset csv_name = 'eLM_result004_' & dateFormat(now() , "yyyymmdd") & timeFormat(now() , "HHmmss") & '.csv'>
		<cfheader name="Content-Disposition" value="attachment;filename=#csv_name#">
		<cfheader name="Pragma" value="">
		<cfheader name="Cache-Control" value= "">
		<cfcontent type="text/csv; charset=#lsObj.get_value("csv.charset")#" reset="no">

		<cfsetting requestTimeOut="600">
		<cfoutput>#double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_3_logo:ja=eLearningManager'))##delim#</cfoutput>
		<cfoutput>#double_quote(Session.termObj.get_term('eLMLadmin_course_report3_csv_3_title:ja=教材成績一覧'))##delim#</cfoutput>
		<cfoutput>#delim#</cfoutput>
		<cfoutput>#double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_3_output_date:ja=出力日時'))##delim#</cfoutput>
		<cfoutput>#double_quote(DateFormat(now(),"yyyy-mm-dd") & " " & TimeFormat(now(),"HH:mm:ss"))#</cfoutput>
		<cfoutput>#chr(10)#</cfoutput>
		<cfoutput>#chr(10)#</cfoutput>
		<cfoutput>"#Session.termObj.get_term('eLM_admin_course_report3_csv_3_col_1:ja=姓')#"#delim#</cfoutput><!--- last_name --->
		<cfoutput>"#Session.termObj.get_term('eLM_admin_course_report3_csv_3_col_2:ja=名')#"#delim#</cfoutput><!--- first_name --->
		<cfoutput>"#Session.termObj.get_term('eLM_admin_course_report3_csv_3_col_3:ja=姓（ふりがな）')#"#delim#</cfoutput><!--- last_name_furi --->
		<cfoutput>"#Session.termObj.get_term('eLM_admin_course_report3_csv_3_col_4:ja=名（ふりがな）')#"#delim#</cfoutput><!--- first_name_furi --->
		<cfoutput>"#Session.termObj.get_term('eLM_admin_course_report3_csv_3_col_5:ja=ユーザーID')#"#delim#</cfoutput><!--- logon --->
		<cfoutput>"#Session.termObj.get_term('eLM_admin_course_report3_csv_3_col_6:ja=メールアドレス')#"#delim#</cfoutput><!--- mailaddress --->
		<cfoutput>"#Session.termObj.get_term('eLM_admin_course_report3_csv_3_col_7:ja=コース名')#"#delim#</cfoutput><!--- course_name --->
		<cfoutput>"#Session.termObj.get_term('eLM_admin_course_report3_csv_3_col_8:ja=教材名')#"#delim#</cfoutput><!--- sco_name --->
		<cfoutput>"#Session.termObj.get_term('eLM_admin_course_report3_csv_3_col_9:ja=成績')#"#delim#</cfoutput><!--- status --->
		<cfoutput>"#Session.termObj.get_term('eLM_admin_course_report3_csv_3_col_10:ja=得点')#"#delim#</cfoutput><!--- score --->
		<cfoutput>"#Session.termObj.get_term('eLM_admin_course_report3_csv_3_col_11:ja=学習回数')#"#delim#</cfoutput><!--- times --->
		<cfoutput>"#Session.termObj.get_term('eLM_admin_course_report3_csv_3_col_12:ja=学習開始日時')#"#delim#</cfoutput><!--- start_time --->
		<cfoutput>"#Session.termObj.get_term('eLM_admin_course_report3_csv_3_col_13:ja=学習終了日時')#"#delim#</cfoutput><!--- end_time --->
		<cfoutput>"#Session.termObj.get_term('eLM_admin_course_report3_csv_3_col_14:ja=累積時間')#"#delim#</cfoutput><!--- total_time --->
		<cfoutput>#chr(10)#</cfoutput>
		<cfloop index="line" from="1" to="#ArrayLen(result_array)#">
			<cfset currentLine = result_array[line]>
			<cfoutput>#double_quote(currentLine[14])##delim#</cfoutput><!--- last_name --->
			<cfoutput>#double_quote(currentLine[15])##delim#</cfoutput><!--- first_name --->
			<cfoutput>#double_quote(currentLine[16])##delim#</cfoutput><!--- last_name_furi --->
			<cfoutput>#double_quote(currentLine[17])##delim#</cfoutput><!--- first_name_furi --->
			<cfoutput>#double_quote(currentLine[1])##delim#</cfoutput><!--- logon --->
			<cfoutput>#double_quote(currentLine[18])##delim#</cfoutput><!--- mailaddress --->
			<cfoutput>#double_quote(currentLine[3])##delim#</cfoutput><!--- course_name --->
			<cfoutput>#double_quote(currentLine[4])##delim#</cfoutput><!--- sco_name --->
			<cfoutput>#double_quote(currentLine[5])##delim#</cfoutput><!--- status --->
			<cfoutput>#double_quote(currentLine[7])##delim#</cfoutput><!--- score --->
			<cfoutput>#double_quote(currentLine[6])##delim#</cfoutput><!--- times --->
			<cfoutput>#double_quote(currentLine[8])##delim#</cfoutput><!--- start_time --->
			<cfoutput>#double_quote(currentLine[10])##delim#</cfoutput><!--- end_time --->
			<cfoutput>#double_quote(currentLine[11])#</cfoutput><!--- total_time --->
			<cfoutput>#chr(10)#</cfoutput>
		</cfloop>
	</cfcase>

	<cfcase value="s_csv_sco_rate">

		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>

		<cfparam name="sid" default="-1">
		<cfset variables.sco_id = sid>

		<cfsetting enablecfoutputonly="yes" requestTimeOut="3600">

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset str_course_name = course_info.course_name>

		<!--- SCO情報 --->
		<cfquery name="qGetSCOInfo" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			SELECT * FROM SCO_MASTER WHERE sco_id = #variables.sco_id#
		</cfquery>
		<cfset str_sco_name = qGetSCOInfo.sco_name>

		<cfflush interval="50">
		<cfset csv_name = 'eLM_result009_' & dateFormat(now() , "yyyymmdd") & timeFormat(now() , "HHmmss") & '.csv'>
		<cfset de = lsObj.get_value("csv.delimiter")>

		<cfheader name="Content-Disposition" value="attachment;filename=#csv_name#">
		<cfheader name="Pragma" value="">
		<cfheader name="Cache-Control" value= "">
		<cfcontent type="text/csv; charset=#lsObj.get_value("csv.charset")#" reset="no">

		<!--- すぐダウンロードダイアログが表示されるよう、SQL実行前に出力 --->
		<cfoutput>#double_quote('eLearningManager')##de##double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_11_title:ja=テスト教材　正答率'))##de##de##double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_1_output_date:ja=出力日時'))##de##double_quote(DateFormat(Now(),"yyyy-mm-dd") & " " & TimeFormat(Now(),"HH:mm:ss"))##chr(10)##chr(10)#</cfoutput>
		<cfset temp_csv_col_arr = arrayNew(1)>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_11_col_1:ja=コース名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_11_col_2:ja=教材名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_11_col_3:ja=問題ID')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_11_col_4:ja=問題番号')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_11_col_5:ja=のべ回答回数')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_11_col_6:ja=正答回数')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_11_col_7:ja=正答率[%]')))>

		<cfset temp_csv_col_str = ArrayToList(temp_csv_col_arr,#de#)>
		<cfoutput>#temp_csv_col_str#</cfoutput>
		<cfoutput>#chr(10)#</cfoutput>

		<!---　のべ回答回数 --->
		<cfset sql = "
			SELECT it.id, count(it.id) AS ans_count FROM ITEMS AS it
			WHERE it.sco_id = " & variables.sco_id & "
			GROUP BY it.id ORDER BY it.id
			">
		<cfquery name="qGetAnswerCount" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			#PreserveSingleQuotes(sql)#
		</cfquery>

		<cfset ans_count_struct = StructNew()>
		<cfset id_struct = StructNew()>
		<cfset id_array = ArrayNew(1)>
		<cfset zero_flg = false>
		<cfloop query = "qGetAnswerCount">
			<cfset ans_count_struct[id] = ans_count>
			<cfset temp_len = Len(id)-REFindNocase("\d+$", id)+1>
			<cfset temp_id = Right(id, temp_len)>
			<cfif temp_id EQ 0>
				<cfset zero_flg = true>
			</cfif>
			<cfif zero_flg EQ true>
				<cfset id_struct[id]=temp_id+1>
				<cfset id_array[temp_id+1]=id>
			<cfelse>
				<cfset id_struct[id]=temp_id>
				<cfset id_array[temp_id]=id>
			</cfif>
		</cfloop>
		<!---
		<cfdump var="#id_array#">
		<cfdump var="#id_struct#">
		<cfdump var="#qGetAnswerCount#">
		--->

		<!---　正答回数 --->
		<cfset sql = "
			SELECT it.id, count(it.id) AS c_count FROM ITEMS AS it
			WHERE it.sco_id = " & variables.sco_id & " AND it.result = 'correct'
			GROUP BY it.id
			">
		<cfquery name="qGetAnswerCorrect" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			#PreserveSingleQuotes(sql)#
		</cfquery>
		<cfset ans_correct_struct = StructNew()>
		<cfloop query = "qGetAnswerCorrect">
			<cfset ans_correct_struct[id] = c_count>
		</cfloop>
		<!---
		<cfdump var="#ans_correct_struct#">
		<cfdump var="#qGetAnswerCorrect#">
		--->

		<cfloop index="current_id" array="#id_array#">
<!---
		<cfloop query = "qGetAnswerCount">
		--->
			<cfset q_no = "問" & id_struct[current_id]>
			<cfset n_correct = 0>
			<cfset n_count = 0>
			<cfset r_correct = 0>
			<cfif StructKeyExists(ans_correct_struct, current_id)>
				<cfset n_correct = ans_correct_struct[current_id]>
				<cfset n_count = ans_count_struct[current_id]>
				<cfset r_correct = DecimalFormat(n_correct/n_count*100)>
			</cfif>
			<!---
			<cfdump var="#n_correct#">
			<cfdump var="#r_correct#">
			--->
			<cfoutput>#double_quote(str_course_name)##de#</cfoutput>
			<cfoutput>#double_quote(str_sco_name)##de#</cfoutput>
			<cfoutput>#double_quote(current_id)##de#</cfoutput>
			<cfoutput>#double_quote(q_no)##de#</cfoutput>
			<cfoutput>#double_quote(n_count)##de#</cfoutput>
			<cfoutput>#double_quote(n_correct)##de#</cfoutput>
			<cfoutput>#double_quote(r_correct)##chr(10)#</cfoutput>
		</cfloop>
		<cfabort>
		<cfset variables.mode = "sr">
	</cfcase>

	<cfcase value="quiz_result_dn">

		<cfparam name="sid" default="-1">
		<cfset variables.sco_id = sid>

		<cflocation url="quiz_report.cfm?sco_id=#variables.sco_id#&admin_type=#admin_info.user_type_id#">

	</cfcase>

	<cfcase value="quiz_all_result_dn">

		<cfparam name="sid" default="-1">
		<cfset variables.sco_id = sid>

		<cflocation url="quiz_all_report.cfm?sco_id=#variables.sco_id#&admin_type=#admin_info.user_type_id#">

	</cfcase>

	<cfcase value="course_quiz_result_dn">
		<cfparam name="quiz_id" default="">
		<cfparam name="cid" default="-1">

		<cflocation url="quiz_course_report.cfm?cid=#cid#&qid_list=#quiz_id#">

	</cfcase>

	<!--- 2020/01/17 ito c_csv_co_sco ADD start --->
	<cfcase value="c_csv_co_sco">
		<cfparam name="uid" default="-1">
		<cfset variables.user_id = uid>

		<cfparam name="cid" default="-1">
		<cfset variables.course_id = cid>

		<cfif variables.u_search_group is "-1">
			<cfset variables.u_search_group = "">
		</cfif>

		<!--- コース情報 --->
		<cfset course_info = get_course_info(variables.course_id)>
		<cfset temp_course_id_list = "#variables.course_id#">

		<!--- ユーザー情報 --->
		<cfset user_list = umObj.get_user_list_ex(now_login_user, customer_name, variables.u_search_word, variables.course_id, variables.u_search_group)>
		<cfset temp_user_id_list = ValueList(user_list.list.user_id, ",")>

		<cfset user_array = ListToArray(temp_user_id_list)>
		<cfset course_array = ListToArray(temp_course_id_list)>

		<!--- 成績を取得 --->
		<cfset result_array = make_result_array_for_co_sco(user_array , course_array, indication_type)>

		<!--- SCOの学習回数をmax(SCO_PROGRESS.lecture_count)からcount(SCO_PROGRESS.*)に変換--->
		<cfloop index="LoopIndex" from="1" to="#ArrayLen(result_array)#">
			<cfif result_array[LoopIndex][13] neq "">
				<cfset isNumericOrError(result_array[LoopIndex][16])>
				<cfset isNumericOrError(variables.course_id)>
				<cfquery name="q_getSPCount" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					select count(*) as lc from SCO_PROGRESS where user_id = #result_array[LoopIndex][16]# and course_id = #variables.course_id# and sco_id = #result_array[LoopIndex][13]# and lecture_count <> -1
				</cfquery>
				<cfset result_array[LoopIndex][6] = q_getSPCount.lc>
			</cfif>
		</cfloop>

		<!--- CSVに変換&出力 --->
		<cfset csv_name = 'eLM_result020_' & dateFormat(now() , "yyyymmdd") & timeFormat(now() , "HHmmss") & '.csv'>
		<cfset csv_data = result2csv(7, result_array, csv_name)>
	</cfcase>
	<!--- 2020/01/17 ito c_csv_co_sco ADD end --->
</cfswitch>


<!---///////////////////////////////////////
関数
////////////////////////////////////////--->

<cffunction name="get_course_info" returntype="query">
	<cfargument name="course_id" type="numeric" required="Yes">
	<cfset var course_info = ''>

	<cfset Variables.TempSelectObj = dao_select("COURSE_MASTER")>
	<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "course_id" , course_id)>
	<cfset course_info = dao_result("#application.DSN#", Variables.TempSelectObj)>
	<cfreturn course_info>
</cffunction>

<!--- コース／SCO選択時の成績を配列に変換 --->
<cffunction name="make_result_array" output="yes" returntype="array">
	<cfargument name="user_array" required="Yes" type="array">
	<cfargument name="course_array" required="Yes" type="array">
	<cfargument name="arg_type" required="Yes" type="numeric">

	<cfset var result_array = ArrayNew(2)>
	<cfset var qGetProgress = ''>
	<cfset var qGetCourseProgress = ''>
	<cfset var qGetScoProgress = ''>
	<cfset var __TempQueryString = ''>

	<cfset qGetCourseProgress = cpObj.get_course_progress_query_by_user_id(user_array , course_array)>
	<cfset qGetScoProgress = spObj.get_sco_progress_query_by_user_id(user_array , course_array, 1)>

	<cfquery name="qGetProgress" dbtype="query">
	select user_id , first_name , last_name , logon , course_id , CAST(0 as INTEGER) as sco_id , course_name , '---' as sco_name ,
	       course_status as status , course_count as count_num , start_date , end_date , eLM_total_time as total_time ,
	       c_progress , score_date , CAST(0 as INTEGER) as order_no , course_score as score , -1 as class_id, -1 as sco_kind
	       , 2 as sco_type , last_name_furi , first_name_furi , mailaddress
	       , -1 as flag_get_status, -1 as flag_get_score
	from   qGetCourseProgress
	union
	select user_id , first_name , last_name , logon , course_id , sco_id , course_name , sco_name ,
	       status , m_lc as count_num , start_date , end_date ,
	       eLM_total_time as total_time , CAST(0 as INTEGER) as c_progress , score_date , order_no , score , class_id, sco_kind
	       , sco_type , last_name_furi , first_name_furi , mailaddress
	       , flag_get_status, flag_get_score
	from   qGetScoProgress
	order  by user_id , course_id , order_no
	</cfquery>

	<cfloop query="qGetProgress">
		<cfset result_array[qGetProgress.CurrentRow][1] = logon>
		<cfset result_array[qGetProgress.CurrentRow][2] = last_name & ' ' & first_name>
		<cfset result_array[qGetProgress.CurrentRow][3] = course_name>
		<cfset result_array[qGetProgress.CurrentRow][4] = sco_name>

		<cfset result_array[qGetProgress.CurrentRow][16] = user_id>
		<cfset result_array[qGetProgress.CurrentRow][17] = last_name>
		<cfset result_array[qGetProgress.CurrentRow][18] = first_name>
		<cfset result_array[qGetProgress.CurrentRow][19] = last_name_furi>
		<cfset result_array[qGetProgress.CurrentRow][20] = first_name_furi>
		<cfset result_array[qGetProgress.CurrentRow][21] = mailaddress>

		<cfset result_array[qGetProgress.CurrentRow][22] = flag_get_status>
		<cfset result_array[qGetProgress.CurrentRow][23] = flag_get_score>

		<cfif sco_type eq 2>

			<cfset result_array[qGetProgress.CurrentRow][5] = ''>
			<cfset result_array[qGetProgress.CurrentRow][6] = ''>
			<cfset result_array[qGetProgress.CurrentRow][7] = ''>
			<cfset result_array[qGetProgress.CurrentRow][8] = ''>
			<cfset result_array[qGetProgress.CurrentRow][9] = ''>
			<cfset result_array[qGetProgress.CurrentRow][10] = ''>
			<cfset result_array[qGetProgress.CurrentRow][11] = ''>
			<cfset result_array[qGetProgress.CurrentRow][12] = ''>
			<cfset result_array[qGetProgress.CurrentRow][13] = ''>
			<cfset result_array[qGetProgress.CurrentRow][14] = ''>
			<cfset result_array[qGetProgress.CurrentRow][15] = ''>

		<cfelse>

			<cfset result_array[qGetProgress.CurrentRow][5] = status2str(status)>
			<cfset result_array[qGetProgress.CurrentRow][6] = count_num>
			<cfif score is "">
				<cfset result_array[qGetProgress.CurrentRow][7] = 0>
			<cfelse>
				<cfset result_array[qGetProgress.CurrentRow][7] = score>
			</cfif>

			<cfif start_date is "">
				<cfset result_array[qGetProgress.CurrentRow][8] = '---'>
			<cfelse>
				<cfset result_array[qGetProgress.CurrentRow][8] = DateFormat(start_date , 'yyyy/mm/dd') & ' ' & TimeFormat(start_date , 'HH:mm')>
			</cfif>
			<cfif score_date is "">
				<cfset result_array[qGetProgress.CurrentRow][9] = '---'>
			<cfelse>
				<cfset result_array[qGetProgress.CurrentRow][9] = DateFormat(score_date , 'yyyy/mm/dd') & ' ' & TimeFormat(score_date , 'HH:mm')>
			</cfif>
			<cfif end_date is "">
				<cfset result_array[qGetProgress.CurrentRow][10] = '---'>
			<cfelse>
				<cfset result_array[qGetProgress.CurrentRow][10] = DateFormat(end_date , 'yyyy/mm/dd') & ' ' & TimeFormat(end_date , 'HH:mm')>
			</cfif>

			<cfset result_array[qGetProgress.CurrentRow][11] = fn_sec2time(total_time)>
			<cfset result_array[qGetProgress.CurrentRow][12] = course_id>
			<cfset result_array[qGetProgress.CurrentRow][13] = sco_id>

			<cfset result_array[qGetProgress.CurrentRow][14] = getScoTypeString(class_id, sco_kind)>
			<cfif sco_kind eq 2 or (sco_kind eq 1 and class_id neq 2)>
				<cfset result_array[qGetProgress.CurrentRow][7] = "---">	<!--- 点数表示はテストか宿題のみ --->
			</cfif>

			<cfset result_array[qGetProgress.CurrentRow][15] = status>

			<!--- SCOのscoreのlecture_count --->
			<cfif sco_id gt 0>
				<cfset Variables.TempSelectObj = dao_select("SCO_PROGRESS_RECORD")>
				<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id" , user_id)>
				<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "sco_id" , sco_id)>
				<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "type" , arg_type)>
				<cfset q_SPR = dao_result("#application.DSN#", Variables.TempSelectObj)>
				<cfset result_array[qGetProgress.CurrentRow][24] = q_SPR.lecture_count>
			<cfelse>
				<cfset result_array[qGetProgress.CurrentRow][24] = 0>
			</cfif>

		</cfif>
		<cfset result_array[qGetProgress.CurrentRow][25] = sco_type>

	</cfloop>

	<cfreturn result_array>

</cffunction>

<!--- 2020/01/17 ito c_csv_co_sco ADD start --->
<!--- コース全体の教材毎成績を配列に変換 --->
<cffunction name="make_result_array_for_co_sco" output="yes" returntype="array">
	<cfargument name="user_array" required="Yes" type="array">
	<cfargument name="course_array" required="Yes" type="array">
	<cfargument name="arg_type" required="Yes" type="numeric">

	<cfset var result_array = ArrayNew(2)>
	<cfset var qGetProgress = ''>
	<cfset var qGetScoProgress = ''>
	<cfset var __TempQueryString = ''>

	<cfset qGetScoProgress = spObj.get_sco_progress_query_by_user_id_for_co_sco(user_array , course_array, 1)>

	<cfquery name="qGetProgress" dbtype="query">
	select user_id , first_name , last_name , logon , course_id , sco_id , course_name , sco_name ,
	       status , m_lc as count_num , start_date , end_date ,
	       eLM_total_time as total_time , score_date , order_no , score , class_id, sco_kind
	       , sco_type , last_name_furi , first_name_furi , mailaddress
	       , flag_get_status, flag_get_score
		   , course_status, c_progress, course_count, cpr_start_date, cprd_end_date, cpr_eLM_total_time
	from   qGetScoProgress
	order  by user_id , course_id , order_no
	</cfquery>

	<cfloop query="qGetProgress">
		<cfset result_array[qGetProgress.CurrentRow][1] = logon>
		<cfset result_array[qGetProgress.CurrentRow][2] = last_name & ' ' & first_name>
		<cfset result_array[qGetProgress.CurrentRow][3] = course_name>
		<cfset result_array[qGetProgress.CurrentRow][4] = sco_name>
		<cfset result_array[qGetProgress.CurrentRow][16] = user_id>
		<cfset result_array[qGetProgress.CurrentRow][17] = last_name>
		<cfset result_array[qGetProgress.CurrentRow][18] = first_name>
		<cfset result_array[qGetProgress.CurrentRow][19] = last_name_furi>
		<cfset result_array[qGetProgress.CurrentRow][20] = first_name_furi>
		<cfset result_array[qGetProgress.CurrentRow][21] = mailaddress>
		<cfset result_array[qGetProgress.CurrentRow][22] = flag_get_status>
		<cfset result_array[qGetProgress.CurrentRow][23] = flag_get_score>

		<!--- 教材の成績情報 --->
		<cfset result_array[qGetProgress.CurrentRow][5] = status2str(status)>
		<cfset result_array[qGetProgress.CurrentRow][6] = count_num>
		<cfif score is "">
			<cfset result_array[qGetProgress.CurrentRow][7] = 0>
		<cfelse>
			<cfset result_array[qGetProgress.CurrentRow][7] = score>
		</cfif>
		<cfif start_date is "">
			<cfset result_array[qGetProgress.CurrentRow][8] = '---'>
		<cfelse>
			<cfset result_array[qGetProgress.CurrentRow][8] = DateFormat(start_date , 'yyyy/mm/dd') & ' ' & TimeFormat(start_date , 'HH:mm')>
		</cfif>
		<cfif score_date is "">
			<cfset result_array[qGetProgress.CurrentRow][9] = '---'>
		<cfelse>
			<cfset result_array[qGetProgress.CurrentRow][9] = DateFormat(score_date , 'yyyy/mm/dd') & ' ' & TimeFormat(score_date , 'HH:mm')>
		</cfif>
		<cfif end_date is "">
			<cfset result_array[qGetProgress.CurrentRow][10] = '---'>
		<cfelse>
			<cfset result_array[qGetProgress.CurrentRow][10] = DateFormat(end_date , 'yyyy/mm/dd') & ' ' & TimeFormat(end_date , 'HH:mm')>
		</cfif>
		<cfset result_array[qGetProgress.CurrentRow][11] = fn_sec2time(total_time)>
		<cfset result_array[qGetProgress.CurrentRow][12] = course_id>
		<cfset result_array[qGetProgress.CurrentRow][13] = sco_id>
		<cfset result_array[qGetProgress.CurrentRow][14] = getScoTypeString(class_id, sco_kind)>
		<cfif sco_kind eq 2 or (sco_kind eq 1 and class_id neq 2)>
			<cfset result_array[qGetProgress.CurrentRow][7] = "---">	<!--- 点数表示はテストか宿題のみ --->
		</cfif>
		<cfset result_array[qGetProgress.CurrentRow][15] = status>
		<!--- SCOのscoreのlecture_count --->
		<cfif sco_id gt 0>
			<cfset Variables.TempSelectObj = dao_select("SCO_PROGRESS_RECORD")>
			<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id" , user_id)>
			<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "sco_id" , sco_id)>
			<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "type" , arg_type)>
			<cfset q_SPR = dao_result("#application.DSN#", Variables.TempSelectObj)>
			<cfset result_array[qGetProgress.CurrentRow][24] = q_SPR.lecture_count>
		<cfelse>
			<cfset result_array[qGetProgress.CurrentRow][24] = 0>
		</cfif>
		<cfset result_array[qGetProgress.CurrentRow][25] = sco_type>
		<!--- ユーザーの所属グループ情報 --->
		<cfset result_array[qGetProgress.CurrentRow][26] = gmObj.get_group_name_by_user_id(user_id, 1)>	

		<!--- コースの成績情報 --->
		<cfset result_array[qGetProgress.CurrentRow][27] = status2str(course_status)>

		<cfif c_progress is "">
			<cfset result_array[qGetProgress.CurrentRow][28] = '0%'>
		<cfelse>
			<cfset result_array[qGetProgress.CurrentRow][28] = c_progress & '%'>
		</cfif>
		
		<cfset result_array[qGetProgress.CurrentRow][29] = course_count>

		<cfif cpr_start_date is "">
			<cfset result_array[qGetProgress.CurrentRow][30] = '---'>
		<cfelse>
			<cfset result_array[qGetProgress.CurrentRow][30] = DateFormat(cpr_start_date ,lsObj.get_value("record.begin_time_dateformat")) & ' ' & TimeFormat(cpr_start_date ,lsObj.get_value("record.begin_time_timeformat"))>
		</cfif>

		<cfif cprd_end_date is "">
			<cfset result_array[qGetProgress.CurrentRow][31] = '---'>
		<cfelse>
			<cfset result_array[qGetProgress.CurrentRow][31] = DateFormat(cprd_end_date ,lsObj.get_value("record.complete_time_dateformat")) & ' ' & TimeFormat(cprd_end_date , lsObj.get_value("record.complete_time_timeformat"))>
		</cfif>

		<cfset result_array[qGetProgress.CurrentRow][32] = fn_sec2time(cpr_eLM_total_time)>

	</cfloop>

	<cfreturn result_array>

</cffunction>
<!--- 2020/01/17 ito c_csv_co_sco ADD end --->

<!--- コース選択時の成績を配列に変換 --->
<cffunction name="make_result_array_for_course" output="no" returntype="array">
	<cfargument name="user_array" required="Yes" type="array">
	<cfargument name="course_array" required="Yes" type="array">
	<cfargument name="arg_status" required="No" type="String" default="">
	<cfargument name="uc_flg" required="No" type="String" default="">
	<cfargument name="group_flg" required="No" type="String" default="">

	<cfset var result_array = ArrayNew(2)>
	<cfset var qGetProgress = ''>
	<cfset var __TempQueryString = ''>

	<cfif ArrayLen(user_array) eq 0 or ArrayLen(course_array) eq 0>
		<cfreturn result_array>
	</cfif>

	<cfset qGetProgress = cpObj.get_course_progress_query_by_user_id(user_array , course_array)>

	<!--- 成績による絞込み --->
	<cfswitch expression="#arg_status#">
	<cfcase value="not_attempted,not attempted">
		<cfset cond_status = "course_status = 'not attempted'">
	</cfcase>
	<cfcase value="incomplete">
		<cfset cond_status = "course_status = 'incomplete'">
	</cfcase>
	<cfcase value="completed">
		<cfset cond_status = "course_status = 'completed'">
	</cfcase>
	<cfdefaultcase>
		<cfset cond_status = "">
	</cfdefaultcase>
	</cfswitch>
	<cfif cond_status neq "">
		<cfquery dbtype="query" name="qGetProgress">
			SELECT * FROM qGetProgress WHERE #PreserveSingleQuotes(cond_status)#
			order by user_id ,course_type_sed, sort
		</cfquery>
	</cfif>

	<cfif uc_flg eq 1>
		<cfquery dbtype="query" name="qGetProgress">
			SELECT * FROM qGetProgress order by last_name_furi,first_name_furi, logon
		</cfquery>
	</cfif>

	<cfloop query="qGetProgress">
		<cfset result_array[qGetProgress.CurrentRow][1] = logon>
		<cfset result_array[qGetProgress.CurrentRow][2] = last_name & ' ' & first_name>
		<cfset result_array[qGetProgress.CurrentRow][3] = course_name>
		<cfset result_array[qGetProgress.CurrentRow][4] = '---'>
		<cfset result_array[qGetProgress.CurrentRow][5] = status2str(course_status)>
		<cfset result_array[qGetProgress.CurrentRow][6] = course_count>
		<cfif c_progress is "">
			<cfset result_array[qGetProgress.CurrentRow][7] = '0%'>
		<cfelse>
			<cfset result_array[qGetProgress.CurrentRow][7] = c_progress & '%'>
		</cfif>

		<cfif start_date is "">
			<cfset result_array[qGetProgress.CurrentRow][8] = '---'>
		<cfelse>
			<cfset result_array[qGetProgress.CurrentRow][8] = DateFormat(start_date ,lsObj.get_value("record.begin_time_dateformat")) & ' ' & TimeFormat(start_date ,lsObj.get_value("record.begin_time_timeformat"))>
		</cfif>
		<cfif score_date is "">
			<cfset result_array[qGetProgress.CurrentRow][9] = '---'>
		<cfelse>
			<cfset result_array[qGetProgress.CurrentRow][9] = DateFormat(score_date , 'yyyy/mm/dd') & ' ' & TimeFormat(score_date , 'HH:mm')>
		</cfif>
		<cfif end_date is "">
			<cfset result_array[qGetProgress.CurrentRow][10] = '---'>
		<cfelse>
			<cfset result_array[qGetProgress.CurrentRow][10] = DateFormat(end_date ,lsObj.get_value("record.complete_time_dateformat")) & ' ' & TimeFormat(end_date , lsObj.get_value("record.complete_time_timeformat"))>
		</cfif>

		<!--- total_timeが24時間を越えると、時刻関数でエラーが出る
		<cfset result_array[qGetProgress.CurrentRow][11] = ToString(Val(TimeFormat(course_total_time, "HH")) * 60 + Val(TimeFormat(course_total_time, "m"))) & Session.termObj.get_term('eLM_admin_report_minute') & TimeFormat(course_total_time, "ss") & Session.termObj.get_term('eLM_admin_report_second')>
		--->
		<cfset result_array[qGetProgress.CurrentRow][11] = fn_sec2time(eLM_total_time)>

		<cfset result_array[qGetProgress.CurrentRow][12] = course_id>
		<cfset result_array[qGetProgress.CurrentRow][13] = user_id>
		<cfset result_array[qGetProgress.CurrentRow][14] = last_name>
		<cfset result_array[qGetProgress.CurrentRow][15] = first_name>
		<cfset result_array[qGetProgress.CurrentRow][16] = last_name_furi>
		<cfset result_array[qGetProgress.CurrentRow][17] = first_name_furi>
		<cfset result_array[qGetProgress.CurrentRow][18] = mailaddress>

		<cfif group_flg eq 1>
			<!--- ユーザーの所属グループ情報 --->
			<cfset result_array[qGetProgress.CurrentRow][19] = gmObj.get_group_name_by_user_id(user_id, 1)>
		</cfif>
	</cfloop>

	<cfreturn result_array>

</cffunction>

<!--- ステータスによる該当コースのユーザリストを取得 --->
<cffunction name="make_result_array_for_status" output="no" returntype="array">
	<cfargument name="user_array" required="Yes" type="array">
	<cfargument name="course_array" required="Yes" type="array">
	<cfargument name="arg_status" required="No" type="String" default="">
	<cfargument name="uc_flg" required="No" type="String" default="">

	<cfset var result_arry = user_array>
	<cfset var qGetProgress = "">

	<cfif ArrayLen(user_array) eq 0 or ArrayLen(course_array) eq 0>
		<cfreturn result_arry>
	</cfif>

	<cfset qGetProgress = cpObj.get_course_progress_query_by_user_id(user_array, course_array)>

	<!--- 成績による絞込み --->
	<cfswitch expression="#arg_status#">
	<cfcase value="not_attempted,not attempted">
		<cfset cond_status = "course_status = 'not attempted'">
	</cfcase>
	<cfcase value="incomplete">
		<cfset cond_status = "course_status = 'incomplete'">
	</cfcase>
	<cfcase value="completed">
		<cfset cond_status = "course_status = 'completed'">
	</cfcase>
	<cfdefaultcase>
		<cfset cond_status = "1 = 1">
	</cfdefaultcase>
	</cfswitch>

	<cfquery dbtype="query" name="qGetProgress">
		SELECT user_id,last_name_furi,first_name_furi, logon FROM qGetProgress WHERE #PreserveSingleQuotes(cond_status)#
		ORDER BY last_name_furi,first_name_furi, logon
	</cfquery>
	<cfset result_arry = ListToArray(valuelist(qGetProgress.user_id)) >

	<cfreturn result_arry>

</cffunction>

<!--- SCO選択時の成績を配列に変換 --->
<cffunction name="make_result_array_for_sco" output="yes" returntype="struct">
	<cfargument name="user_array" required="Yes" type="array">
	<cfargument name="sco_id" required="Yes" type="numeric">
	<cfargument name="arg_status" type="String" default=""><!--- 成績ステータスによる絞り込み --->
	<cfargument name="start" type="numeric" default="-1"><!--- ページで絞り込み(start件目からunit件表示、-1の場合は全件取得) --->
	<cfargument name="unit" default="-1"><!--- ページあたり件数(-1の場合はLMS_SETTING - PAGER.DEFAULT_UNITに従う) --->

	<cfset var result = StructNew()>
	<cfset var result_array = ArrayNew(2)>
	<cfset var qGetProgress = ''>
	<cfset var qGetScoProgress = ''>
	<cfset var qGetUsers = ''>
	<cfset var __TempQueryString = ''>
	<cfset var startindex = 0>
	<cfset var endindex = 0>
	<cfset var i = 0>
	<cfset var tmp_user_array = ArrayNew(1)>
	<cfset var sco_id_safe = dao_escape(sco_id)>
	<cfset var type = 0>
	<cfset var sql_status = ''>
	<cfset var resultGraph = ArrayNew(1)>

	<!--- 表示タイプ取得 --->
	<cfinvoke component="#SERVICE_ADDRESS#.table_lms_setting"
	          method="get_value"
	          param_name="indication_type"
	          returnVariable="type"
	>
	<!--- 成績による絞り込み 有効な絞り込みの場合のみ処理する --->
	<cfif arg_status neq '' and ArrayLen(user_array) gt 0>
		<cfswitch expression="#arg_status#">
			<cfcase value="not_attempted,not attempted">
				<cfset sql_status = " AND (SP.STATUS IS NULL OR SP.STATUS = 'not attempted') ">
			</cfcase>
			<cfcase value="incomplete,completed,failed,passed">
				<cfset sql_status = " AND SP.STATUS='" & arg_status & "'">
			</cfcase>
			<cfdefaultcase>
				<cfset sql_status = "">
			</cfdefaultcase>
		</cfswitch>
		<cfset isNumericOrError(type)>
		<cfif sql_status neq ''>
			<cfquery name="qGetUsers" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				SELECT U.USER_ID
				FROM USER_MASTER AS U
				INNER JOIN SCO_MASTER S ON S.SCO_ID = #preserveSingleQuotes(sco_id_safe)#
				INNER JOIN CONSTRUCT     CO ON S.SCO_ID = CO.SCO_ID
				INNER JOIN COURSE_MASTER C  ON CO.COURSE_ID = C.COURSE_ID
				LEFT JOIN SCO_PROGRESS_RECORD SPR ON SPR.USER_ID   = U.USER_ID AND
				                                     SPR.COURSE_ID = C.COURSE_ID AND
				                                     SPR.SCO_ID    = S.SCO_ID AND
				                                     SPR.TYPE      = #type#
				LEFT JOIN SCO_PROGRESS SP ON SPR.USER_ID       = SP.USER_ID   AND
				                             SPR.COURSE_ID     = SP.COURSE_ID AND
				                             SPR.SCO_ID        = SP.SCO_ID    AND
				                             SPR.LECTURE_COUNT = SP.LECTURE_COUNT
				WHERE U.USER_ID IN (#ArrayToList(user_array)#)
				      #preserveSingleQuotes(sql_status)#
				ORDER BY U.LAST_NAME_FURI, U.FIRST_NAME_FURI, U.LOGON
			</cfquery>
			<cfset user_array = ValueList(qGetUsers.user_id, ",")>
			<cfset user_array = ListToArray(user_array, ",")>
		</cfif>
	</cfif>
	<cfset result.count = ArrayLen(user_array)>

	<cfset Variables.TempSelectObj = dao_select("CONSTRUCT")>
	<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "sco_id" , sco_id)>
	<cfset q_construct = dao_result("#application.DSN#", Variables.TempSelectObj)>
	<cfset course_array = ListToArray(q_construct.course_id)>

	<cfset qGetScoProgressF = spObj.get_sco_progress_query_by_user_id(user_array , course_array)>
	<cfquery name="qGetProgressF" dbtype="query">
		select * from qGetScoProgressF where sco_id = #sco_id# order by LAST_NAME_FURI, FIRST_NAME_FURI, LOGON
	</cfquery>

	<cfloop query="qGetProgressF">
		<cfset resultGraph[qGetProgressF.CurrentRow][6] = m_lc>
		<cfif score is "">
			<cfset resultGraph[qGetProgressF.CurrentRow][7] = 0>
		<cfelse>
			<cfset resultGraph[qGetProgressF.CurrentRow][7] = score>
		</cfif>
		<cfif sco_kind eq 2 or (sco_kind eq 1 and class_id neq 2)>
			<cfset resultGraph[qGetProgressF.CurrentRow][7] = "---">	<!--- 点数表示はテストか宿題のみ --->
		</cfif>
	</cfloop>

	<!--- 点数の度数分布表を作成 --->
	<cfset result.graph_struct = make_frequency_table(resultGraph)>

	<!--- ページャ処理 --->
	<cfset unit = make_pager_getUnit(unit)>
	<cfif start gt 0>
		<cfset startindex = start>
		<cfset endindex = start + unit - 1>
		<cfif endindex gt ArrayLen(user_array)>
			<cfset endindex = ArrayLen(user_array)>
		</cfif>
		<cfset tmp_user_array = ArrayNew(1)>
		<cfloop index="i" from="#startindex#" to="#endindex#">
			<cfset ArrayAppend(tmp_user_array, user_array[i])>
		</cfloop>
		<cfset user_array = tmp_user_array>
	</cfif>

	<cfset Variables.TempSelectObj = dao_select("CONSTRUCT")>
	<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "sco_id" , sco_id)>
	<cfset q_construct = dao_result("#application.DSN#", Variables.TempSelectObj)>
	<cfset course_array = ListToArray(q_construct.course_id)>

	<cfset qGetScoProgress = spObj.get_sco_progress_query_by_user_id(user_array , course_array)>
	<cfquery name="qGetProgress" dbtype="query">
		select * from qGetScoProgress where sco_id = #sco_id# order by LAST_NAME_FURI, FIRST_NAME_FURI, LOGON
	</cfquery>

	<cfloop query="qGetProgress">
		<cfset result_array[qGetProgress.CurrentRow][1] = logon>
		<cfset result_array[qGetProgress.CurrentRow][2] = last_name & ' ' & first_name>
		<cfset result_array[qGetProgress.CurrentRow][3] = course_name>
		<cfset result_array[qGetProgress.CurrentRow][4] = sco_name>
		<cfset result_array[qGetProgress.CurrentRow][5] = status2str(status)>
		<cfset result_array[qGetProgress.CurrentRow][6] = m_lc>
		<cfif score is "">
			<cfset result_array[qGetProgress.CurrentRow][7] = 0>
		<cfelse>
			<cfset result_array[qGetProgress.CurrentRow][7] = score>
		</cfif>

		<cfif start_date is "">
			<cfset result_array[qGetProgress.CurrentRow][8] = '---'>
		<cfelse>
			<cfset result_array[qGetProgress.CurrentRow][8] = DateFormat(start_date , 'yyyy/mm/dd') & ' ' & TimeFormat(start_date , 'HH:mm')>
		</cfif>
		<cfif score_date is "">
			<cfset result_array[qGetProgress.CurrentRow][9] = '---'>
		<cfelse>
			<cfset result_array[qGetProgress.CurrentRow][9] = DateFormat(score_date , 'yyyy/mm/dd') & ' ' & TimeFormat(score_date , 'HH:mm')>
		</cfif>
		<cfif end_date is "">
			<cfset result_array[qGetProgress.CurrentRow][10] = '---'>
		<cfelse>
			<cfset result_array[qGetProgress.CurrentRow][10] = DateFormat(end_date , 'yyyy/mm/dd') & ' ' & TimeFormat(end_date , 'HH:mm')>
		</cfif>

		<cfset result_array[qGetProgress.CurrentRow][11] = fn_sec2time(eLM_total_time)>

		<cfset result_array[qGetProgress.CurrentRow][12] = course_id>
		<cfset result_array[qGetProgress.CurrentRow][19] = sco_id>

		<cfset result_array[qGetProgress.CurrentRow][20] = getScoTypeString(class_id, sco_kind)>
		<cfif sco_kind eq 2 or (sco_kind eq 1 and class_id neq 2)>
			<cfset result_array[qGetProgress.CurrentRow][7] = "---">	<!--- 点数表示はテストか宿題のみ --->
		</cfif>

		<cfset result_array[qGetProgress.CurrentRow][13] = user_id>
		<cfset result_array[qGetProgress.CurrentRow][14] = last_name>
		<cfset result_array[qGetProgress.CurrentRow][15] = first_name>
		<cfset result_array[qGetProgress.CurrentRow][16] = last_name_furi>
		<cfset result_array[qGetProgress.CurrentRow][17] = first_name_furi>
		<cfset result_array[qGetProgress.CurrentRow][18] = mailaddress>

		<cfset result_array[qGetProgress.CurrentRow][21] = ''>	<!--- 欠番 --->
		<cfset result_array[qGetProgress.CurrentRow][22] = flag_get_status>
		<cfset result_array[qGetProgress.CurrentRow][23] = flag_get_score>
	</cfloop>

	<cfset result.array = result_array>
	<cfreturn result>

</cffunction>

<!--- 成績配列から点数の度数分布表を生成 --->
<cffunction name="make_frequency_table" output="Yes" returntype="struct">
	<cfargument name="result_array" type="array" required="yes">
	<cfset var granularity = 5>
	<cfset var i = 0>
	<cfset var frequency_table = StructNew()>
	<cfset var frequency_array = ArrayNew(1)>
	<cfset var target = 0>

	<cfloop index="i" from="1" to="#ArrayLen(result_array)#">
		<cfif result_array[i][6] neq 0 and isnumeric(result_array[i][7])>
			<cfset target = int(result_array[i][7] / granularity) + 1>
			<cfloop condition="ArrayLen(frequency_array) lt target">
				<cfset ArrayAppend(frequency_array, 0)>
			</cfloop>
			<cfset frequency_array[target] = frequency_array[target] + 1>
		</cfif>
	</cfloop>

	<cfset frequency_table.data_array  = frequency_array>
	<cfset frequency_table.granularity = granularity>
	<cfreturn frequency_table>
</cffunction>

<!--- 成績配列をCSVに変換&出力 --->
<cffunction name="result2csv" output="Yes" returntype="array">
	<cfargument name="arg_type" type="numeric" required="yes"><!--- =1:コース、=2:コース／SCO、=3:テスト初回時解答 --->
	<cfargument name="arg_data" type="array" required="yes">
	<cfargument name="csv_file_name" type="string" required="yes">

	<cfset var csv_data = ArrayNew(1)>
	<cfset var de = lsObj.get_value("csv.delimiter")>

	<cfheader name="Content-Disposition" value="attachment;filename=#csv_file_name#">
	<cfheader name="Pragma" value="">
	<cfheader name="Cache-Control" value= "">
	<cfcontent type="text/csv; charset=#lsObj.get_value("csv.charset")#" reset="no">
	<cfflush>

	<cfswitch expression="#arg_type#">
	<cfcase value="1,6">
		<cfset csv_data[1] = double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_logo:ja=eLearningManager')) & de & double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_title:ja=コース成績一覧')) & de & de & double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_output_date:ja=出力日時')) & de & double_quote(DateFormat(Now(),"yyyy-mm-dd") & ' ' & TimeFormat(Now(),"HH:mm:ss"))>
		<cfset csv_data[2] = ''>
		<cfset temp_csv_col_arr = arrayNew(1)>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_1:ja=姓')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_2:ja=名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_3:ja=姓（ふりがな）')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_4:ja=名（ふりがな）')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_5:ja=ユーザーID')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_6:ja=メールアドレス')))>
		<cfif arg_type eq 1><cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_14:ja=グループ名')))></cfif>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_7:ja=コース名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_8:ja=成績')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_9:ja=進捗率')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_10:ja=学習回数')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_11:ja=学習開始日時')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_12:ja=学習修了日時')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_13:ja=累積時間')))>
		<cfset temp_csv_col_str = ArrayToList(temp_csv_col_arr,#de#)>
		<cfset csv_data[3] = temp_csv_col_str>

		<cfoutput>#csv_data[1]##chr(10)#</cfoutput>
		<cfoutput>#csv_data[2]##chr(10)#</cfoutput>
		<cfoutput>#csv_data[3]##chr(10)#</cfoutput>

		<cfloop index="i" from="1" to="#ArrayLen(arg_data)#">
			<cfif arg_type eq 1>
				<cfset csv_data[i + 3] = '"' & arg_data[i][14] & '"' & de & '"' & arg_data[i][15] & '"' & de & '"' & arg_data[i][16] & '"' & de & '"' & arg_data[i][17] & '"' & de & '"' & arg_data[i][1] & '"' & de & '"' & arg_data[i][18] & '"' & de & '"' & arg_data[i][19] & '"' & de & '"' & arg_data[i][3] & '"' & de & '"' & arg_data[i][5] & '"' & de & '"' & arg_data[i][7] & '"' & de & '"' & arg_data[i][6] & '"' & de & '"' & arg_data[i][8] & '"' & de & '"' & arg_data[i][10] & '"' & de & '"' & arg_data[i][11] & '"'>
			<cfelse>
				<cfset csv_data[i + 3] = '"' & arg_data[i][14] & '"' & de & '"' & arg_data[i][15] & '"' & de & '"' & arg_data[i][16] & '"' & de & '"' & arg_data[i][17] & '"' & de & '"' & arg_data[i][1] & '"' & de & '"' & arg_data[i][18] & '"' & de & '"' & arg_data[i][3] & '"' & de & '"' & arg_data[i][5] & '"' & de & '"' & arg_data[i][7] & '"' & de & '"' & arg_data[i][6] & '"' & de & '"' & arg_data[i][8] & '"' & de & '"' & arg_data[i][10] & '"' & de & '"' & arg_data[i][11] & '"'>
			</cfif>
			<cfoutput>#csv_data[i + 3]##chr(10)#</cfoutput>
		</cfloop>
	</cfcase>
	<cfcase value="2">
		<cfset csv_data[1] = double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_logo:ja=eLearningManager')) & de & double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_title:ja=教材成績一覧')) & de & de & double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_output_date:ja=出力日時')) & de & double_quote(DateFormat(Now(),"yyyy-mm-dd") & ' ' & TimeFormat(Now(),"HH:mm:ss"))>
		<cfset csv_data[2] = ''>
		<cfset temp_csv_col_arr = arrayNew(1)>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_1:ja=姓')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_2:ja=名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_3:ja=姓（ふりがな）')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_4:ja=名（ふりがな）')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_5:ja=ユーザーID')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_6:ja=メールアドレス')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_7:ja=コース名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_8:ja=教材名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_9:ja=教材種別')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_10:ja=成績')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_11:ja=学習回数')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_12:ja=点数')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_13:ja=学習開始日時')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_14:ja=学習修了日時')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_15:ja=累積時間')))>
		<cfset temp_csv_col_str = ArrayToList(temp_csv_col_arr,#de#)>
		<cfset csv_data[3] = temp_csv_col_str>

		<cfoutput>#csv_data[1]##chr(10)#</cfoutput>
		<cfoutput>#csv_data[2]##chr(10)#</cfoutput>
		<cfoutput>#csv_data[3]##chr(10)#</cfoutput>

		<cfloop index="i" from="1" to="#ArrayLen(arg_data)#">
			<cfset csv_data[i + 3] = '"' & arg_data[i][17] & '"' & de & '"' & arg_data[i][18] & '"' & de & '"' & arg_data[i][19] & '"' & de & '"' & arg_data[i][20] & '"' & de & '"' & arg_data[i][1] & '"' & de & '"' & arg_data[i][21] & '"' & de & '"' & arg_data[i][3] & '"' & de & '"' & arg_data[i][4] & '"' & de & '"' & arg_data[i][14] & '"' & de & '"' & arg_data[i][5] & '"' & de & '"' & arg_data[i][6] & '"' & de & '"' & arg_data[i][7] & '"' & de & '"' & arg_data[i][8] & '"' & de & '"' & arg_data[i][10] & '"' & de & '"' & arg_data[i][11] & '"'>

			<cfoutput>#csv_data[i + 3]##chr(10)#</cfoutput>
		</cfloop>
	</cfcase>
	<cfcase value="3">
		<cfset csv_data[1] = double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_logo:ja=eLearningManager')) & de & double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_title:ja=テスト教材　初回受講時回答成績')) & de & de & double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_output_date:ja=出力日時')) & de & double_quote(DateFormat(Now(),"yyyy-mm-dd") & ' ' & TimeFormat(Now(),"HH:mm:ss"))>
		<cfset csv_data[2] = ''>
		<cfset temp_csv_col_arr = arrayNew(1)>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_1:ja=姓')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_2:ja=名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_3:ja=姓（ふりがな）')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_4:ja=名（ふりがな）')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_5:ja=ユーザーID')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_6:ja=メールアドレス')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_7:ja=コース名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_8:ja=教材名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_9:ja=教材種別')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_10:ja=成績')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_11:ja=学習回数')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_12:ja=点数')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_13:ja=開始日時')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_14:ja=終了日時')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_15:ja=学習時間')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_16:ja=問題番号')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_17:ja=問題ID')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_18:ja=回答')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_6_col_18:ja=正答')))>
		<cfset temp_csv_col_str = ArrayToList(temp_csv_col_arr,#de#)>
		<cfset csv_data[3] = temp_csv_col_str>

		<cfoutput>#csv_data[1]##chr(10)#</cfoutput>
		<cfoutput>#csv_data[2]##chr(10)#</cfoutput>
		<cfoutput>#csv_data[3]##chr(10)#</cfoutput>

		<cfloop index="i" from="1" to="#ArrayLen(arg_data)#">
			<cfset csv_data[i + 3] = '"' & arg_data[i][3] & '"' & de & '"' & arg_data[i][4] & '"' & de & '"' & arg_data[i][5] & '"' & de & '"' & arg_data[i][6] & '"' & de & '"' & arg_data[i][2] & '"' & de & '"' & arg_data[i][7] & '"' & de & '"' & arg_data[i][12] & '"' & de & '"' & arg_data[i][22] & '"' & de & '"' & arg_data[i][23] & '"' & de & '"' & arg_data[i][35] & '"' & de & '"' & arg_data[i][31] & '"' & de & '"' & arg_data[i][36] & '"' & de & '"' & arg_data[i][32] & '"' & de & '"' & arg_data[i][33] & '"' & de & '"' & arg_data[i][34] & '"' & de & '"' & arg_data[i][41] & '"' & de & '"' & arg_data[i][42] & '"' & de & '"' & arg_data[i][43] & '"' & de & '"' & arg_data[i][44] & '"' & de & '"' & arg_data[i][45] & '"'>

			<cfoutput>#csv_data[i + 3]##chr(10)#</cfoutput>
		</cfloop>
	</cfcase>
	<!--- 2020/01/17 ito c_csv_co_sco ADD start --->
	<cfcase value="7">
		<cfset csv_data[1] = double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_logo:ja=eLearningManager')) & de & double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_title:ja=教材成績一覧')) & de & de & double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_output_date:ja=出力日時')) & de & double_quote(DateFormat(Now(),"yyyy-mm-dd") & ' ' & TimeFormat(Now(),"HH:mm:ss"))>
		<cfset csv_data[2] = ''>
		<cfset temp_csv_col_arr = arrayNew(1)>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_1:ja=姓')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_2:ja=名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_3:ja=姓（ふりがな）')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_4:ja=名（ふりがな）')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_5:ja=ユーザーID')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_6:ja=メールアドレス')))>
		<!--- ※※文言IDは別途新規で作成するべき※※ --->
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_14:ja=グループ名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_8:ja=成績')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_9:ja=進捗率')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_10:ja=学習回数')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_11:ja=学習開始日時')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_12:ja=学習修了日時')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_4_col_13:ja=累積時間')))>
		<!--- ※※文言IDは別途新規で作成するべき※※ --->
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_7:ja=コース名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_8:ja=教材名')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_9:ja=教材種別')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_10:ja=成績')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_11:ja=学習回数')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_12:ja=点数')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_13:ja=学習開始日時')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_14:ja=学習修了日時')))>
		<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_5_col_15:ja=累積時間')))>
		<cfset temp_csv_col_str = ArrayToList(temp_csv_col_arr,#de#)>
		<cfset csv_data[3] = temp_csv_col_str>

		<cfoutput>#csv_data[1]##chr(10)#</cfoutput>
		<cfoutput>#csv_data[2]##chr(10)#</cfoutput>
		<cfoutput>#csv_data[3]##chr(10)#</cfoutput>

		<cfloop index="i" from="1" to="#ArrayLen(arg_data)#">
			<cfset csv_data[i + 3] = '"' & arg_data[i][17] & '"' & de & '"' & arg_data[i][18] & '"' & de & '"' & arg_data[i][19] & '"' & de & '"' & arg_data[i][20] & '"' & de & '"' & arg_data[i][1] & '"' & de & '"' & arg_data[i][21] & '"' & de & '"' & arg_data[i][26] & '"' & de & '"' & arg_data[i][27] & '"' & de & '"' & arg_data[i][28] & '"' & de & '"' & arg_data[i][29] & '"' & de & '"' & arg_data[i][30] & '"' & de & '"' & arg_data[i][31] & '"' & de & '"' & arg_data[i][32] & '"' & de & '"' & arg_data[i][3] & '"' & de & '"' & arg_data[i][4] & '"' & de & '"' & arg_data[i][14] & '"' & de & '"' & arg_data[i][5] & '"' & de & '"' & arg_data[i][6] & '"' & de & '"' & arg_data[i][7] & '"' & de & '"' & arg_data[i][8] & '"' & de & '"' & arg_data[i][10] & '"' & de & '"' & arg_data[i][11] & '"'>

			<cfoutput>#csv_data[i + 3]##chr(10)#</cfoutput>
		</cfloop>
	</cfcase>
	<!--- 2020/01/17 ito c_csv_co_sco ADD end --->
	</cfswitch>

	<cfreturn csv_data>

</cffunction>

<!--- テスト点数度数分布表をCSVに変換 --->
<cffunction name="freqtable2csv" output="Yes" returntype="array">
	<cfargument name="freqArray" type="array" required="Yes">
	<cfargument name="csv_file_name" type="string" required="yes">

	<cfset var i = 0>
	<cfset var j = 0>
	<cfset var max_score = 0>
	<cfset var granularity = 0>
	<cfset var csv_data = ArrayNew(1)>
	<cfset var de = lsObj.get_value("csv.delimiter")>

	<cfheader name="Content-Disposition" value="attachment;filename=#csv_file_name#">
	<cfheader name="Pragma" value="">
	<cfheader name="Cache-Control" value= "">
	<cfcontent type="text/csv; charset=#lsObj.get_value("csv.charset")#" reset="no">
	<cfflush>

	<!--- ヘッダー作成 --->
	<cfset csv_data[1] = double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_7_logo:ja=eLearningManager')) & de & double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_7_title:ja=テスト教材得点　度数分布表')) & de & de & double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_7_output_date:ja=出力日時')) & de & double_quote(DateFormat(Now(),"yyyy-mm-dd") & ' ' & TimeFormat(Now(),"HH:mm:ss"))>
	<cfset csv_data[2] = ''>
	<cfset csv_data[3] = double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_7_col_1:ja=教材名'))>

	<cfoutput>#csv_data[1]##chr(10)#</cfoutput>
	<cfoutput>#csv_data[2]##chr(10)#</cfoutput>

	<!--- データが空ならヘッダのみ返す --->
	<cfif ArrayLen(freqArray) eq 0>
		<cfoutput>#csv_data[3]##chr(10)#</cfoutput>
		<cfreturn csv_data>
	</cfif>

	<!--- 点数上限を計算 --->
	<cfloop index="i" from="1" to="#ArrayLen(freqArray)#">
		<cfif freqArray[i].max_score gt max_score>
			<cfset max_score = freqArray[i].max_score>
		</cfif>
		<cfset granularity = freqArray[i].granularity>
	</cfloop>

	<cfset i = 0>
	<cfloop condition = "granularity * i lte max_score">
		<cfif granularity * i eq max_score>
			<cfset csv_data[3] = csv_data[3] & de & double_quote(granularity * i)>
		<cfelseif granularity * (i+1) -1 lte max_score>
			<cfset csv_data[3] = csv_data[3] & de & double_quote(granularity * i & '-' & granularity * (i+1) - 1)>
		<cfelse>
			<cfset csv_data[3] = csv_data[3] & de & double_quote(granularity * i & '-' & max_score)>
		</cfif>
		<cfset i = i + 1>
	</cfloop>

	<cfoutput>#csv_data[3]##chr(10)#</cfoutput>

	<!--- データ作成 --->
	<cfloop index="i" from="1" to="#ArrayLen(freqArray)#">
		<cfset csv_data[3+i] = double_quote(freqArray[i].sco_name)>
		<cfloop index="j" from="1" to="#int(freqArray[i].max_score/freqArray[i].granularity) + 1#">
			<cfif j lte ArrayLen(freqArray[i].data_array)>
				<cfset csv_data[3+i] = csv_data[3+i] & de & double_quote(freqArray[i].data_array[j])>
			<cfelse>
				<cfset csv_data[3+i] = csv_data[3+i] & de & double_quote("0")>
			</cfif>
		</cfloop>

		<cfoutput>#csv_data[3+i]##chr(10)#</cfoutput>
	</cfloop>

	<cfreturn csv_data>
</cffunction>

<!--- 受講時間分析表をCSVに変換&出力 --->
<cffunction name="timetable2csv" output="Yes" returntype="array">
	<cfargument name="timeArray" type="array" required="Yes">
	<cfargument name="csv_file_name" type="string" required="yes">

	<cfset var i = 0>
	<cfset var csv_data = ArrayNew(1)>
	<cfset var de = lsObj.get_value("csv.delimiter")>

	<cfheader name="Content-Disposition" value="attachment;filename=#csv_file_name#">
	<cfheader name="Pragma" value="">
	<cfheader name="Cache-Control" value= "">
	<cfcontent type="text/csv; charset=#lsObj.get_value("csv.charset")#" reset="no">
	<cfflush>

	<!--- ヘッダー作成 --->
	<cfset csv_data[1] = double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_8_logo:ja=eLearningManager')) & de & double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_8_title:ja=教材受講時間分析表')) & de & de & double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_8_output_date:ja=出力日時')) & de & double_quote(DateFormat(Now(),"yyyy-mm-dd") & ' ' & TimeFormat(Now(),"HH:mm:ss"))>
	<cfset csv_data[2] = ''>
	<cfset temp_csv_col_arr = arrayNew(1)>
	<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_8_col_1:ja=教材名')))>
	<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_8_col_2:ja=受講者数')))>
	<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_8_col_3:ja=のべ受講回数')))>
	<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_8_col_4:ja=のべ受講時間')))>
	<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_8_col_5:ja=１人当たり受講回数')))>
	<cfset Arrayappend(temp_csv_col_arr, double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_8_col_6:ja=１人当たり受講時間')))>
	<cfset temp_csv_col_str = ArrayToList(temp_csv_col_arr,#de#)>
	<cfset csv_data[3] = temp_csv_col_str>

	<cfoutput>#csv_data[1]##chr(10)#</cfoutput>
	<cfoutput>#csv_data[2]##chr(10)#</cfoutput>
	<cfoutput>#csv_data[3]##chr(10)#</cfoutput>

	<!--- データ作成 --->
	<cfloop index="i" from="1" to="#ArrayLen(timeArray)#">
		<cfset csv_data[3+i] = double_quote(timeArray[i].sco_name)>
		<cfset csv_data[3+i] = csv_data[3+i] & de & double_quote(timeArray[i].user_count)>
		<cfset csv_data[3+i] = csv_data[3+i] & de & double_quote(timeArray[i].lecture_count)>
		<cfset csv_data[3+i] = csv_data[3+i] & de & double_quote(fn_sec2time(timeArray[i].total_time))>
		<cfif timeArray[i].user_count eq 0>
			<cfset csv_data[3+i] = csv_data[3+i] & de & 0 & de & double_quote(fn_sec2time(0))>
		<cfelse>
			<cfset csv_data[3+i] = csv_data[3+i] & de & double_quote(timeArray[i].lecture_count / timeArray[i].user_count)>
			<cfset csv_data[3+i] = csv_data[3+i] & de & double_quote(fn_sec2time(timeArray[i].total_time / timeArray[i].user_count))>
		</cfif>

		<cfoutput>#csv_data[3+i]##chr(10)#</cfoutput>
	</cfloop>

	<cfreturn csv_data>
</cffunction>

<!--- 成績クエリをCSVに変換&出力 --->
<cffunction name="resultquery2csv" output="Yes" returntype="array">
	<cfargument name="arg_type" type="numeric" required="yes"><!--- =1:学習履歴、=2:テスト回答 --->
	<cfargument name="arg_info" type="array" required="yes">
	<cfargument name="arg_result" type="query" required="yes">
	<cfargument name="csv_file_name" type="string" required="yes">

	<cfset var csv_data = ArrayNew(1)>
	<cfset var de = lsObj.get_value("csv.delimiter")>

	<cfheader name="Content-Disposition" value="attachment;filename=#csv_file_name#">
	<cfheader name="Pragma" value="">
	<cfheader name="Cache-Control" value= "">
	<cfcontent type="text/csv; charset=#lsObj.get_value("csv.charset")#" reset="no">
	<cfflush>

	<cfswitch expression="#arg_type#">
	<cfcase value="1">
		<cfset csv_data[1] = #double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_logo:ja=eLearningManager'))# & de & #double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_title:ja=教材学習履歴一覧'))# & de & de & #double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_output_date:ja=出力日時'))# & de & double_quote(DateFormat(Now(),"yyyy-mm-dd") & ' ' & TimeFormat(Now(),"HH:mm:ss"))>
		<cfset csv_data[2] = ''>
		<cfset temp_csv_col_arr = arrayNew(1)>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_1:ja=姓')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_2:ja=名')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_3:ja=姓（ふりがな）')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_4:ja=名（ふりがな）')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_5:ja=ユーザーID')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_6:ja=メールアドレス')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_7:ja=コース名')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_8:ja=教材名')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_9:ja=教材種別')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_10:ja=成績')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_11:ja=学習回数')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_12:ja=点数')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_13:ja=開始日時')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_14:ja=終了日時')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_15:ja=学習時間')))>
<cfif arg_info[24] eq 3>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_16:ja=コメント')))>
</cfif>
		<cfset temp_csv_col_str = ArrayToList(temp_csv_col_arr,#de#)>
		<cfset csv_data[3] = temp_csv_col_str>

		<cfoutput>#csv_data[1]##chr(10)#</cfoutput>
		<cfoutput>#csv_data[2]##chr(10)#</cfoutput>
		<cfoutput>#csv_data[3]##chr(10)#</cfoutput>

		<cfset LoopCount = 0>
		<cfloop query="arg_result">
			<cfset LoopCount = LoopCount + 1>
			<cfset csv_data[3 + LoopCount] = '"' & arg_info[3] & '"' & de & '"' & arg_info[4] & '"' & de & '"' & arg_info[5] & '"' & de & '"' & arg_info[6] & '"' & de & '"' & arg_info[2] & '"' & de & '"' & arg_info[7] & '"' & de & '"' & arg_info[12] & '"' & de & '"' & arg_info[22] & '"' & de & '"' & arg_info[23] & '"' & de & '"' & status2str(status) & '"' & de & '"' & lecture_count & Session.termObj.get_term('eLM_admin_course_report3_inc_sco_history_learning_times') & '"' & de & '"'>
			<cfif flag_get_score is 1>
				<cfset csv_data[3 + LoopCount] = csv_data[3 + LoopCount] & score>
			<cfelse>
				<cfset csv_data[3 + LoopCount] = csv_data[3 + LoopCount] & "---">
			</cfif>
			<cfset csv_data[3 + LoopCount] = csv_data[3 + LoopCount] & '"' & de & '"' & DateFormat(start_date, 'yyyy/mm/dd') & ' ' & TimeFormat(start_date, 'HH:mm:ss') & '"' & de & '"' & DateFormat(end_date, 'yyyy/mm/dd') & ' ' & TimeFormat(end_date, 'HH:mm:ss') & '"' & de & '"' & fn_sec2time(eLM_session_time) & '"'>

<cfif arg_info[24] eq 3>
			<cfif flg_comment is 1>
				<cfset csv_data[3 + LoopCount] = csv_data[3 + LoopCount] & de & '"' & Session.termObj.get_term('eLM_admin_course_report3_inc_results_have_detail_comment') & '"'>
			<cfelse>
				<cfset csv_data[3 + LoopCount] = csv_data[3 + LoopCount] & de & '"' & "---" & '"'>
			</cfif>
</cfif>

			<cfoutput>#csv_data[3 + LoopCount]##chr(10)#</cfoutput>

		</cfloop>
	</cfcase>
	<cfcase value="2">
		<cfset csv_data[1] = #double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_logo:ja=eLearningManager'))# & de & #double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_title:ja=テスト教材回答一覧'))# & de & de & #double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_output_date:ja=出力日時'))# & de & double_quote(DateFormat(Now(),"yyyy-mm-dd") & ' ' & TimeFormat(Now(),"HH:mm:ss"))>
		<cfset csv_data[2] = ''>
		<cfset temp_csv_col_arr = arrayNew(1)>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_1:ja=姓')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_2:ja=名')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_3:ja=姓（ふりがな）')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_4:ja=名（ふりがな）')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_5:ja=ユーザーID')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_6:ja=メールアドレス')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_7:ja=コース名')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_8:ja=教材名')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_9:ja=教材種別')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_10:ja=成績')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_11:ja=学習回数')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_12:ja=点数')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_13:ja=開始日時')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_14:ja=終了日時')))>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_15:ja=学習時間')))>
<cfif arg_info[30] eq 3>
		<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_9_col_16:ja=コメント')))>
</cfif>

		<cfif arg_result.recordcount neq "0">
			<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_16:ja=問題番号')))>
			<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_17:ja=問題ID')))>
			<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_18:ja=回答')))>
			<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_19:ja=正答')))>
			<cfset Arrayappend(temp_csv_col_arr,double_quote(Session.termObj.get_term('eLM_admin_course_report3_csv_10_col_20:ja=判定')))>
		</cfif>
		<cfset temp_csv_col_str = ArrayToList(temp_csv_col_arr,#de#)>
		<cfset csv_data[3] = temp_csv_col_str>

		<cfoutput>#csv_data[1]##chr(10)#</cfoutput>
		<cfoutput>#csv_data[2]##chr(10)#</cfoutput>
		<cfoutput>#csv_data[3]##chr(10)#</cfoutput>

		<cfset LoopCount = 0>
		<cfif arg_result.recordcount neq "0">
			<cfloop query="arg_result">
				<cfset str__correct_response = "">
				<cfif correct_responses_json neq "">
					<cfset temp_correct_response = objJSON.decode(correct_responses_json)>
					<cfloop index="ArrayIndex" from="1" to="#ArrayLen(temp_correct_response)#">
						<cfif str__correct_response eq "">
							<cfset str__correct_response = temp_correct_response[ArrayIndex].pattern>
						<cfelse>
							<cfset str__correct_response = str__correct_response & "|" & temp_correct_response[ArrayIndex].pattern>
						</cfif>
					</cfloop>
				</cfif>

				<cfset LoopCount = LoopCount + 1>
				<cfset csv_data[3 + LoopCount] = '"' & arg_info[3] & '"' & de & '"' & arg_info[4] & '"' & de & '"' & arg_info[5] & '"' & de & '"' & arg_info[6] & '"' & de & '"' & arg_info[2] & '"' & de & '"' & arg_info[7] & '"' & de & '"' & arg_info[12] & '"' & de & '"' & arg_info[22] & '"' & de & '"' & arg_info[23] & '"' & de & '"' & arg_info[24] & '"' & de & '"' & arg_info[25] & '"' & de & '"' & arg_info[26] & '"' & de & '"' & arg_info[27] & '"' & de & '"' & arg_info[28] & '"' & de & '"' & arg_info[29] & '"' & de & '"' & LoopCount & '"' & de & '"' & id & '"' & de & '"' & user_response & '"' & de & '"' & str__correct_response & '"' & de & '"' & fn_output_result_mark(result) & '"'>

				<cfoutput>#csv_data[3 + LoopCount]##chr(10)#</cfoutput>

			</cfloop>
		<cfelse>
			<cfset csv_data[3 + LoopCount] = '"' & arg_info[3] & '"' & de & '"' & arg_info[4] & '"' & de & '"' & arg_info[5] & '"' & de & '"' & arg_info[6] & '"' & de & '"' & arg_info[2] & '"' & de & '"' & arg_info[7] & '"' & de & '"' & arg_info[12] & '"' & de & '"' & arg_info[22] & '"' & de & '"' & arg_info[23] & '"' & de & '"' & arg_info[24] & '"' & de & '"' & arg_info[25] & '"' & de & '"' & arg_info[26] & '"' & de & '"' & arg_info[27] & '"' & de & '"' & arg_info[28] & '"' & de & '"' & arg_info[29] & '"'>

<cfif arg_info[30] eq 3>
			<cfset csv_data[3 + LoopCount] =  csv_data[3 + LoopCount] & de & '"' & arg_info[31] & '"'>
</cfif>
			<cfoutput>#csv_data[3 + LoopCount]##chr(10)#</cfoutput>
		</cfif>
	</cfcase>
	</cfswitch>

	<cfreturn csv_data>

</cffunction>

<!--- モードごとのパンくずリスト生成 --->
<cffunction name="makeTopicPath" output="No" returntype="string">
	<cfargument name="arg_mode" type="string" required="yes">

	<cfset strTopicPath = ''>

	<cfswitch expression="#arg_mode#">
	<cfcase value="u">
		<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report1:ja=成績管理')#</cfoutput>
</span> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user1:ja=ユーザー単位')#</cfoutput><br>'>
	</cfcase>
	<cfcase value="ur">
		<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report2:ja=成績管理')#</cfoutput>
</span> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=u&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user2:ja=ユーザー単位')#</cfoutput></a> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_reportshow1:ja=成績表示')#</cfoutput><br>'>
	</cfcase>
	<cfcase value="user_graph">
		<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report3:ja=成績管理')#</cfoutput>
</span> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=u&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user3:ja=ユーザー単位')#</cfoutput></a> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_reportgrapshow1:ja=成績グラフ表示')#</cfoutput><br>'>
	</cfcase>
	<cfcase value="ur2">
		<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report4:ja=成績管理')#</cfoutput>
</span> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=u&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user4:ja=ユーザー単位')#</cfoutput></a> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=ur&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_reportshow2:ja=成績表示')#</cfoutput></a> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_detail1:ja=詳細')#</cfoutput><br>'>
	</cfcase>
	<cfcase value="ur2h">
		<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report5:ja=成績管理')#</cfoutput>
</span> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=u&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user5:ja=ユーザー単位')#</cfoutput></a> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=ur&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_reportshow3:ja=成績表示')#</cfoutput></a> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=ur2&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_detail2:ja=詳細')#</cfoutput></a> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_studyrecord1:ja=学習履歴')#</cfoutput><br>'>
	</cfcase>
	<cfcase value="ur2t">
		<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report6:ja=成績管理')#</cfoutput>
</span> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=u&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user6:ja=ユーザー単位')#</cfoutput></a> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=ur&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_reportshow4:ja=成績表示')#</cfoutput></a> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=ur2&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_detail3:ja=詳細')#</cfoutput></a> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_answer:ja=回答内容')#</cfoutput><br>'>
	</cfcase>
	<cfcase value="c,s">
		<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report7:ja=成績管理')#</cfoutput>
</span> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user7:ja=コース・教材単位')#</cfoutput><br>'>
	</cfcase>
	<cfcase value="cr,sr">
		<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report8:ja=成績管理')#</cfoutput>
</span> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=c&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user8:ja=コース単位')#</cfoutput></a> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_reportshow5:ja=成績表示')#</cfoutput><br>'>
	</cfcase>
	<cfcase value="cr2">
		<cfif lsObj.get_value('course.score_by_group') eq 1 or lsObj.get_value('customer_name') eq 'sato'>
			<cfif from eq 'sr'>
				<cfset mode_g='sg'>
			<cfelseif from eq 'cr'>
				<cfset mode_g='cg'>
			</cfif>
			<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report9:ja=成績管理')#</cfoutput></span>
			 <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=c&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user9:ja=コース単位')#</cfoutput></a>
			 <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=#mode_g#&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user13:ja=グループ単位')#</cfoutput></a>
			 <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=#from#&sid=#sid#&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_reportshow6:ja=成績表示')#</cfoutput></a>
			 <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_detail4:ja=詳細')#</cfoutput><br>'>
		<cfelse>
			<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report9:ja=成績管理')#</cfoutput></span>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=c&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user9:ja=コース単位')#</cfoutput></a>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=#from#&sid=#sid#&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_reportshow6:ja=成績表示')#</cfoutput></a>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_detail4:ja=詳細')#</cfoutput><br>'>
		</cfif>
	</cfcase>
	<cfcase value="cr2h">
		<cfif lsObj.get_value('course.score_by_group') eq 1 or lsObj.get_value('customer_name') eq 'sato'>
			<cfif from eq 'sr'>
				<cfset mode_g='sg'>
			<cfelseif from eq 'cr'>
				<cfset mode_g='cg'>
			</cfif>
			<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report10:ja=成績管理')#</cfoutput>
	</span> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=c&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user10:ja=コース単位')#</cfoutput></a>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=#mode_g#&sid=#sid#&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user13:ja=グループ単位')#</cfoutput></a>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=#from#&sid=#sid#&gid=#gid#&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_reportshow7:ja=成績表示')#</cfoutput></a>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=cr2&sid=#sid#&gid=#gid#&from=#from#&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_detail5:ja=詳細')#</cfoutput></a>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_studyrecord2:ja=学習履歴')#</cfoutput><br>'>
		<cfelse>
			<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report10:ja=成績管理')#</cfoutput>
	</span> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=c&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user10:ja=コース単位')#</cfoutput></a>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=#from#&sid=#sid#&gid=#gid#&from=#from#&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_reportshow7:ja=成績表示')#</cfoutput></a>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=cr2&from=#from#&sid=#sid#&gid=#gid#&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_detail5:ja=詳細')#</cfoutput></a>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_studyrecord2:ja=学習履歴')#</cfoutput><br>'>
		</cfif>
	</cfcase>
	<cfcase value="cr2t">
		<cfif lsObj.get_value('course.score_by_group') eq 1 or lsObj.get_value('customer_name') eq 'sato'>
			<cfif from eq 'sr'>
				<cfset mode_g='sg'>
			<cfelseif from eq 'cr'>
				<cfset mode_g='cg'>
			</cfif>
			<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report11:ja=成績管理')#</cfoutput>
	</span> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=c&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user11:ja=コース単位')#</cfoutput></a>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=#mode_g#&sid=#sid#&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user13:ja=グループ単位')#</cfoutput></a>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=#from#&sid=#sid#&gid=#gid#&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_reportshow8:ja=成績表示')#</cfoutput></a>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=cr2&from=#from#&gid=#gid#&sid=#sid#&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_detail6:ja=詳細')#</cfoutput></a>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_answer:ja=回答内容')#</cfoutput><br>'>
		<cfelse>
			<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report11:ja=成績管理')#</cfoutput>
	</span> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=c&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user11:ja=コース単位')#</cfoutput></a>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=#from#&sid=#sid#&gid=#gid#&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_reportshow8:ja=成績表示')#</cfoutput></a>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=cr2&from=#from#&sid=#sid#&gid=#gid#&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_detail6:ja=詳細')#</cfoutput></a>
			<cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_answer:ja=回答内容')#</cfoutput><br>'>
		</cfif>
	</cfcase>

	<cfcase value="cg">
		<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report12:ja=成績管理')#</cfoutput></span>
		 <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=c&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user8:ja=コース単位')#</cfoutput></a>
		 <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user13:ja=グループ単位')#</cfoutput>'>
	</cfcase>

	<cfcase value="sg">
		<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report12:ja=成績管理')#</cfoutput></span>
		 <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=c&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user8:ja=コース単位')#</cfoutput></a>
		 <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user13:ja=グループ単位')#</cfoutput>'>
	</cfcase>
	<cfcase value="cgr">
		<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report12:ja=成績管理')#</cfoutput>
		</span> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=c&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user8:ja=コース単位')#</cfoutput></a>
		 <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=cg&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user13:ja=グループ単位')#</cfoutput></a>
		 <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_ureportshow1:ja=成績表示')#</cfoutput>'>
	</cfcase>
	<cfcase value="sgr">
		<cfset strTopicPath = '<span class="ht"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_report12:ja=成績管理')#</cfoutput>
		</span> <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=c&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user8:ja=コース単位')#</cfoutput></a>
		 <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <a href="#CGI.SCRIPT_NAME#?mode=sg&#params2url(params)#"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_user13:ja=グループ単位')#</cfoutput></a>
		 <cfoutput>#Session.termObj.get_term('eLM_tool_delimiter')#</cfoutput> <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_index_ureportshow1:ja=成績表示')#</cfoutput>'>
	</cfcase>

	</cfswitch>

	<cfreturn strTopicPath>

</cffunction>

<!--- 教材種別の文字列を返す --->
<cffunction name="getScoTypeString" output="No" returntype="string">
	<cfargument name="arg_class_id" type="string" required="yes">
	<cfargument name="arg_sco_kind" type="string" required="yes">

	<cfif arg_sco_kind eq 2>
		<cfset str_sco_type = #Session.termObj.get_term('eLM_admin_course_report3_index_sco_type_1:ja=アンケート教材')#>
	<cfelseif arg_sco_kind eq 3>
		<cfset str_sco_type = #Session.termObj.get_term('eLM_admin_course_report3_index_sco_type_2:ja=宿題教材')#>
	<cfelse>
		<cfif arg_class_id eq 2>
			<cfset str_sco_type = #Session.termObj.get_term('eLM_admin_course_report3_index_sco_type_3:ja=テスト教材')#>
		<cfelse>
			<cfset str_sco_type = #Session.termObj.get_term('eLM_admin_course_report3_index_sco_type_4:ja=学習教材')#>
		</cfif>
	</cfif>

	<cfreturn str_sco_type>

</cffunction>

<!--- SCOの階層表示用タグ作成 --->
<cffunction name="make_tableCont" output="yes">
	<cfargument name="courseConst" type="query" required="yes">

	<cfset var Arr_tableCont = ArrayNew(1)>
	<cfset var str_tableCont = ''>
	<cfset var arr_h = Arraynew(1)>

	<cfloop query="courseConst">

		<!---  数値型の値をチェックする --->
		<cfset isNumericOrError( courseConst.sco_id )>

		<cfquery name="qGetCount" dbtype="query">
			select count(*) as cnt from courseConst where parent_sco_id = #courseConst.sco_id#
		</cfquery>

		<cfset str_tableCont = ''>
		<cfset loc_h_no = courseConst.h_no>
		<cfif courseConst.h_no is "">
			<cfset loc_h_no = 1>
		</cfif>

		<!--- nodeの番号作成 --->
		<cfparam name="arr_h[loc_h_no]" default="0">
		<cfset arr_h[loc_h_no] = arr_h[loc_h_no] + 1>

		<!--- アイコン変更 --->
		<cfif courseConst.sco_kind is 2>		<!--- アンケート --->
			<!---<cfset img_name = 'icon_qts'>--->
			<cfset next_mode = 'qts_edit'>
		<cfelseif courseConst.sco_kind is 3>	<!--- 宿題 --->
			<!---<cfset img_name = 'icon_file_hw'>--->
			<cfset next_mode = 'hw_edit'>
		<cfelse>								<!--- SCO sco_kindが1のものと空欄のものはこれ。 --->
			<!---<cfset img_name = 'icon_file'>--->
			<cfset next_mode = 'file_edit'>
		</cfif>
		<cfset img_name = 'SCO_STATUS'>

		<cfswitch expression="#courseConst.sco_type#">

			<!--- ファイル --->
			<cfcase value="1">
				<cfset str_tableCont = '<img src="../../images/spacer.gif" width="' & (loc_h_no - 1) * 15 & '" height="8"><img src="../../images/' & img_name & '.gif" width="20" height="20" border="0" align="absmiddle">'>
			</cfcase>

			<!--- フォルダ --->
			<cfcase value="2">
				<cfset str_tableCont = IIF((loc_h_no is 1) , DE('') , DE('<img src="../../images/spacer.gif" width="' & (loc_h_no - 1) * 15 & '" height="8">')) & '<img src="../../images/icon_folder.gif" width="18" height="18" align="absmiddle">'>
			</cfcase>

		</cfswitch>

		<cfset temp = ArrayAppend(Arr_tableCont , str_tableCont)>

	</cfloop>

	<cfreturn Arr_tableCont>

</cffunction>

<!--- 成績ステータスから、画像イメージ名に変換 --->
<cffunction name="status2img" output="No">
	<cfargument name="status" required="Yes">

	<cfset var img_name = ''>

	<cfif status is 'not attempted' or status is 'browsed'>
		<cfset img_name = 'not_attempted'>
	<cfelseif status is 'incomplete'>
		<cfset img_name = 'incomplete'>
	<cfelseif status is 'completed'>
		<cfset img_name = 'completed'>
	<cfelseif status is 'failed'>
		<cfset img_name = 'failed'>
	<cfelseif status is 'passed'>
		<cfset img_name = 'passed'>
	</cfif>

	<cfreturn img_name>

</cffunction>

<!--- 成績ステータスを表示用文字列に変換 --->
<cffunction name="status2str" output="No">
	<cfargument name="arg_status" required="Yes">

	<cfset var str_status = ''>

	<cfswitch expression="#arg_status#">
		<cfcase value="not attempted">
			<cfset str_status = #Session.termObj.get_term('eLM_admin_course_report3_index_sco_status_1:ja=未履修')#>
		</cfcase>
		<cfcase value="incomplete">
			<cfset str_status = #Session.termObj.get_term('eLM_admin_course_report3_index_sco_status_2:ja=履修中')#>
		</cfcase>
		<cfcase value="completed">
			<cfset str_status = #Session.termObj.get_term('eLM_admin_course_report3_index_sco_status_3:ja=修了')#>
		</cfcase>
		<cfcase value="failed">
			<cfset str_status = #Session.termObj.get_term('eLM_admin_course_report3_index_sco_status_4:ja=不合格')#>
		</cfcase>
		<cfcase value="passed">
			<cfset str_status = #Session.termObj.get_term('eLM_admin_course_report3_index_sco_status_5:ja=合格')#>
		</cfcase>
		<cfdefaultcase>
			<cfset str_status = #Session.termObj.get_term('eLM_admin_course_report3_index_sco_status_6:ja=未履修')#>
		</cfdefaultcase>
	</cfswitch>

	<cfreturn str_status>

</cffunction>

<cffunction name="get_group_option_list">
	<cfargument name="selected" required="Yes">
	<!--- グループリスト作成 --->
	<cfset var q_g1 = objGC.get_group_list_no_hier(now_login_user)>
	<cfset var q_g3 = objGC.get_group_list_hier(now_login_user)>
	<cfset var group_option_list = ''>
	<cfset var g_id = "">
	<cfset var g_name = "">
	<cfset var str_space = "">
	<cfset var loopIndex = 0>

	<cfloop query="q_g1">
		<cfset g_id = q_g1.group_id>
		<cfset g_name = q_g1.group_name>
		<cfset group_option_list = group_option_list & '<option value="' & g_id & '"' & iif((g_id is selected) , de("selected") , de("")) & '>' & g_name & '</option>' & chr(10)>
	</cfloop>
	<cfloop query="q_g3">
		<cfset str_space = "">
		<cfloop index="LoopIndex" from="1" to="#q_g3.depth#"><cfset str_space = "　#str_space#"></cfloop>
		<cfset g_id = q_g3.group_id>
		<cfset g_name = str_space & q_g3.group_name>
		<cfset group_option_list = group_option_list & '<option value="' & g_id & '"' & iif((g_id is selected) , de("selected") , de("")) & '>' & g_name & '</option>' & chr(10)>
	</cfloop>
	<cfreturn group_option_list>
</cffunction>

<cffunction name="output_count">
	<cfargument name="count">
	<cfargument name="count_all">
	<cfargument name="c_assign_sett">
	<cfargument name="q_admin_info">
	<cfargument name="group_id" default="-1">
	<cfset var ret_str = "">

	<cfif q_admin_info.user_type_id eq 1>
		<cfset ret_str=count_all>
	<cfelse>
		<cfif c_assign_sett eq 1 and group_id eq -1>
			<cfset ret_str=Session.termObj.get_term('eLM_admin_c_assign_count_group_all:ja=（部門内） %s / （全体） %s', count, count_all)>
		<cfelse>
			<cfset ret_str=count>
		</cfif>
	</cfif>
	<cfreturn ret_str>
</cffunction>

<cfscript>
function NewLineToBR(txt) {
	//改行コードをbrタグに変換
	return ReplaceList(txt, "#Chr(13)##Chr(10)#,#Chr(13)#,#Chr(10)#", "<br>#Chr(13)##Chr(10)#,<br>#Chr(13)##Chr(10)#,<br>#Chr(13)##Chr(10)#");
}
</cfscript>
