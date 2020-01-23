<cfcomponent extends="parent">
<cfprocessingdirective pageencoding="UTF-8">

	<!---////////////////////////////////////////
	関数名	get_sco_progress_query_by_user_id
	引数1	ユーザーID	user_id		array	必須
	引数2	コースID	course_id	array	必須
	引数3	タイプ		dir_type	numeric			0:ディレクトリの情報含まない　1:ディレクトリの情報含む	default:0
	引数4	成績タイプ	type		numeric			0:データベースの設定値を利用　1:最新　2:最高　3:初回受講時　4:初回修了時　-1:全タイプ取得
	戻り値	クエリオブジェクト
	説明	とあるユーザーのSCO成績をクエリオブジェクトの
			形式で返す
			コース名、SCO名、USER名、CONSTRUCTなどを結合
			とりあえず成績がほしい時はここを使うこと。
			成績タイプは、特にそのタイプの成績を取得したい場合に使用すること。
			成績タイプの引数が0、もしくは渡されてこなかった場合はDBの設定値を使用します。
	/////////////////////////////////////////--->

	<cffunction name="get_sco_progress_query_by_user_id" access="public" output="no" returntype="query">
		<cfargument name="user_id"     required="yes" type="array"  >
		<cfargument name="course_id"   required="yes" type="array"  >
		<cfargument name="dir_type"    default="0"    type="numeric">
		<cfargument name="output_type" default="0"    type="numeric">

		<cfset var __TempQueryString = ''>
		<cfset var __TempQueryString1 = ''>
		<cfset var __TempQueryString2 = ''>
		<cfset var TempSelectObj = ''>
		<cfset var qGetUserInfo = ''>
		<cfset var qGetAllCourseUser = ''>
		<cfset var strGetAllCourseUser = ''>
		<cfset var qGetNomarlUser = ''>
		<cfset var strGetNomarlUser = ''>
		<cfset var resultObjAllCourse = ''>
		<cfset var resultObjNormal = ''>
		<cfset var resultObj = ''>
		<cfset var type = ''>
		<cfset var sql = ''>

		<cfif output_type is 0>
			<!--- 表示タイプ取得 --->
			<cfinvoke component="table_lms_setting"
			          method="get_value"
			          param_name="indication_type"
			          returnVariable="type"
			>
		<cfelse>
			<cfset type = output_type>
		</cfif>

		<!--- ユーザー情報取得 --->
		<cfset TempSelectObj = dao_select("USER_MASTER")>
		<cfset TempSelectObj = dao_in(TempSelectObj, "user_id" , "#ArrayToList(user_id)#")>
		<cfset qGetUserInfo = dao_result("#application.DSN#", TempSelectObj)>

		<!---////////////////////////////////////////////////
		全コース割り当てかどうかで二つのグループに分ける
		/////////////////////////////////////////////////--->

		<!--- 全コース割り当て --->
		<cfquery name="qGetAllCourseUser" dbtype="query">
		select user_id from qGetUserInfo where flag_all_course = 1
		</cfquery>

		<cfif qGetAllCourseUser.recordcount is not 0>
			<cfset strGetAllCourseUser = ValueList(qGetAllCourseUser.user_id)>
		<cfelse>
			<cfset strGetAllCourseUser = "-9999">
		</cfif>

		<cfinvoke component="#Application.SqlStringComponent#" method="table_sco_progress_004" returnVariable="__TempQueryString1">
			<cfinvokeargument name="arg001" value="#strGetAllCourseUser#">
			<cfinvokeargument name="arg002" value="#ArrayToList(course_id)#">
			<cfinvokeargument name="arg003" value="#dir_type#">
			<cfinvokeargument name="arg004" value="#type#">
		</cfinvoke>

		<!--- 全コース割り当てでない --->
		<cfquery name="qGetNomarlUser" dbtype="query">
		select user_id from qGetUserInfo where flag_all_course = 0
		</cfquery>
		
		<cfif qGetNomarlUser.recordcount is not 0>
			<cfset strGetNomarlUser = ValueList(qGetNomarlUser.user_id)>
		<cfelse>
			<cfset strGetNomarlUser = "-9999">
		</cfif>

		<cfinvoke component="#Application.SqlStringComponent#" method="table_sco_progress_001" returnVariable="__TempQueryString2">
			<cfinvokeargument name="arg001" value="#strGetNomarlUser#">
			<cfinvokeargument name="arg002" value="#ArrayToList(course_id)#">
			<cfinvokeargument name="arg003" value="#dir_type#">
			<cfinvokeargument name="arg004" value="#type#">
		</cfinvoke>

		<cfset __TempQueryString = __TempQueryString1 & ' union all ' & __TempQueryString2>

		<cfquery name="resultObj" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			#PreserveSingleQuotes(__TempQueryString)#
		</cfquery>

		<cfreturn overwrite_status(resultObj)>

	</cffunction>


	<!---////////////////////////////////////////
	関数名	get_sco_progress_query_by_user_id_for_left_menu
	引数1	ユーザーID	user_id		numeric		必須
	引数2	コースID	course_id	numeric		必須
	引数3	タイプ		dir_type	numeric		0:ディレクトリの情報含まない　1:ディレクトリの情報含む	default:0
	引数4	成績タイプ	type		numeric		0:データベースの設定値を利用　1:最新　2:最高　3:初回受講時　4:初回修了時　-1:全タイプ取得
	戻り値	クエリオブジェクト
	説明	とあるユーザーのSCO成績をクエリオブジェクトの
			形式で返す
			make_course_list.cfcでのみ使用するため、
			sco_idとstatusのみ取得
	/////////////////////////////////////////--->

	<cffunction name="get_sco_progress_query_by_user_id_for_left_menu" access="public" output="no" returntype="query">
		<cfargument name="user_id"     required="yes" type="numeric"  >
		<cfargument name="course_id"   required="yes" type="numeric"  >
		<cfargument name="dir_type"    default="0"    type="numeric">
		<cfargument name="output_type" default="0"    type="numeric">

		<cfset var __TempQueryString = ''>
		<cfset var TempSelectObj = ''>
		<cfset var qGetUserInfo = ''>
		<cfset var qGetAllCourseUser = ''>
		<cfset var qGetNomarlUser = ''>
		<cfset var resultObjAllCourse = ''>
		<cfset var resultObjNormal = ''>
		<cfset var resultObj = ''>
		<cfset var type = ''>

		<cfif output_type is 0>
			<!--- 表示タイプ取得 --->
			<cfinvoke component="table_lms_setting"
			          method="get_value"
			          param_name="indication_type"
			          returnVariable="type"
			>
		<cfelse>
			<cfset type = output_type>
		</cfif>

		<!--- ユーザー情報取得 --->
		<cfquery name="qGetUserInfo" datasource="#application.DSN#">
		select flag_all_course from USER_MASTER where user_id = #arguments.user_id#
		</cfquery>

		<!---////////////////////////////////////////////////
		全コース割り当てかどうかで切り替え
		/////////////////////////////////////////////////--->

		<cfif qGetUserInfo.flag_all_course is 1>

			<cfinvoke component="#Application.SqlStringComponent#" method="table_sco_progress_008" returnVariable="__TempQueryString">
				<cfinvokeargument name="arg001" value="#arguments.user_id#">
				<cfinvokeargument name="arg002" value="#arguments.course_id#">
				<cfinvokeargument name="arg003" value="#dir_type#">
				<cfinvokeargument name="arg004" value="#type#">
			</cfinvoke>
			<cfquery name="resultObj" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				#PreserveSingleQuotes(__TempQueryString)#
			</cfquery>

		<cfelse>

			<cfinvoke component="#Application.SqlStringComponent#" method="table_sco_progress_007" returnVariable="__TempQueryString">
				<cfinvokeargument name="arg001" value="#arguments.user_id#">
				<cfinvokeargument name="arg002" value="#arguments.course_id#">
				<cfinvokeargument name="arg003" value="#dir_type#">
				<cfinvokeargument name="arg004" value="#type#">
			</cfinvoke>
			<cfquery name="resultObj" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				#PreserveSingleQuotes(__TempQueryString)#
			</cfquery>

		</cfif>

		<cfreturn overwrite_status(resultObj)>

	</cffunction>

	<!---////////////////////////////////////////
	関数名	get_sco_progress_query_by_user_id_for_hw
	引数1	ユーザーID	user_id		any		必須
	引数2	コースID	sco_id		any		必須
	引数3	管理者ID	admin_id	numeric	必須
	引数4	タイプ		dir_type	numeric			0:ディレクトリの情報含まない　1:ディレクトリの情報含む	default:0
	引数5	成績タイプ	type		numeric			0:データベースの設定値を利用　1:最新　2:最高　3:初回受講時　4:初回修了時　-1:全タイプ取得
	戻り値	クエリオブジェクト
	説明	とあるユーザーのSCO成績をクエリオブジェクトの
			形式で返す
			宿題提出用にsco_kindが3のデータを返します。
	/////////////////////////////////////////--->

	<cffunction name="get_sco_progress_query_by_user_id_for_hw" access="public" output="yes" returntype="query">
		<cfargument name="user_id"     required="yes" type="any"    >
		<cfargument name="sco_id"      required="yes" type="any"    >
		<cfargument name="admin_id"    required="yes" type="numeric">
		<cfargument name="dir_type"    default="0"    type="numeric">
		<cfargument name="output_type" default="0"    type="numeric">

		<cfset var __TempQueryString = ''>
		<cfset var __TempQueryString1 = ''>
		<cfset var __TempQueryString2 = ''>
		<cfset var TempSelectObj = ''>
		<cfset var qGetUserInfo = ''>
		<cfset var qGetAllCourseUser = ''>
		<cfset var qGetNomarlUser = ''>
		<cfset var resultObjAllCourse = ''>
		<cfset var resultObjNormal = ''>
		<cfset var resultObj = ''>
		<cfset var type = ''>
		<cfset var qGetAdminInfo = ''>
		<cfset var user_list = ''>
		<cfset var sco_list = ''>

		<!--- 表示タイプ取得 --->
		<cfif output_type is 0>
			<cfinvoke component="table_lms_setting"
			          method="get_value"
			          param_name="indication_type"
			          returnVariable="type"
			>
		<cfelse>
			<cfset type = output_type>
		</cfif>

		<!--- ログイン管理者情報取得 --->
		<cfset TempSelectObj = dao_select("USER_MASTER")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "user_id", "#admin_id#")>
		<cfset q_admin_info = dao_result("#application.DSN#", TempSelectObj)>

		<!--- 全グループ権限外の部門管理者が管理しているユーザ情報取得 --->
		<cfif q_admin_info.user_type_id eq 2 and q_admin_info.flag_all_admin_group eq 0>
			<cfif user_id is "all">
				<!--- 全ユーザを選択された場合 --->
				<cfquery name="qGetUserList" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					select um.logon from USER_MASTER um 
						where exists 
							(select be.user_id from belong be, admin_group ag 
								where 
									be.group_id = ag.group_id AND 
									ag.user_id = #admin_id# AND 
									um.user_id = be.user_id ) 
				</cfquery>
			<cfelse>
				<!--- 個別ユーザを選択された場合 --->
				<cfquery name="qGetUserList" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					select um.logon from USER_MASTER um 
						where exists 
							(select be.user_id from belong be, admin_group ag 
								where 
									be.group_id = ag.group_id AND 
									ag.user_id = #admin_id# AND 
									um.user_id = be.user_id ) AND
							um.logon in (#addSingleQuotesToList(user_id)#)
				</cfquery>
			</cfif>
			<cfset user_id = Valuelist(qGetUserList.logon)>
		</cfif>

		<!--- ログイン管理者の管理しているコース情報取得 --->
		<cfquery name="qGetUserCourse" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			SELECT ac.course_id as cid, um.user_type_id
			FROM USER_MASTER um
			INNER JOIN admin_course ac ON ac.user_id = um.user_id
			WHERE um.user_id = #admin_id# and um.user_type_id = 2 and um.flag_all_admin_course = 0
		</cfquery>
		<cfif qGetUserCourse.recordcount gt 0 >
			<cfset course_id_list = QuotedValueList(qGetUserCourse.cid) >
		<cfelseif q_admin_info.user_type_id eq 2 and q_admin_info.flag_all_admin_course eq 0>
			<cfset course_id_list=-1>
		<cfelse>
			<cfset course_id_list = '-9999' >
		</cfif>

		<!--- SCO取得 --->
		<cfif IsArray(sco_id)>
			<cfset sco_list = ArrayToList(sco_id)>
		<cfelse>
			<cfset sco_list = '-9999'>
		</cfif>
		
		<cfinvoke component="#Application.SqlStringComponent#" method="table_sco_progress_010" returnVariable="__TempQueryString">
			<cfinvokeargument name="arg001" value="#user_id#">
			<cfinvokeargument name="arg002" value="#sco_list#">
			<cfinvokeargument name="arg003" value="#dir_type#">
			<cfinvokeargument name="arg004" value="#type#">
			<cfinvokeargument name="course_id_list" value="#course_id_list#">
		</cfinvoke>

		<cfquery name="resultObj" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			#PreserveSingleQuotes(__TempQueryString)#
		</cfquery>

		<cfreturn overwrite_status(resultObj, "last_name_furi, first_name_furi, logon, course_id")>

	</cffunction>

	<!---////////////////////////////////////////
	関数名	overwrite_status
	引数1	クエリオブジェクト	resultObj	query	必須
	引数2	Orderby 項目	string	非必須
	戻り値	クエリオブジェクト
	説明	渡されたクエリから、フラッグによるstatusの判定を行い、
			flag_get_status、flag_get_scoreが0でかつstatusがcompletedの
			テスト教材の成績をincompleteに変更する。
	/////////////////////////////////////////--->
	<cffunction name="overwrite_status" access="private" output="no" returntype="query">
		<cfargument name="resultObj" type="query"  required="yes">
		<cfargument name="orderby" type="string"  required="no" default="user_id , course_id , order_no">

		<cfset var ret_obj = ''>

		<!--- 学習教材(class_id:1)の場合は変更なし --->
		<cfset sql = "select " & arguments.resultObj.ColumnList & "
		from   arguments.resultObj
		where  class_id = 1
		union"
		>

		<!---///////////////////////////////////////////////////////
		テスト教材(class_id:2)のとき、flag_get_statusが0、
		かつflag_get_scoreが0、かつstatusがcompleteでない
		教材は変更なし。
		///////////////////////////////////////////////////////--->
		<cfset sql = sql & "
		select " & arguments.resultObj.ColumnList & "
		from   arguments.resultObj
		where  class_id = 2 and
		       not (flag_get_status = 0 and status = 'completed' and flag_get_score = 0)
		union"
		>

		<!---///////////////////////////////////////////////////////
		テスト教材(class_id:2)のとき、flag_get_statusが0、
		かつflag_get_scoreが0、かつstatusがcompleteである
		教材は成績をincompleteに変更。
		///////////////////////////////////////////////////////--->
		<cfset sql = sql & "
		select " & replaceNoCase(arguments.resultObj.ColumnList , ",status," , ",'incomplete' as status," , 'all') & "
		from   arguments.resultObj
		where  class_id = 2 and
		       flag_get_status = 0 and status = 'completed' and flag_get_score = 0 
				order by
		">

		<cfset sql = sql & orderby >

		<cfquery name="ret_obj" dbtype="query">
		#PreserveSingleQuotes(sql)#
		</cfquery>

		<cfreturn ret_obj>

	</cffunction>



	<!---////////////////////////////////////////
	関数名	get_status_for_return
	引数1	ユーザーID	user_id		numeric		必須
	引数2	コースID	course_id	numeric		必須
	引数3	SCO_ID		sco_id		numeric		必須
	戻り値	string
	説明	指定されたSCOの成績を取得する。
			
	/////////////////////////////////////////--->
	<cffunction name="get_status_for_return" access="public" output="no" returntype="string">
		<cfargument name="user_id"        type="numeric"  required="yes">
		<cfargument name="course_id" type="numeric"  required="yes">
		<cfargument name="sco_id"  type="numeric"  required="yes">

		<cfset var ret_val = ''>
		<cfset var ret_obj = ''>
		<cfset var type = ''>

		<!--- 表示タイプ取得 --->
		<cfinvoke component="table_lms_setting"
		          method="get_value"
		          param_name="indication_type"
		          returnVariable="type"
		>

		<cfset type_safe = dao_escape(type)>
		<cfquery name="ret_obj" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			select s.status , s.flag_get_status , s.flag_get_score , m.class_id
			from SCO_PROGRESS as s inner join SCO_PROGRESS_RECORD as r on s.lecture_count = r.lecture_count
			     inner join SCO_MASTER as m on s.sco_id = m.sco_id
			where s.user_id   = #arguments.user_id# and s.user_id   = r.user_id
			and   s.course_id = #arguments.course_id# and s.course_id = r.course_id
			and   s.sco_id    = #arguments.sco_id# and s.sco_id    = r.sco_id
			and   r.type      = '#PreserveSingleQuotes(type_safe)#'
		</cfquery>

		<cfset ret_val = ret_obj.status>

		<cfif ret_obj.class_id is 2 and ret_obj.flag_get_status is 0 and ret_obj.flag_get_score is 0 and ret_obj.status is 'completed'>
			<cfset ret_val = 'incomplete'>
		</cfif>

		<cfreturn ret_val>

	</cffunction>


	<!---////////////////////////////////////////
	関数名	get_sco_info_query_by_user_id
	引数1	ユーザーID	user_id		numeric	必須
	引数2	SCOID		sco_id		numeric	必須
	戻り値	構造体
	説明	指定されたSCOひとつの情報を返します。
			SCO_MASTERの情報と学習開始日時、コース情報など。
	/////////////////////////////////////////--->

	<cffunction name="get_sco_info_query_by_user_id" access="public" output="no" returntype="struct">
		<cfargument name="user_id" required="yes" type="numeric">
		<cfargument name="sco_id"  required="yes" type="numeric">

		<cfset var TempSelectObj = ''>
		<cfset var qGetScoMASTER = ''>
		<cfset var qGetScoProgress = ''>
		<cfset var qGetScoProgressRecord = ''>
		<cfset var qGetUser = ''>
		<cfset var resultObj = StructNew()>
		<cfset var type = ''>

		<!--- 表示タイプ取得 --->
		<cfinvoke component="table_lms_setting"
		          method="get_value"
		          param_name="indication_type"
		          returnVariable="type"
		>

		<!--- ユーザー情報情報取得 --->
		<cfset TempSelectObj = dao_select("USER_MASTER")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "user_id" , "#arguments.user_id#")>
		<cfset qGetUser = dao_result("#application.DSN#", TempSelectObj)>

		<cfset resultObj.logon = qGetUser.logon>
		<cfset resultObj.first_name = qGetUser.first_name>
		<cfset resultObj.last_name = qGetUser.last_name>

		<!--- CONSTRUCT情報取得 --->
		<cfset TempSelectObj = dao_select("CONSTRUCT")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "sco_id" , "#arguments.sco_id#")>
		<cfset qGetConstruct = dao_result("#application.DSN#", TempSelectObj)>

		<!--- コース情報取得 --->
		<cfset TempSelectObj = dao_select("COURSE_MASTER")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "course_id" , "#qGetConstruct.course_id#")>
		<cfset qGetCourseMaster = dao_result("#application.DSN#", TempSelectObj)>

		<cfset resultObj.course_name = qGetCourseMaster.course_name>

		<!--- SCO情報取得 --->
		<cfset TempSelectObj = dao_select("SCO_MASTER")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "sco_id" , "#arguments.sco_id#")>
		<cfset qGetScoMASTER = dao_result("#application.DSN#", TempSelectObj)>

		<cfset resultObj.flag_trial = qGetScoMASTER.flag_trial>
		<cfset resultObj.sco_name = qGetScoMASTER.sco_name>
		<cfset resultObj.class_id = qGetScoMASTER.class_id>
		<cfset resultObj.flg_score = qGetScoMASTER.flg_score>
		<cfset resultObj.flg_answer = qGetScoMASTER.flg_answer>
		<cfset resultObj.sco_guide = qGetScoMASTER.sco_guide>
		<cfset resultObj.lecture_time_hour = qGetScoMASTER.lecture_time_hour>
		<cfset resultObj.lecture_time_min = qGetScoMASTER.lecture_time_min>
		<cfset resultObj.review_count = qGetScoMASTER.review_count>
		<cfset resultObj.sco_kind = qGetScoMASTER.sco_kind>

		<!--- 成績取得 --->
		<cfset TempSelectObj = dao_select("SCO_PROGRESS")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "user_id" , "#arguments.user_id#")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "sco_id" , "#arguments.sco_id#")>
		<cfset TempSelectObj = dao_ne(TempSelectObj, "lecture_count" , "-1")>
		<cfset qGetScoProgress = dao_result("#application.DSN#", TempSelectObj)>

		<!--- 初回学習時のデータ取得 --->
		<cfquery name="qGetStartData" dbtype="query" maxrows="1">
		select * from qGetScoProgress order by lecture_count
		</cfquery>

		<cfset resultObj.start_date = qGetStartData.start_date>

		<!--- 累計時間 --->
		<cfquery name="qGetTotal" dbtype="query">
		select max(eLM_total_time) as mt from qGetScoProgress
		</cfquery>

		<cfif qGetTotal.recordcount is 0>
			<cfset resultObj.total_time = 0>
		<cfelse>
			<cfset resultObj.total_time = qGetTotal.mt>
		</cfif>

		<!--- 成績レコード取得 --->
		<cfset TempSelectObj = dao_select("SCO_PROGRESS_RECORD")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "user_id" , "#arguments.user_id#")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "sco_id" , "#arguments.sco_id#")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "type" , "#type#")>
		<cfset qGetScoProgressRecord = dao_result("#application.DSN#", TempSelectObj)>

		<!--- 学習回数 --->
		<cfquery name="qGetLectureCount" dbtype="query">
		select max(lecture_count) as m_lc from qGetScoProgress
		</cfquery>

		<cfif qGetLectureCount.m_lc is not "">
			<cfset resultObj.lecture_count = qGetLectureCount.m_lc>
		<cfelse>
			<cfset resultObj.lecture_count = 0>
		</cfif>

		<!--- 学習終了日取得 --->
		<cfif qGetScoProgressRecord.recordcount is not 0>
			<cfquery name="qGetEndDate" dbtype="query">
				select * from qGetScoProgress where lecture_count = #qGetScoProgressRecord.lecture_count#
			</cfquery>

			<cfset resultObj.end_date = qGetEndDate.end_date>

		<cfelse>
			<cfset resultObj.end_date = ''>
		</cfif>

		<cfreturn resultObj>

	</cffunction>

	<!---////////////////////////////////////////
	関数名	get_sco_progress_same_parent_query_by_user_id
	引数1	ユーザーID			user_id			numeric	必須
	引数1	ペアレントSCOID		parent_sco_id	numeric	必須
	引数2	コースID			course_id		numeric	必須
	戻り値	クエリオブジェクト
	説明	とあるユーザーのSCO成績をクエリオブジェクトの
			形式で返す
			CONSTRUCTの情報も結合して返します。
	/////////////////////////////////////////--->

	<cffunction name="get_sco_progress_same_parent_query_by_user_id" access="public" output="no" returntype="query">
		<cfargument name="user_id" required="yes" type="numeric">
		<cfargument name="parent_sco_id" required="yes" type="numeric">
		<cfargument name="course_id" required="yes" type="numeric">

		<cfset var __TempQueryString = ''>
		<cfset var TempSelectObj = ''>
		<cfset var qGetUserInfo = ''>
		<cfset var resultObj = ''>
		<cfset var type = ''>

		<!--- 表示タイプ取得 --->
		<cfinvoke component="table_lms_setting"
		          method="get_value"
		          param_name="indication_type"
		          returnVariable="type"
		>

		<!--- ユーザー情報取得 --->
		<cfset TempSelectObj = dao_select("USER_MASTER")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "user_id" , "#user_id#")>
		<cfset qGetUserInfo = dao_result("#application.DSN#", TempSelectObj)>

		<cfif qGetUserInfo.flag_all_course is 0>		<!--- 全コース割り当てでない --->

			<cfinvoke component="#Application.SqlStringComponent#" method="table_sco_progress_003" returnVariable="__TempQueryString">
				<cfinvokeargument name="arg001" value="#user_id#">
				<cfinvokeargument name="arg002" value="#parent_sco_id#">
				<cfinvokeargument name="arg003" value="#course_id#">
				<cfinvokeargument name="arg004" value="#type#">
			</cfinvoke>
			<cfquery name="resultObj" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				#PreserveSingleQuotes(__TempQueryString)#
			</cfquery>

		<cfelse>											<!--- 全コース割り当て --->

			<cfinvoke component="#Application.SqlStringComponent#" method="table_sco_progress_005" returnVariable="__TempQueryString">
				<cfinvokeargument name="arg001" value="#user_id#">
				<cfinvokeargument name="arg002" value="#parent_sco_id#">
				<cfinvokeargument name="arg003" value="#course_id#">
				<cfinvokeargument name="arg004" value="#type#">
			</cfinvoke>
			<cfquery name="resultObj" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				#PreserveSingleQuotes(__TempQueryString)#
			</cfquery>

		</cfif>

		<cfreturn resultObj>

	</cffunction>

	<!---////////////////////////////////////////
	関数名	set_sco_progress
	引数1	ユーザーID	user_id		numeric	必須
	引数2	コースID	course_id	numeric	必須
	引数3	SCOID		sco_id		numeric	必須
	戻り値	boolean
	説明	指定されたSCOのSCO_PROGRESSを作成する
			データを作成する際にはlecture_countを常に-1とする。
			その時履歴がすでに存在する場合、履歴のうち最新のレコードをコピーし
			新しいレコードを作製し、lecture_countを-1にする。
			もし-1のレコードがすでに存在する場合は、そのレコードの
			lecture_countを指定されたSCOのlecture_countの最大値+1した値に書き換え、
			それと同じデータをもう一件、lecture_countを-1で作成する。
	/////////////////////////////////////////--->
	<cffunction name="set_sco_progress" access="public" output="no" returntype="any">
		<cfargument name="user_id"   required="yes" type="numeric">
		<cfargument name="course_id" required="yes" type="numeric">
		<cfargument name="sco_id"    required="yes" type="numeric">

		<cfset var row = structNew()>
		<cfset var __TempQueryString = ''>
		<cfset var qGetScoProgress = ''>
		<cfset var q_max_lecture_count = ''>
		<cfset var chk_remain = ''>
		<cfset var TempSelectObj = ''>
		<cfset var copy_date = ''>
		<cfset var tempLectureCount = 0>
		<cfset var ret_val = -1>

		<cfset row.user_id = user_id>
		<cfset row.course_id = course_id>
		<cfset row.sco_id = sco_id>

		<cftry>

		<cftransaction action="begin">

		<cfset TempSelectObj = dao_select("SCO_PROGRESS")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "user_id"   , "#user_id#")  >
		<cfset TempSelectObj = dao_eq(TempSelectObj, "course_id" , "#course_id#")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "sco_id"    , "#sco_id#")   >
		<cfset qGetScoProgress = dao_result("#application.DSN#", TempSelectObj)>

		<!--- SCO_PROGRESSにデータがあるかどうか確認 --->
		<cfif qGetScoProgress.recordcount is 0>

			<!--- SCO_PROGRESSにデータがない --->
			<cfset row.status = 'not attempted'>
			<cfset row.lecture_count = -1>
			<cfset row.entry = 'ab-initio'>
			<cfset row.total_time = '0000:00:00'>
			<cfset row.session_time = '0000:00:00'>
			<cfset row.eLM_total_time = '0'>
			<cfset row.eLM_session_time = '0'>
			<cfset row.start_date = dateformat(now() , 'yyyy/mm/dd') & ' ' & timeformat(now() , 'HH:mm:ss')>
			<cfset row.change_date = dateformat(now() , 'yyyy/mm/dd') & ' ' & timeformat(now() , 'HH:mm:ss')>
			<cfif FindNoCase("remote_addr", qGetScoProgress.ColumnList) gt 0>
				<cfset row.remote_addr = REQUEST.remoteAddress>
			</cfif>
			<cfif FindNoCase("http_user_agent", qGetScoProgress.ColumnList) gt 0>
				<cfset row.http_user_agent = CGI.HTTP_USER_AGENT>
			</cfif>

			<cfset temp = dao_insert_ex(Application.dsn , 'SCO_PROGRESS' , row , 'user_id')>

		<cfelse>
			<!--- SCO_PROGRESSに「-1」が残っているかどうか確認。 --->
			<cfquery name="chk_remain" dbtype="query">
			select * from qGetScoProgress where lecture_count = -1
			</cfquery>

			<!--- SCO_PROGRESSのlecture_countの最大値を抽出 --->
			<cfquery name="q_max_lecture_count" dbtype="query">
			select max(lecture_count) as max_count from qGetScoProgress
			</cfquery>

			<cfif q_max_lecture_count.max_count is -1>
				<cfset tempLectureCount = 0>
			<cfelse>
				<cfset tempLectureCount = q_max_lecture_count.max_count>
			</cfif>

			<cfif chk_remain.recordcount is not 0>
				<!--- -1のデータが残っていたので、残っていたデータのlecture_countを現在のデータの最大値に1を足したものに変更する。 --->
				<cfinvoke component="#Application.SqlStringComponent#" method="table_sco_progress_002" returnVariable="__TempQueryString">
					<cfinvokeargument name="arg001" value="#user_id#">
					<cfinvokeargument name="arg002" value="#course_id#">
					<cfinvokeargument name="arg003" value="#sco_id#">
					<cfinvokeargument name="arg004" value="#tempLectureCount#+1">
					<cfinvokeargument name="arg005" value="#dateformat(now() , 'yyyy/mm/dd')# #timeformat(now() , 'HH:mm:ss')#">
				</cfinvoke>
				<cfquery name="resultObj" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					#PreserveSingleQuotes(__TempQueryString)#
				</cfquery>

				<!--- この時点では「-1」のデータが最新データとなるので、新しいデータとしてコピー --->
<!---
				<cfset row.status = chk_remain.status>
--->
				<cfset row.status = 'not attempted'>
				<cfset row.lecture_count = -1>
				<cfset row.entry = chk_remain.entry>
				<cfif chk_remain.location is not ""><cfset row.location = chk_remain.location></cfif>
				<cfif chk_remain.score is not ""><cfset row.score = 0></cfif>
<!---開始時刻、終了時刻は受講のたびに更新
				<cfif chk_remain.start_date is not ""><cfset row.start_date = chk_remain.start_date></cfif>
				<cfif chk_remain.end_date is not ""><cfset row.end_date = chk_remain.end_date></cfif>
--->
				<cfset row.start_date = dateformat(now() , 'yyyy/mm/dd') & ' ' & timeformat(now() , 'HH:mm:ss')>
				<cfset row.total_time = chk_remain.total_time>
				<cfset row.session_time = chk_remain.session_time>
				<cfif chk_remain.suspend is not ""><cfset row.suspend = chk_remain.suspend></cfif>
				<cfset row.change_date = dateformat(now() , 'yyyy/mm/dd') & ' ' & timeformat(now() , 'HH:mm:ss')>
				<cfif chk_remain.score_date is not ""><cfset row.score_date = chk_remain.score_date></cfif>
				<cfif chk_remain.objectives_json is not ""><cfset row.objectives_json = chk_remain.objectives_json></cfif>
				<cfif chk_remain.comments_from_learner is not ""><cfset row.comments_from_learner = chk_remain.comments_from_learner></cfif>
				<cfif chk_remain.tmp_status is not ""><cfset row.tmp_status = chk_remain.tmp_status></cfif>
				<cfset row.eLM_session_time = '0'>
				<cfset row.eLM_total_time = 0>

				<!--- add 20080302 tanaka --->
				<cfif FindNoCase("remote_addr", chk_remain.ColumnList) gt 0>
					<cfset row.remote_addr = REQUEST.remoteAddress>
				</cfif>
				<cfif FindNoCase("http_user_agent", chk_remain.ColumnList) gt 0>
					<cfset row.http_user_agent = CGI.HTTP_USER_AGENT>
				</cfif>

				<cfset temp = dao_insert_ex(Application.dsn , 'SCO_PROGRESS' , row , 'user_id')>

				<cfset ret_val = tempLectureCount + 2>

			<cfelse>
				<!--- -1のデータがないのでlecture_countが最大のデータを探す。 --->
				<cfquery name="copy_date" dbtype="query">
					select * from qGetScoProgress where lecture_count = #q_max_lecture_count.max_count#
				</cfquery>

<!---
				<cfset row.status = copy_date.status>
--->
				<cfset row.status = 'not attempted'>
				<cfset row.lecture_count = -1>
				<cfset row.entry = copy_date.entry>
				<cfif copy_date.location is not ""><cfset row.location = copy_date.location></cfif>
				<cfif copy_date.score is not ""><cfset row.score = 0></cfif>
<!---開始時刻、終了時刻は受講のたびに更新
				<cfif copy_date.start_date is not ""><cfset row.start_date = copy_date.start_date></cfif>
				<cfif copy_date.end_date is not ""><cfset row.end_date = copy_date.end_date></cfif>
--->
				<cfset row.start_date = dateformat(now() , 'yyyy/mm/dd') & ' ' & timeformat(now() , 'HH:mm:ss')>
				<cfset row.total_time = copy_date.total_time>
				<cfset row.session_time = copy_date.session_time>
				<cfif copy_date.suspend is not ""><cfset row.suspend = copy_date.suspend></cfif>
				<cfset row.change_date = dateformat(now() , 'yyyy/mm/dd') & ' ' & timeformat(now() , 'HH:mm:ss')>
				<cfif copy_date.score_date is not ""><cfset row.score_date = copy_date.score_date></cfif>
				<cfif copy_date.objectives_json is not ""><cfset row.objectives_json = copy_date.objectives_json></cfif>
				<cfif copy_date.comments_from_learner is not ""><cfset row.comments_from_learner = copy_date.comments_from_learner></cfif>
				<cfif copy_date.tmp_status is not ""><cfset row.tmp_status = copy_date.tmp_status></cfif>
				<cfset row.eLM_session_time = '0'>
				<cfset row.eLM_total_time = 0>

				<!--- add 20080302 tanaka --->
				<cfif FindNoCase("remote_addr", copy_date.ColumnList) gt 0>
					<cfset row.remote_addr = REQUEST.remoteAddress>
				</cfif>
				<cfif FindNoCase("http_user_agent", copy_date.ColumnList) gt 0>
					<cfset row.http_user_agent = CGI.HTTP_USER_AGENT>
				</cfif>

				<cfset temp = dao_insert_ex(Application.dsn , 'SCO_PROGRESS' , row , 'user_id')>

				<cfset ret_val = copy_date.lecture_count + 1>

			</cfif>

		</cfif>

		<cftransaction action="commit" />
		<cfreturn ret_val>

		<cfcatch type="any">
			<cftransaction action="rollback" />
			<cfreturn false>
		</cfcatch>

		</cftry>

	</cffunction>

	<!---////////////////////////////////////////
	関数名	set_sco_progress_aist
	引数1	ユーザーID	user_id		numeric	必須
	引数2	コースID	course_id	numeric	必須
	引数3	SCOID		sco_id		numeric	必須
	戻り値	boolean
	説明	指定されたSCOのSCO_PROGRESSを作成する
			データを作成する際にはlecture_countを常に-1とする。
			その時履歴がすでに存在する場合、履歴のうち最新のレコードをコピーし
			新しいレコードを作製し、lecture_countを-1にする。
			もし-1のレコードがすでに存在する場合は、そのレコードの
			lecture_countを指定されたSCOのlecture_countの最大値+1した値に書き換え、
			それと同じデータをもう一件、lecture_countを-1で作成する。
	/////////////////////////////////////////--->
	<cffunction name="set_sco_progress_aist" access="public" output="no" returntype="any">
		<cfargument name="user_id"   required="yes" type="numeric">
		<cfargument name="course_id" required="yes" type="numeric">
		<cfargument name="sco_id"    required="yes" type="numeric">
		<cfargument name="fdate" 	 required="yes" type="string">

		<cfset var row = structNew()>
		<cfset var __TempQueryString = ''>
		<cfset var qGetScoProgress = ''>
		<cfset var q_max_lecture_count = ''>
		<cfset var chk_remain = ''>
		<cfset var TempSelectObj = ''>
		<cfset var copy_date = ''>
		<cfset var tempLectureCount = 0>
		<cfset var ret_val = -1>

		<cfset row.user_id = user_id>
		<cfset row.course_id = course_id>
		<cfset row.sco_id = sco_id>

		<cftry>

		<cftransaction action="begin">

		<cfset TempSelectObj = dao_select("SCO_PROGRESS")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "user_id"   , "#user_id#")  >
		<cfset TempSelectObj = dao_eq(TempSelectObj, "course_id" , "#course_id#")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "sco_id"    , "#sco_id#")   >
		<cfset qGetScoProgress = dao_result("#application.DSN#", TempSelectObj)>

		<!--- SCO_PROGRESSにデータがあるかどうか確認 --->
		<cfif qGetScoProgress.recordcount is 0>

			<!--- SCO_PROGRESSにデータがない --->
			<cfset row.status = 'completed'>
			<cfset row.lecture_count = 1>
			<cfset row.entry = 'ab-initio'>
			<cfset row.score = 100>
			<cfset row.total_time = '0000:00:00'>
			<cfset row.session_time = '0000:00:00'>
			<cfset row.eLM_total_time = '0'>
			<cfset row.eLM_session_time = '0'>
			<cfset row.flag_get_score = 1>
			<cfset row.change_date = dateformat(fdate, 'yyyy/mm/dd') & ' 00:00:00'>
			<cfset row.start_date = dateformat(fdate, 'yyyy/mm/dd') & ' 00:00:00'>
			<cfset row.end_date = dateformat(fdate, 'yyyy/mm/dd') & ' 00:00:00'>
			<cfif FindNoCase("remote_addr", qGetScoProgress.ColumnList) gt 0>
				<cfset row.remote_addr = REQUEST.remoteAddress>
			</cfif>
			<cfif FindNoCase("http_user_agent", qGetScoProgress.ColumnList) gt 0>
				<cfset row.http_user_agent = CGI.HTTP_USER_AGENT>
			</cfif>

			<cfset temp = dao_insert_ex(Application.dsn , 'SCO_PROGRESS' , row , 'user_id')>

		<cfelse>
			<!--- SCO_PROGRESSのlecture_countの最大値を抽出 --->
			<cfquery name="q_max_lecture_count" dbtype="query">
				select max(lecture_count) as max_count from qGetScoProgress
			</cfquery>

			<cfif q_max_lecture_count.max_count is -1>
				<cfset tempLectureCount = 0>
			<cfelse>
				<cfset tempLectureCount = q_max_lecture_count.max_count>
			</cfif>

			<cfset row.status = 'completed'>
			<cfset row.lecture_count = tempLectureCount + 1>
			<cfset row.entry = 'ab-initio'>
			<cfset row.score = 100>
			<cfset row.total_time = '0000:00:00'>
			<cfset row.session_time = '0000:00:00'>
			<cfset row.eLM_total_time = '0'>
			<cfset row.eLM_session_time = '0'>
			<cfset row.flag_get_score = 1>
			<cfset row.change_date = dateformat(fdate, 'yyyy/mm/dd') & ' 00:00:00'>
			<cfset row.end_date = dateformat(fdate, 'yyyy/mm/dd') & ' 00:00:00'>
			<cfset row.start_date = dateformat(fdate, 'yyyy/mm/dd') & ' 00:00:00'>
			<cfif FindNoCase("remote_addr", qGetScoProgress.ColumnList) gt 0>
				<cfset row.remote_addr = REQUEST.remoteAddress>
			</cfif>
			<cfif FindNoCase("http_user_agent", qGetScoProgress.ColumnList) gt 0>
				<cfset row.http_user_agent = CGI.HTTP_USER_AGENT>
			</cfif>

			<cfset temp = dao_insert_ex(Application.dsn , 'SCO_PROGRESS' , row , 'user_id')>

		</cfif>

		<cftransaction action="commit" />
		<cfreturn ret_val>

		<cfcatch type="any">
			<cftransaction action="rollback" />
			<cfreturn false>
		</cfcatch>

		</cftry>

	</cffunction>

	<!---////////////////////////////////////////
	関数名	get_next_sco_id
	引数1	ユーザーID	user_id		numeric	必須
	引数2	コースID	course_id	numeric	必須
	戻り値	numeric
	説明	次に学習するSCOを取得します。
			SSPでのみ使用します。
			SCO_PROGRESSが一件もない場合はコースの最初の教材が選択されます。
			SCO_PROGRESSがある場合、その中の最新の一件が選択されます。
			(つまり、最後に開いていた教材が再度表示されます。)
	/////////////////////////////////////////--->
	<cffunction name="get_next_sco_id" access="public" output="no" returntype="numeric">
		<cfargument name="user_id"   required="yes" type="numeric">
		<cfargument name="course_id" required="yes" type="numeric">

		<cfset var TempSelectObj = ''>
		<cfset var qGetScoProgress = ''>
		<cfset var qGetConstruct = ''>
		<cfset var __TempQueryString = ''>
		<cfset var ret_val = 0>
		<cfset var first_sco_id = 0>

		<!--- コースの最初のSCOを検索 --->
		<cfinvoke component="#Application.SqlStringComponent#" method="table_sco_progress_006" returnVariable="__TempQueryString">
			<cfinvokeargument name="arg001" value="#arguments.course_id#">
		</cfinvoke>
		<cfquery name="resultObj" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#" maxrows="1">
			#PreserveSingleQuotes(__TempQueryString)#
		</cfquery>

		<cfset first_sco_id = resultObj.sco_id>

		<!--- SCO_PROGRESSにデータがあるかチェックし、もしデータがあったらそのSCOIDを返す --->
		<cfset TempSelectObj = dao_select("SCO_PROGRESS")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "user_id"   , "#user_id#")  >
		<cfset TempSelectObj = dao_eq(TempSelectObj, "course_id" , "#course_id#")>
		<cfset qGetScoProgress = dao_result("#application.DSN#", TempSelectObj)>

		<cfif qGetScoProgress.recordcount is not 0>
			<cfquery name="resultObj" dbtype="query">
			select sco_id from qGetScoProgress order by change_date desc
			</cfquery>

			<cfset ret_val = resultObj.sco_id>
		</cfif>

		<!--- 上のSCOIDをもつSCOがあるのかどうか、SCO_MASTERを検索 --->
		<cfset TempSelectObj = dao_select("SCO_MASTER")>
		<cfset TempSelectObj = dao_eq(TempSelectObj, "sco_id"   , "#ret_val#")  >
		<cfset qGetScoMaster = dao_result("#application.DSN#", TempSelectObj)>

		<cfif qGetScoMaster.recordcount is 0>
			<cfset ret_val = -1>
		</cfif>

		<cfreturn ret_val>

	</cffunction>

	<!---////////////////////////////////////////
	関数名	get_max_lecture_count
	引数1	ユーザーID	user_id		numeric	必須
	引数2	SCOID		sco_id		numeric	必須
	戻り値	numeric
	説明	指定されたユーザの、指定されたSCOの
			lecture_countの最大値を返します
			成績が一件もない場合は1を返します
	/////////////////////////////////////////--->
	<cffunction name="get_max_lecture_count" access="public" output="no" returntype="numeric">
		<cfargument name="user_id" required="yes" type="numeric">
		<cfargument name="sco_id"  required="yes" type="numeric">

		<cfset var __TempQueryString = ''>
		<cfset var resultObj = ''>
		<cfset var ret_val = 0>

		<cfinvoke component="#Application.SqlStringComponent#" method="table_sco_progress_009" returnVariable="__TempQueryString">
			<cfinvokeargument name="arg001" value="#arguments.user_id#">
			<cfinvokeargument name="arg002" value="#arguments.sco_id#">
		</cfinvoke>
		<cfquery name="resultObj" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#" maxrows="1">
			#PreserveSingleQuotes(__TempQueryString)#
		</cfquery>

		<cfif resultObj.m_lc is -1>
			<cfset ret_val = 0>
		<cfelse>
			<cfset ret_val = resultObj.m_lc>
		</cfif>

		<cfreturn ret_val>

	</cffunction>

    <cffunction name="delete_column_lecture_count_minus_one">
      <cfargument name = "user_id" />
      <cfargument name = "course_id" />
      <cfargument name = "sco_id" />
      <cfset var q = "" />
      <cfset var user_id_safe = dao_escape(user_id) />
      <cfset var course_id_safe = dao_escape(course_id) />
      <cfset var sco_id_safe = dao_escape(sco_id) />

      <cfquery name="q" username="#Application.DUN#" password="#Application.DUP#" datasource="#Application.DSN#">
        SELECT *
        FROM SCO_PROGRESS
        WHERE user_id = '#PreserveSingleQuotes(user_id_safe)#' AND
        course_id = '#PreserveSingleQuotes(course_id_safe)#' AND
        sco_id = '#PreserveSingleQuotes(sco_id_safe)#' AND
        lecture_count = -1;
      </cfquery>

      <cfif q.RecordCount eq 1>
        <cfquery name="q" username="#Application.DUN#" password="#Application.DUP#" datasource="#Application.DSN#">
          DELETE FROM SCO_PROGRESS
          WHERE user_id = '#PreserveSingleQuotes(user_id_safe)#' AND
          course_id = '#PreserveSingleQuotes(course_id_safe)#' AND
          sco_id = '#PreserveSingleQuotes(sco_id_safe)#' AND
          lecture_count = -1;
        </cfquery>

		<!---operation ログに出力--->
		<cfset now_login_user=GetAuthUser()>
		<cfset txt="OPEN_SCO_-1_RECORD_DELETE, USER_ID;#now_login_user#, COURSE_ID;#course_id_safe#, SCO_ID;#sco_id_safe#">
		<cflog file="operation" application="yes" text="#txt#">
      </cfif>
    </cffunction>

	<!--- 2020/01/17 ito c_csv_co_sco ADD start --->
	<!---////////////////////////////////////////
	関数名	get_sco_progress_query_by_user_id_for_co_sco
	引数1	ユーザーID	user_id		array	必須
	引数2	コースID	course_id	array	必須
	引数3	タイプ		dir_type	numeric			0:ディレクトリの情報含まない　1:ディレクトリの情報含む	default:0
	引数4	成績タイプ	type		numeric			0:データベースの設定値を利用　1:最新　2:最高　3:初回受講時　4:初回修了時　-1:全タイプ取得
	戻り値	クエリオブジェクト
	説明	とあるユーザーのSCO成績をクエリオブジェクトの
			形式で返す
			コース名、SCO名、USER名、CONSTRUCTなどを結合
			とりあえず成績がほしい時はここを使うこと。
			成績タイプは、特にそのタイプの成績を取得したい場合に使用すること。
			成績タイプの引数が0、もしくは渡されてこなかった場合はDBの設定値を使用します。
			↓for_co_sco版の変更点
			SCO成績に加えて、コースの成績も付与します。
	/////////////////////////////////////////--->

	<cffunction name="get_sco_progress_query_by_user_id_for_co_sco" access="public" output="no" returntype="query">
		<cfargument name="user_id"     required="yes" type="array"  >
		<cfargument name="course_id"   required="yes" type="array"  >
		<cfargument name="dir_type"    default="0"    type="numeric">
		<cfargument name="output_type" default="0"    type="numeric">

		<cfset var __TempQueryString = ''>
		<cfset var __TempQueryString1 = ''>
		<cfset var __TempQueryString2 = ''>
		<cfset var TempSelectObj = ''>
		<cfset var qGetUserInfo = ''>
		<cfset var qGetAllCourseUser = ''>
		<cfset var strGetAllCourseUser = ''>
		<cfset var qGetNomarlUser = ''>
		<cfset var strGetNomarlUser = ''>
		<cfset var resultObjAllCourse = ''>
		<cfset var resultObjNormal = ''>
		<cfset var resultObj = ''>
		<cfset var type = ''>
		<cfset var sql = ''>

		<cfif output_type is 0>
			<!--- 表示タイプ取得 --->
			<cfinvoke component="table_lms_setting"
			          method="get_value"
			          param_name="indication_type"
			          returnVariable="type"
			>
		<cfelse>
			<cfset type = output_type>
		</cfif>

		<!--- ユーザー情報取得 --->
		<cfset TempSelectObj = dao_select("USER_MASTER")>
		<cfset TempSelectObj = dao_in(TempSelectObj, "user_id" , "#ArrayToList(user_id)#")>
		<cfset qGetUserInfo = dao_result("#application.DSN#", TempSelectObj)>

		<!---////////////////////////////////////////////////
		全コース割り当てかどうかで二つのグループに分ける
		/////////////////////////////////////////////////--->

		<!--- 全コース割り当て --->
		<cfquery name="qGetAllCourseUser" dbtype="query">
		select user_id from qGetUserInfo where flag_all_course = 1
		</cfquery>

		<cfif qGetAllCourseUser.recordcount is not 0>
			<cfset strGetAllCourseUser = ValueList(qGetAllCourseUser.user_id)>
		<cfelse>
			<cfset strGetAllCourseUser = "-9999">
		</cfif>

		<cfinvoke component="#Application.SqlStringComponent#" method="table_sco_progress_004_for_co_sco" returnVariable="__TempQueryString1">
			<cfinvokeargument name="arg001" value="#strGetAllCourseUser#">
			<cfinvokeargument name="arg002" value="#ArrayToList(course_id)#">
			<cfinvokeargument name="arg003" value="#dir_type#">
			<cfinvokeargument name="arg004" value="#type#">
		</cfinvoke>

		<!--- 全コース割り当てでない --->
		<cfquery name="qGetNomarlUser" dbtype="query">
		select user_id from qGetUserInfo where flag_all_course = 0
		</cfquery>
		
		<cfif qGetNomarlUser.recordcount is not 0>
			<cfset strGetNomarlUser = ValueList(qGetNomarlUser.user_id)>
		<cfelse>
			<cfset strGetNomarlUser = "-9999">
		</cfif>

		<cfinvoke component="#Application.SqlStringComponent#" method="table_sco_progress_001_for_co_sco" returnVariable="__TempQueryString2">
			<cfinvokeargument name="arg001" value="#strGetNomarlUser#">
			<cfinvokeargument name="arg002" value="#ArrayToList(course_id)#">
			<cfinvokeargument name="arg003" value="#dir_type#">
			<cfinvokeargument name="arg004" value="#type#">
		</cfinvoke>

		<cfset __TempQueryString = __TempQueryString1 & ' union all ' & __TempQueryString2>

		<cfquery name="resultObj" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			#PreserveSingleQuotes(__TempQueryString)#
		</cfquery>

		<cfreturn overwrite_status(resultObj)>

	</cffunction>
	<!--- 2020/01/17 ito c_csv_co_sco ADD end --->
</cfcomponent>
