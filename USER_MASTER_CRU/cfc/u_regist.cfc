<!---
************************************************************************************
Attin2　Management Interface Function
Copyright (C) 2003 SATT,Inc.

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE..  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

************************************************************************************
日本訳: （英文優先）
Attain2　管理インタフェース機能
Copyright (C)  2003年  エスエイティーティー株式会社

このライブラリはフリーソフトウェアです。あなたはこれを、フリーソフトウェ
ア財団によって発行されたGNU 劣等一般公衆利用許諾契約書(バージョン2.1
か、希望によってはそれ以降のバージョンのうちどれか)の定める条件の下で
再頒布または改変することができます。

このライブラリは有用であることを願って頒布されますが、*全くの無保証*
です。商業可能性の保証や特定の目的への適合性は、言外に示されたものも含
め全く存在しません。詳しくはGNU 劣等一般公衆利用許諾契約書をご覧くださ
い。

あなたはこのライブラリと共に、GNU 劣等一般公衆利用許諾契約書の複製物を
一部受け取ったはずです。もし受け取っていなければ、フリーソフトウェア財
団まで請求してください(宛先は the Free Software Foundation, Inc., 59
Temple Place, Suite 330, Boston, MA 02111-1307 USA)。
************************************************************************************
--->

<cfcomponent extends="parent">
<cfprocessingdirective pageencoding="UTF-8">

<cfobject component="#application.SERVICE_ADDRESS#.table_assign" name="asObj">
<cfobject component="#application.SERVICE_ADDRESS#.table_course_master" name="cmObj">
<cfobject component="#application.SERVICE_ADDRESS#.table_lms_setting" name="lsObj">
<cfobject component="#application.SERVICE_ADDRESS#.table_user_master" name="umObj">

<!---user_idを取得(新規登録)--->
	<cffunction name="New_registration" access="public">
		<cfset max = dao_get_serial(application.DSN , 'USER_MASTER')>
		<cfreturn max>
	</cffunction>

	<cffunction name="Check_loginName" access="public" returntype="any">
		<cfargument name="logonStr" type="string" required="true">
		<cfset returnNum = 0>
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "logon", "#logonStr#")>
		<cfset CheckLogon = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfif CheckLogon.recordcount neq 0>
			<cfset returnNum = 2>
		</cfif>
		<cfreturn returnNum>
	</cffunction>

	<cffunction name="Check_loginName2" access="public" returntype="any">
		<cfargument name="user_id" type="any" required="true">
		<cfargument name="logonStr" type="string" required="true">
		<cfset returnNum = 0>
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_ne(Variables.TempSelectObj, "user_id", "#user_id#")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "logon", "#logonStr#")>
		<cfset CheckLogon = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfif CheckLogon.recordcount neq 0>
				<cfset returnNum = 2>
		</cfif>

		<cfreturn returnNum>
	</cffunction>

	<cffunction name="regist" access="public" returntype="string" output="Yes">
		<cfargument name="user_id" type="any" required="true">
		<cfargument name="logon" type="any" required="true">
		<cfargument name="password" type="any" default="">
		<cfargument name="last" type="any" required="true">
		<cfargument name="first" type="any" required="true">
		<cfargument name="last_furi" type="any" required="true">
		<cfargument name="first_furi" type="any" required="true">
		<cfargument name="mail" type="any" required="true">
		<cfargument name="user_type" type="any" required="true">
		<cfargument name="group_id" type="array" required="true">
		<cfargument name="course_id" type="array" required="true"> <!--- 割り当てるコースIDのarray 期間情報はperiod_idに分けて入れる --->
		<cfargument name="period_id" type="string" default=""> <!--- 割り当てるコースの期間情報 ("course_id.period_id|course_id.period_id|course_id.period_id|～") --->
		<cfargument name="use" type="string" default="normal">	<!--- 和歌山CSVインポートではメールを送らないようにするFlag --->
		<cfargument name="is_send_mail_to_admin" default="false">
		<cfargument name="is_joca_members" default="false" required="false">
		<cfset var user_id_safe=dao_escape(user_id)>
		<cfif password is "">
			<cfinvoke method="password_maker" returnVariable="password">
		</cfif>

		<!--- 更新前の全コースフラグを保持 --->
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#user_id#")>
		<cfset q_UM = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<cfset last_all_course = q_UM.flag_all_course>
		<cfif last_all_course eq ""><cfset last_all_course = 0></cfif>

		<cfif ArrayLen(course_id) gt 0 and course_id[1] eq 0>
			<cfset new_course_all = 1>

			<cfif lsObj.get_value("course.auto_assign") is 0>
				<cfif use is 'normal'>
					<!---受講割り当て通知 Yoichiro--->
					<cfquery name="q_mail" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
						select course_id from NOTIFICATION where type=2 and effective_1=1;
					</cfquery>
					<cfloop query="q_mail">
						<cfquery name="isExist" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
							select count(*) as count from ASSIGN where user_id='#PreserveSingleQuotes(user_id_safe)#' and course_id=#q_mail.course_id#
						</cfquery>
						<!---新規ASSIGNならメールを送信 Yoichiro--->
						<cfif isExist.count is 0>
							<!---所属コースのコース割り当て通知を送信 20071001 Yoichiro--->
							<cfinvoke
								component="#Application.SERVICE_ADDRESS#.auto_mail"
								method="assign_mail"
								param1 = "#user_id#"
								param2 = "#q_mail.course_id#"
							/>
						</cfif>
					</cfloop>
				</cfif>
			</cfif>
		<cfelse>
			<cfset new_course_all = 0>
			<cfset mailFlag=1>
		</cfif>

		<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_005" returnVariable="__TempQueryString">
			<cfinvokeargument name="arg001" value="#user_id#">
			<cfinvokeargument name="arg002" value="#logon#">
			<cfinvokeargument name="arg003" value="#password#">
			<cfinvokeargument name="arg004" value="#last#">
			<cfinvokeargument name="arg005" value="#first#">
			<cfinvokeargument name="arg006" value="#last_furi#">
			<cfinvokeargument name="arg007" value="#first_furi#">
			<cfinvokeargument name="arg008" value="#mail#">
			<cfinvokeargument name="arg009" value="#user_type#">
			<cfinvokeargument name="arg010" value="#DateFormat(Now(),'YYYY/MM/DD')#">
			<cfinvokeargument name="arg011" value="#TimeFormat(Now(),'HH:MM:SS')#">
			<cfinvokeargument name="arg012" value="#new_course_all#">    <!--- 全コース割り当てフラグ追加 20061120 tanaka --->
		</cfinvoke>
		<cfquery name="SCO" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			#PreserveSingleQuotes(Variables.__TempQueryString)#
		</cfquery>

    <!---初期パスワードを設定--->
		<cfset init_password = ''>
		<cfset init_password = #password#>
		<cfset umObj.update_user_init_password(#user_id#, init_password)>

		<!---所属グループを記入--->
		<cfif group_id[1] is 0>
		<!---全グループの場合は記入しない--->
		<cfelse>
		<cfloop index="i" from="1" to="#ArrayLen(group_id)#">
			<cfset group_id_each = #group_id[i]#>
			<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_006" returnVariable="__TempQueryString">
				<cfinvokeargument name="arg001" value="#user_id#">
				<cfinvokeargument name="arg002" value="#group_id_each#">
				<cfinvokeargument name="arg003" value="#DateFormat(Now(),'YYYY/MM/DD')#">
				<cfinvokeargument name="arg004" value="#TimeFormat(Now(),'HH:MM:SS')#">
			</cfinvoke>
			<cfquery name="adminG" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
				#PreserveSingleQuotes(Variables.__TempQueryString)#
			</cfquery>
		</cfloop>
		</cfif>

		<cfif lsObj.get_value("course.auto_assign") is 0>
			<!--- コース割り当て --->
			<cfset temp = asObj.set_assign(user_id, course_id, 0, period_id, last_all_course, new_course_all)>


			<cfif use is 'normal'>
				<cfinvoke component="auto_mail"
				          method="register_mail"
				          param1="#user_id#"
				          is_send_mail_to_admin="#is_send_mail_to_admin#"
						  is_joca_members="#is_joca_members#">

				<cfif isDefined("mailFlag") and mailFlag eq 1>
					<cfif ArrayLen(course_id) gt 0 and course_id[1] neq 0>
						<cfloop index="i" from="1" to="#ArrayLen(course_id)#">
							<cfinvoke
								component="#Application.SERVICE_ADDRESS#.auto_mail"
								method="assign_mail"
								param1 = "#user_id#"
								param2 = "#course_id[i]#"
								/>
						</cfloop>
					</cfif>
				</cfif>
			</cfif>
		</cfif>

		<cfset myResult="成功">
		<cfreturn myResult>
	</cffunction>

	<!---一括登録--->
	<cffunction name="Lump_regist" access="public">
		<cfargument name="str" type="string" required="true">

		<cfset var myArray = ArrayNew(1)>
		<cfset var detailArray = ArrayNew(1)>
		<!---受講者はuser_type_idを3に指定--->
		<cfset var admin = 3>
		<cfset var msg = "">
		<cfset var num = 0>
		<cfset var returnMsg = "">
		<cfset var max_row = 0>
		<cfset var password = "">

		<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_015" returnVariable="__TempQueryString">
		</cfinvoke>
		<cfquery name="max" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			#PreserveSingleQuotes(Variables.__TempQueryString)#
		</cfquery>

		<cfset max_row = max.max_user_id + 1>

		<cfset myArray = ListToArray(str , chr(13))>

		<cfloop index="i" from="1" to="#ArrayLen(myArray)#">

			<cfset msg = "">

			<cfset detailArray = ArrayNew(1)>
			<cfinvoke method="NewListToArray" List="#myArray[i]#" returnVariable="detailArray">
			<cfset length = 8 - ArrayLen(detailArray)>

			<cfif detailArray[4] is "">
				<cfinvoke method="password_maker" returnVariable="password" count="#i#">
				<cfset detailArray[4] = password>
			</cfif>

			<cfloop index="j" from="1" to="#length#">
				<cfset ArrayAppend(detailArray , 0)>
			</cfloop>


			<cfloop index="k" from="1" to="#ArrayLen(detailArray)#">
				<cfif Len(detailArray[k]) is not Len(HTMLEditFormat(detailArray[k]))>
					<cfset msg = '使用禁止記号が含まれていました。'>
					<cfbreak>
				</cfif>
			</cfloop>

			<cfif msg is ''>
				<cfif ArrayLen(detailArray) gt 8>
					<cfset msg='項目数が10以上あります。項目数の最大は8です。'>
				</cfif>
			</cfif>

			<cfif msg is ''>
				<cfif Len(detailArray[1]) gt 10>
					<cfset msg = '姓が10文字を超えています。'>
				<cfelseif Len(detailArray[1]) is 0>
					<cfset msg = '姓が入力されていません。'>
				</cfif>
			</cfif>

			<cfif msg is ''>
				<cfif Len(detailArray[2]) gt 10>
					<cfset msg = '名が10文字を超えています。'>
				<cfelseif Len(detailArray[2]) is 0>
					<cfset msg = '名が入力されていません。'>
				</cfif>
			</cfif>

			<cfif msg is ''>
				<cfif Len(detailArray[3]) gt 10>
					<cfset msg = 'ユーザーIDが10文字を超えています。'>
				<cfelseif Len(detailArray[3]) is 0>
					<cfset msg = 'ユーザーIDが入力されていません。'>
				</cfif>
				<cfif msg is ''>
					<cfset PATTERN = "^([a-zA-Z0-9]+)$">
					<cfset st = #REFind("#PATTERN#", detailArray[3])#>
					<cfif st is 0>
						<cfset msg = 'ユーザーIDに半角英数以外の文字が含まれています。'>
					</cfif>
				</cfif>
			</cfif>

			<cfif msg is ''>
				<cfif Len(detailArray[4]) gt 10>
					<cfset msg = 'パスワードが10文字を超えています。'>
				<cfelseif Len(detailArray[4]) is 0>
					<cfset msg = 'パスワードが入力されていません。'>
				</cfif>
				<cfif msg is ''>
					<cfset PATTERN = "^([a-zA-Z0-9]+)$">
					<cfset st = #REFind("#PATTERN#", detailArray[4])#>
					<cfif st is 0>
						<cfset msg = 'パスワードに半角英数以外の文字が含まれています。'>
					</cfif>
				</cfif>
			</cfif>

			<cfif msg is ''>
				<cfif Len(detailArray[5]) gt 50>
					<cfset msg = 'メールアドレスが50文字を超えています。'>
				<cfelseif Len(detailArray[5]) is 0>
					<cfset msg = 'メールアドレスが入力されていません。'>
				</cfif>
				<cfif msg is ''>
					<cfset PATTERN = "^([a-zA-Z0-9._-]+)@([a-zA-Z0-9._-]+)$">
					<cfset st = #REFind("#PATTERN#", detailArray[5])#>
					<cfif st is 0>
						<cfset msg = 'メールアドレスに使用禁止文字が含まれています。'>
					</cfif>
				</cfif>
			</cfif>

			<cfif msg is ''>
				<cfinvoke method="Check_loginName" lastnameStr="#detailArray[1]#" firstnameStr="#detailArray[2]#" logonStr="#detailArray[3]#" returnVariable="returnNum">
				<cfif returnNum is 1>
					<cfset msg = '同じ名前のユーザーがすでに登録されています。'>
				<cfelseif returnNum is 2>
					<cfset msg = '同じユーザーIDがすでに登録されています。'>
				</cfif>
			</cfif>

			<cfif msg is ''>
				<cfif detailArray[6] is "">
					<cfset detailArray[6] = 0>
				</cfif>
				<cfif detailArray[6] is not 0>
					<cfif not IsNumeric(detailArray[6])>
						<cfset msg='グループ1が数値ではありません。'>
					<cfelseif Len(detailArray[6]) gt 10>
						<cfset msg='グループ1を10桁以内にしてください。'>
					</cfif>
				</cfif>
			</cfif>

			<cfif msg is ''>
				<cfif detailArray[7] is "">
					<cfset detailArray[7] = 0>
				</cfif>
				<cfif detailArray[7] is not 0>
					<cfif not IsNumeric(detailArray[7])>
						<cfset msg='グループ2が数値ではありません。'>
					<cfelseif Len(detailArray[7]) gt 10>
						<cfset msg='グループ2を10桁以内にしてください。'>
					</cfif>
				</cfif>
			</cfif>

			<cfif msg is ''>
				<cfif detailArray[8] is "">
					<cfset detailArray[8] = 0>
				</cfif>
				<cfif detailArray[8] is not 0>
					<cfif not IsNumeric(detailArray[8])>
						<cfset msg='グループ3が数値ではありません。'>
					<cfelseif Len(detailArray[8]) gt 10>
						<cfset msg='グループ3を10桁以内にしてください。'>
					</cfif>
				</cfif>
			</cfif>

			<cfif msg is ''>
				<cftry>

<!--- 2006/08/30 mod. --->
<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_016" returnVariable="__TempQueryString">
	<cfinvokeargument name="arg001" value="#max_row#">
	<cfinvokeargument name="arg002" value="#detailArray[3]#">
	<cfinvokeargument name="arg003" value="#detailArray[4]#">
	<cfinvokeargument name="arg004" value="#detailArray[1]#">
	<cfinvokeargument name="arg005" value="#detailArray[2]#">
	<cfinvokeargument name="arg006" value="#detailArray[5]#">
	<cfinvokeargument name="arg007" value="#admin#">
	<cfinvokeargument name="arg008" value="#DateFormat(Now(),'YYYY/MM/DD')#">
	<cfinvokeargument name="arg009" value="#TimeFormat(Now(),'HH:MM:SS')#">
</cfinvoke>
<cfquery name="SCO" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
	#PreserveSingleQuotes(Variables.__TempQueryString)#
</cfquery>
<!--- 2006/08/30 mod. --->



					<!---所属グループを書き込む--->
					<cfloop index="j" from="6" to="8">
						<cfif detailArray[j] is 0>
						<!---指定してないなら、書き込まない--->
						<cfelse>

<!--- 2006/08/30 mod. --->
<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_017" returnVariable="__TempQueryString">
	<cfinvokeargument name="arg001" value="#max_row#">
	<cfinvokeargument name="arg002" value="#detailArray[j]#">
	<cfinvokeargument name="arg003" value="#DateFormat(Now(),'YYYY/MM/DD')#">
	<cfinvokeargument name="arg004" value="#TimeFormat(Now(),'HH:MM:SS')#">
</cfinvoke>
<cfquery name="belongG" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
	#PreserveSingleQuotes(Variables.__TempQueryString)#
</cfquery>
<!--- 2006/08/30 mod. --->


						</cfif>
					</cfloop>


					<cfset returnMsg = returnMsg & i & '行目：成功　' & chr(10)>

					<cfinvoke component="auto_mail"
					          method="register_mail"
					          param1="#max_row#"
					>

					<cfcatch type="any">
						<cfset returnMsg = returnMsg & i & '行目：失敗　' & cfcatch.message & chr(10)>
					</cfcatch>
				</cftry>

				<cfset max_row = max_row + 1>
			<cfelse>
				<cfset returnMsg = returnMsg & i & '行目：失敗　' & msg & chr(10)>
			</cfif>

		</cfloop>
		<cfreturn returnMsg>
	</cffunction>

<!---登録日時を取得して編集登録--->
	<cffunction name="Updating_registration_day" access="public" returntype="query">
		<cfargument name="user_id" type="any" required="true">

		<!--- 2006/08/30 mod. --->
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#user_id#")>
		<cfset max = dao_result("#application.DSN#", Variables.TempSelectObj)>
		<!--- 2006/08/30 mod. --->

		<cfreturn max>
	</cffunction>

<!---編集登録--->
	<cffunction name="Updating_registration" access="public" returntype="string" output="yes">
		<cfargument name="user_id" type="any" required="true">
		<cfargument name="logon" type="any" required="true">
		<cfargument name="password" type="any" default="">
		<cfargument name="last" type="any" required="true">
		<cfargument name="first" type="any" required="true">
		<cfargument name="last_furi" type="any" required="true">
		<cfargument name="first_furi" type="any" required="true">
		<cfargument name="mail" type="any" required="true">
		<cfargument name="user_type" type="any" required="true">
		<cfargument name="group_id" type="array" required="true">
		<cfargument name="course_id" type="array" required="true">
		<cfargument name="admin_user_id" type="any" required="true">
		<cfargument name="admin_user_type" type="any" required="true">
		<cfargument name="period_id" type="string" default="">
		<cfargument name="use" type="string" default="normal">	<!--- 和歌山CSVインポートではメールを送らないようにするFlag --->

		<cfset var group_id_list = ArrayToList(group_id)>
		<cfset var course_id_list = ArrayToList(course_id)>
		<cfset var giLoc = ''>
		<cfset var ciLoc = ''>
		<cfset var uCid = ''>

		<cfset var user_id_safe = dao_escape(user_id)>

		<cfif password is "">
			<cfinvoke method="password_maker" returnVariable="password">
		</cfif>

		<!---変更前に全コース割り当てだったかかどうかを保持 20061120 tanaka --->
		<!--- 2006/11/20 mod. --->
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#user_id#")>
		<cfset last_user_data = dao_result("#application.DSN#", Variables.TempSelectObj)>

		<!--- 2006/11/20 mod. --->
		<!---旧：全コースフラグ--->
		<cfif last_user_data.flag_all_course eq 1>
			<cfset cur_course_all = 1>
		<cfelse>
			<cfset cur_course_all = 0>
		</cfif>
		<!---新：全コースフラグ--->
		<cfquery name="wasAll" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			select flag_all_course from USER_MASTER where user_id='#PreserveSingleQuotes(user_id_safe)#'
		</cfquery>
		<cfif ArrayLen(course_id) gt 0 and course_id[1] eq 0>
			<cfset new_course_all = 1>

			<cfif lsObj.get_value("course.auto_assign") is 0>
				<cfif use is 'normal'>
					<!---受講割り当て通知 Yoichiro--->
					<cfif wasAll.flag_all_course is 0><!---元々全コース割り当ての場合は送信しない--->
						<cfquery name="q_mail" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
							select course_id from NOTIFICATION where type=2 and effective_1=1;
						</cfquery>
						<cfloop query="q_mail">
							<cfquery name="isExist" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
								select count(*) as count from ASSIGN where user_id='#PreserveSingleQuotes(user_id_safe)#' and course_id=#q_mail.course_id#
							</cfquery>
							<!---新規ASSIGNならメールを送信 Yoichiro--->
							<cfif isExist.count is 0>
								<!---所属コースのコース割り当て通知を送信 20071001 Yoichiro--->
								<cfinvoke
									component="#Application.SERVICE_ADDRESS#.auto_mail"
									method="assign_mail"
									param1 = "#user_id#"
									param2 = "#q_mail.course_id#"
								/>
							</cfif>
						</cfloop>
					</cfif>
				</cfif>
			</cfif>
		<cfelse>
			<cfset new_course_all = 0>
		</cfif>
		<!---ユーザ編集登録--->

		<!--- 2006/08/30 mod. --->
		<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_019" returnVariable="__TempQueryString">
			<cfinvokeargument name="arg001" value="#logon#">
			<cfinvokeargument name="arg002" value="#password#">
			<cfinvokeargument name="arg003" value="#last#">
			<cfinvokeargument name="arg004" value="#first#">
			<cfinvokeargument name="arg005" value="#last_furi#">
			<cfinvokeargument name="arg006" value="#first_furi#">
			<cfinvokeargument name="arg007" value="#mail#">
			<cfinvokeargument name="arg008" value="#user_type#">
			<cfinvokeargument name="arg009" value="#DateFormat(Now(),'YYYY/MM/DD')#">
			<cfinvokeargument name="arg010" value="#TimeFormat(Now(),'HH:MM:SS')#">
			<cfinvokeargument name="arg011" value="#user_id#">
			<cfinvokeargument name="arg012" value="#new_course_all#">    <!--- 全コース割り当てフラグ追加 20061120 tanaka --->
		</cfinvoke>
		<cfquery name="SCO" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			#PreserveSingleQuotes(Variables.__TempQueryString)#
		</cfquery>
		<!--- 2006/08/30 mod. --->


			<!---所属グループを先に削除--->

			<cfif admin_user_type eq 1>
				<!---全グループを削除--->
				<!--- 2006/08/30 mod. --->
				<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_043" returnVariable="__TempQueryString">
					<cfinvokeargument name="arg001" value="#user_id#">
				</cfinvoke>
				<cfquery name="adminGd" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					#PreserveSingleQuotes(Variables.__TempQueryString)#
				</cfquery>
				<!--- 2006/08/30 mod. --->
			<cfelseif admin_user_type eq 2>
				<!--- 2006/10/25 mod. --->
				<cfset Variables.TempSelectObj = dao_select("admin_group")>
				<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#admin_user_id#")>
				<cfset admin_group = dao_result("#application.DSN#", Variables.TempSelectObj)>
				<!--- 2006/10/25 mod. --->
				<cfif admin_group.recordcount eq 0>
					<!---全グループを削除--->
					<!--- 2006/08/30 mod. --->
					<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_043" returnVariable="__TempQueryString">
						<cfinvokeargument name="arg001" value="#user_id#">
					</cfinvoke>
					<cfquery name="adminGd" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
						#PreserveSingleQuotes(Variables.__TempQueryString)#
					</cfquery>
					<!--- 2006/08/30 mod. --->
				<cfelse>
					<!---権限のあるグループのみ削除--->
					<!--- 2006/10/25 mod. --->
					<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_086" returnVariable="__TempQueryString">
						<cfinvokeargument name="arg001" value="#user_id#">
						<cfinvokeargument name="arg002" value="#admin_user_id#">
					</cfinvoke>
					<cfquery name="adminGd" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
						#PreserveSingleQuotes(Variables.__TempQueryString)#
					</cfquery>
					<!--- 2006/10/25 mod. --->
				</cfif>
			</cfif>

			<!---全グループの場合は記入しない--->
			<cfif group_id[1] is not 0>
				<cfloop index="i" from="1" to="#ArrayLen(group_id)#">
				<cfset group_id_each = #group_id[i]#>

				<!--- 2006/08/30 mod. --->
				<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_044" returnVariable="__TempQueryString">
					<cfinvokeargument name="arg001" value="#user_id#">
					<cfinvokeargument name="arg002" value="#group_id_each#">
					<cfinvokeargument name="arg003" value="#DateFormat(Now(),'YYYY/MM/DD')#">
					<cfinvokeargument name="arg004" value="#TimeFormat(Now(),'HH:MM:SS')#">
				</cfinvoke>
				<cfquery name="adminG" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
					#PreserveSingleQuotes(Variables.__TempQueryString)#
				</cfquery>
				<!--- 2006/08/30 mod. --->

				</cfloop>
			</cfif>

			<cfif lsObj.get_value("course.auto_assign") is 0>
				<cfif wasAll.flag_all_course is 0 and  (ArrayLen(course_id) gt 0 and course_id[1] is not 0) and use is 'normal'><!--- 過去も現在も全コースフラグがついていない場合 --->
					<cfloop index="i" from="1" to="#ArrayLen(course_id)#">
						<!---既にASSIGNされているかチェック Yoichiro--->
						<cfset course_id_safe = dao_escape(course_id[i])>
						<cfquery name="isExist" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
							select count(*) as count from ASSIGN where user_id='#PreserveSingleQuotes(user_id_safe)#' and course_id='#PreserveSingleQuotes(course_id_safe)#'
						</cfquery>
						<!---新規ASSIGNならメールを送信 Yoichiro--->
						<cfif isExist.count is 0>
							<!---所属コースのコース割り当て通知を送信 20071001 Yoichiro--->
							<cfinvoke
								component="#Application.SERVICE_ADDRESS#.auto_mail"
								method="assign_mail"
								param1 = "#user_id#"
								param2 = "#course_id[i]#"
							/>
						</cfif>
					</cfloop>
				</cfif>
				<!--- コース割り当て --->
				<cfset temp = asObj.set_assign(user_id, course_id, admin_user_id, period_id, cur_course_all, new_course_all)>
			</cfif>

		<cfset myResult="成功">
		<cfreturn myResult>
	</cffunction>

	 <!---削除/GOURSE_PROGRESSとSCO_PROGRESSテーブルにも、ユーザー削除--->
	<cffunction name="Delete" access="public" returntype="any">
	<cfargument name="id" type="any"  required="true">
	  <cftry>
	    <cftransaction>
			<!---グループ所属--->

<!--- 2006/08/30 mod. --->
<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_056" returnVariable="__TempQueryString">
	<cfinvokeargument name="arg001" value="#id#">
</cfinvoke>
<cfquery username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
	#PreserveSingleQuotes(Variables.__TempQueryString)#
</cfquery>
<!--- 2006/08/30 mod. --->


			<!---与えられたコース--->

<!--- 2006/08/30 mod. --->
<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_057" returnVariable="__TempQueryString">
	<cfinvokeargument name="arg001" value="#id#">
</cfinvoke>
<cfquery username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
	#PreserveSingleQuotes(Variables.__TempQueryString)#
</cfquery>
<!--- 2006/08/30 mod. --->



			<!---与えられたコースの進捗も削除--->

<!--- 2006/08/30 mod. --->
<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_058" returnVariable="__TempQueryString">
	<cfinvokeargument name="arg001" value="#id#">
</cfinvoke>
<cfquery username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
	#PreserveSingleQuotes(Variables.__TempQueryString)#
</cfquery>
<!--- 2006/08/30 mod. --->



			<!---与えられたコースのSCO進捗も削除--->

<!--- 2006/08/30 mod. --->
<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_059" returnVariable="__TempQueryString">
	<cfinvokeargument name="arg001" value="#id#">
</cfinvoke>
<cfquery name="Set_ScoIDQuery" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
	#PreserveSingleQuotes(Variables.__TempQueryString)#
</cfquery>
<!--- 2006/08/30 mod. --->



			<!---ユーザーマスター--->

<!--- 2006/08/30 mod. --->
<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_060" returnVariable="__TempQueryString">
	<cfinvokeargument name="arg001" value="#id#">
</cfinvoke>
<cfquery username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
	#PreserveSingleQuotes(Variables.__TempQueryString)#
</cfquery>
<!--- 2006/08/30 mod. --->


		    <cfset myResult = "成功">
	  <cftransaction>
	  <cfcatch type = "Database">
		    <cfset myResult = "失敗">
	  </cfcatch>
	  </cftry>
	  <cfreturn myResult>
	</cffunction>


<!---受講者一覧を取得--->
	<cffunction name="participant_reading" access="public">
	<cfargument name="UserID" type="any" required="true">

		<cftry>
			<cfif UserID is 0>

<!--- 2006/08/30 mod. --->
<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_type_id", "3")>
<cfset Variables.TempSelectObj = dao_orderby(Variables.TempSelectObj, "last_name_furi, first_name_furi")>
<cfset participant = dao_result("#application.DSN#", Variables.TempSelectObj)>
<!--- 2006/08/30 mod. --->


			<cfelse>

<!--- 2006/08/30 mod. --->
<cfset Variables.TempSelectObj = dao_select("admin_group")>
<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#UserID#")>
<cfset check = dao_result("#application.DSN#", Variables.TempSelectObj)>
<!--- 2006/08/30 mod. --->


				<cfif check.recordcount is 0>
					<!---全コースに権限持ってる場合--->

<!--- 2006/08/30 mod. --->
<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_type_id", "3")>
<cfset Variables.TempSelectObj = dao_orderby(Variables.TempSelectObj, "last_name_furi, first_name_furi")>
<cfset participant = dao_result("#application.DSN#", Variables.TempSelectObj)>
<!--- 2006/08/30 mod. --->


				<cfelse>

<!--- 2006/08/30 mod. --->
<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_064" returnVariable="__TempQueryString">
	<cfinvokeargument name="arg001" value="#UserID#">
</cfinvoke>
<cfquery name="participant" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
	#PreserveSingleQuotes(Variables.__TempQueryString)#
</cfquery>
<!--- 2006/08/30 mod. --->


				</cfif>
			</cfif>
			<cfcatch type="any">
				<cfreturn false>
			</cfcatch>
		</cftry>

		<cfreturn participant>
	</cffunction>


<!---グループを取得--->
	<cffunction name="group_reading" access="public" returntype="query">

<!--- 2006/08/30 mod. --->
<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_065" returnVariable="__TempQueryString">
</cfinvoke>
<cfquery name="group" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
	#PreserveSingleQuotes(Variables.__TempQueryString)#
</cfquery>
<!--- 2006/08/30 mod. --->


		<cfreturn group>
	</cffunction>

<!---一般個人情報を取得--->
	<cffunction name="Personal_information" access="public" returntype="query">
	<cfargument name="id" type="any" required="true">

<!--- 2006/08/30 mod. --->
<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#id#")>
<cfset Variables.TempSelectObj = dao_orderby(Variables.TempSelectObj, "last_name_furi, first_name_furi")>
<cfset information = dao_result("#application.DSN#", Variables.TempSelectObj)>
<!--- 2006/08/30 mod. --->


	 <cfreturn information>

	</cffunction>

<!---全グループを取得--->
	<cffunction name="Group_list" access="public" returntype="query">

<!--- 2006/08/30 mod. --->
<cfset Variables.TempSelectObj = dao_select("GROUP_MASTER")>
<cfset glist = dao_result("#application.DSN#", Variables.TempSelectObj)>
<!--- 2006/08/30 mod. --->


	 <cfreturn glist>
	</cffunction>

<!---管理してるグループだけを取得(0件の場合は、全グループに権限あるとする)--->
	<cffunction name="mGroup_list" access="public" returntype="query">
	<cfargument name="id" type="any" required="true">

<!--- 2006/08/30 mod. --->
<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_069" returnVariable="__TempQueryString">
	<cfinvokeargument name="arg001" value="#id#">
</cfinvoke>
<cfquery name="mglist" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
	#PreserveSingleQuotes(Variables.__TempQueryString)#
</cfquery>
<!--- 2006/08/30 mod. --->


	 <cfif mglist.recordcount eq 0>

<!--- 2006/08/30 mod. --->
<cfset Variables.TempSelectObj = dao_select("GROUP_MASTER")>
<cfset glist = dao_result("#application.DSN#", Variables.TempSelectObj)>
<!--- 2006/08/30 mod. --->


		<cfset mglist = glist>
	 </cfif>

	 <cfreturn mglist>
	</cffunction>

<!---所属してるグループを取得--->
	<cffunction name="smGroup_list" access="public" returntype="query">
	<cfargument name="id" type="any" required="true">

<!--- 2006/08/30 mod. --->
<cfset Variables.TempSelectObj = dao_select("belong")>
<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#id#")>
<cfset smglist = dao_result("#application.DSN#", Variables.TempSelectObj)>
<!--- 2006/08/30 mod. --->


	 <cfreturn smglist>
	</cffunction>

<!---全コースを取得--->
	<cffunction name="Course_list" access="public" returntype="query">

<!--- 2006/08/30 mod. --->
<cfset Variables.TempSelectObj = dao_select("COURSE_MASTER")>
<cfset clist = dao_result("#application.DSN#", Variables.TempSelectObj)>
<!--- 2006/08/30 mod. --->


	 <cfreturn clist>
	</cffunction>

<!---管理してるコースだけを取得--->
	<cffunction name="mCourse_list" access="public" returntype="query">
	<cfargument name="id" type="any" required="true">

<!--- 2006/08/30 mod. --->
<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_073" returnVariable="__TempQueryString">
	<cfinvokeargument name="arg001" value="#id#">
</cfinvoke>
<cfquery name="mclist" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
	#PreserveSingleQuotes(Variables.__TempQueryString)#
</cfquery>
<!--- 2006/08/30 mod. --->


	 <cfif mclist.recordcount eq 0>

<!--- 2006/08/30 mod. --->
<cfset Variables.TempSelectObj = dao_select("COURSE_MASTER")>
<cfset clist = dao_result("#application.DSN#", Variables.TempSelectObj)>
<!--- 2006/08/30 mod. --->


		<cfset mclist = clist>
	 </cfif>

	 <cfreturn mclist>
	</cffunction>

<!---与えられてるコースを取得--->
	<cffunction name="smCourse_list" access="public" returntype="any">
	<cfargument name="id" type="any" required="true">

	<!---------- ASSIGNテーブルを使用せず、COURSE_PROGRESSで判断するよう変更 20061205 tanaka ---------
<!--- 2006/08/30 mod. --->
<cfset Variables.TempSelectObj = dao_select("ASSIGN")>
<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#id#")>
<cfset smclist = dao_result("#application.DSN#", Variables.TempSelectObj)>
<!--- 2006/08/30 mod. --->


	<!---ASSIGNに載ってない場合は、全コースか、コース無しの可能性があるので、course_progresssで確認(20060430陳)--->
	<cfif smclist.recordcount is 0>
	---------->

	<!--- 2006/12/05 mod. --->
	<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
	<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#id#")>
	<cfset temp_user_master = dao_result("#application.DSN#", Variables.TempSelectObj)>
	<!--- 2006/12/05 mod. --->

	<cfif temp_user_master.flag_all_course eq 1>
		<cfreturn "all">
	<cfelse>

<!--- 2006/08/30 mod. --->
<cfset Variables.TempSelectObj = dao_select("COURSE_PROGRESS")>
<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#id#")>
<cfset smclist_progress = dao_result("#application.DSN#", Variables.TempSelectObj)>
<!--- 2006/08/30 mod. --->


		<cfif smclist_progress.recordcount is 0>
			<cfreturn "none">
		<cfelse>
			<!-----<cfreturn "all">----->
			<cfreturn smclist_progress>
		</cfif>
		<!----------
		<cfelse>
			<cfreturn smclist>
		</cfif>
		---------->

	</cfif>

	</cffunction>

<!---検索--->
	<cffunction name="keyword_search" access="public">
	<cfargument name="keyword" type="array" required="true">
	<cfargument name="admin" type="any" required="true">
	<cfargument name="adminID" type="any" required="true">

	<cftry>


<!--- 2006/08/30 mod. --->
<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_077" returnVariable="__TempQueryString">
	<cfinvokeargument name="arg001" value="#keyword[1]#">
	<cfinvokeargument name="arg002" value="#keyword[2]#">
	<cfinvokeargument name="arg003" value="#keyword[3]#">
	<cfinvokeargument name="arg004" value="#keyword[4]#">
	<cfinvokeargument name="arg005" value="#keyword[5]#">
	<cfinvokeargument name="arg006" value="#keyword[6]#">
	<cfinvokeargument name="arg007" value="#admin#">
	<cfinvokeargument name="arg008" value="#adminID#">
</cfinvoke>
<cfquery name="mySearch" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
	#PreserveSingleQuotes(Variables.__TempQueryString)#
</cfquery>
<!--- 2006/08/30 mod. --->



		<cfcatch type="any">
			<cfreturn false>
		</cfcatch>
	</cftry>

	<cfreturn mySearch>
	</cffunction>

	<!---グループ検索--->
	<cffunction name="search_group" access="public" returntype="query">
	<cfargument name="groupid" type="any" required="true">


<!--- 2006/08/30 mod. --->
<cfinvoke component="#Application.SqlStringComponent#" method="u_regist_cfc_078" returnVariable="__TempQueryString">
	<cfinvokeargument name="arg001" value="#groupid#">
</cfinvoke>
<cfquery name="reference" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
	#PreserveSingleQuotes(Variables.__TempQueryString)#
</cfquery>
<!--- 2006/08/30 mod. --->



	<cfreturn reference>
	</cffunction>

	<!---パスワード生成--->
	<cffunction name="password_maker">

		<cfargument name="count" default="0">
		<cfset var seed = timeformat(now() , "HHmmss") & count>

		<cfset temp = Randomize(seed)>

		<cfset result = randrange(0 , 9) & randrange(0 , 9) & randrange(0 , 9) & randrange(0 , 9) & chr(randrange(1,26) + 64)>
		<cfreturn result>
	</cffunction>


<cffunction name="NewListToArray">
<!---関数の要素定義--->
	<cfargument name="List">
	<cfargument name="delimiters" default=",">

	<cfset var resultArray = ArrayNew(1)>
	<cfset var now_str = "">
	<cfset var i = 1>

	<cfloop condition = "Len(List) is not 0">
		<cfset now_str = SpanExcluding(List , delimiters)>
		<cfset resultArray[i] = now_str>
		<cfset now_List = List>
		<cfset List = RemoveChars(List , 1 , Len(now_str) + 1)>

		<cfset i = i + 1>
	</cfloop>

	<cfif Find(delimiters , now_List) is Len(now_List)>
		<cfset resultArray[i] = "">
	</cfif>

	<cfreturn resultArray>
</cffunction>

<cffunction name="get_asp_maxuser" access="public" returntype="any">
<!---ASPサービス時の最大ユーザー数取得--->
	<cfset returnval = -1>
	<cftry>
	<cfif application.eLM_TYPE eq "ASP">
		<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
		<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_type_id", "3")>
		<cfset get_USER_MASTER = dao_result("#application.DSN#", Variables.TempSelectObj)>

		<cfset Variables.TempSelectObj = dao_select("ASP_MASTER")>
		<cfset get_ASP_MASTER = dao_result("#application.DSN#", Variables.TempSelectObj)>

		<cfset returnval = get_ASP_MASTER.max_user - get_USER_MASTER.recordcount>
		<cfif returnval lt 0>
			<cfset returnval = 0>
		</cfif>
	</cfif>
	<cfcatch>
		<cfset returnval = -1>
	</cfcatch>
	</cftry>
	<cfreturn returnval>
</cffunction>

<cffunction name="get_asp_user" access="public" returntype="string" output="No">
<!---ASPサービス時の登録ユーザー数／最大ユーザー数／残りユーザー数の取得--->
	<cftry>

	<cfset result = "-1,-1,-1">
	<cfset val0 = -1>
	<cfset val1 = -1>
	<cfset val2 = -1>

	<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
	<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_type_id", "3")>
	<cfset get_USER_MASTER_count = dao_count("#application.DSN#", Variables.TempSelectObj)>

	<cfset val0 = get_USER_MASTER_count><!---登録ユーザー数--->

	<cfif application.eLM_TYPE eq "ASP">
		<cfset Variables.TempSelectObj = dao_select("ASP_MASTER")>
		<cfset get_ASP_MASTER = dao_result("#application.DSN#", Variables.TempSelectObj)>

		<cfset val1 = get_ASP_MASTER.max_user><!---最大ユーザー数--->
		<cfset val2 = get_ASP_MASTER.max_user - get_USER_MASTER_count><!---残りユーザー数--->
		<cfif val2 lt 0>
			<cfset val2 = 0>
		</cfif>
	</cfif>

	<cfcatch>
		<cfset val0 = -1>
		<cfset val1 = -1>
		<cfset val2 = -1>
	</cfcatch>
	</cftry>

	<cfset result = "#val0#,#val1#,#val2#">

	<cfreturn result>
</cffunction>

<cffunction name="get_asp_admin" access="public" returntype="string" output="No">
<!---ASPサービス時の登録管理者(システム管理者＋部門管理者)数／最大管理者数／残り管理者数の取得--->
	<cftry>

	<cfset result = "-1,-1,-1">
	<cfset val0 = -1>
	<cfset val1 = -1>
	<cfset val2 = -1>

	<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
	<cfset Variables.TempSelectObj = dao_in(Variables.TempSelectObj, "user_type_id", "1,2")>
	<cfset get_USER_MASTER_count = dao_count("#application.DSN#", Variables.TempSelectObj)>
	<cfset val0 = get_USER_MASTER_count><!---登録管理者数--->

	<cfif application.eLM_TYPE eq "ASP">
		<cfset Variables.TempSelectObj = dao_select("ASP_MASTER")>
		<cfset get_ASP_MASTER = dao_result("#application.DSN#", Variables.TempSelectObj)>

		<cfset val1 = get_ASP_MASTER.max_admin><!---最大管理者数--->
		<cfset val2 = get_ASP_MASTER.max_admin - get_USER_MASTER_count><!---残り管理者数--->
		<cfif val2 lt 0>
			<cfset val2 = 0>
		</cfif>
	</cfif>

	<cfcatch>
		<cfset val0 = -1>
		<cfset val1 = -1>
		<cfset val2 = -1>
	</cfcatch>
	</cftry>

	<cfset result = "#val0#,#val1#,#val2#">

	<cfreturn result>
</cffunction>

</cfcomponent>
