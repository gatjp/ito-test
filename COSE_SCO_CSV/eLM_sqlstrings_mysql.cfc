table_sco_progress_004<cfcomponent>
<cfprocessingdirective pageencoding="UTF-8">

<cfobject component="#Application.SERVICE_ADDRESS#.table_lms_setting" name="lsObj">
<cfset this.is_timeset	= lsObj.get_value("course.is_timeset_for_course_period")>

<cfinclude template="../lms_dao.cfm">
<cfinclude template="../function_safe.cfm">

<cffunction name="a_regist_cfc_001">
	<cfset tempSql = "
SELECT MAX(user_id) AS max_user_id FROM USER_MASTER
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_005">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfargument name="arg009" required="true">
	<cfargument name="arg010" required="true">
	<cfargument name="arg011" required="true">
	<cfset tempSql = "
INSERT INTO USER_MASTER
(user_id, logon, password,last_name, first_name, last_name_furi, first_name_furi, mailaddress, user_type_id, entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'" & dao_escape(arguments.arg004) & "', " & dao_n() & "'" & dao_escape(arguments.arg005) & "', " & dao_n() & "'" & dao_escape(arguments.arg006) & "', " & dao_n() & "'" & dao_escape(arguments.arg007) & "', " & dao_n() & "'" & dao_escape(arguments.arg008) & "', " & dao_n() & "'" & dao_escape(arguments.arg009) & "'," & dao_n() & "'" & dao_escape(arguments.arg010) & " " & dao_escape(arguments.arg011) & "', Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_006">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO admin_group
(user_id, group_id, entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_007">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO admin_course
(user_id, course_id, entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_008">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO admin_menu
(user_id, menu_id, entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_009">
	<cfset tempSql = "
SELECT MAX(user_id) AS max_user_id FROM USER_MASTER
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_010">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfargument name="arg009" required="true">
	<cfset tempSql = "
INSERT INTO USER_MASTER
(user_id,logon,password,last_name,first_name,mailaddress,user_type_id,entry_date,change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'" & dao_escape(arguments.arg004) & "', " & dao_n() & "'" & dao_escape(arguments.arg005) & "', " & dao_n() & "'" & dao_escape(arguments.arg006) & "', " & dao_n() & "'" & dao_escape(arguments.arg007) & "',
" & dao_n() & "'" & dao_escape(arguments.arg008) & " " & dao_escape(arguments.arg009) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_011">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO admin_group
(user_id, group_id, entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_013">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfargument name="arg009" required="true">
	<cfargument name="arg010" required="true">
	<cfargument name="arg011" required="true">
	<cfset tempSql = "
UPDATE USER_MASTER SET logon=" & dao_n() & "'" & dao_escape(arguments.arg001) & "', password=" & dao_n() & "'" & dao_escape(arguments.arg002) & "', last_name=" & dao_n() & "'" & dao_escape(arguments.arg003) & "', first_name=" & dao_n() & "'" & dao_escape(arguments.arg004) & "',
last_name_furi=" & dao_n() & "'" & dao_escape(arguments.arg005) & "', first_name_furi=" & dao_n() & "'" & dao_escape(arguments.arg006) & "', mailaddress=" & dao_n() & "'" & dao_escape(arguments.arg007) & "', user_type_id=" & dao_n() & "'" & dao_escape(arguments.arg008) & "',
change_date=" & dao_n() & "'" & dao_escape(arguments.arg009) & " " & dao_escape(arguments.arg010) & "'
WHERE user_id = " & dao_n() & "'" & dao_escape(arguments.arg011) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_014">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM admin_group
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_015">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO admin_group
(user_id, group_id, entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_016">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM admin_course
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_017">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO admin_course
(user_id, course_id, entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_018">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM admin_menu
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_019">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO admin_menu
(user_id, menu_id, entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_020">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM admin_group
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_021">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM admin_course
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_022">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM admin_menu
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_023">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM USER_MASTER
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_024">
	<cfargument name="arg001" required="true">
<cfif dao_escape(arguments.arg001) eq 0>
	<cfset tempSql = "
SELECT user_id,last_name,first_name, last_name_furi,first_name_furi
FROM USER_MASTER
WHERE (user_type_id = 1 OR user_type_id = 2)
ORDER BY last_name_furi,first_name_furi
">
<cfelse>
	<cfset tempSql = "
SELECT user_id,last_name,first_name, last_name_furi,first_name_furi
FROM USER_MASTER
WHERE user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
ORDER BY last_name_furi,first_name_furi
">
</cfif>
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_025">
	<cfset tempSql = "
SELECT DISTINCT * FROM GROUP_MASTER ORDER BY group_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_026">
	<cfset tempSql = "
SELECT DISTINCT * FROM GROUP_MASTER ORDER BY group_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_029">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "

SELECT GROUP_MASTER.group_id, GROUP_MASTER.group_name
FROM admin_group
LEFT JOIN GROUP_MASTER
ON admin_group.group_id = GROUP_MASTER.group_id
WHERE admin_group.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
ORDER BY GROUP_MASTER.group_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_033">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "

SELECT COURSE_MASTER.course_id, COURSE_MASTER.course_name
FROM admin_course
LEFT JOIN COURSE_MASTER
ON admin_course.course_id = COURSE_MASTER.course_id
WHERE admin_course.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
ORDER BY COURSE_MASTER.course_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_037">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "

SELECT MENU_MASTER.menu_id, MENU_MASTER.menu_name
FROM admin_menu
LEFT JOIN MENU_MASTER
ON admin_menu.menu_id = MENU_MASTER.menu_id
WHERE admin_menu.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'

">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_040">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
" & arguments.arg001 & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="a_regist_cfc_041">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT DISTINCT user_id,last_name,first_name, last_name_furi,first_name_furi
FROM USER_MASTER,GROUP_MASTER
WHERE (logon <> 'admin')
">
<cfif dao_escape(arguments.arg001) neq 0>
<cfset tempSql = tempSql & "
AND ((USER_MASTER.group_id_1 = GROUP_MASTER.group_id)
OR (USER_MASTER.group_id_2 = GROUP_MASTER.group_id)
OR (USER_MASTER.group_id_3 = GROUP_MASTER.group_id))
AND ((USER_MASTER.group_id_1 = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
OR (USER_MASTER.group_id_2 = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
OR (USER_MASTER.group_id_3 = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'))
">
</cfif>
<cfset tempSql = tempSql & "
ORDER BY last_name_furi,first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_002">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
UPDATE USER_LOGON SET logon_time = "&dao_now()&"
WHERE user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_016">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
<!--- 2007/06/27 yukawa add lecture_count --->
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET location = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_018">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
<!--- 2007/06/27 yukawa add lecture_count --->
			<cfset tempSql = "UPDATE SCO_PROGRESS">
			<cfset tempSql = tempSql & " SET tmp_status = " & dao_n() & "'" & dao_escape(arguments.arg004) & "'">
			<cfif arg006 eq "">
				<cfset tempSql = tempSql & " , flag_get_status = '0'">
			<cfelseif arg004 eq arg006>
				<cfset tempSql = tempSql & " , flag_get_status = '1'">
			<cfelse>
				<cfset tempSql = tempSql & " , flag_get_status = '2'">
			</cfif>
			<!--- 20060210(陳)日付追加スタート--->
			<cfset tempSql = tempSql & " , change_date = " & dao_n() & "'" & arguments.arg007 & "'">
			<!---日付追加エンド--->
<!---
			<cfif arguments.arg005 is "">
				<cfset tempSql = tempSql & " , start_date = '" & arguments.arg007 & "'">
			</cfif>
--->
			<cfif arguments.arg004 is "completed" or arguments.arg004 is "passed">
				<cfset tempSql = tempSql & " , end_date = " & dao_n() & "'" & arguments.arg007 & "'">
			</cfif>
			<cfset tempSql = tempSql & " WHERE  (user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "') AND
						        (course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "') AND
						        (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "') AND
						        lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_020">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
<!--- 2007/06/27 yukawa add lecture_count --->
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET score = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
, score_date = "&dao_now()&"
, flag_get_score=" & dao_n() & "'1'
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_021">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
UPDATE SCO_MASTER
SET max_score = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_022">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
UPDATE SCO_MASTER
SET min_score = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_023">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
<!--- 2007/06/27 yukawa add lecture_count --->
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET entry = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_024">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
<!--- 2007/06/27 yukawa add lecture_count --->
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET session_time = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_026">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
<!--- 2007/06/27 yukawa add lecture_count --->
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET total_time = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_028">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
UPDATE COURSE_PROGRESS
SET course_total_time = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_029">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
<!--- 2007/06/27 yukawa add lecture_count --->
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET suspend = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_031">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
<!--- 2007/07/05 mod. by yukawa --->
	<cfset tempSql = "
INSERT INTO ITEMS (user_id, course_id, sco_id, entry_count, id, response_date, change_date , lecture_count)
VALUES (" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'" & dao_escape(arguments.arg004) & "', " & dao_n() & "'" & dao_escape(arguments.arg005) & "', " & dao_n() & "'" & dao_escape(arguments.arg006) & "', "&dao_now()&" , -1)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_032">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
<!--- 2007/07/05 mod. by yukawa --->
	<cfset tempSql = "
UPDATE ITEMS
SET id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND (entry_count = " & dao_n() & "'" & dao_escape(arguments.arg005) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_034">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
<!--- 2007/07/05 mod. by yukawa --->
	<cfset tempSql = "
INSERT INTO ITEMS (id, user_id, course_id, sco_id, entry_count, response_date, response_time, change_date, lecture_count)
VALUES (" & dao_n() & "'" & dao_escape(arguments.arg007) & "', " & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'" & dao_escape(arguments.arg004) & "', " & dao_n() & "'" & dao_escape(arguments.arg006) & "', " & dao_n() & "'" & dao_escape(arguments.arg005) & "', "&dao_now()&" , -1)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_035">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
<!--- 2007/07/05 mod. by yukawa --->
	<cfset tempSql = "
UPDATE ITEMS
SET response_time = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&", id = " & dao_n() & "'" & dao_escape(arguments.arg006) & "'
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND (entry_count = " & dao_n() & "'" & dao_escape(arguments.arg005) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_037">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
<!--- 2007/07/05 mod. by yukawa --->
	<cfset tempSql = "
INSERT INTO ITEMS (id, user_id, course_id, sco_id, entry_count, response_date, type, change_date, lecture_count)
VALUES (" & dao_n() & "'" & dao_escape(arguments.arg007) & "', " & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'" & dao_escape(arguments.arg004) & "', " & dao_n() & "'" & dao_escape(arguments.arg006) & "', " & dao_n() & "'" & dao_escape(arguments.arg005) & "', "&dao_now()&", -1)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_038">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
<!--- 2007/07/05 mod. by yukawa --->
	<cfset tempSql = "
UPDATE ITEMS
SET type = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&", id = " & dao_n() & "'" & dao_escape(arguments.arg006) & "'
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND (entry_count = " & dao_n() & "'" & dao_escape(arguments.arg005) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_040">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
<!--- 2007/07/05 mod. by yukawa --->
	<cfset tempSql = "
INSERT INTO ITEMS (user_id, course_id, sco_id, entry_count, response_date, correct_response, change_date, lecture_count, id)
VALUES (" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'" & dao_escape(arguments.arg004) & "', '" & dao_escape(arguments.arg006) & "', " & dao_n() & "'" & dao_escape(arguments.arg005) & "', "&dao_now()&", -1, '')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_041">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
<!--- 2007/07/05 mod. by yukawa --->
	<cfset tempSql = "
UPDATE ITEMS
SET correct_response = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND (entry_count = " & dao_n() & "'" & dao_escape(arguments.arg005) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_043">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
<!--- 2007/07/05 mod. by yukawa --->
	<cfset tempSql = "
INSERT INTO ITEMS (user_id, course_id, sco_id, entry_count, response_date, weighting, change_date, lecture_count, id)
VALUES (" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'" & dao_escape(arguments.arg004) & "', " & dao_n() & "'" & dao_escape(arguments.arg006) & "', " & dao_n() & "'" & dao_escape(arguments.arg005) & "', "&dao_now()&", -1, '')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_044">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
<!--- 2007/07/05 mod. by yukawa --->
	<cfset tempSql = "
UPDATE ITEMS
SET weighting = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND (entry_count = " & dao_n() & "'" & dao_escape(arguments.arg005) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_046">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
<!--- 2007/07/05 mod. by yukawa --->
	<cfset tempSql = "
INSERT INTO ITEMS (id, user_id, course_id, sco_id, entry_count, response_date, user_response, change_date , lecture_count)
VALUES (" & dao_n() & "'" & dao_escape(arguments.arg007) & "', " & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'" & dao_escape(arguments.arg004) & "', " & dao_n() & "'" & dao_escape(arguments.arg006) & "', " & dao_n() & "'" & dao_escape(arguments.arg005) & "', "&dao_now()&" , -1)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_047">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
<!--- 2007/07/05 mod. by yukawa --->
	<cfset tempSql = "
UPDATE ITEMS
SET user_response = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&", id = " & dao_n() & "'" & dao_escape(arguments.arg006) & "'
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND (entry_count = " & dao_n() & "'" & dao_escape(arguments.arg005) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_049">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
<!--- 2007/07/05 mod. by yukawa --->
	<cfset tempSql = "
INSERT INTO ITEMS (id, user_id, course_id, sco_id, entry_count, response_date, result, change_date, lecture_count)
VALUES (" & dao_n() & "'" & dao_escape(arguments.arg007) & "', " & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'" & dao_escape(arguments.arg004) & "', " & dao_n() & "'" & dao_escape(arguments.arg006) & "', " & dao_n() & "'" & dao_escape(arguments.arg005) & "', "&dao_now()&", -1)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_050">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
<!--- 2007/07/05 mod. by yukawa --->
	<cfset tempSql = "
UPDATE ITEMS
SET result = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&", id = " & dao_n() & "'" & dao_escape(arguments.arg006) & "'
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND (entry_count = " & dao_n() & "'" & dao_escape(arguments.arg005) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_052">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
<!--- 2007/07/05 mod. by yukawa --->
	<cfset tempSql = "
INSERT INTO ITEMS (id, user_id, course_id, sco_id, entry_count, response_date, latency, change_date, lecture_count)
VALUES (" & dao_n() & "'" & dao_escape(arguments.arg007) & "', " & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'" & dao_escape(arguments.arg004) & "', " & dao_n() & "'" & dao_escape(arguments.arg006) & "', " & dao_n() & "'" & dao_escape(arguments.arg005) & "', "&dao_now()&", -1)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_053">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
<!--- 2007/07/05 mod. by yukawa --->
	<cfset tempSql = "
UPDATE ITEMS
SET latency = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&", id = " & dao_n() & "'" & dao_escape(arguments.arg006) & "'
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND (entry_count = " & dao_n() & "'" & dao_escape(arguments.arg005) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_054">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
<!--- 2007/06/27 yukawa add lecture_count --->
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET total_time = SCO_PROGRESS.total_time + SCO_PROGRESS.session_time ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_055">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
UPDATE COURSE_PROGRESS
SET course_total_time = COURSE_PROGRESS.course_total_time + SCO_PROGRESS.session_time ,
change_date = "&dao_now()&"
WHERE (COURSE_PROGRESS.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (COURSE_PROGRESS.course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (SCO_PROGRESS.user_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (SCO_PROGRESS.course_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND (SCO_PROGRESS.sco_id = " & dao_n() & "'" & dao_escape(arguments.arg005) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_056">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
delete from TIME_SPOOL
where user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' and
course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "' and
sco_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_057">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
insert into TIME_SPOOL
(user_id , course_id , sco_id , start_time)
values
(" & dao_n() & "'" & dao_escape(arguments.arg001) & "' , " & dao_n() & "'" & dao_escape(arguments.arg002) & "' , " & dao_n() & "'" & dao_escape(arguments.arg003) & "' , "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_060">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT CONSTRUCT.sco_id, SCO_PROGRESS.status, "&dao_ifnull()&"(SCO_PROGRESS.score , 0) as score
FROM CONSTRUCT,SCO_PROGRESS
WHERE (CONSTRUCT.parent_sco_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (SCO_PROGRESS.user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (SCO_PROGRESS.course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (SCO_PROGRESS.sco_id = CONSTRUCT.sco_id)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_062">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">

  	<cfset tempSql = "UPDATE COURSE_PROGRESS SET course_status = " & dao_n() & "'" &
					dao_escape(arguments.arg001) & "' , change_date = "&dao_now()&"">
  	<cfif arguments.arg004 is "">
   		<cfset tempSql = tempSql & " , start_date = "&dao_now()&"">
  	</cfif>
  	<cfif arguments.arg001 is "completed" or arguments.arg001 is "passed">
   		<cfset tempSql = tempSql & " , end_date = "&dao_now()&"">
  	</cfif>
  	<cfset tempSql = tempSql & " WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "') AND
						(course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "');">

	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_063">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
UPDATE COURSE_PROGRESS
SET course_score = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_064">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET status = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_065">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET score = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_066">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
<!---///////////////////////////////////////////////////////
2007/07/04 mod. yukawa
	<cfset tempSql = "
SELECT SCO_PROGRESS.user_id,SCO_PROGRESS.course_id,SCO_PROGRESS.sco_id,
SCO_MASTER.sco_name, SCO_MASTER.sco_type,
SCO_PROGRESS.status,SCO_PROGRESS.lecture_count,SCO_PROGRESS.score,SCO_PROGRESS.total_time
FROM SCO_PROGRESS,SCO_MASTER
WHERE (SCO_PROGRESS.user_id = " & dao_escape(arguments.arg001) & ") AND
(SCO_PROGRESS.course_id = " & dao_escape(arguments.arg002) & ") AND
(SCO_MASTER.sco_id = SCO_PROGRESS.sco_id) AND
SCO_MASTER.sco_type = 1;
">
////////////////////////////////////////////////////////--->
	<cfset tempSql = "
select "&dao_ifnull()&"(t2.status , 'not attempted') as status
from   (
        select t7.user_id , t5.course_id , t5.sco_id , max("&dao_ifnull()&"(t6.lecture_count , 0)) as m_lc
        from   ASSIGN as t7 inner join CONSTRUCT as t5 on t7.course_id = t5.course_id
               left join SCO_PROGRESS as t6 on t7.user_id = t6.user_id and t5.sco_id = t6.sco_id
               inner join SCO_MASTER as t9 on t5.sco_id = t9.sco_id
        where  t7.user_id = (" & dao_escape(arguments.arg001) & ") and
               t5.course_id = (" & dao_escape(arguments.arg002) & ") and
               t9.sco_type = 1
        group by t7.user_id , t5.course_id , t5.sco_id , t5.order_no , t9.sco_name , t9.sco_type
        ) as t1
left join SCO_PROGRESS as t2 on t1.user_id = t2.user_id and t1.course_id = t2.course_id and t1.sco_id = t2.sco_id and t1.m_lc = t2.lecture_count
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_068">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
Update COURSE_PROGRESS
set c_progress = " & dao_escape(arguments.arg001) & " ,
change_date = "&dao_now()&"
where user_id = " & dao_escape(arguments.arg002) & " and
course_id = " & dao_escape(arguments.arg003) & ";
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_071">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
UPDATE COURSE_PROGRESS
SET course_count = course_count + 1 ,
change_date = "&dao_now()&"
WHERE user_id = " & dao_escape(arguments.arg001) & "
AND course_id = " & dao_escape(arguments.arg002) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_072">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET lecture_count = lecture_count + 1 ,
change_date = "&dao_now()&"
WHERE user_id = " & dao_escape(arguments.arg001) & "
AND course_id = " & dao_escape(arguments.arg002) & "
AND sco_id = " & dao_escape(arguments.arg003) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_074">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET status = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_075">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
UPDATE USER_MASTER SET
student_preference_audio = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
WHERE user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_076">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
UPDATE USER_MASTER SET
student_preference_language = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
WHERE user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_077">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
UPDATE USER_MASTER SET
student_preference_speed = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
WHERE user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_078">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
UPDATE USER_MASTER SET
student_preference_text = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
WHERE user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_079">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
<!--- 2007/06/27 yukawa add lecture_count --->
	<cfset tempSql = "
UPDATE SCO_PROGRESS SET
objectives_json = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
WHERE user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND sco_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
AND course_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "'
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_080">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
<!--- 2007/06/27 yukawa add lecture_count --->
	<cfset tempSql = "
UPDATE SCO_PROGRESS SET
comments_from_learner = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
WHERE user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND sco_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
AND course_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "'
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_081">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
<!--- 2007/06/27 yukawa add lecture_count --->
	<cfset tempSql = "
UPDATE SCO_PROGRESS SET
interactions_json = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
WHERE user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND sco_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
AND course_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "'
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_082">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
<!--- 2007/07/05 yukawa add lecture_count --->
	<cfset tempSql = "
INSERT INTO ITEMS (user_id, course_id, sco_id, entry_count, response_date, objectives_json, change_date, lecture_count , id)
VALUES (" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'" & dao_escape(arguments.arg004) & "', " & dao_n() & "'" & dao_escape(arguments.arg006) & "', " & dao_n() & "'" & dao_escape(arguments.arg005) & "', "&dao_now()&", -1, '')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_083">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
<!--- 2007/07/05 yukawa add lecture_count --->
	<cfset tempSql = "
UPDATE ITEMS
SET objectives_json = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND (entry_count = " & dao_n() & "'" & dao_escape(arguments.arg005) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_084">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
<!--- 2007/07/05 yukawa add lecture_count --->
	<cfset tempSql = "
INSERT INTO ITEMS (id, user_id, course_id, sco_id, entry_count, response_date, correct_responses_json, change_date, lecture_count)
VALUES (" & dao_n() & "'" & dao_escape(arguments.arg007) & "', " & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'" & dao_escape(arguments.arg004) & "', " & dao_n() & "'" & dao_escape(arguments.arg006) & "', " & dao_n() & "'" & dao_escape(arguments.arg005) & "', "&dao_now()&", -1)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_085">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
<!--- 2007/07/05 yukawa add lecture_count --->
	<cfset tempSql = "
UPDATE ITEMS
SET correct_responses_json = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&", id = " & dao_n() & "'" & dao_escape(arguments.arg006) & "'
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
AND (entry_count = " & dao_n() & "'" & dao_escape(arguments.arg005) & "')
AND lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_086">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
<!--- 2007/06/27 yukawa add lecture_count --->
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET status = tmp_status ,
    change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (lecture_count = -1)
">
<!---
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET status = tmp_status ,
    lecture_count = " & dao_escape(arguments.arg004) & " ,
    change_date = "&dao_now()&"
WHERE (user_id = '" & dao_escape(arguments.arg001) & "')
AND (course_id = '" & dao_escape(arguments.arg002) & "')
AND (sco_id = '" & dao_escape(arguments.arg003) & "')
AND (lecture_count = -1)
">
--->
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_087">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
<!-----
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET tmp_status = 'incomplete' ,
change_date = "&dao_now()&"
WHERE (user_id = '" & dao_escape(arguments.arg001) & "')
AND (course_id = '" & dao_escape(arguments.arg002) & "')
AND (sco_id = '" & dao_escape(arguments.arg003) & "')
">
----->
<!--- 2007/06/27 yukawa add lecture_count --->
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET status = " & dao_n() & "'incomplete' ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (lecture_count = -1)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_088">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
UPDATE COURSE_PROGRESS
SET course_status = " & dao_n() & "'" & dao_escape(arguments.arg003) & "' ,
change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_089">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset var qGetMax = "">
	<cfquery name="qGetMax" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
		SELECT #dao_ifnull()#(MAX(lecture_count), -1) AS m_lc
		FROM ITEMS
		WHERE user_id   = '#dao_escape(arguments.arg001)#' AND
		      course_id = '#dao_escape(arguments.arg002)#' AND
		      sco_id    = '#dao_escape(arguments.arg003)#'
	</cfquery>
	<cfset tempSql = "
SELECT *
FROM ITEMS
WHERE user_id   = " & dao_escape(arguments.arg001) & " AND
      course_id = " & dao_escape(arguments.arg002) & " AND
      sco_id    = " & dao_escape(arguments.arg003) & " AND
      lecture_count = " & qGetMax.m_lc & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_090">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
select eLM_total_time as mt , lecture_count as m_lc , start_date as m_sd
from   SCO_PROGRESS
where  user_id   = " & dao_escape(arguments.arg001) & " and
       course_id = " & dao_escape(arguments.arg002) & " and
       sco_id    = " & dao_escape(arguments.arg003) & "
order by lecture_count DESC
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_090_1">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
select max(eLM_total_time) as mt , max(lecture_count) as m_lc , max(start_date) as m_sd, max(end_date) as m_ed
from   SCO_PROGRESS
where  user_id   = " & dao_escape(arguments.arg001) & " and
       course_id = " & dao_escape(arguments.arg002) & " and
       sco_id    = " & dao_escape(arguments.arg003) & "
group by user_id, course_id, sco_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_090_2">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
select eLM_total_time as mt
from   SCO_PROGRESS
where  user_id   = " & dao_escape(arguments.arg001) & " and
       course_id = " & dao_escape(arguments.arg002) & " and
       sco_id    = " & dao_escape(arguments.arg003) & " and
       lecture_count   = " & dao_escape(arguments.arg004)-1 & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_091">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfset tempSql = "
update SCO_PROGRESS
set    eLM_session_time = " & dao_escape(arguments.arg005) & " ,
       eLM_total_time = " & dao_escape(arguments.arg005) & " + " & dao_escape(arguments.arg006) & " ,
       end_date = " & dao_n() & "'" & dao_escape(arguments.arg007) & "'
where user_id   = " & dao_escape(arguments.arg001) & " and
      course_id = " & dao_escape(arguments.arg002) & " and
      sco_id    = " & dao_escape(arguments.arg003) & " and
      lecture_count =  " & dao_escape(arguments.arg004) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_092">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
update COURSE_PROGRESS
set    eLM_total_time = eLM_total_time + " & dao_escape(arguments.arg003) & "
where user_id   = " & dao_escape(arguments.arg001) & " and
      course_id = " & dao_escape(arguments.arg002) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_093">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET lecture_count = " & dao_escape(arguments.arg004) & " ,
    status = tmp_status ,
    change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (lecture_count = -1)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ApiSql_cfc_094">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
UPDATE SCO_PROGRESS
SET lecture_count = " & dao_escape(arguments.arg004) & " ,
    change_date = "&dao_now()&"
WHERE (user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (lecture_count = -1)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="auto_mail_cfc_005">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
select USER_MASTER.mailaddress , course_progress.course_score
from USER_MASTER , course_progress
where USER_MASTER.user_id = course_progress.user_id and
course_progress.user_id = " & dao_escape(arguments.arg001) & " and
course_progress.course_id = " & dao_escape(arguments.arg002) & " and
course_progress.mail_flag = 0;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="auto_mail_cfc_007">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
update course_progress
set mail_flag = 1 ,
change_date = "&dao_now()&"
where user_id = " & dao_escape(arguments.arg001) & " and
course_id = " & dao_escape(arguments.arg002) & ";
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="auto_mail_cfc_008">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select last_name || first_name as full_name , password , logon
from USER_MASTER
where user_id = " & dao_escape(arguments.arg001) & ";
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="bbs_admin_cfc_001">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
Insert into BBS
(bbs_user_id , title , contents , effective , entry_date, change_date)
values
(" & dao_n() & "'" & dao_escape(arguments.arg001) & "' , " & dao_n() & "'" & dao_escape(arguments.arg002) & "' , " & dao_n() & "'" & dao_escape(arguments.arg003) & "' , 1 , "&dao_now()&", "&dao_now()&");
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="bbs_admin_cfc_002">
<!---
	<cfset tempSql = "
select count(*) as counter
from BBS
where effective = 1;
">
--->
	<cfset tempSql = "
select count(*) as counter
from BBS, USER_MASTER
where effective = 1
and BBS.bbs_user_id = USER_MASTER.user_id;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="bbs_admin_cfc_005">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
<!---
	<cfset tempSql = "
update BBS
set bbs_user_id = " & dao_escape(arguments.arg001) & " ,
title = '" & dao_escape(arguments.arg002) & "' ,
contents = '" & dao_escape(arguments.arg003) & "' ,
change_date = "&dao_now()&"
where serial = " & dao_escape(arguments.arg004) & ";
">
--->
<!--- 管理者が記事を編集しても投稿者を更新しないよう変更 --->
	<cfset tempSql = "
update BBS
set title = " & dao_n() & "'" & dao_escape(arguments.arg002) & "' ,
contents = " & dao_n() & "'" & dao_escape(arguments.arg003) & "' ,
change_date = "&dao_now()&"
where serial = " & dao_n() & "'" & dao_escape(arguments.arg004) & "';
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="bbs_admin_cfc_006">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
update BBS
set effective = 0 ,
change_date = "&dao_now()&"
where serial = " & dao_n() & "'" & dao_escape(arguments.arg001) & "';
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="bbs_admin_cfc_007">
	<cfset tempSql = "
select BBS.serial, BBS.bbs_user_id, BBS.title, BBS.contents, BBS.effective, BBS.entry_date, BBS.change_date, um.last_name, um.first_name
from BBS, USER_MASTER as um
where BBS.effective = '1'
and BBS.bbs_user_id = um.user_id
order by BBS.serial desc;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="bbs_admin_cfc_008">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select BBS.serial, BBS.bbs_user_id, BBS.title, BBS.contents, BBS.effective, BBS.entry_date, BBS.change_date, um.last_name, um.first_name
from bbs, USER_MASTER as um
where BBS.effective = " & dao_n() & "'1'
and BBS.serial = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
and BBS.bbs_user_id = um.user_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="bbs_user_cfc_001">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
Insert into BBS
(bbs_user_id , title , contents , effective , entry_date, change_date)
values
(" & dao_n() & "'" & dao_escape(arguments.arg001) & "' , " & dao_n() & "'" & dao_escape(arguments.arg002) & "' , " & dao_n() & "'" & dao_escape(arguments.arg003) & "' , 1 , "&dao_now()&", "&dao_now()&");
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="bbs_user_cfc_002">
<!---
	<cfset tempSql = "
select count(*) as counter
from BBS
where effective = 1;
">
--->
	<cfset tempSql = "
select count(*) as counter
from BBS, USER_MASTER
where effective = 1
and BBS.bbs_user_id = USER_MASTER.user_id;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="bbs_user_cfc_005">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
update BBS
set bbs_user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
title = " & dao_n() & "'" & dao_escape(arguments.arg002) & "' ,
contents = " & dao_n() & "'" & dao_escape(arguments.arg003) & "' ,
change_date = "&dao_now()&"
where serial = " & dao_n() & "'" & dao_escape(arguments.arg004) & "';
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="bbs_user_cfc_006">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
update BBS
set effective = 0 ,
change_date = "&dao_now()&"
where serial = " & dao_n() & "'" & dao_escape(arguments.arg001) & "';
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="bbs_user_cfc_007">
	<cfset tempSql = "
select t1.serial , t1.title , t1.entry_date , t2.last_name || t2.first_name as full_name
from   BBS as t1 , USER_MASTER as t2
where  t1.effective = 1 and
       t1.bbs_user_id = t2.user_id
order by serial desc
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="bbs_user_cfc_008">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select t1.serial, t1.bbs_user_id , t1.title , t1.contents , t1.entry_date , t2.last_name || t2.first_name as full_name
from   BBS as t1 , USER_MASTER as t2
where  t1.effective = 1 and
       t1.bbs_user_id = t2.user_id and
       t1.serial = #arg001#
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------------------------------------------------- c_regist ---->
<cffunction name="c_regist_cfc_001">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
UPDATE USER_LOGON
SET USER_LOGON.logon_time = "&dao_now()&"
WHERE USER_LOGON.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_007">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
INSERT INTO CHECK_STATE (course_id, change_date) VALUES (" & dao_n() & "'" & dao_escape(arguments.arg001) & "', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_008">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM CHECK_STATE
WHERE course_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_009">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
UPDATE SCO_MASTER
SET sco_name = " & dao_n() & "'" & dao_escape(arguments.arg001) & "',
change_date = "&dao_now()&"
WHERE sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_011">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfargument name="arg009" required="true">
	<cfset tempSql = "
UPDATE COURSE_MASTER
SET course_no = " & dao_n() & "'" & dao_escape(arguments.arg001) & "',
course_name = " & dao_n() & "'" & dao_escape(arguments.arg002) & "',
course_guide = " & dao_n() & "'" & dao_escape(arguments.arg003) & "',
regist_flag = " & dao_n() & "'" & dao_escape(arguments.arg004) & "',
course_time_hour = " & dao_n() & "'" & dao_escape(arguments.arg005) & "',
course_time_min = " & dao_n() & "'" & dao_escape(arguments.arg006) & "',
start_date = " & dao_n() & "'" & dao_escape(arguments.arg007) & "',
complete_count = " & dao_n() & "'" & dao_escape(arguments.arg008) & "',
change_date = "&dao_now()&"
WHERE course_id = " & dao_n() & "'" & dao_escape(arguments.arg009) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_012">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT SCO_MASTER.sco_name
FROM CONSTRUCT INNER JOIN
SCO_MASTER ON CONSTRUCT.sco_id = SCO_MASTER.sco_id
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (SCO_MASTER.sco_name = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (SCO_MASTER.sco_id <> " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_013">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfargument name="arg009" required="true">
	<cfargument name="arg010" required="true">
	<cfargument name="arg011" required="true">
	<cfargument name="arg012" required="true"><!--- add 20070412 tanaka SCO試用フラグ追加 --->
	<cfset tempSql = "
UPDATE SCO_MASTER
SET sco_name = " & dao_n() & "'" & dao_escape(arguments.arg001) & "',
url = " & dao_n() & "'" & dao_escape(arguments.arg002) & "',
sco_guide = " & dao_n() & "'" & dao_escape(arguments.arg003) & "',
launch = " & dao_n() & "'" & dao_escape(arguments.arg004) & "',
max_score = " & dao_n() & "'" & dao_escape(arguments.arg005) & "',
mastery_score = " & dao_n() & "'" & dao_escape(arguments.arg006) & "',
class_id = " & dao_n() & "'" & dao_escape(arguments.arg007) & "',
lecture_time_hour = " & dao_n() & "'" & dao_escape(arguments.arg008) & "',
lecture_time_min = " & dao_n() & "'" & dao_escape(arguments.arg009) & "',
review_count = " & dao_n() & "'" & dao_escape(arguments.arg010) & "',
flag_trial = " & dao_n() & "'" & dao_escape(arguments.arg012) & "',
change_date = "&dao_now()&"
WHERE sco_id = " & dao_n() & "'" & dao_escape(arguments.arg011) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_014">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
DELETE FROM PRECONDITION
WHERE (PRECONDITION.course_id = '" & dao_escape(arguments.arg001) & "')
AND (PRECONDITION.sco_id = '" & dao_escape(arguments.arg002) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_015">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT SCO_MASTER.sco_id
FROM SCO_MASTER INNER JOIN
CONSTRUCT ON SCO_MASTER.sco_id = CONSTRUCT.sco_id
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND ((sco_name = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
">
<cfloop index="loopcount" from="2" to="#ArrayLen(arguments.arg003)#">
<cfset tempSql = tempSql & "
OR (sco_name = " & dao_n() & "'" & arguments.arg003[loopcount] & "')
">
</cfloop>
<cfset tempSql = tempSql & "
)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_016">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
INSERT INTO PRECONDITION
(course_id, sco_id, pre_sco_id, entry_date, change_date)
VALUES
(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', "&dao_now()&", "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_018">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM SCO_MASTER
WHERE sco_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_019">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM COURSE_MASTER
WHERE course_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_020">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM CONSTRUCT
WHERE course_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_021">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM CHECK_STATE
WHERE course_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_022">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM COURSE_PROGRESS
WHERE course_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_023">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM SCO_PROGRESS
WHERE course_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_024">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM ITEMS
WHERE course_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_025">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM PRECONDITION
WHERE course_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_026">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM ASSIGN
WHERE course_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_027">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM admin_course
WHERE course_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_029">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM SCO_MASTER
WHERE sco_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_030">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
DELETE FROM CONSTRUCT
WHERE (course_id = '" & dao_escape(arguments.arg001) & "')
AND (sco_id = '" & dao_escape(arguments.arg002) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_031">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
DELETE FROM SCO_PROGRESS
WHERE (course_id = '" & dao_escape(arguments.arg001) & "')
AND (sco_id = '" & dao_escape(arguments.arg002) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_032">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
DELETE FROM ITEMS
WHERE (course_id = '" & dao_escape(arguments.arg001) & "')
AND (sco_id = '" & dao_escape(arguments.arg002) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_033">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
DELETE FROM PRECONDITION
WHERE (course_id = '" & dao_escape(arguments.arg001) & "')
AND ((sco_id = '" & dao_escape(arguments.arg002) & "') OR (pre_sco_id = '" & dao_escape(arguments.arg003) & "'))
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_035">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT CONSTRUCT.sco_id, SCO_MASTER.sco_type
FROM CONSTRUCT, SCO_MASTER
WHERE (CONSTRUCT.parent_sco_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (CONSTRUCT.sco_id = SCO_MASTER.sco_id)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_036">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM SCO_MASTER
WHERE sco_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_037">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM CONSTRUCT
WHERE sco_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_038">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM SCO_PROGRESS
WHERE sco_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_039">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM ITEMS
WHERE sco_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_040">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
DELETE FROM PRECONDITION
WHERE (sco_id = '" & dao_escape(arguments.arg001) & "')
OR (pre_sco_id = '" & dao_escape(arguments.arg002) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_041">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM SCO_MASTER
WHERE sco_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_042">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM CONSTRUCT
WHERE sco_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_043">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM SCO_PROGRESS
WHERE sco_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_044">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM ITEMS
WHERE sco_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_047">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
INSERT INTO COURSE_MASTER
(course_id, course_no, course_name, regist_flag, course_time_hour, course_time_min, complete_count, entry_date, start_date, change_date)
VALUES
(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'新規コース', 0, 0, 0, 0, "&dao_now()&", "&dao_now()&", "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_048">
	<!--- 全コース割り当てはassignではなくUSER_MASTERのフラグで判断する 20061120 tanaka --->
	<!----------
	<cfset tempSql = "
SELECT USER_MASTER.user_id from USER_MASTER
LEFT JOIN ASSIGN ON ASSIGN.user_id = USER_MASTER.user_id
where ASSIGN.user_id is null
">
---------->
	<cfset tempSql = "
SELECT user_id
FROM USER_MASTER
WHERE flag_all_course = '1'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_049">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
INSERT INTO COURSE_PROGRESS (user_id, course_id, course_status, course_count, course_score, course_total_time, change_date) VALUES (" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'not attempted', 0, 0, " & dao_n() & "'0000:00:00', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_050">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
INSERT INTO CHECK_STATE (course_id, change_date) VALUES (" & dao_n() & "'" & dao_escape(arguments.arg001) & "', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_052">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
INSERT INTO admin_course
(user_id, course_id, entry_date, change_date)
VALUES
(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', "&dao_now()&", "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_055">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfset tempSql = "
INSERT INTO SCO_MASTER
(sco_id, sco_type, sco_name, url, class_id, lecture_time_hour, lecture_time_min, max_score, mastery_score, min_score, review_count, entry_date, change_date)
VALUES
(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'" & dao_escape(arguments.arg004) & "', 1, 0, 0, " & dao_n() & "'" & dao_escape(arguments.arg005) & "', " & dao_n() & "'" & dao_escape(arguments.arg006) & "', " & dao_n() & "'" & dao_escape(arguments.arg007) & "', 0, "&dao_now()&", "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_056">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT CONSTRUCT.parent_sco_id, CONSTRUCT.order_no, SCO_MASTER.sco_type
FROM CONSTRUCT, SCO_MASTER
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (CONSTRUCT.sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (CONSTRUCT.sco_id = SCO_MASTER.sco_id)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_057">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT CONSTRUCT.parent_sco_id, CONSTRUCT.order_no
FROM CONSTRUCT, SCO_MASTER
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (CONSTRUCT.sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_058">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT CONSTRUCT.parent_sco_id,
CONSTRUCT.order_no,
CONSTRUCT.sco_id,
SCO_MASTER.sco_type
FROM CONSTRUCT INNER JOIN
SCO_MASTER ON CONSTRUCT.sco_id = SCO_MASTER.sco_id
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (CONSTRUCT.parent_sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
ORDER BY CONSTRUCT.order_no DESC
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_059">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
INSERT INTO CONSTRUCT
(course_id, parent_sco_id, order_no, sco_id, entry_date, change_date)
VALUES
(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', 0, " & dao_n() & "'" & dao_escape(arguments.arg003) & "', "&dao_now()&", "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- score`s default value is not (0) but (null) --->
<cffunction name="c_regist_cfc_061">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
INSERT INTO SCO_PROGRESS
(user_id, course_id, sco_id, status, lecture_count, entry, score, total_time, session_time, change_date)
VALUES
(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'not attempted', 0, " & dao_n() & "'ab-initio', null, " & dao_n() & "'0000:00:00', " & dao_n() & "'0000:00:00', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_063">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
UPDATE CONSTRUCT
SET order_no = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_064">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
UPDATE CONSTRUCT
SET order_no = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (order_no = 0)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_065">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
UPDATE CONSTRUCT
SET order_no = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (sco_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_066">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT SCO_MASTER.sco_name
FROM SCO_MASTER, CONSTRUCT
WHERE (SCO_MASTER.sco_id = CONSTRUCT.sco_id)
AND (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (SCO_MASTER.sco_type = 1)
ORDER BY CONSTRUCT.order_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_067">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT DISTINCT SCO_MASTER.sco_name
FROM SCO_MASTER, PRECONDITION
WHERE (SCO_MASTER.sco_id = PRECONDITION.pre_sco_id)
AND (PRECONDITION.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (PRECONDITION.sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
ORDER BY SCO_MASTER.sco_name
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_069">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT SCO_MASTER.sco_type, CONSTRUCT.parent_sco_id, CONSTRUCT.order_no
FROM CONSTRUCT, SCO_MASTER
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (CONSTRUCT.sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (CONSTRUCT.sco_id = SCO_MASTER.sco_id)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_071">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT CONSTRUCT.parent_sco_id,
CONSTRUCT.order_no,
CONSTRUCT.sco_id,
SCO_MASTER.sco_type
FROM CONSTRUCT INNER JOIN
SCO_MASTER ON CONSTRUCT.sco_id = SCO_MASTER.sco_id
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (CONSTRUCT.parent_sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
ORDER BY CONSTRUCT.order_no DESC
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--------
<cffunction name="c_regist_cfc_072">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
SELECT *
FROM CONSTRUCT
WHERE (CONSTRUCT.course_id = '" & dao_escape(arguments.arg001) & "')
<cfif fromOrderNo gt forOrderNo>
<cfset forOrderNo = forOrderNo + 1>
AND ((CONSTRUCT.order_no >= '" & dao_escape(arguments.arg002) & "') AND (CONSTRUCT.order_no < '" & dao_escape(arguments.arg003) & "'))
<cfelse>
AND ((CONSTRUCT.order_no > '" & dao_escape(arguments.arg004) & "') AND (CONSTRUCT.order_no <= '" & dao_escape(arguments.arg005) & "'))
</cfif>
ORDER BY CONSTRUCT.order_no
">
	<cfreturn tempSql>
</cffunction>
-------->
<cffunction name="c_regist_cfc_072">
	<cfargument name="arg001" required="true"> <!--- fromCourseID --->
	<cfargument name="arg002" required="true"> <!--- forOrderNo --->
	<cfargument name="arg003" required="true"> <!--- fromOrderNo --->
	<cfset tempSql = "
SELECT *
FROM CONSTRUCT
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
">

<cfif arguments.arg003 gt arguments.arg002>
	<cfset arguments.arg002 = arguments.arg002 + 1>
	<cfset tempSql = tempSql & "
AND ((CONSTRUCT.order_no >= " & dao_n() & "'" & dao_escape(arguments.arg002) & "') AND (CONSTRUCT.order_no < " & dao_n() & "'" & dao_escape(arguments.arg003) & "'))
">
<cfelse>
	<cfset tempSql = tempSql & "
AND ((CONSTRUCT.order_no > " & dao_n() & "'" & dao_escape(arguments.arg003) & "') AND (CONSTRUCT.order_no <= " & dao_n() & "'" & dao_escape(arguments.arg002) & "'))
">
</cfif>
<cfset tempSql = tempSql & "
ORDER BY CONSTRUCT.order_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_073">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
UPDATE CONSTRUCT
SET CONSTRUCT.order_no = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (CONSTRUCT.sco_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_074">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
UPDATE CONSTRUCT
SET CONSTRUCT.order_no = " & dao_n() & "'" & dao_escape(arguments.arg001) & "',
CONSTRUCT.parent_sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "' ,
change_date = "&dao_now()&"
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (CONSTRUCT.sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_076">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT CONSTRUCT.parent_sco_id,
CONSTRUCT.order_no,
CONSTRUCT.sco_id,
SCO_MASTER.sco_type
FROM CONSTRUCT INNER JOIN
SCO_MASTER ON CONSTRUCT.sco_id = SCO_MASTER.sco_id
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (CONSTRUCT.parent_sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
ORDER BY CONSTRUCT.order_no DESC
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_077">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT SCO_MASTER.sco_type, CONSTRUCT.parent_sco_id, CONSTRUCT.order_no
FROM CONSTRUCT, SCO_MASTER
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (CONSTRUCT.sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (CONSTRUCT.sco_id = SCO_MASTER.sco_id)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_079">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT CONSTRUCT.parent_sco_id,
CONSTRUCT.order_no,
CONSTRUCT.sco_id,
SCO_MASTER.sco_type
FROM CONSTRUCT INNER JOIN
SCO_MASTER ON CONSTRUCT.sco_id = SCO_MASTER.sco_id
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (CONSTRUCT.parent_sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
ORDER BY CONSTRUCT.order_no DESC
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_080">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
SELECT *
FROM CONSTRUCT
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
">
<cfif arguments.arg004 gt arguments.arg002>
<cfset tempSql = tempSql & "
AND ((CONSTRUCT.order_no > " & dao_n() & "'" & dao_escape(arguments.arg002) & "') AND (CONSTRUCT.order_no <= " & dao_n() & "'" & dao_escape(arguments.arg003) & "'))
">
<cfelse>
<cfset tempSql = tempSql & "
AND ((CONSTRUCT.order_no >= " & dao_n() & "'" & dao_escape(arguments.arg004) & "') AND (CONSTRUCT.order_no <= " & dao_n() & "'" & dao_escape(arguments.arg005) & "'))
">
</cfif>
<cfset tempSql = tempSql & "
ORDER BY CONSTRUCT.order_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_081">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">

	<cfargument name="arg100" required="true">
	<cfargument name="arg101" required="true">
	<cfset tempSql = "
UPDATE CONSTRUCT
SET CONSTRUCT.order_no = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
">
<cfif arguments.arg100 eq arguments.arg101>
<cfset tempSql = tempSql & "
, CONSTRUCT.parent_sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
</cfif>
<cfset tempSql = tempSql & "
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (CONSTRUCT.sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_082">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
UPDATE CONSTRUCT
SET CONSTRUCT.order_no = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
AND (CONSTRUCT.sco_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="c_regist_cfc_083">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">

	<cfargument name="arg100" required="true">
	<cfargument name="arg101" required="true">
	<cfset tempSql = "
UPDATE CONSTRUCT
SET CONSTRUCT.order_no = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
change_date = "&dao_now()&"
">
<cfif arguments.arg100 eq arguments.arg101>
<cfset tempSql = tempSql & "
, CONSTRUCT.parent_sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
</cfif>
<cfset tempSql = tempSql & "
WHERE (CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "')
AND (CONSTRUCT.sco_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="comp_cfc_002">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select "&dao_ifnull()&"(max(counter) , '0') as count
from COMP_COUNTER
where course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "';
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="comp_cfc_003">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
insert into COMP_COUNTER
(user_id , course_id , counter , entry_date)
values
(" & dao_n() & "'" & dao_escape(arguments.arg001) & "' , " & dao_n() & "'" & dao_escape(arguments.arg002) & "' , " & dao_escape(arguments.arg003) & " , "&dao_now()&");
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="comp_cfc_004">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
select t1.last_name , t1.first_name , t2.end_date
from USER_MASTER as t1 , COURSE_PROGRESS as t2
where t1.user_id = t2.user_id and
t2.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' and
t2.course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "';
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="course_info_cfc_002">
	<cfset tempSql = "
delete from course_open;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="course_info_cfc_003">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
Insert into course_open
(title , contents , effective , entry_date, change_date)
values
(" & dao_n() & "'" & dao_escape(arguments.arg002) & "' , " & dao_n() & "'" & dao_escape(arguments.arg001) & "' , 1 , "&dao_now()&", "&dao_now()&");
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="course_info_cfc_005">
	<cfset tempSql = "
delete from jukou_open;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="course_info_cfc_006">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
Insert into jukou_open
(title , contents , effective , entry_date, change_date)
values
(" & dao_n() & "'" & dao_escape(arguments.arg002) & "' , " & dao_n() & "'" & dao_escape(arguments.arg001) & "' , 1 , "&dao_now()&", "&dao_now()&");
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="course_info_cfc_008">
	<cfset tempSql = "
delete from toiawase_open;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="course_info_cfc_009">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
Insert into toiawase_open
(title , contents , effective , entry_date, change_date)
values
(" & dao_n() & "'" & dao_escape(arguments.arg002) & "' , " & dao_n() & "'" & dao_escape(arguments.arg001) & "' , 1 , "&dao_now()&", "&dao_now()&");
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------------------------------------------------- default ---->
<cffunction name="default_cfc_002">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT *
FROM COURSE_MASTER, COURSE_PROGRESS
WHERE COURSE_PROGRESS.user_id = " & dao_escape(arguments.arg001) & "
AND COURSE_PROGRESS.course_id = COURSE_MASTER.course_id
ORDER BY COURSE_MASTER.course_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="default_cfc_003">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT *
FROM ASSIGN, COURSE_MASTER, COURSE_PROGRESS
WHERE (COURSE_MASTER.course_id = ASSIGN.course_id)
AND (COURSE_PROGRESS.course_id = ASSIGN.course_id)
AND (ASSIGN.user_id = " & dao_escape(arguments.arg001) & ")
AND (COURSE_PROGRESS.user_id = " & dao_escape(arguments.arg002) & ")
ORDER BY COURSE_MASTER.course_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="default_cfc_005">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
<!---////////////////////////////////////////////////////////////
2007/0702 湯川
成績の持ち方が変わったためコメントアウト
	<cfset tempSql = "
SELECT SCO_MASTER.sco_name,
SCO_MASTER.sco_type,
SCO_MASTER.sco_id,
SCO_PROGRESS.status
FROM CONSTRUCT,
SCO_MASTER,
SCO_PROGRESS
WHERE CONSTRUCT.course_id = '" & dao_escape(arguments.arg001) & "'
AND CONSTRUCT.parent_sco_id = '" & dao_escape(arguments.arg002) & "'
AND CONSTRUCT.sco_id = SCO_MASTER.sco_id
AND SCO_PROGRESS.user_id = '" & dao_escape(arguments.arg003) & "'
AND SCO_MASTER.sco_id = SCO_PROGRESS.sco_id
ORDER BY CONSTRUCT.order_no
">
////////////////////////////////////////////////////////////--->

	<cfset tempSql = "
SELECT t2.sco_name , t2.sco_type , t2.sco_id , "&dao_ifnull()&"(t3.status , 'not attempted') as status
FROM ASSIGN as t4 left join CONSTRUCT as t1 on t4.course_id = t1.course_id
inner join SCO_MASTER as t2 on t1.sco_id = t2.sco_id
left join SCO_PROGRESS as t3 on t1.sco_id = t3.sco_id and t4.user_id = t3.user_id
WHERE
t4.user_id =  " & dao_n() & "'" & dao_escape(arguments.arg003) & "' and
t1.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' AND
t1.parent_sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
ORDER BY t1.order_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="default_cfc_008">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT SCO_MASTER.sco_name
FROM PRECONDITION, SCO_MASTER, CONSTRUCT
WHERE (PRECONDITION.pre_sco_id = SCO_MASTER.sco_id)
AND (SCO_MASTER.sco_id = CONSTRUCT.sco_id)
AND (PRECONDITION.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
AND (PRECONDITION.sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
order by order_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="default_cfc_010">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT DISTINCT SCO_PROGRESS.status
FROM SCO_PROGRESS INNER JOIN
PRECONDITION ON SCO_PROGRESS.course_id = PRECONDITION.course_id
AND SCO_PROGRESS.sco_id = PRECONDITION.pre_sco_id
WHERE (SCO_PROGRESS.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "') AND (PRECONDITION.sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="default_cfc_012">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM USER_LOGON
WHERE ("&dao_date_add('logon_time',dao_escape(arguments.arg001))&" <= "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="default_cfc_014">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
UPDATE USER_LOGON
SET course_id = " & dao_escape(arguments.arg001) & ",
logon_time = "&dao_now()&"
WHERE user_id = " & dao_escape(arguments.arg002) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="GetData_cfc_004">
	<cfargument name="arg001" required="true">
<!---
	<cfset tempSql = "
SELECT COURSE_MASTER.*, CHECK_STATE.course_id as check_state
FROM   COURSE_MASTER , admin_course
LEFT JOIN CHECK_STATE ON CHECK_STATE.course_id = COURSE_MASTER.course_id
WHERE  admin_course.course_id = COURSE_MASTER.course_id
AND admin_course.user_id = " & dao_escape(arguments.arg001) & "
ORDER BY COURSE_MASTER.course_id
">
--->
	<cfset tempSql = "
SELECT COURSE_MASTER.*, CHECK_STATE.course_id as check_state
FROM   COURSE_MASTER
inner join admin_course on 1=1
LEFT JOIN CHECK_STATE ON CHECK_STATE.course_id = COURSE_MASTER.course_id
WHERE  admin_course.course_id = COURSE_MASTER.course_id
AND admin_course.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
ORDER BY COURSE_MASTER.course_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="GetData_cfc_005">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT SCO_MASTER.sco_name,
SCO_MASTER.sco_type,
SCO_MASTER.sco_id,
CONSTRUCT.order_no
FROM CONSTRUCT,
SCO_MASTER
WHERE CONSTRUCT.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND CONSTRUCT.parent_sco_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND CONSTRUCT.sco_id = SCO_MASTER.sco_id
ORDER BY CONSTRUCT.order_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="GetData_cfc_006">
	<cfset tempSql = "
SELECT cm.* , cs.course_id as check_state
FROM   COURSE_MASTER as cm
LEFT JOIN CHECK_STATE as cs ON cs.course_id = cm.course_id
ORDER BY cm.course_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="GetData_cfc_007">
	<cfset tempSql = "
SELECT cm.*, cs.course_id as check_state
FROM   COURSE_MASTER as cm
LEFT JOIN CHECK_STATE as cs ON cs.course_id = cm.course_id
ORDER BY cm.course_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_001">
	<cfset tempSql = "
SELECT MAX(manifest_id) AS manifestid
FROM MANIFEST
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_002">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT MAX(metadata_id) AS metadataid
FROM METADATA
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_003">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT MAX(o_organization_id) AS organizationid
FROM O_ORGANIZATION
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_004">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(o_item_id) AS itemid
FROM O_ITEM
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND o_organization_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_005">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT MAX(r_resource_id) AS resourceid
FROM R_RESOURCE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_006">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(r_file_id) AS fileid
FROM R_FILE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND r_resource_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_007">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(r_dependency_id) AS dependencyid
FROM R_DEPENDENCY
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND r_resource_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_008">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(g_title_id) AS gtitleid
FROM G_TITLE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_009">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(g_catalogentry_id) AS gcatalogid
FROM G_CATALOGENTRY
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_010">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(g_entry_id) AS gentryid
FROM G_CATALOGENTRY_ENTRY
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND g_catalogentry_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_011">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(g_language_id) AS glanguageid
FROM G_LANGUAGE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_012">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(g_description_id) AS gdescriptionid
FROM G_DESCRIPTION
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_013">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(g_lang_id) AS gdesclangid
FROM G_DESCRIPTION
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND g_description_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_014">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(g_keyword_id) AS gkeywordid
FROM G_KEYWORD
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_015">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(g_lang_id) AS gkwlangid
FROM G_KEYWORD
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND g_keyword_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_016">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(g_coverage_id) AS gcoverageid
FROM G_COVERAGE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_017">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(g_lang_id) AS gcovlangid
FROM G_COVERAGE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND g_coverage_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_018">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(l_version_id) AS lversionid
FROM L_VERSION
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_019">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(l_contribute_id) AS lcontributeid
FROM L_CONTRIBUTE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_020">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(l_centity_id) AS lcentityid
FROM L_CONTRIBUTE_CENTITY
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND l_contribute_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_021">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(l_date_id) AS ldateid
FROM L_CONTRIBUTE_DATE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND l_contribute_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_022">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(m_catalogentry_id) AS mcatalogid
FROM M_CATALOGENTRY
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_023">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(m_entry_id) AS mentryid
FROM M_CATALOGENTRY_ENTRY
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND m_catalogentry_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_024">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(m_contribute_id) AS mcontributeid
FROM M_CONTRIBUTE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_025">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(m_centity_id) AS mcentityid
FROM M_CONTRIBUTE_CENTITY
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND m_contribute_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_026">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(m_date_id) AS mdateid
FROM M_CONTRIBUTE_DATE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND m_contribute_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_027">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(m_scheme_id) AS mschemeid
FROM M_SCHEME
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_028">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(t_format_id) AS tformatid
FROM T_FORMAT
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_029">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(t_location_id) AS tlocationid
FROM T_LOCATION
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_030">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(t_requirement_id) AS trequirementid
FROM T_REQUIREMENT
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_031">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(t_installationremarks_id) AS tremarksid
FROM T_INSTALLATIONREMARKS
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_032">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(t_otherplatform_id) AS totherplatformid
FROM T_OTHERPLATFORM
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_033">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(t_duration_id) AS tdurationid
FROM T_DURATION
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_034">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(e_learningresource_id) AS elearningresourceid
FROM E_LEARNINGRESOURCE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_035">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(e_enduserrole_id) AS eenduserroleid
FROM E_ENDUSERROLE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_036">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(e_context_id) AS econtextid
FROM E_CONTEXT
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_037">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(e_agerange_id) AS eagerangeid
FROM E_AGERANGE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_038">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(e_lang_id) AS elangid
FROM E_AGERANGE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND e_agerange_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_039">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(e_learningtime_id) AS elearningtimeid
FROM E_LEARNINGTIME
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_040">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(e_description_id) AS edescriptionid
FROM E_DESCRIPTION
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_041">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(e_language_id) AS elanguageid
FROM E_LANGUAGE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_042">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(ri_description_id) AS ridescriptionid
FROM RI_DESCRIPTION
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_043">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(relation_id) AS relationid
FROM RELATION
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_044">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(re_resource_id) AS reresourceid
FROM RE_RESOURCE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND relation_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_045">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(re_catalogentry_id) AS recatalogentryid
FROM RE_CATALOGENTRY
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND relation_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_046">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
SELECT MAX(re_entry_id) AS reentryid
FROM RE_CATALOGENTRY_ENTRY
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND relation_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
AND re_catalogentry_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_047">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(annotation_id) AS annotationid
FROM ANNOTATION
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_048">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(a_date_id) AS adateid
FROM A_DATE
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND annotation_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_049">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(a_description_id) AS adescriptionid
FROM A_DESCRIPTION
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND annotation_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_050">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT MAX(classification_id) AS classificationid
FROM CLASSIFICATION
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_051">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(c_taxon_path_id) AS ctaxonpathid
FROM C_TAXON_PATH
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND classification_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_052">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
SELECT MAX(c_source_id) AS csourceid
FROM C_TAXON_PATH
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND classification_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
AND c_taxon_path_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_053">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
SELECT MAX(c_taxon_id) AS ctaxonid
FROM C_TAXON
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND classification_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
AND c_taxon_path_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_054">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
SELECT MAX(c_entry_id) AS centryid
FROM C_TAXON_ENTRY
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND classification_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
AND c_taxon_path_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "'
AND c_taxon_id = " & dao_n() & "'" & dao_escape(arguments.arg005) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_055">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(c_lang_id) AS clangid
FROM C_DESCRIPTION
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND classification_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_056">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT MAX(c_keyword_id) AS ckeywordid
FROM C_KEYWORD
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND classification_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_057">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
SELECT MAX(c_lang_id) AS keyclangid
FROM C_KEYWORD
WHERE manifest_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND metadata_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
AND classification_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
AND c_keyword_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="importManifest_cfc_058">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfargument name="arg009" required="true">
	<cfargument name="arg010" required="true">
	<cfargument name="arg011" required="true">
	<cfargument name="arg012" required="true">
	<cfargument name="arg013" required="true">
	<cfargument name="arg014" required="true">
	<cfargument name="arg015" required="true">
	<cfargument name="arg016" required="true">
	<cfargument name="arg017" required="true">
	<cfargument name="arg018" required="true">
	<cfargument name="arg019" required="true">
	<cfargument name="arg020" required="true">
	<cfargument name="arg021" required="true">
	<cfargument name="arg022" required="true">
	<cfargument name="arg023" required="true">
	<cfargument name="arg024" required="true">
	<cfargument name="arg025" required="true">
	<cfargument name="arg026" required="true">
	<cfargument name="arg027" required="true">
	<cfargument name="arg028" required="true">
	<cfargument name="arg029" required="true">
	<cfargument name="arg030" required="true">
	<cfargument name="arg031" required="true">
	<cfargument name="arg032" required="true">
	<cfargument name="arg033" required="true">
	<cfargument name="arg034" required="true">
	<cfargument name="arg035" required="true">
	<cfargument name="arg036" required="true">
	<cfargument name="arg037" required="true">
	<cfargument name="arg038" required="true">
	<cfargument name="arg039" required="true">
	<cfargument name="arg040" required="true">
	<cfargument name="arg041" required="true">
	<cfargument name="arg042" required="true">
	<cfargument name="arg043" required="true">
	<cfargument name="arg044" required="true">
	<cfargument name="arg045" required="true">
	<cfargument name="arg046" required="true">
	<cfargument name="arg047" required="true">
	<cfargument name="arg048" required="true">
	<cfargument name="arg049" required="true">
	<cfargument name="arg050" required="true">
	<cfargument name="arg051" required="true">
	<cfargument name="arg052" required="true">
	<cfargument name="arg053" required="true">
	<cfargument name="arg054" required="true">
	<cfargument name="arg055" required="true">
	<cfargument name="arg056" required="true">
	<cfargument name="arg057" required="true">
	<cfargument name="arg058" required="true">
	<cfargument name="arg059" required="true">
	<cfset tempSql = "
DELETE FROM MANIFEST WHERE manifest_id = '" & dao_escape(arguments.arg001) & "';
DELETE FROM ORGANIZATIONS WHERE manifest_id = '" & dao_escape(arguments.arg002) & "';
DELETE FROM O_ORGANIZATION WHERE manifest_id = '" & dao_escape(arguments.arg003) & "';
DELETE FROM O_ITEM WHERE manifest_id = '" & dao_escape(arguments.arg004) & "';
DELETE FROM RESOURCES WHERE manifest_id = '" & dao_escape(arguments.arg005) & "';
DELETE FROM R_RESOURCE WHERE manifest_id = '" & dao_escape(arguments.arg006) & "';
DELETE FROM R_FILE WHERE manifest_id = '" & dao_escape(arguments.arg007) & "';
DELETE FROM R_DEPENDENCY WHERE manifest_id = '" & dao_escape(arguments.arg008) & "';
DELETE FROM METADATA WHERE manifest_id = '" & dao_escape(arguments.arg009) & "';
DELETE FROM GENERAL WHERE manifest_id = '" & dao_escape(arguments.arg010) & "';
DELETE FROM G_TITLE WHERE manifest_id = '" & dao_escape(arguments.arg011) & "';
DELETE FROM G_CATALOGENTRY WHERE manifest_id = '" & dao_escape(arguments.arg012) & "';
DELETE FROM G_CATALOGENTRY_ENTRY WHERE manifest_id = '" & dao_escape(arguments.arg013) & "';
DELETE FROM G_LANGUAGE WHERE manifest_id = '" & dao_escape(arguments.arg014) & "';
DELETE FROM G_DESCRIPTION WHERE manifest_id = '" & dao_escape(arguments.arg015) & "';
DELETE FROM G_KEYWORD WHERE manifest_id = '" & dao_escape(arguments.arg016) & "';
DELETE FROM G_COVERAGE WHERE manifest_id = '" & dao_escape(arguments.arg017) & "';
DELETE FROM LIFECYCLE WHERE manifest_id = '" & dao_escape(arguments.arg018) & "';
DELETE FROM L_VERSION WHERE manifest_id = '" & dao_escape(arguments.arg019) & "';
DELETE FROM L_CONTRIBUTE WHERE manifest_id = '" & dao_escape(arguments.arg020) & "';
DELETE FROM L_CONTRIBUTE_CENTITY WHERE manifest_id = '" & dao_escape(arguments.arg021) & "';
DELETE FROM L_CONTRIBUTE_DATE WHERE manifest_id = '" & dao_escape(arguments.arg022) & "';
DELETE FROM METAMETADATA WHERE manifest_id = '" & dao_escape(arguments.arg023) & "';
DELETE FROM M_CATALOGENTRY WHERE manifest_id = '" & dao_escape(arguments.arg024) & "';
DELETE FROM M_CATALOGENTRY_ENTRY WHERE manifest_id = '" & dao_escape(arguments.arg025) & "';
DELETE FROM M_CONTRIBUTE WHERE manifest_id = '" & dao_escape(arguments.arg026) & "';
DELETE FROM M_CONTRIBUTE_CENTITY WHERE manifest_id = '" & dao_escape(arguments.arg027) & "';
DELETE FROM M_CONTRIBUTE_DATE WHERE manifest_id = '" & dao_escape(arguments.arg028) & "';
DELETE FROM M_SCHEME WHERE manifest_id = '" & dao_escape(arguments.arg029) & "';
DELETE FROM TECHNICAL WHERE manifest_id = '" & dao_escape(arguments.arg030) & "';
DELETE FROM T_FORMAT WHERE manifest_id = '" & dao_escape(arguments.arg031) & "';
DELETE FROM T_LOCATION WHERE manifest_id = '" & dao_escape(arguments.arg032) & "';
DELETE FROM T_REQUIREMENT WHERE manifest_id = '" & dao_escape(arguments.arg033) & "';
DELETE FROM T_INSTALLATIONREMARKS WHERE manifest_id = '" & dao_escape(arguments.arg034) & "';
DELETE FROM T_OTHERPLATFORM WHERE manifest_id = '" & dao_escape(arguments.arg035) & "';
DELETE FROM T_DURATION WHERE manifest_id = '" & dao_escape(arguments.arg036) & "';
DELETE FROM EDUCATIONAL WHERE manifest_id = '" & dao_escape(arguments.arg037) & "';
DELETE FROM E_LEARNINGRESOURCE WHERE manifest_id = '" & dao_escape(arguments.arg038) & "';
DELETE FROM E_ENDUSERROLE WHERE manifest_id = '" & dao_escape(arguments.arg039) & "';
DELETE FROM E_CONTEXT WHERE manifest_id = '" & dao_escape(arguments.arg040) & "';
DELETE FROM E_AGERANGE WHERE manifest_id = '" & dao_escape(arguments.arg041) & "';
DELETE FROM E_LEARNINGTIME WHERE manifest_id = '" & dao_escape(arguments.arg042) & "';
DELETE FROM E_DESCRIPTION WHERE manifest_id = '" & dao_escape(arguments.arg043) & "';
DELETE FROM E_LANGUAGE WHERE manifest_id = '" & dao_escape(arguments.arg044) & "';
DELETE FROM RIGHTS WHERE manifest_id = '" & dao_escape(arguments.arg045) & "';
DELETE FROM RI_DESCRIPTION WHERE manifest_id = '" & dao_escape(arguments.arg046) & "';
DELETE FROM RELATION WHERE manifest_id = '" & dao_escape(arguments.arg047) & "';
DELETE FROM RE_RESOURCE WHERE manifest_id = '" & dao_escape(arguments.arg048) & "';
DELETE FROM RE_CATALOGENTRY WHERE manifest_id = '" & dao_escape(arguments.arg049) & "';
DELETE FROM RE_CATALOGENTRY_ENTRY WHERE manifest_id = '" & dao_escape(arguments.arg050) & "';
DELETE FROM ANNOTATION WHERE manifest_id = '" & dao_escape(arguments.arg051) & "';
DELETE FROM A_DATE WHERE manifest_id = '" & dao_escape(arguments.arg052) & "';
DELETE FROM A_DESCRIPTION WHERE manifest_id = '" & dao_escape(arguments.arg053) & "';
DELETE FROM CLASSIFICATION WHERE manifest_id = '" & dao_escape(arguments.arg054) & "';
DELETE FROM C_TAXON_PATH WHERE manifest_id = '" & dao_escape(arguments.arg055) & "';
DELETE FROM C_TAXON WHERE manifest_id = '" & dao_escape(arguments.arg056) & "';
DELETE FROM C_TAXON_ENTRY WHERE manifest_id = '" & dao_escape(arguments.arg057) & "';
DELETE FROM C_DESCRIPTION WHERE manifest_id = '" & dao_escape(arguments.arg058) & "';
DELETE FROM C_KEYWORD WHERE manifest_id = '" & dao_escape(arguments.arg059) & "';
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="info_cfc_001">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
Insert into information
(title , contents , user_id , effective , entry_date, change_date)
values
(" & dao_n() & "'" & dao_escape(arguments.arg001) & "' , " & dao_n() & "'" & dao_escape(arguments.arg002) & "' , " & dao_escape(arguments.arg003) & " , 1 , " & dao_n() & "'" & dao_escape(arguments.arg004) & "' , "&dao_now()&");
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="info_cfc_003">
	<cfset tempSql = "
select count(*) as count
from information
where effective = 1;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="info_cfc_004">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select t1.* , t2.first_name , t2.last_name
from information as t1 , USER_MASTER as t2
where t2.user_id = t1.user_id and
t1.effective = 1 and
t1.serial = " & dao_escape(arguments.arg001) & ";
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="info_cfc_005">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
delete from information
where serial = " & dao_escape(arguments.arg001) & ";
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="info_cfc_006">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
update information
set title = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
contents = " & dao_n() & "'" & dao_escape(arguments.arg002) & "' ,
entry_date = " & dao_n() & "'" & dao_escape(arguments.arg004) & "' ,
change_date = "&dao_now()&"
where serial = " & dao_escape(arguments.arg003) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="main_cfc_005">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM USER_LOGON
WHERE "&dao_date_add('logon_time',dao_escape(arguments.arg001a)) &" <= "&dao_now()&"
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="main_cfc_008">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
INSERT INTO USER_LOGON (user_id, course_id, logon_time) VALUES (" & dao_escape(arguments.arg001) & ", NULL, "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="main_cfc_009">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM USER_LOGON WHERE USER_LOGON.user_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- 追加 20070205 tanaka --->
<cffunction name="main_cfc_010">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
UPDATE USER_LOGON_LOG
SET
    logon_date_last = CURRENT_TIMESTAMP,
    logon_count = logon_count + 1
WHERE
    user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- 追加 20070205 tanaka --->
<cffunction name="main_cfc_011">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
INSERT INTO USER_LOGON_LOG (
    user_id, logon_date_first, logon_date_last, logon_count
) VALUES (
    " & dao_n() & "'" & dao_escape(arguments.arg001) & "', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '1'
)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="option_cfc_002">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfargument name="arg009" required="true">
	<cfargument name="arg010" required="true">
	<cfset tempSql = "
UPDATE LMS_INFO
SET timeout = " & dao_escape(arguments.arg001) & ",
default_max = " & dao_escape(arguments.arg002) & ",
default_comp = " & dao_escape(arguments.arg003) & ",
default_min = " & dao_escape(arguments.arg004) & ",
default_url = " & dao_n() & "'" & dao_escape(arguments.arg005) & "',
change_date = "&dao_now()&" ,
login_double = " & dao_n() & "'" & dao_escape(arguments.arg006) & "' ,
video_chk = " & dao_n() & "'" & dao_escape(arguments.arg007) & "' ,
ope_name = " & dao_n() & "'" & dao_escape(arguments.arg008) & "' ,
ope_url = " & dao_n() & "'" & dao_escape(arguments.arg009) & "' ,
wb_chk = " & dao_n() & "'" & dao_escape(arguments.arg010) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_001">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
INSERT INTO G_TITLE
(manifest_id,metadata_id,g_title_id,lang,title)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_002">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO G_CATALOGENTRY
(manifest_id,metadata_id,g_catalogentry_id,g_catalog)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_003">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO G_CATALOGENTRY_ENTRY
(manifest_id,metadata_id,g_catalogentry_id,g_entry_id,lang,entry)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_004">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO G_LANGUAGE
(manifest_id,metadata_id,g_language_id,g_language)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_005">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO G_DESCRIPTION
(manifest_id,metadata_id,g_description_id,g_lang_id,lang,g_description)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_006">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO G_KEYWORD
(manifest_id,metadata_id,g_keyword_id,g_lang_id,lang,g_keyword)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_007">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO G_COVERAGE
(manifest_id,metadata_id,g_coverage_id,g_lang_id,lang,g_coverage)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_008">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO GENERAL
(manifest_id,metadata_id,structure,aggregation_level)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_009">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
INSERT INTO L_VERSION
(manifest_id,metadata_id,l_version_id,lang,version)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_010">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
INSERT INTO L_CONTRIBUTE_CENTITY
(manifest_id,metadata_id,l_contribute_id,l_centity_id,centity)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_011">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO L_CONTRIBUTE_DATE
(manifest_id,metadata_id,l_contribute_id,l_date_id,lang,description)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_012">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
INSERT INTO L_CONTRIBUTE
(manifest_id,metadata_id,l_contribute_id,role,datetime)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_013">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
INSERT INTO LIFECYCLE
(manifest_id,metadata_id,status)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_014">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO M_CATALOGENTRY
(manifest_id,metadata_id,m_catalogentry_id,m_catalog)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_015">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO M_CATALOGENTRY_ENTRY
(manifest_id,metadata_id,m_catalogentry_id,m_entry_id,lang,entry)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_016">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
INSERT INTO M_CONTRIBUTE_CENTITY
(manifest_id,metadata_id,m_contribute_id,m_centity_id,centity)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_017">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO M_CONTRIBUTE_DATE
(manifest_id,metadata_id,m_contribute_id,m_date_id,lang,description)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_018">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
INSERT INTO M_CONTRIBUTE
(manifest_id,metadata_id,m_contribute_id,role,datetime)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_019">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO M_SCHEME
(manifest_id,metadata_id,m_scheme_id,metadata_scheme)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_020">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
INSERT INTO METAMETADATA
(manifest_id,metadata_id,m_language)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_021">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO T_FORMAT
(manifest_id,metadata_id,t_format_id,format)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_022">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
INSERT INTO T_LOCATION
(manifest_id,metadata_id,t_location_id,type,location)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_023">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfset tempSql = "
INSERT INTO T_REQUIREMENT
(manifest_id,metadata_id,t_requirement_id,type,name,minimum_version,maximum_version)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "'," & dao_n() & "'" & dao_escape(arguments.arg007) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_024">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
INSERT INTO T_INSTALLATIONREMARKS
(manifest_id,metadata_id,t_installationremarks_id,lang,installation_remarks)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_025">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
INSERT INTO T_OTHERPLATFORM
(manifest_id,metadata_id,t_otherplatform_id,lang,other_platform_requirements)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_026">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
INSERT INTO T_DURATION
(manifest_id,metadata_id,t_duration_id,lang,description)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_027">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO TECHNICAL
(manifest_id,metadata_id,t_size,duration)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_028">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO E_LEARNINGRESOURCE
(manifest_id,metadata_id,e_learningresource_id,learning_resource_type)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_029">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO E_ENDUSERROLE
(manifest_id,metadata_id,e_enduserrole_id,intended_end_user_role)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_030">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO E_CONTEXT
(manifest_id,metadata_id,e_context_id,context)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_031">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO E_AGERANGE
(manifest_id,metadata_id,e_agerange_id,e_lang_id,lang,typical_age_range)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_032">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
INSERT INTO E_LEARNINGTIME
(manifest_id,metadata_id,e_learningtime_id,lang,description)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_033">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
INSERT INTO E_DESCRIPTION
(manifest_id,metadata_id,e_description_id,lang,description)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_034">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO E_LANGUAGE
(manifest_id,metadata_id,e_language_id,e_language)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_035">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfset tempSql = "
INSERT INTO EDUCATIONAL
(manifest_id,metadata_id,interactivity_type,interactivity_level,semantic_density,difficulty,typical_learning_time)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "'," & dao_n() & "'" & dao_escape(arguments.arg007) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_036">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
INSERT INTO RI_DESCRIPTION
(manifest_id,metadata_id,ri_description_id,lang,description)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_037">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO RIGHTS
(manifest_id,metadata_id,cost,copyright_and_other_restrictions)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_038">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO RE_RESOURCE
(manifest_id,metadata_id,relation_id,re_resource_id,lang,description)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_039">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfset tempSql = "
INSERT INTO RE_CATALOGENTRY_ENTRY
(manifest_id,metadata_id,relation_id,re_catalogentry_id,re_entry_id,lang,entry)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "'," & dao_n() & "'" & dao_escape(arguments.arg007) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_040">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
INSERT INTO RE_CATALOGENTRY
(manifest_id,metadata_id,relation_id,re_catalogentry_id,re_catalog)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_041">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO RELATION
(manifest_id,metadata_id,relation_id,kind)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_042">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO A_DATE
(manifest_id,metadata_id,annotation_id,a_date_id,lang,description)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_043">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO A_DESCRIPTION
(manifest_id,metadata_id,annotation_id,a_description_id,lang,description)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_044">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
INSERT INTO ANNOTATION
(manifest_id,metadata_id,annotation_id,person,a_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_045">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfset tempSql = "
INSERT INTO C_TAXON_PATH
(manifest_id,metadata_id,classification_id,c_taxon_path_id,c_source_id,lang,source)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "'," & dao_n() & "'" & dao_escape(arguments.arg007) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_046">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO C_DESCRIPTION
(manifest_id,metadata_id,classification_id,c_lang_id,lang,description)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_047">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfset tempSql = "
INSERT INTO C_KEYWORD
(manifest_id,metadata_id,classification_id,c_keyword_id,c_lang_id,lang,keyword)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "'," & dao_n() & "'" & dao_escape(arguments.arg007) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_048">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO CLASSIFICATION
(manifest_id,metadata_id,classification_id,purpose)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_049">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfset tempSql = "
INSERT INTO C_TAXON_ENTRY
(manifest_id,metadata_id,classification_id,c_taxon_path_id,c_taxon_id,c_entry_id,lang,entry)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "'," & dao_n() & "'" & dao_escape(arguments.arg007) & "'," & dao_n() & "'" & dao_escape(arguments.arg008) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="parseLomItems_cfc_050">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfset tempSql = "
INSERT INTO C_TAXON
(manifest_id,metadata_id,classification_id,c_taxon_path_id,c_taxon_id,parent_c_taxon_id,id)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "'," & dao_n() & "'" & dao_escape(arguments.arg007) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="progress_cfc_005">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "

SELECT GROUP_MASTER.group_id, GROUP_MASTER.group_name
FROM admin_group
LEFT JOIN GROUP_MASTER
ON admin_group.group_id = GROUP_MASTER.group_id
WHERE admin_group.user_id = " & dao_escape(arguments.arg001) & "
ORDER BY GROUP_MASTER.group_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="progress_cfc_007">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
				SELECT user_id , last_name , first_name
					FROM   (
							SELECT		USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name , USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
							FROM		USER_MASTER, belong
							WHERE		USER_MASTER.user_type_id = 3 AND
										USER_MASTER.user_id = belong.user_id AND
										belong.group_id IN (" & dao_escape(arguments.arg001) & ")
							group by	USER_MASTER.user_id , USER_MASTER.last_name , first_name , last_name_furi , first_name_furi
							having		count(*) = " & dao_escape(arguments.arg002) & "

							UNION

							SELECT	USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name , USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
							FROM	USER_MASTER
							WHERE	USER_MASTER.user_type_id = 3
							AND		NOT EXISTS (
									SELECT	*
									FROM	belong
									WHERE	USER_MASTER.user_id = belong.user_id
									)
					) t1
						order by last_name_furi , first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="progress_cfc_008">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
				SELECT  user_id , last_name , first_name
					FROM (
						SELECT	USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name , USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
						FROM	USER_MASTER, course_progress
						WHERE	USER_MASTER.user_type_id = 3 AND
								USER_MASTER.user_id = course_progress.user_id AND
								course_id IN (" & dao_escape(arguments.arg001) & ")
								group  by USER_MASTER.user_id , last_name , first_name , last_name_furi , first_name_furi
								having count(USER_MASTER.user_id) = " & dao_escape(arguments.arg002) & "
					) t1
					order by last_name_furi , first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="progress_cfc_009">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT USER_MASTER.user_id
FROM USER_MASTER, belong
WHERE USER_MASTER.user_type_id = 3 AND
USER_MASTER.user_id = belong.user_id AND
belong.group_id IN (" & dao_escape(arguments.arg001) & ")
group by USER_MASTER.user_id
having count(*) = " & dao_escape(arguments.arg002) & "

UNION

SELECT USER_MASTER.user_id
FROM USER_MASTER
WHERE USER_MASTER.user_type_id = 3
AND NOT EXISTS
(
SELECT *
FROM belong
WHERE USER_MASTER.user_id = belong.user_id
)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="progress_cfc_010">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT USER_MASTER.user_id
FROM USER_MASTER, course_progress
WHERE USER_MASTER.user_type_id = 3 AND
USER_MASTER.user_id = course_progress.user_id AND
course_id IN (" & dao_escape(arguments.arg001) & ")
group by USER_MASTER.user_id
having count(USER_MASTER.user_id) = " & dao_escape(arguments.arg002) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="progress_cfc_012">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT user_id, last_name, first_name
FROM USER_MASTER
WHERE user_id IN (" & dao_escape(arguments.arg001) & ")
ORDER by last_name_furi , first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="progress_cfc_013">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name, USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
FROM COURSE_PROGRESS , USER_MASTER
WHERE COURSE_PROGRESS.user_id = USER_MASTER.user_id AND
COURSE_PROGRESS.user_id in (" & dao_escape(arguments.arg001) & ") AND
COURSE_PROGRESS.course_id IN (" & dao_escape(arguments.arg002) & ") AND
(COURSE_PROGRESS.course_status = 'completed' or COURSE_PROGRESS.course_status = 'passed')
Group by USER_MASTER.user_id , USER_MASTER.last_name , USER_MASTER.first_name , USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
Having count(*) = " & dao_escape(arguments.arg003) & "
order by USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="progress_cfc_014">
	<cfset tempSql = "
SELECT last_name || ' ' || first_name
FROM USER_MASTER
WHERE user_type_id = 2
ORDER BY last_name,first_name
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="progress_cfc_020">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "

SELECT COURSE_MASTER.course_id, COURSE_MASTER.course_name
FROM admin_course
LEFT JOIN COURSE_MASTER
ON admin_course.course_id = COURSE_MASTER.course_id
WHERE admin_course.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'

">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="progress_cfc_022">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT SCO_MASTER.sco_name,
SCO_MASTER.sco_type,
SCO_MASTER.sco_id,
CONSTRUCT.order_no
FROM CONSTRUCT,
SCO_MASTER
WHERE CONSTRUCT.course_id = " & dao_escape(arguments.arg001) & "
AND CONSTRUCT.parent_sco_id = " & dao_escape(arguments.arg002) & "
AND CONSTRUCT.sco_id = SCO_MASTER.sco_id
ORDER BY CONSTRUCT.order_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_001">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select count(*) as count from admin_group where user_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_002">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
		<cfif arguments.arg001 is 0 and arguments.arg002 is 0>
		<!---ユーザーIDもグループIDも0--->
			<cfset  tempSql = '
					SELECT USER_MASTER.*
					FROM   USER_MASTER
					WHERE  user_type_id = 3'
			>
		<cfelseif arguments.arg001 is 0 and arguments.arg002 is not 0>
		<!---ユーザーIDは0だがグループIDは指定あり--->
			<cfset  tempSql = '
					SELECT USER_MASTER.*
					FROM   USER_MASTER
					WHERE  user_type_id = 3 AND
					       USER_MASTER.user_id in (select user_id from belong where belong.group_id = " & dao_n() & "' & dao_escape(arguments.arg002) & ')
					'
			>
		<cfelseif arguments.arg001 is not 0 and arguments.arg002 is 0>
		<!---ユーザーIDは指定ありだがグループは0--->
			<cfset  tempSql = '
					SELECT USER_MASTER.*
					FROM   USER_MASTER
					WHERE  user_type_id = 3 AND
					       USER_MASTER.user_id in (select user_id from belong where group_id in (
					       select group_id from admin_group where user_id = ' & dao_escape(arguments.arg001) & '))
					'
			>
		<cfelse>
		<!---ユーザーIDは指定ありでグループも指定あり--->
			<cfset  tempSql = '
					SELECT USER_MASTER.*
					FROM   USER_MASTER
					WHERE  user_type_id = 3 AND
					       USER_MASTER.user_id in (select user_id from belong where
					       group_id in ( select group_id from admin_group where user_id = ' & dao_escape(arguments.arg001) & ' and group_id = ' & dao_escape(arguments.arg002) & '))
					'
			>
		</cfif>

		<cfif arguments.arg003 is not 'null'>
			<cfset tempSql = tempSql & " AND (
								       USER_MASTER.logon like " & dao_n() & "'%" & dao_escape(arguments.arg003) & "%' OR
								       USER_MASTER.first_name like " & dao_n() & "'%" & dao_escape(arguments.arg003) & "%' OR
								       USER_MASTER.last_name like " & dao_n() & "'%" & dao_escape(arguments.arg003) & "%' OR
								       USER_MASTER.first_name_furi like " & dao_n() & "'%" & dao_escape(arguments.arg003) & "%' OR
								       USER_MASTER.last_name_furi like " & dao_n() & "'%" & dao_escape(arguments.arg003) & "%' OR
								       USER_MASTER.mailaddress like " & dao_n() & "'%" & dao_escape(arguments.arg003) & "%'
								       )"
			>
		</cfif>
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_003">
	<cfargument name="arg001" required="true">
		<cfset tempSql = '		select USER_MASTER.*
		from   USER_MASTER
		where  user_type_id = 3 AND
		       not exists (
		                   select *
		                   from   belong
		                   where  USER_MASTER.user_id = belong.user_id
		                   )'
		>

		<cfif arguments.arg001 is not 'null'>
			<cfset tempSql = tempSql & " AND (
								       USER_MASTER.logon like " & dao_n() & "'%" & dao_escape(arguments.arg001) & "%' OR
								       USER_MASTER.first_name like " & dao_n() & "'%" & dao_escape(arguments.arg001) & "%' OR
								       USER_MASTER.last_name like " & dao_n() & "'%" & dao_escape(arguments.arg001) & "%' OR
								       USER_MASTER.first_name_furi like " & dao_n() & "'%" & dao_escape(arguments.arg001) & "%' OR
								       USER_MASTER.last_name_furi like " & dao_n() & "'%" & dao_escape(arguments.arg001) & "%' OR
								       USER_MASTER.mailaddress like " & dao_n() & "'%" & dao_escape(arguments.arg001) & "%'
								       )"
			>
		</cfif>
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_005">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT user_id, last_name_furi, first_name_furi
FROM USER_MASTER
WHERE user_id in (" & dao_escape(arguments.arg001) & ")
order by last_name_furi , first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_006">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT COURSE_PROGRESS.user_id
FROM COURSE_PROGRESS , USER_MASTER
WHERE COURSE_PROGRESS.user_id = USER_MASTER.user_id AND
COURSE_PROGRESS.user_id in (" & dao_escape(arguments.arg001) & ") AND
(COURSE_PROGRESS.course_status = 'completed' or COURSE_PROGRESS.course_status = 'passed')
Group by COURSE_PROGRESS.user_id , USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
order by USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_007">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT COURSE_PROGRESS.user_id
FROM COURSE_PROGRESS , USER_MASTER
WHERE COURSE_PROGRESS.user_id = USER_MASTER.user_id AND
COURSE_PROGRESS.user_id in (" & dao_escape(arguments.arg001) & ") AND
(COURSE_PROGRESS.course_status <> 'completed' and COURSE_PROGRESS.course_status <> 'passed')
Group by COURSE_PROGRESS.user_id , USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
order by USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->




<!---/////////////////////////////////////////////////////////
現在は使っていないと思われる関数
2007/01/4時点で問題が出ていない場合は
削除してください。
//////////////////////////////////////////////////////////--->
<cffunction name="q_mode_cfc_012">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
" & arguments.arg001 & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_013">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
" & arguments.arg001 & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_015">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT user_id, last_name_furi, first_name_furi
FROM USER_MASTER
WHERE user_id in (" & dao_escape(arguments.arg001) & ")
order by last_name_furi , first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_017">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT COURSE_PROGRESS.user_id, USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
FROM COURSE_PROGRESS , USER_MASTER
WHERE COURSE_PROGRESS.user_id = USER_MASTER.user_id
AND COURSE_PROGRESS.user_id in (" & dao_escape(arguments.arg001) & ")
AND ((COURSE_PROGRESS.course_status = 'completed') or (COURSE_PROGRESS.course_status = 'passed'))
Group by COURSE_PROGRESS.user_id , USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
order by USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_018">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT COURSE_PROGRESS.user_id, USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
FROM COURSE_PROGRESS , USER_MASTER, admin_course
WHERE COURSE_PROGRESS.user_id = USER_MASTER.user_id
AND admin_course.user_id = " & dao_escape(arguments.arg001) & "
AND COURSE_PROGRESS.user_id in (" & dao_escape(arguments.arg002) & ")
AND ((COURSE_PROGRESS.course_status = 'completed') or (COURSE_PROGRESS.course_status = 'passed'))
Group by COURSE_PROGRESS.user_id , USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
order by USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_019">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT COURSE_PROGRESS.user_id, USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
FROM COURSE_PROGRESS , USER_MASTER
WHERE COURSE_PROGRESS.user_id = USER_MASTER.user_id
AND COURSE_PROGRESS.user_id in (" & dao_escape(arguments.arg001) & ")
AND (COURSE_PROGRESS.course_status <> 'completed' and COURSE_PROGRESS.course_status <> 'passed')
Group by COURSE_PROGRESS.user_id , USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
order by USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_020">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT COURSE_PROGRESS.user_id, USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
FROM COURSE_PROGRESS , USER_MASTER, admin_course
WHERE COURSE_PROGRESS.user_id = USER_MASTER.user_id
AND admin_course.user_id = " & dao_escape(arguments.arg001) & "
AND COURSE_PROGRESS.user_id in (" & dao_escape(arguments.arg002) & ")
AND (COURSE_PROGRESS.course_status <> 'completed' and COURSE_PROGRESS.course_status <> 'passed')
Group by COURSE_PROGRESS.user_id , USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
order by USER_MASTER.last_name_furi , USER_MASTER.first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---/////////////////////////////////////////////////////////
現在は使っていないと思われる関数
2007/01/4時点で問題が出ていない場合は
削除してください。
//////////////////////////////////////////////////////////--->





<!---------------------------------------------->
<cffunction name="q_mode_cfc_021">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT user_id, last_name, first_name
FROM USER_MASTER
WHERE (user_type_id = 3)
AND user_id In (" & dao_escape(arguments.arg001) & ")
order by last_name_furi , first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_022">
	<cfset tempSql = "
SELECT COURSE_MASTER.*, NOTIFICATION.effective as noti_effe
FROM COURSE_MASTER
LEFT JOIN NOTIFICATION
ON NOTIFICATION.type=2 and NOTIFICATION.course_id=COURSE_MASTER.course_id
ORDER BY COURSE_MASTER.course_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_024">
	<cfset tempSql = "
SELECT COURSE_MASTER.*, NOTIFICATION.effective as noti_effe
FROM COURSE_MASTER
LEFT JOIN NOTIFICATION
ON NOTIFICATION.type=2 and NOTIFICATION.course_id=COURSE_MASTER.course_id
ORDER BY COURSE_MASTER.course_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_025">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT COURSE_MASTER.*, NOTIFICATION.effective as noti_effe
FROM COURSE_MASTER
INNER JOIN admin_course
ON admin_course.course_id = COURSE_MASTER.course_id
LEFT JOIN NOTIFICATION
ON NOTIFICATION.type=2 and NOTIFICATION.course_id=COURSE_MASTER.course_id
WHERE admin_course.user_id = " & dao_escape(arguments.arg001) & "
ORDER BY COURSE_MASTER.course_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_028">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT user_id , course_id , course_status
FROM COURSE_PROGRESS
WHERE user_id in (" & dao_escape(arguments.arg001) & ") AND course_id in (" & dao_escape(arguments.arg002) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->



<!---/////////////////////////////////////////////////////////
現在は使っていないと思われる関数
2007/01/4時点で問題が出ていない場合は
削除してください。
//////////////////////////////////////////////////////////--->
<cffunction name="q_mode_cfc_032">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO ASSIGN (user_id, course_id, entry_date, change_date)
VALUES (" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & ", " & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---/////////////////////////////////////////////////////////
現在は使っていないと思われる関数
2007/01/4時点で問題が出ていない場合は
削除してください。
//////////////////////////////////////////////////////////--->



<!---------------------------------------------->
<cffunction name="q_mode_cfc_033">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
INSERT INTO COURSE_PROGRESS (user_id, course_id, course_status, course_count, course_score, course_total_time, change_date) VALUES (" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & ", " & dao_n() & "'not attempted', 0, 0, " & dao_n() & "'0000:00:00', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- score`s default value is not (0) but (null) --->
<cffunction name="q_mode_cfc_035">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
INSERT INTO SCO_PROGRESS
( user_id, course_id, sco_id, status, lecture_count, entry, score, total_time, session_time, change_date )
VALUES( " & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & ", " & dao_escape(arguments.arg003) & ", " & dao_n() & "'not attempted', 0, " & dao_n() & "'ab-initio', null, " & dao_n() & "'0000:00:00', " & dao_n() & "'0000:00:00', "&dao_now()&" )
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_038">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
UPDATE USER_MASTER
SET    flag_all_course = 1 ,
       change_date = "&dao_now()&"
WHERE user_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_040">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
DELETE FROM COURSE_PROGRESS
WHERE (course_id = " & dao_escape(arguments.arg001) & ") AND (user_id = " & dao_escape(arguments.arg002) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_041">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
DELETE FROM SCO_PROGRESS
WHERE (course_id = " & dao_escape(arguments.arg001) & ") AND (user_id = " & dao_escape(arguments.arg002) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_042">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
DELETE FROM ITEMS
WHERE (course_id = " & dao_escape(arguments.arg001) & ") AND (user_id = " & dao_escape(arguments.arg002) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_045">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
UPDATE USER_MASTER
SET    flag_all_course = 0 ,
       change_date = "&dao_now()&"
WHERE user_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_049">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT GROUP_MASTER.group_id,GROUP_MASTER.group_name
FROM GROUP_MASTER , admin_group
WHERE GROUP_MASTER.group_id = admin_group.group_id AND
admin_group.user_id = " & dao_escape(arguments.arg001) & "
ORDER BY GROUP_MASTER.group_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_050">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT user_id,last_name, first_name, last_name_furi,first_name_furi
FROM USER_MASTER
WHERE (user_type_id = 3)
">
<cfif dao_escape(arguments.arg001) neq 0>
	<cfset tempSql = tempSql & "
AND ((group_id_1 = " & dao_escape(arguments.arg001) & ") OR (group_id_2 = " & dao_escape(arguments.arg002) & ") OR (group_id_3 = " & dao_escape(arguments.arg003) & "))
">
</cfif>
	<cfset tempSql = tempSql & "
ORDER BY last_name_furi,first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_051">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
update NOTIFICATION set
effective = " & dao_escape(arguments.arg001) & "
where course_id = " & dao_escape(arguments.arg002) & " and type=2
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="q_mode_cfc_052">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
UPDATE	COURSE_PROGRESS
SET	course_status = 'not attempted' ,
	course_count = 0 ,
	course_score = 0 ,
	course_total_time = '0000:00:00' ,
	change_date = "&dao_now()&"
WHERE	user_id = " & dao_escape(arguments.arg001) & " AND
	course_id = " & dao_escape(arguments.arg002)
>
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- score`s default value is not (0) but (null) --->
<cffunction name="q_mode_cfc_053">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
UPDATE	SCO_PROGRESS
SET	status = " & dao_n() & "'not attempted' ,
	lecture_count = 0 ,
	entry = " & dao_n() & "'ab-initio' ,
	score = null ,
	total_time = " & dao_n() & "'0000:00:00' ,
	session_time = " & dao_n() & "'0000:00:00' ,
	change_date = "&dao_now()&"
WHERE	user_id = " & dao_escape(arguments.arg001) & " AND
	course_id = " & dao_escape(arguments.arg002)
>
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_admin_cfc_003">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
Insert into genre
(g_name , g_exp , effective , entry_date, change_date)
values
(" & dao_n() & "'" & dao_escape(arguments.arg001) & "' , " & dao_n() & "'" & dao_escape(arguments.arg002) & "' , 1 , "&dao_now()&", "&dao_now()&");
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_admin_cfc_005">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
update genre
set g_name = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
g_exp = " & dao_n() & "'" & dao_escape(arguments.arg002) & "' ,
change_date = "&dao_now()&"
where serial = " & dao_escape(arguments.arg003) & ";
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_admin_cfc_006">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
update genre
set effective = 0 ,
change_date = "&dao_now()&"
where serial = " & dao_escape(arguments.arg001) & ";
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_admin_cfc_007">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfset tempSql = "
Insert into faq
(a_user_id , genre , division , title , contents , answer , indication , a_flag , effective , entry_date, change_date)
values
(" & dao_n() & "'" & dao_escape(arguments.arg001) & "' , " & dao_n() & "'" & dao_escape(arguments.arg002) & "' , " & dao_n() & "'" & dao_escape(arguments.arg003) & "' , " & dao_n() & "'" & dao_escape(arguments.arg004) & "' , " & dao_n() & "'" & dao_escape(arguments.arg005) & "' , " & dao_n() & "'" & dao_escape(arguments.arg006) & "' , " & dao_n() & "'" & dao_escape(arguments.arg007) & "' , 1 , 1 , "&dao_now()&", "&dao_now()&");
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_admin_cfc_008">
	<cfset tempSql = "
select *
from   FAQ as t1 , USER_MASTER as t2
where  t1.q_user_id = t2.user_id and
       t1.a_flag = 0 and
       t1.effective = 1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_admin_cfc_010">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select t1.* , t2.last_name || t2.first_name as full_name
from faq as t1 , USER_MASTER as t2
where t1.q_user_id = t2.user_id and
t1.effective = 1 and
t1.serial = " & dao_escape(arguments.arg001) & ";
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_admin_cfc_011">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
update faq
set answer = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
a_flag = 1 ,
a_user_id = " & dao_escape(arguments.arg002) & " ,
answer_movie_name = " & dao_n() & "'" & dao_escape(arguments.arg004) & "' ,
title = " & dao_n() & "'" & dao_escape(arguments.arg005) & "' ,
contents = " & dao_n() & "'" & dao_escape(arguments.arg006) & "' ,
change_date = "&dao_now()&"
where serial = " & dao_escape(arguments.arg003) & ";
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_admin_cfc_012">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
update faq
set effective = 0 ,
change_date = "&dao_now()&"
where serial = " & dao_escape(arguments.arg001) & ";
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_admin_cfc_013">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
select *
from   FAQ as t1 , USER_MASTER as t2
where  t1.q_user_id = t2.user_id and
       t1.a_flag = 1 and
       t1.effective = 1
">
<cfif dao_escape(arguments.arg001) is not "">
<cfset tempSql = tempSql & "
and (
t1.title like " & dao_n() & "'%" & dao_escape(arguments.arg001) & "%' or
t1.contents like " & dao_n() & "'%" & dao_escape(arguments.arg002) & "%' or
t1.answer like " & dao_n() & "'%" & dao_escape(arguments.arg003) & "%'
)
">
</cfif>
<cfset tempSql = tempSql & "
;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_admin_cfc_014">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
select t1.* , t2.last_name || t2.first_name as fullname
from   FAQ as t1 , USER_MASTER as t2
where  t1.q_user_id = t2.user_id and
       t1.a_flag = 1 and
       t1.effective = 1
">
<cfif dao_escape(arguments.arg001) is not "">
<cfset tempSql = tempSql & "
and (
t1.title like " & dao_n() & "'%" & dao_escape(arguments.arg001) & "%' or
t1.contents like " & dao_n() & "'%" & dao_escape(arguments.arg002) & "%' or
t1.answer like " & dao_n() & "'%" & dao_escape(arguments.arg003) & "%'
)
">
</cfif>
<cfset tempSql = tempSql & "
order by t1.serial desc;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_admin_cfc_015">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select t1.serial , t1.division , t1.title , t1.contents ,
t1.genre , t1.answer , t1.indication , t1.entry_date , t1.recordName , t1.answer_movie_name
from faq as t1 , USER_MASTER as t2
where t1.a_user_id = t2.user_id and
t1.a_flag = 1 and
t1.effective = 1 and
t1.serial = " & dao_escape(arguments.arg001) & ";
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_admin_cfc_016">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select count(*) -1 as counter
from genre
where effective = 1 and
serial <= " & dao_escape(arguments.arg001) & ";
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_admin_cfc_017">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfset tempSql = "
update faq
set answer = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ,
a_user_id = " & dao_escape(arguments.arg002) & " ,
genre = " & dao_escape(arguments.arg003) & " ,
division = " & dao_escape(arguments.arg004) & " ,
title = " & dao_n() & "'" & dao_escape(arguments.arg005) & "' ,
contents = " & dao_n() & "'" & dao_escape(arguments.arg006) & "' ,
indication = " & dao_escape(arguments.arg007) & " ,
change_date = "&dao_now()&"
where serial = " & dao_escape(arguments.arg008) & ";
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- add 20060926 tanaka --->
<cffunction name="qa_admin_cfc_018">
	<cfset tempSql = "
select count(*) as gc
from genre
where effective = 1;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- add 20070206 yukawa --->
<cffunction name="qa_admin_cfc_019">
	<cfset tempSql = "
select t1.* , t2.last_name || t2.first_name as fullname
from   FAQ as t1 , USER_MASTER as t2
where  t1.q_user_id = t2.user_id and
       t1.a_flag = 0 and
       t1.effective = 1
       order by serial desc
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- add 20070219 yukawa --->
<cffunction name="qa_admin_cfc_020">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select distinct user_id from belong where group_id in (" & arguments.arg001 & ")
union
select user_id
from   USER_MASTER
where  user_type_id = 3 and
       user_id not in (
                       select distinct user_id
                       from   belong
                      )
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_user_cfc_001">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
select count(*) as counter
from faq
where a_flag = 1 and
indication = 1 and
effective = 1
">
<cfif dao_escape(arguments.arg001) is not "">
<cfset tempSql = tempSql & "
and (
title like " & dao_n() & "'%" & dao_escape(arguments.arg001) & "%' or
contents like " & dao_n() & "'%" & dao_escape(arguments.arg002) & "%' or
answer like " & dao_n() & "'%" & dao_escape(arguments.arg003) & "%'
)
">
</cfif>
<cfset tempSql = tempSql & "
;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_user_cfc_002">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
select serial , title , division , entry_date
from faq
where a_flag = 1 and
indication = 1 and
effective = 1
">
<cfif dao_escape(arguments.arg001) is not "">
<cfset tempSql = tempSql & "
and (
title like " & dao_n() & "'%" & dao_escape(arguments.arg001) & "%' or
contents like " & dao_n() & "'%" & dao_escape(arguments.arg002) & "%' or
answer like " & dao_n() & "'%" & dao_escape(arguments.arg003) & "%'
)
">
</cfif>
<cfset tempSql = tempSql & "
order by serial;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_user_cfc_003">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select count(*) as counter
from   FAQ as t1 left join USER_MASTER as t2 on t1.a_user_id = t2.user_id
where  t1.effective = 1 and
       t1.q_user_id = " & dao_escape(arguments.arg001) & ";
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_user_cfc_004">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select t1.* , t2.last_name || t2.first_name as fullname
from   FAQ as t1 left join USER_MASTER as t2 on t1.a_user_id = t2.user_id
where  t1.effective = 1 and
       t1.q_user_id = " & dao_escape(arguments.arg001) & "
       order by t1.serial desc;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_user_cfc_005">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select t1.* , t2.last_name || t2.first_name as fullname
from   FAQ as t1 left join USER_MASTER as t2 on t1.a_user_id = t2.user_id
where  t1.effective = 1 and
       t1.serial = " & dao_escape(arguments.arg001) & ";
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_user_cfc_007">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
Insert into faq
(q_user_id , title , contents , q_course_id , q_sco_id , answer , indication , a_flag , effective , entry_date, change_date , recordname)
values
(" & dao_escape(arguments.arg001) & " , " & dao_n() & "'" & dao_escape(arguments.arg002) & "' , " & dao_n() & "'" & dao_escape(arguments.arg003) & "' , " & dao_escape(arguments.arg004) & " , " & dao_escape(arguments.arg005) & " , " & dao_n() & "'' , 0 , 0 , 1 , "&dao_now()&", "&dao_now()&" , " & dao_n() & "'" & dao_escape(arguments.arg006) & "');
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- add 20060927 tanaka --->
<cffunction name="qa_user_cfc_008">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
	select user_id, mailaddress, user_type_id , last_name , first_name
	from   USER_MASTER
	where  user_type_id = 1

	union

	select user_id , mailaddress , user_type_id , last_name , first_name
	from   USER_MASTER
	where  user_type_id = 2 and
	       user_id not in (
	                       select distinct user_id
	                       from   admin_group
	                      )

	union

	select distinct um.user_id, um.mailaddress, um.user_type_id , um.last_name , um.first_name
	from   USER_MASTER as um,
		(
                 select ag.user_id
                 from   admin_group as ag,
                        (select group_id from belong where user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' ) as sq1
                 where ag.group_id = sq1.group_id
                ) as sq2
	where  um.user_id = sq2.user_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_user_cfc_009">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
	select user_id
	from   USER_MASTER
	where  user_type_id = 1

	union

	select user_id
	from   admin_course
	where  course_id = " & dao_n() & "'" & #dao_escape(arguments.arg001)# & "'

	union

	select user_id
	from   USER_MASTER
	where  user_type_id = 2 AND
	       user_id not in (
	                       select distinct user_id
	                       from   admin_course
	                      )

">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="qa_userinq_cfc_002">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
Insert into faq
(q_user_id , genre , division , title , contents , answer , indication , a_flag , effective , entry_date, change_date)
values
(" & dao_escape(arguments.arg001) & " , " & dao_escape(arguments.arg002) & " , " & dao_escape(arguments.arg003) & " , " & dao_n() & "'" & dao_escape(arguments.arg004) & "' , " & dao_n() & "'" & dao_escape(arguments.arg005) & "' , " & dao_n() & "'' , 0 , 0 , 1 , "&dao_now()&", "&dao_now()&");
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="setManifest_cfc_003">
	<cfset tempSql = "
SELECT MAX(sco_id) AS maxscoid
FROM SCO_MASTER
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="setManifest_cfc_008">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfargument name="arg009" required="true">
	<cfargument name="arg010" required="true">
	<cfargument name="arg011" required="true">
	<cfargument name="arg012" required="true">
	<cfargument name="arg013" required="true">
	<cfargument name="arg014" required="true">
	<cfargument name="arg015" required="true">
	<cfargument name="arg016" required="true">
	<cfargument name="arg017" required="true">
	<cfargument name="arg018" required="true">
	<cfargument name="arg019" required="true">
	<cfargument name="arg020" required="true">
	<cfargument name="arg021" required="true">
	<cfargument name="arg022" required="true">
	<cfargument name="arg023" required="true">
	<cfargument name="arg024" required="true">
	<cfargument name="arg025" required="true">
		<cfset tempSql = "
INSERT INTO SCO_MASTER
(sco_id, sco_type, sco_name, sco_guide, url, launch, class_id
, lecture_time_hour, lecture_time_min, max_score, mastery_score, min_score
, entry_date, change_date
, max_time_allowed, time_limit_action, flag_trial, flg_score, flg_answer
, sco_kind, review_count, note, explanation, passed_msg
, manifest_id, identifier)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'1'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "'
, " & dao_n() & "'" & dao_escape(arguments.arg007) & "'," & dao_n() & "'" & dao_escape(arguments.arg008) & "'," & dao_n() & "'" & dao_escape(arguments.arg009) & "'," & dao_n() & "'" & dao_escape(arguments.arg010) & "'," & dao_n() & "'" & dao_escape(arguments.arg011) & "'
, " & dao_n() & "'" & dao_escape(arguments.arg012) & " " & dao_escape(arguments.arg013) & "', "&dao_now()&"
, " & dao_n() & "'" & dao_escape(arguments.arg014) & "'," & dao_n() & "'" & dao_escape(arguments.arg015) & "'," & dao_n() & "'" & dao_escape(arguments.arg016) & "'," & dao_n() & "'" & dao_escape(arguments.arg017) & "'," & dao_n() & "'" & dao_escape(arguments.arg018) & "'
, " & dao_n() & "'" & dao_escape(arguments.arg019) & "', " & dao_n() & "'" & dao_escape(arguments.arg020) & "'," & dao_n() & "'" & dao_escape(arguments.arg021) & "'," & dao_n() & "'" & dao_escape(arguments.arg022) & "'," & dao_n() & "'" & dao_escape(arguments.arg023) & "'
, " & dao_n() & "'" & dao_escape(arguments.arg024) & "'," & dao_n() & "'" & dao_escape(arguments.arg025) & "')
">
	<!--- edit end 20061006 tanaka --->
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="setManifest_cfc_010">
	<cfset tempSql = "
SELECT MAX(course_id) AS maxcourseid
FROM COURSE_MASTER
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="setManifest_cfc_011">
	<cfset tempSql = "
SELECT course_no
FROM COURSE_MASTER
WHERE course_no LIKE 'mani%'
ORDER BY course_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="setManifest_cfc_014">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfargument name="arg009" required="true">
	<cfset tempSql = "
INSERT INTO COURSE_MASTER_DELETED
(course_id,course_no,course_name,course_guide,regist_flag,course_time_hour,
course_time_min,complete_count,entry_date,start_date, change_date, directory_name,
check_state,flag_bbs,flag_inquiry,flag_faq,flag_tree,display_move_button,appear)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'0'," & dao_n() & "'" & dao_escape(arguments.arg005) & "',
" & dao_n() & "'" & dao_escape(arguments.arg006) & "'," & dao_n() & "'0'," & dao_n() & "'" & dao_escape(arguments.arg007) & " " & dao_escape(arguments.arg008) & "',"&dao_now()&", "&dao_now()&", " & dao_n() & "'" & dao_escape(arguments.arg009) & "',
1,1,1,1,1,1,0)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="setManifest_cfc_015">
	<!--- 全コース割り当てはassignではなくUSER_MASTERのフラグで判断する 20061120 tanaka --->
	<!----------
	<cfset tempSql = "
SELECT USER_MASTER.user_id from USER_MASTER
LEFT JOIN ASSIGN ON ASSIGN.user_id = USER_MASTER.user_id
where ASSIGN.user_id is null
">
---------->
	<cfset tempSql = "
SELECT user_id
FROM USER_MASTER
WHERE flag_all_course = '1'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="setManifest_cfc_016">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
INSERT INTO COURSE_PROGRESS (user_id, course_id, course_status, course_count, course_score, course_total_time, change_date) VALUES (" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & ", " & dao_n() & "'not attempted', 0, 0, " & dao_n() & "'0000:00:00', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="setManifest_cfc_018">
	<cfset tempSql = "
SELECT MAX(sco_id) AS maxscoid
FROM SCO_MASTER
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="setManifest_cfc_019">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfargument name="arg009" required="true">
	<cfset tempSql = "
INSERT INTO SCO_MASTER
(sco_id,sco_type,sco_name,sco_guide,url,launch,class_id,
lecture_time_hour,lecture_time_min,max_score,mastery_score,min_score,
review_count,entry_date, change_date, flag_trial)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'2'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "''," & dao_n() & "''," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'1',
" & dao_n() & "'0'," & dao_n() & "'0'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "',
" & dao_n() & "'0'," & dao_n() & "'" & dao_escape(arguments.arg007) & " " & dao_escape(arguments.arg008) & "', "&dao_now()&"," & dao_n() & "'" & dao_escape(arguments.arg009) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="setManifest_cfc_020">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO CONSTRUCT
(course_id,parent_sco_id,order_no,sco_id,entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & " " & dao_escape(arguments.arg006) & "', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="setManifest_cfc_021">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO CONSTRUCT
(course_id,parent_sco_id,order_no,sco_id,entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & " " & dao_escape(arguments.arg006) & "', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>

<!---------------------------------------------->
<cffunction name="setManifest_cfc_022">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
INSERT INTO PRECONDITION
(course_id, sco_id, pre_sco_id, entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'
, "&dao_now()&", "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>

<!---------------------------------------------->
<cffunction name="tell_cfc_002">
	<cfset tempSql = "
update NOTIFICATION set
effective_1 = " & dao_n() & "'0'
where type = 1;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_003">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
Insert into NOTIFICATION
(type , title_1 , contents_1 , effective_1 , entry_date, change_date)
values
(1 , " & dao_n() & "'" & dao_escape(arguments.arg001) & "' , " & dao_n() & "'" & dao_escape(arguments.arg002) & "' , " & dao_n() & "'" & dao_escape(arguments.arg003) & "' , "&dao_now()&", "&dao_now()&");
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_004">
	<cfset tempSql = "
update NOTIFICATION set
effective_1 = '0'
where type = 1;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_005">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
Update NOTIFICATION set
type = 1,
title_1 = " & dao_n() & "'" & dao_escape(arguments.arg001) & "',
contents_1 = " & dao_n() & "'" & dao_escape(arguments.arg002) & "',
effective_1 = " & dao_n() & "'" & dao_escape(arguments.arg003) & "',
change_date = "&dao_now()&"
where serial = " & dao_n() & "'" & dao_escape(arguments.arg004) & "';
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_006">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
delete from NOTIFICATION
where serial = " & dao_n() & "'" & dao_escape(arguments.arg001) & "';
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_007">
	<cfset tempSql = "
update NOTIFICATION set
effective_1 = " & dao_n() & "'0'
where type = 1;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_008">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
update NOTIFICATION set
effective_1 = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
where serial = " & dao_n() & "'" & dao_escape(arguments.arg002) & "';
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_009">
	<cfargument name="arg001" required="true">

		<cfif arg001 is 1>
			<cfset order = ' order by COURSE_MASTER.course_no'>
		<cfelseif arg001 is 2>
			<cfset order = ' order by COURSE_MASTER.course_no desc'>
		<cfelseif arg001 is 3>
			<cfset order = ' order by COURSE_MASTER.course_name'>
		<cfelseif arg001 is 4>
			<cfset order = ' order by COURSE_MASTER.course_name desc'>
		<cfelseif arg001 is 5>
			<cfset order = ' order by COURSE_MASTER.entry_date'>
		<cfelseif arg001 is 6>
			<cfset order = ' order by COURSE_MASTER.entry_date desc'>
		</cfif>

	<cfset tempSql = "
select COURSE_MASTER.course_id , COURSE_MASTER.course_name, NOTIFICATION.title_1 as title, NOTIFICATION.contents_1 as content, NOTIFICATION.effective_1 as effective
from COURSE_MASTER
left join NOTIFICATION on COURSE_MASTER.course_id = NOTIFICATION.course_id and NOTIFICATION.type = 2
">

	<cfset tempSql = tempSql & order>

	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_011">
	<cfargument name="arg001" required="true">

	<cfif arg001 is 1>
		<cfset order = ' order by COURSE_MASTER.course_no'>
	<cfelseif arg001 is 2>
		<cfset order = ' order by COURSE_MASTER.course_no desc'>
	<cfelseif arg001 is 3>
		<cfset order = ' order by COURSE_MASTER.course_name'>
	<cfelseif arg001 is 4>
		<cfset order = ' order by COURSE_MASTER.course_name desc'>
	<cfelseif arg001 is 5>
		<cfset order = ' order by COURSE_MASTER.entry_date'>
	<cfelseif arg001 is 6>
		<cfset order = ' order by COURSE_MASTER.entry_date desc'>
	</cfif>

	<cfset tempSql = "
select COURSE_MASTER.course_id , COURSE_MASTER.course_name, NOTIFICATION.title_1 as title , NOTIFICATION.contents_1 as contents, NOTIFICATION.effective_1 as effective
from COURSE_MASTER
left join NOTIFICATION on COURSE_MASTER.course_id = NOTIFICATION.course_id and NOTIFICATION.type = 2
">

	<cfset tempSql = tempSql & order>

	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_012">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">

	<cfif arg002 is 1>
		<cfset order = ' order by COURSE_MASTER.course_no'>
	<cfelseif arg002 is 2>
		<cfset order = ' order by COURSE_MASTER.course_no desc'>
	<cfelseif arg002 is 3>
		<cfset order = ' order by COURSE_MASTER.course_name'>
	<cfelseif arg002 is 4>
		<cfset order = ' order by COURSE_MASTER.course_name desc'>
	<cfelseif arg002 is 5>
		<cfset order = ' order by COURSE_MASTER.entry_date'>
	<cfelseif arg002 is 6>
		<cfset order = ' order by COURSE_MASTER.entry_date desc'>
	</cfif>

	<cfset tempSql = "
select COURSE_MASTER.course_id , COURSE_MASTER.course_name, NOTIFICATION.title_1 as title , NOTIFICATION.contents_1 as contents , NOTIFICATION.effective_1 as effective
from COURSE_MASTER
left join admin_course on admin_course.course_id = COURSE_MASTER.course_id
left join NOTIFICATION on COURSE_MASTER.course_id = NOTIFICATION.course_id and NOTIFICATION.type = 2
where admin_course.user_id = " & dao_escape(arguments.arg001) & "
">

	<cfset tempSql = tempSql & order>

	<cfreturn tempSql>
</cffunction>

<!---------------------------------------------->
<cffunction name="tell_cfc_099">
	<cfargument name="arg001" required="true">

	<cfset tempSql = "
select *
from NOTIFICATION
where NOTIFICATION.type = " & dao_escape(arguments.arg001) & "
">

	<cfreturn tempSql>
</cffunction>

<!---------------------------------------------->
<cffunction name="tell_cfc_013">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
delete from NOTIFICATION
where type = 2 and course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "';
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_014">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
Insert into NOTIFICATION
(course_id, type , title_1 , contents_1 , effective_1 , allotment_flag, entry_date, change_date)
values
(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', 2 , " & dao_n() & "'" & dao_escape(arguments.arg002) & "' , " & dao_n() & "'" & dao_escape(arguments.arg003) & "' , " & dao_n() & "'" & dao_escape(arguments.arg004) & "' , " & dao_n() & "'" & dao_escape(arguments.arg005) & "' , " &dao_now()&", "&dao_now()&");
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_015">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
update NOTIFICATION set
effective_1 = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
where type=2 and course_id=" & dao_n() & "'" & dao_escape(arguments.arg002) & "';
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_016">
	<cfargument name="arg001" required="true">

	<cfset var order = ''>

	<cfif arg001 is 1>
		<cfset order = ' order by COURSE_MASTER.course_no'>
	<cfelseif arg001 is 2>
		<cfset order = ' order by COURSE_MASTER.course_no desc'>
	<cfelseif arg001 is 3>
		<cfset order = ' order by COURSE_MASTER.course_name'>
	<cfelseif arg001 is 4>
		<cfset order = ' order by COURSE_MASTER.course_name desc'>
	<cfelseif arg001 is 5>
		<cfset order = ' order by COURSE_MASTER.entry_date'>
	<cfelseif arg001 is 6>
		<cfset order = ' order by COURSE_MASTER.entry_date desc'>
	</cfif>
	<cfset tempSql = "
select
	COURSE_MASTER.course_id ,
	COURSE_MASTER.course_name,
	COURSE_MASTER.start_date,
	COURSE_MASTER.complete_count,
	NOTIFICATION.effective_1 ,
	NOTIFICATION.effective_2 ,
	NOTIFICATION.effective_3 ,
	NOTIFICATION.effective_student_1 ,
	NOTIFICATION.effective_student_2 ,
	NOTIFICATION.effective_student_3 ,
	NOTIFICATION.effective_mentor_1 ,
	NOTIFICATION.effective_mentor_2 ,
	NOTIFICATION.effective_mentor_3 ,
	NOTIFICATION.notice_1,
	NOTIFICATION.notice_2,
	NOTIFICATION.notice_3,
	NOTIFICATION.title_1 ,
	NOTIFICATION.title_2 ,
	NOTIFICATION.title_3 ,
	NOTIFICATION.contents_1 ,
	NOTIFICATION.contents_2 ,
	NOTIFICATION.contents_3 ,
	NOTIFICATION.title_mentor_1 ,
	NOTIFICATION.title_mentor_2 ,
	NOTIFICATION.title_mentor_3 ,
	NOTIFICATION.contents_1 ,
	NOTIFICATION.contents_2 ,
	NOTIFICATION.contents_3 ,
	NOTIFICATION.contents_mentor_1 ,
	NOTIFICATION.contents_mentor_2 ,
	NOTIFICATION.contents_mentor_3 ,
	NOTIFICATION.achievement_1,
	NOTIFICATION.achievement_2,
	NOTIFICATION.achievement_3
from COURSE_MASTER
left join NOTIFICATION on COURSE_MASTER.course_id = NOTIFICATION.course_id and NOTIFICATION.type = 3">

	<cfset tempSql = tempSql & order>

	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_018">
	<cfargument name="arg001" required="true">

	<cfset var order = ''>

	<cfif arg001 is 1>
		<cfset order = ' order by COURSE_MASTER.course_no'>
	<cfelseif arg001 is 2>
		<cfset order = ' order by COURSE_MASTER.course_no desc'>
	<cfelseif arg001 is 3>
		<cfset order = ' order by COURSE_MASTER.course_name'>
	<cfelseif arg001 is 4>
		<cfset order = ' order by COURSE_MASTER.course_name desc'>
	<cfelseif arg001 is 5>
		<cfset order = ' order by COURSE_MASTER.entry_date'>
	<cfelseif arg001 is 6>
		<cfset order = ' order by COURSE_MASTER.entry_date desc'>
	</cfif>

	<cfset tempSql = "
select
	COURSE_MASTER.course_id ,
	COURSE_MASTER.course_name,
	COURSE_MASTER.start_date,
	COURSE_MASTER.complete_count,
	NOTIFICATION.effective_1 ,
	NOTIFICATION.effective_2 ,
	NOTIFICATION.effective_3 ,
	NOTIFICATION.effective_student_1 ,
	NOTIFICATION.effective_student_2 ,
	NOTIFICATION.effective_student_3 ,
	NOTIFICATION.effective_mentor_1 ,
	NOTIFICATION.effective_mentor_2 ,
	NOTIFICATION.effective_mentor_3 ,
	NOTIFICATION.notice_1,
	NOTIFICATION.notice_2,
	NOTIFICATION.notice_3,
	NOTIFICATION.title_1 ,
	NOTIFICATION.title_2 ,
	NOTIFICATION.title_3 ,
	NOTIFICATION.contents_1 ,
	NOTIFICATION.contents_2 ,
	NOTIFICATION.contents_3 ,
	NOTIFICATION.title_mentor_1 ,
	NOTIFICATION.title_mentor_2 ,
	NOTIFICATION.title_mentor_3 ,
	NOTIFICATION.contents_1 ,
	NOTIFICATION.contents_2 ,
	NOTIFICATION.contents_3 ,
	NOTIFICATION.contents_mentor_1 ,
	NOTIFICATION.contents_mentor_2 ,
	NOTIFICATION.contents_mentor_3 ,
	NOTIFICATION.achievement_1,
	NOTIFICATION.achievement_2,
	NOTIFICATION.achievement_3
from COURSE_MASTER
left join NOTIFICATION on COURSE_MASTER.course_id = NOTIFICATION.course_id and NOTIFICATION.type = 3
">

	<cfset tempSql = tempSql & order>

	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_019">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">

	<cfset var order = ''>

	<cfif arg002 is 1>
		<cfset order = ' order by COURSE_MASTER.course_no'>
	<cfelseif arg002 is 2>
		<cfset order = ' order by COURSE_MASTER.course_no desc'>
	<cfelseif arg002 is 3>
		<cfset order = ' order by COURSE_MASTER.course_name'>
	<cfelseif arg002 is 4>
		<cfset order = ' order by COURSE_MASTER.course_name desc'>
	<cfelseif arg002 is 5>
		<cfset order = ' order by COURSE_MASTER.entry_date'>
	<cfelseif arg002 is 6>
		<cfset order = ' order by COURSE_MASTER.entry_date desc'>
	</cfif>


	<cfset tempSql = "
select
	COURSE_MASTER.course_id ,
	COURSE_MASTER.course_name,
	COURSE_MASTER.start_date,
	COURSE_MASTER.complete_count,
	NOTIFICATION.effective_1 ,
	NOTIFICATION.effective_2 ,
	NOTIFICATION.effective_3 ,
	NOTIFICATION.effective_student_1 ,
	NOTIFICATION.effective_student_2 ,
	NOTIFICATION.effective_student_3 ,
	NOTIFICATION.effective_mentor_1 ,
	NOTIFICATION.effective_mentor_2 ,
	NOTIFICATION.effective_mentor_3 ,
	NOTIFICATION.notice_1,
	NOTIFICATION.notice_2,
	NOTIFICATION.notice_3,
	NOTIFICATION.title_1 ,
	NOTIFICATION.title_2 ,
	NOTIFICATION.title_3 ,
	NOTIFICATION.contents_1 ,
	NOTIFICATION.contents_2 ,
	NOTIFICATION.contents_3 ,
	NOTIFICATION.title_mentor_1 ,
	NOTIFICATION.title_mentor_2 ,
	NOTIFICATION.title_mentor_3 ,
	NOTIFICATION.contents_1 ,
	NOTIFICATION.contents_2 ,
	NOTIFICATION.contents_3 ,
	NOTIFICATION.contents_mentor_1 ,
	NOTIFICATION.contents_mentor_2 ,
	NOTIFICATION.contents_mentor_3 ,
	NOTIFICATION.achievement_1,
	NOTIFICATION.achievement_2,
	NOTIFICATION.achievement_3
from COURSE_MASTER
left join admin_course on admin_course.course_id = COURSE_MASTER.course_id
left join NOTIFICATION on COURSE_MASTER.course_id = NOTIFICATION.course_id and NOTIFICATION.type = 3
where admin_course.user_id = " & dao_escape(arguments.arg001) & "
">

	<cfset tempSql = tempSql & order>

	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_020">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
delete from NOTIFICATION
where type = 3
and course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_021">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfargument name="arg009" required="true">
	<cfargument name="arg010" required="true">
	<cfargument name="arg011" required="true">
	<cfargument name="arg012" required="true">
	<cfargument name="arg013" required="true">
	<cfargument name="arg014" required="true">
	<cfargument name="arg015" required="true">
	<cfargument name="arg016" required="true">
	<cfargument name="arg017" required="true">
	<cfargument name="arg018" required="false"><!--- メンター関連 --->
	<cfargument name="arg019" required="false">
	<cfargument name="arg020" required="false">
	<cfargument name="arg021" required="false">
	<cfargument name="arg022" required="false">
	<cfargument name="arg023" required="false">
	<cfargument name="arg024" required="false">
	<cfargument name="arg025" required="false">
	<cfargument name="arg026" required="false">
	<cfargument name="arg027" required="false">
	<cfargument name="arg028" required="false">
	<cfargument name="arg029" required="false">

<cfif isDefined("arg018")>
	<cfset tempSql = "
Insert into NOTIFICATION
(course_id ,
 type ,
 title_1 ,
 title_2 ,
 title_3 ,
 contents_1 ,
 contents_2 ,
 contents_3 ,
 effective_1 ,
 effective_2 ,
 effective_3 ,
 achievement_1 ,
 achievement_2 ,
 achievement_3 ,
 notice_1 ,
 notice_2 ,
 notice_3 ,
 p_day ,
 entry_date ,
 change_date ,
 title_mentor_1,
 title_mentor_2,
 title_mentor_3,
 contents_mentor_1,
 contents_mentor_2,
 contents_mentor_3,
 effective_student_1,
 effective_student_2,
 effective_student_3,
 effective_mentor_1,
 effective_mentor_2,
 effective_mentor_3
) values (
 " & dao_n() & "'" & dao_escape(arguments.arg001) & "',
  3 ,
 " & dao_n() & "'" & dao_escape(arguments.arg002) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg003) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg004) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg005) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg006) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg007) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg008) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg009) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg010) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg011) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg012) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg013) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg014) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg015) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg016) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg017) & "' ,
 "&dao_now()&",
 "&dao_now()&",
 " & dao_n() & "'" & dao_escape(arguments.arg018) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg019) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg020) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg021) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg022) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg023) & "' ,
  " & dao_escape(arguments.arg024) & "  ,
  " & dao_escape(arguments.arg025) & "  ,
  " & dao_escape(arguments.arg026) & "  ,
  " & dao_escape(arguments.arg027) & "  ,
  " & dao_escape(arguments.arg028) & "  ,
  " & dao_escape(arguments.arg029) & "

);
">
	<cfreturn tempSql>
<cfelse>
	<cfset tempSql = "
Insert into NOTIFICATION
(course_id ,
 type ,
 title_1 ,
 title_2 ,
 title_3 ,
 contents_1 ,
 contents_2 ,
 contents_3 ,
 effective_1 ,
 effective_2 ,
 effective_3 ,
 achievement_1 ,
 achievement_2 ,
 achievement_3 ,
 notice_1 ,
 notice_2 ,
 notice_3 ,
 p_day ,
 entry_date ,
 change_date
) values (
 " & dao_n() & "'" & dao_escape(arguments.arg001) & "',
  3 ,
 " & dao_n() & "'" & dao_escape(arguments.arg002) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg003) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg004) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg005) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg006) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg007) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg008) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg009) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg010) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg011) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg012) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg013) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg014) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg015) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg016) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.arg017) & "' ,
 "&dao_now()&",
 "&dao_now()&");
">
	<cfreturn tempSql>
</cfif>
</cffunction>

<!---------------------------------------------->
<cffunction name="tell_cfc_022">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
update NOTIFICATION set
effective_1 = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
where type=3 and course_id=" & dao_n() & "'" & dao_escape(arguments.arg002) & "';
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_024">
	<cfset tempSql = "
delete from NOTIFICATION
where type = 4;
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_025">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
Insert into NOTIFICATION
(type , title_1 , contents_1 , effective_1 , entry_date, change_date)
values
(4 , " & dao_n() & "'" & dao_escape(arguments.arg001) & "' , " & dao_n() & "'" & dao_escape(arguments.arg002) & "' , " & dao_n() & "'" & dao_escape(arguments.arg003) & "' , "&dao_now()&", "&dao_now()&");
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_026">
	<cfargument name="arg001" required="true">

	<cfif arg001 is 1>
		<cfset order = ' order by serial'>
	<cfelseif arg001 is 2>
		<cfset order = ' order by serial desc'>
	<cfelseif arg001 is 3>
		<cfset order = ' order by effective_1 desc'>
	<cfelseif arg001 is 4>
		<cfset order = ' order by effective_1'>
	<cfelseif arg001 is 5>
		<cfset order = ' order by title_1'>
	<cfelseif arg001 is 6>
		<cfset order = ' order by title_1 desc'>
	<cfelse>
		<cfset order = ''>
	</cfif>
	<cfset tempSql = "
select serial , type , title_1 as title , contents_1 as title , effective_1 as effective , entry_date
from   NOTIFICATION
where  type = 1
">

	<cfset tempSql = tempSql & order>

	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_027">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
update LMS_INFO set default_mail = " & dao_n() & "'#dao_escape(arguments.arg001)#' , default_name = " & dao_n() & "'#dao_escape(arguments.arg002)#' , default_signature = " & dao_n() & "'#dao_escape(arguments.arg003)#'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_028">
	<cfargument name="course_id"   type="numeric">
	<cfargument name="title_1"     type="string" >
	<cfargument name="title_2"     type="string" >
	<cfargument name="title_3"     type="string" >
	<cfargument name="contents_1"  type="string" >
	<cfargument name="contents_2"  type="string" >
	<cfargument name="contents_3"  type="string" >
	<cfargument name="effective_1" type="string" >
	<cfargument name="effective_2" type="string" >
	<cfargument name="effective_3" type="string" >
	<cfargument name="notice_1" type="string" >
	<cfargument name="notice_2" type="string" >
	<cfargument name="notice_3" type="string" >
	<cfset tempSql = "
Insert into NOTIFICATION
(type ,
 course_id,
 title_1 ,
 title_2 ,
 title_3 ,
 contents_1 ,
 contents_2 ,
 contents_3 ,
 effective_1 ,
 effective_2 ,
 effective_3 ,
 notice_1 ,
 notice_2 ,
 notice_3 ,
 entry_date,
 change_date)
values
(6 ,
 " & dao_n() & "'" & dao_escape(arguments.course_id) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.title_1) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.title_2) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.title_3) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.contents_1) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.contents_2) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.contents_3) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.effective_1) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.effective_2) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.effective_3) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.notice_1) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.notice_2) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.notice_3) & "' ,
  "&dao_now()&", "&dao_now()&");

">
	<cfreturn tempSql>
</cffunction>

<!---------------------------------------------->
<cffunction name="tell_cfc_029">
	<cfargument name="arg001" required="true">

	<cfset var order = ''>

	<cfif arg001 is 1>
		<cfset order = ' order by COURSE_MASTER.course_no'>
	<cfelseif arg001 is 2>
		<cfset order = ' order by COURSE_MASTER.course_no desc'>
	<cfelseif arg001 is 3>
		<cfset order = ' order by COURSE_MASTER.course_name'>
	<cfelseif arg001 is 4>
		<cfset order = ' order by COURSE_MASTER.course_name desc'>
	<cfelseif arg001 is 5>
		<cfset order = ' order by COURSE_MASTER.entry_date'>
	<cfelseif arg001 is 6>
		<cfset order = ' order by COURSE_MASTER.entry_date desc'>
	</cfif>
	<cfset tempSql = "
select
	COURSE_MASTER.course_id ,
	COURSE_MASTER.course_name,
	COURSE_MASTER.start_date,
	COURSE_MASTER.complete_count,
	NOTIFICATION.effective_1 ,
	NOTIFICATION.effective_2 ,
	NOTIFICATION.effective_3 ,
	NOTIFICATION.effective_student_1 ,
	NOTIFICATION.effective_student_2 ,
	NOTIFICATION.effective_student_3 ,
	NOTIFICATION.effective_mentor_1 ,
	NOTIFICATION.effective_mentor_2 ,
	NOTIFICATION.effective_mentor_3 ,
	NOTIFICATION.notice_1,
	NOTIFICATION.notice_2,
	NOTIFICATION.notice_3,
	NOTIFICATION.title_1 ,
	NOTIFICATION.title_2 ,
	NOTIFICATION.title_3 ,
	NOTIFICATION.contents_1 ,
	NOTIFICATION.contents_2 ,
	NOTIFICATION.contents_3 ,
	NOTIFICATION.title_mentor_1 ,
	NOTIFICATION.title_mentor_2 ,
	NOTIFICATION.title_mentor_3 ,
	NOTIFICATION.contents_1 ,
	NOTIFICATION.contents_2 ,
	NOTIFICATION.contents_3 ,
	NOTIFICATION.contents_mentor_1 ,
	NOTIFICATION.contents_mentor_2 ,
	NOTIFICATION.contents_mentor_3 ,
	NOTIFICATION.achievement_1,
	NOTIFICATION.achievement_2,
	NOTIFICATION.achievement_3
from COURSE_MASTER
left join NOTIFICATION on COURSE_MASTER.course_id = NOTIFICATION.course_id and NOTIFICATION.type = 6">

	<cfset tempSql = tempSql & order>

	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_030">
	<cfargument name="arg001" required="true">

	<cfset var order = ''>

	<cfif arg001 is 1>
		<cfset order = ' order by COURSE_MASTER.course_no'>
	<cfelseif arg001 is 2>
		<cfset order = ' order by COURSE_MASTER.course_no desc'>
	<cfelseif arg001 is 3>
		<cfset order = ' order by COURSE_MASTER.course_name'>
	<cfelseif arg001 is 4>
		<cfset order = ' order by COURSE_MASTER.course_name desc'>
	<cfelseif arg001 is 5>
		<cfset order = ' order by COURSE_MASTER.entry_date'>
	<cfelseif arg001 is 6>
		<cfset order = ' order by COURSE_MASTER.entry_date desc'>
	</cfif>

	<cfset tempSql = "
select
	COURSE_MASTER.course_id ,
	COURSE_MASTER.course_name,
	COURSE_MASTER.start_date,
	COURSE_MASTER.complete_count,
	NOTIFICATION.effective_1 ,
	NOTIFICATION.effective_2 ,
	NOTIFICATION.effective_3 ,
	NOTIFICATION.effective_student_1 ,
	NOTIFICATION.effective_student_2 ,
	NOTIFICATION.effective_student_3 ,
	NOTIFICATION.effective_mentor_1 ,
	NOTIFICATION.effective_mentor_2 ,
	NOTIFICATION.effective_mentor_3 ,
	NOTIFICATION.notice_1,
	NOTIFICATION.notice_2,
	NOTIFICATION.notice_3,
	NOTIFICATION.title_1 ,
	NOTIFICATION.title_2 ,
	NOTIFICATION.title_3 ,
	NOTIFICATION.contents_1 ,
	NOTIFICATION.contents_2 ,
	NOTIFICATION.contents_3 ,
	NOTIFICATION.title_mentor_1 ,
	NOTIFICATION.title_mentor_2 ,
	NOTIFICATION.title_mentor_3 ,
	NOTIFICATION.contents_1 ,
	NOTIFICATION.contents_2 ,
	NOTIFICATION.contents_3 ,
	NOTIFICATION.contents_mentor_1 ,
	NOTIFICATION.contents_mentor_2 ,
	NOTIFICATION.contents_mentor_3 ,
	NOTIFICATION.achievement_1,
	NOTIFICATION.achievement_2,
	NOTIFICATION.achievement_3
from COURSE_MASTER
left join NOTIFICATION on COURSE_MASTER.course_id = NOTIFICATION.course_id and NOTIFICATION.type = 6
">

	<cfset tempSql = tempSql & order>

	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_031">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">

	<cfset var order = ''>

	<cfif arg002 is 1>
		<cfset order = ' order by COURSE_MASTER.course_no'>
	<cfelseif arg002 is 2>
		<cfset order = ' order by COURSE_MASTER.course_no desc'>
	<cfelseif arg002 is 3>
		<cfset order = ' order by COURSE_MASTER.course_name'>
	<cfelseif arg002 is 4>
		<cfset order = ' order by COURSE_MASTER.course_name desc'>
	<cfelseif arg002 is 5>
		<cfset order = ' order by COURSE_MASTER.entry_date'>
	<cfelseif arg002 is 6>
		<cfset order = ' order by COURSE_MASTER.entry_date desc'>
	</cfif>

	<cfset tempSql = "
select
	COURSE_MASTER.course_id ,
	COURSE_MASTER.course_name,
	COURSE_MASTER.start_date,
	COURSE_MASTER.complete_count,
	NOTIFICATION.effective_1 ,
	NOTIFICATION.effective_2 ,
	NOTIFICATION.effective_3 ,
	NOTIFICATION.effective_student_1 ,
	NOTIFICATION.effective_student_2 ,
	NOTIFICATION.effective_student_3 ,
	NOTIFICATION.effective_mentor_1 ,
	NOTIFICATION.effective_mentor_2 ,
	NOTIFICATION.effective_mentor_3 ,
	NOTIFICATION.notice_1,
	NOTIFICATION.notice_2,
	NOTIFICATION.notice_3,
	NOTIFICATION.title_1 ,
	NOTIFICATION.title_2 ,
	NOTIFICATION.title_3 ,
	NOTIFICATION.contents_1 ,
	NOTIFICATION.contents_2 ,
	NOTIFICATION.contents_3 ,
	NOTIFICATION.title_mentor_1 ,
	NOTIFICATION.title_mentor_2 ,
	NOTIFICATION.title_mentor_3 ,
	NOTIFICATION.contents_1 ,
	NOTIFICATION.contents_2 ,
	NOTIFICATION.contents_3 ,
	NOTIFICATION.contents_mentor_1 ,
	NOTIFICATION.contents_mentor_2 ,
	NOTIFICATION.contents_mentor_3 ,
	NOTIFICATION.achievement_1,
	NOTIFICATION.achievement_2,
	NOTIFICATION.achievement_3
from COURSE_MASTER
left join admin_course on admin_course.course_id = COURSE_MASTER.course_id
left join NOTIFICATION on COURSE_MASTER.course_id = NOTIFICATION.course_id and NOTIFICATION.type = 6
where admin_course.user_id = " & dao_escape(arguments.arg001) & "
">

	<cfset tempSql = tempSql & order>

	<cfreturn tempSql>
</cffunction>

<!---------------------------------------------->
<cffunction name="tell_cfc_032">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
delete from NOTIFICATION
where type = 6
and course_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_028_">
	<cfargument name="course_id"   type="numeric">
	<cfargument name="title_1"     type="string" >
	<cfargument name="contents_1"  type="string" >
	<cfargument name="effective_1" type="string" >
	<cfset tempSql = "
Insert into NOTIFICATION
(type ,
 course_id,
 title_1 ,
 contents_1 ,
 effective_1 ,
 entry_date,
 change_date)
values
(7 ,
 " & dao_n() & "'" & dao_escape(arguments.course_id) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.title_1) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.contents_1) & "' ,
 " & dao_n() & "'" & dao_escape(arguments.effective_1) & "' ,
  "&dao_now()&", "&dao_now()&");

">
	<cfreturn tempSql>
</cffunction>

<!---------------------------------------------->
<cffunction name="tell_cfc_029_">
	<cfargument name="arg001" required="true">

	<cfset var order = ''>

	<cfif arg001 is 1>
		<cfset order = ' order by COURSE_MASTER.course_no'>
	<cfelseif arg001 is 2>
		<cfset order = ' order by COURSE_MASTER.course_no desc'>
	<cfelseif arg001 is 3>
		<cfset order = ' order by COURSE_MASTER.course_name'>
	<cfelseif arg001 is 4>
		<cfset order = ' order by COURSE_MASTER.course_name desc'>
	<cfelseif arg001 is 5>
		<cfset order = ' order by COURSE_MASTER.entry_date'>
	<cfelseif arg001 is 6>
		<cfset order = ' order by COURSE_MASTER.entry_date desc'>
	</cfif>
	<cfset tempSql = "
select
	COURSE_MASTER.course_id ,
	COURSE_MASTER.course_name,
	COURSE_MASTER.start_date,
	COURSE_MASTER.complete_count,
	NOTIFICATION.effective_1 ,
	NOTIFICATION.title_1 ,
	NOTIFICATION.contents_1 ,
from COURSE_MASTER
left join NOTIFICATION on COURSE_MASTER.course_id = NOTIFICATION.course_id and NOTIFICATION.type = 7">

	<cfset tempSql = tempSql & order>

	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_030_">
	<cfargument name="arg001" required="true">

	<cfset var order = ''>

	<cfif arg001 is 1>
		<cfset order = ' order by COURSE_MASTER.course_no'>
	<cfelseif arg001 is 2>
		<cfset order = ' order by COURSE_MASTER.course_no desc'>
	<cfelseif arg001 is 3>
		<cfset order = ' order by COURSE_MASTER.course_name'>
	<cfelseif arg001 is 4>
		<cfset order = ' order by COURSE_MASTER.course_name desc'>
	<cfelseif arg001 is 5>
		<cfset order = ' order by COURSE_MASTER.entry_date'>
	<cfelseif arg001 is 6>
		<cfset order = ' order by COURSE_MASTER.entry_date desc'>
	</cfif>

	<cfset tempSql = "
select
	COURSE_MASTER.course_id ,
	COURSE_MASTER.course_name,
	COURSE_MASTER.start_date,
	COURSE_MASTER.complete_count,
	NOTIFICATION.effective_1 ,
	NOTIFICATION.title_1 ,
	NOTIFICATION.contents_1
from COURSE_MASTER
left join NOTIFICATION on COURSE_MASTER.course_id = NOTIFICATION.course_id and NOTIFICATION.type = 7
">

	<cfset tempSql = tempSql & order>

	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="tell_cfc_031_">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">

	<cfset var order = ''>

	<cfif arg002 is 1>
		<cfset order = ' order by COURSE_MASTER.course_no'>
	<cfelseif arg002 is 2>
		<cfset order = ' order by COURSE_MASTER.course_no desc'>
	<cfelseif arg002 is 3>
		<cfset order = ' order by COURSE_MASTER.course_name'>
	<cfelseif arg002 is 4>
		<cfset order = ' order by COURSE_MASTER.course_name desc'>
	<cfelseif arg002 is 5>
		<cfset order = ' order by COURSE_MASTER.entry_date'>
	<cfelseif arg002 is 6>
		<cfset order = ' order by COURSE_MASTER.entry_date desc'>
	</cfif>

	<cfset tempSql = "
select
	COURSE_MASTER.course_id ,
	COURSE_MASTER.course_name,
	COURSE_MASTER.start_date,
	COURSE_MASTER.complete_count,
	NOTIFICATION.effective_1 ,
	NOTIFICATION.title_1 ,
	NOTIFICATION.contents_1
from COURSE_MASTER
left join admin_course on admin_course.course_id = COURSE_MASTER.course_id
left join NOTIFICATION on COURSE_MASTER.course_id = NOTIFICATION.course_id and NOTIFICATION.type = 7
where admin_course.user_id = " & dao_escape(arguments.arg001) & "
">

	<cfset tempSql = tempSql & order>

	<cfreturn tempSql>
</cffunction>

<!---------------------------------------------->
<cffunction name="tell_cfc_032_">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
delete from NOTIFICATION
where type = 7
and course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_004">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT USER_MASTER.user_id , USER_MASTER.last_name , USER_MASTER.first_name, USER_MASTER.last_name_furi, USER_MASTER.first_name_furi , USER_MASTER.flag_all_course
FROM admin_group , belong , USER_MASTER
WHERE admin_group.group_id = belong.group_id AND
belong.user_id = USER_MASTER.user_id AND
admin_group.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'

union

SELECT USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name, USER_MASTER.last_name_furi, USER_MASTER.first_name_furi , USER_MASTER.flag_all_course
FROM USER_MASTER
WHERE USER_MASTER.user_type_id = 3
AND NOT EXISTS (
SELECT *
FROM belong
WHERE USER_MASTER.user_id = belong.user_id
)

ORDER BY USER_MASTER.last_name_furi, USER_MASTER.first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_008">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT GROUP_MASTER.group_id, GROUP_MASTER.group_name
FROM GROUP_MASTER, admin_group
WHERE admin_group.group_id = GROUP_MASTER.group_id
AND admin_group.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
ORDER BY GROUP_MASTER.group_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_013">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT COURSE_MASTER.course_id, COURSE_MASTER.course_name, COURSE_MASTER.course_no
FROM COURSE_MASTER , admin_course
WHERE admin_course.course_id = COURSE_MASTER.course_id
AND admin_course.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
ORDER BY COURSE_MASTER.course_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->




<!---/////////////////////////////////////////////////////////////////////////
ここから使っていない。
<cffunction name="u_assign_cfc_014">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT DISTINCT Dbo_assign.course_id, Dbo_course_master.course_name
FROM COURSE_PROGRESS Dbo_assign, COURSE_MASTER Dbo_course_master
WHERE (Dbo_assign.course_id = Dbo_course_master.course_id)
">
<cfif arguments.arg001 NEQ "">
	<cfset tempSql = tempSql & "
AND (Dbo_assign.user_id = '" & dao_escape(arguments.arg002) & "')
">
</cfif>
<cfset tempSql = tempSql & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_015">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT DISTINCT Dbo_assign.course_id, Dbo_course_master.course_name
FROM COURSE_PROGRESS Dbo_assign, COURSE_MASTER Dbo_course_master
WHERE (Dbo_assign.course_id = Dbo_course_master.course_id)
">
<cfif arguments.arg001 NEQ "">
	<cfset tempSql = tempSql & "
AND (Dbo_assign.user_id <> " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
">
</cfif>
<cfset tempSql = tempSql & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_016">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT DISTINCT Dbo_assign.user_id, Dbo_USER_MASTER.last_name, Dbo_USER_MASTER.first_name
FROM COURSE_PROGRESS Dbo_assign, USER_MASTER Dbo_USER_MASTER
WHERE (Dbo_assign.user_id = Dbo_USER_MASTER.user_id)
">
<cfif arguments.arg001 NEQ "">
	<cfset tempSql = tempSql & "
AND (Dbo_assign.course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
">
</cfif>
<cfset tempSql = tempSql & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_017">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT DISTINCT Dbo_assign.user_id, Dbo_USER_MASTER.last_name, Dbo_USER_MASTER.first_name
FROM COURSE_PROGRESS Dbo_assign, USER_MASTER Dbo_USER_MASTER
WHERE (Dbo_assign.user_id = Dbo_USER_MASTER.user_id)
">
<cfif arguments.arg001 NEQ "">
	<cfset tempSql = tempSql & "
AND (Dbo_assign.course_id <> " & dao_n() & "'" & dao_escape(arguments.arg002) & "')
">
</cfif>
<cfset tempSql = tempSql & "
ORDER BY Dbo_USER_MASTER.last_name, Dbo_USER_MASTER.first_name
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_018">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT * FROM COURSE_PROGRESS
where (user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
">
<cfif 1 LTE ArrayLen(arguments.arg002)>
	<cfset tempSql = tempSql & "
AND course_id IN (" & dao_n() & "'" & arguments.arg002[1] & "'
">
<cfloop index="LoopCount" from="2" to="#ArrayLen(arguments.arg002)#">
	<cfset tempSql = tempSql & "
, " & dao_n() & "'" & arguments.arg002[LoopCount] & "'
">
</cfloop>
	<cfset tempSql = tempSql & "
)
">
</cfif>
<cfset tempSql = tempSql & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_019">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO ASSIGN
( user_id, course_id, entry_date, change_date)
VALUES( " & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_020">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
INSERT INTO COURSE_PROGRESS
( user_id, course_id, course_status, course_count, course_score, course_total_time, change_date )
VALUES( " & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'not attempted', 0, 0, " & dao_n() & "'0000:00:00', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- score`s default value is not (0) but (null) --->
<cffunction name="u_assign_cfc_022">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
INSERT INTO SCO_PROGRESS
( user_id, course_id, sco_id, status, lecture_count, entry, score, total_time, session_time, change_date )
VALUES( " & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'not attempted', 0, " & dao_n() & "'ab-initio', null, " & dao_n() & "'0000:00:00', " & dao_n() & "'0000:00:00', "&dao_now()&" )
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_025">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM ASSIGN
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_026">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
SELECT * FROM COURSE_PROGRESS
where (course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
">
<cfif 1 LTE ArrayLen(arguments.arg002)>
	<cfset tempSql = tempSql & "
AND user_id IN (" & arguments.arg002[1] & "
">
<cfloop index="LoopCount" from="2" to="#ArrayLen(arguments.arg002)#">
	<cfset tempSql = tempSql & "
, " & arguments.arg002[LoopCount]>
</cfloop>
	<cfset tempSql = tempSql & "
)
">
</cfif>
<cfset tempSql = tempSql & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_029">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM ASSIGN
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_030">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO ASSIGN
( user_id, course_id, entry_date, change_date)
VALUES( " & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_031">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
INSERT INTO COURSE_PROGRESS
( user_id, course_id, course_status, course_count, course_score, course_total_time, change_date )
VALUES( " & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'not attempted', 0, 0, " & dao_n() & "'0000:00:00', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- score`s default value is not (0) but (null) --->
<cffunction name="u_assign_cfc_033">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
INSERT INTO SCO_PROGRESS
( user_id, course_id, sco_id, status, lecture_count, entry, score, total_time, session_time, change_date )
VALUES( " & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'not attempted', 0, " & dao_n() & "'ab-initio', null, " & dao_n() & "'0000:00:00', " & dao_n() & "'0000:00:00', "&dao_now()&" )
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_034">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
DELETE FROM ASSIGN
where 0 = 0
">
<cfswitch expression="#arguments.arg001#">
<cfcase Value="1"> <!--- 受講者IDをキーに --->
	<cfif 1 LTE ArrayLen(arguments.arg003)>
		<cfset tempSql = tempSql & "
		AND course_id = " & arguments.arg003[1] & "
		">
	</cfif>
	<cfset LoopMax = ArrayLen(arguments.arg002)> <!--- リストの要素数を取得 --->
	<cfif 1 LTE LoopMax> <!--- 1 <= 要素数なら、IN --->
		<cfset tempSql = tempSql & "
		AND user_id IN (" & dao_n() & "'" & arguments.arg002[1] & "'
		">
		<cfloop index="LoopCount" from="2" to="#LoopMax#"> <!--- 2つ目以降は、要素の前に「,」を追加 --->
			<cfset tempSql = tempSql & "
			, " & dao_n() & "'" & arguments.arg002[LoopCount] & "'
			">
		</cfloop>
		<cfset tempSql = tempSql & "
		)
		">
	</cfif>
</cfcase>
<cfcase Value="2"> <!--- コースIDをキーに --->
	<cfif 1 LTE ArrayLen(arguments.arg002)>
		<cfset tempSql = tempSql & "
		AND user_id = " & arguments.arg002[1] & "
		">
	</cfif>
	<cfset LoopMax = ArrayLen(arguments.arg003)>
	<cfif 1 LTE LoopMax>
		<cfset tempSql = tempSql & "
		AND course_id IN (" & dao_n() & "'" & arguments.arg003[1] & "'
		">
		<cfloop index="LoopCount" from="2" to="#LoopMax#">
			<cfset tempSql = tempSql & "
			, " & dao_n() & "'" & arguments.arg003[LoopCount] & "'
			">
		</cfloop>
		<cfset tempSql = tempSql & "
		)
		">
	</cfif>
</cfcase>
</cfswitch>
<cfset tempSql = tempSql & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_035">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
DELETE FROM COURSE_PROGRESS
where 0 = 0
">
<cfswitch expression="#arguments.arg001#">
	<cfcase Value="1"> <!--- 受講者IDをキーに --->
	<cfif 1 LTE ArrayLen(arguments.arg003)>
		<cfset tempSql = tempSql & "
		AND course_id = " & arguments.arg003[1] & "
		">
	</cfif>
	<cfset LoopMax = ArrayLen(arguments.arg002)> <!--- リストの要素数を取得 --->
	<cfif 1 LTE LoopMax> <!--- 1 <= 要素数なら、IN --->
		<cfset tempSql = tempSql & "
		AND user_id IN ('" & arguments.arg002[1] & "'
		">
		<cfloop index="LoopCount" from="2" to="#LoopMax#"> <!--- 2つ目以降は、要素の前に「,」を追加 --->
			<cfset tempSql = tempSql & "
			, '" & arguments.arg002[LoopCount] & "'
			">
		</cfloop>
	<cfset tempSql = tempSql & "
	)
	">
	</cfif>
</cfcase>
<cfcase Value="2"> <!--- コースIDをキーに --->
	<cfif 1 LTE ArrayLen(arguments.arg002) >
		<cfset tempSql = tempSql & "
		AND user_id = '" & arguments.arg002[1] & "'
		">
	</cfif>
	<cfset LoopMax = ArrayLen(arguments.arg003)>
	<cfif 1 LTE LoopMax>
		<cfset tempSql = tempSql & "
		AND course_id IN ('" & arguments.arg003[1] & "'
		">
		<cfloop index="LoopCount" from="2" to="#LoopMax#">
			<cfset tempSql = tempSql & "
			, '" & arguments.arg003[LoopCount] & "'
			">
		</cfloop>
		<cfset tempSql = tempSql & "
		)
		">
	</cfif>
</cfcase>
</cfswitch>
<cfset tempSql = tempSql & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_036">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
DELETE FROM SCO_PROGRESS
where 0 = 0
">
<cfswitch expression="#arguments.arg001#">
<cfcase Value="1"> <!--- 受講者IDをキーに --->
		<cfif 1 LTE ArrayLen(arguments.arg003)>
			<cfset tempSql = tempSql & "
			AND course_id = '" & arguments.arg003[1] & "'
			">
		</cfif>
	<cfset LoopMax = ArrayLen(arguments.arg002)> <!--- リストの要素数を取得 --->
	<cfif 1 LTE LoopMax> <!--- 1 <= 要素数なら、IN --->
		<cfset tempSql = tempSql & "
		AND user_id IN ('" & arguments.arg002[1] & "'
		">
		<cfloop index="LoopCount" from="2" to="#LoopMax#"> <!--- 2つ目以降は、要素の前に「,」を追加 --->
			<cfset tempSql = tempSql & "
			, '" & arguments.arg002[LoopCount] & "'
			">
		</cfloop>
		<cfset tempSql = tempSql & "
		)
		">
	</cfif>
</cfcase>
<cfcase Value="2"> <!--- コースIDをキーに --->
	<cfif 1 LTE ArrayLen(arguments.arg002)>
		<cfset tempSql = tempSql & "
		AND user_id = '" & arguments.arg002[1] & "'
		">
	</cfif>
	<cfset LoopMax = ArrayLen(arguments.arg003)>
	<cfif 1 LTE LoopMax>
		<cfset tempSql = tempSql & "
		AND course_id IN ('" & arguments.arg003[1] & "'
		">
		<cfloop index="LoopCount" from="2" to="#LoopMax#">
			<cfset tempSql = tempSql & "
			, '" & arguments.arg003[LoopCount] & "'
			">
		</cfloop>
		<cfset tempSql = tempSql & "
		)
		">
	</cfif>
</cfcase>
</cfswitch>
<cfset tempSql = tempSql & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_037">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">	ListUserID
	<cfargument name="arg003" required="true">	ListCourseID
	<cfset tempSql = "
DELETE FROM ITEMS
where 0 = 0
">
<cfswitch expression="#arguments.arg001#">
<cfcase Value="1"> <!--- 受講者IDをキーに --->
	<cfif 1 LTE ArrayLen(arguments.arg003)>
		<cfset tempSql = tempSql & "
		AND course_id = '" & arguments.arg003[1] & "'
		">
	</cfif>
	<cfset LoopMax = ArrayLen(arguments.arg002)> <!--- リストの要素数を取得 --->
	<cfif 1 LTE LoopMax> <!--- 1 <= 要素数なら、IN --->
		<cfset tempSql = tempSql & "
		AND user_id IN ('" & arguments.arg002[1] & "'
		">
		<cfloop index="LoopCount" from="2" to="#LoopMax#"> <!--- 2つ目以降は、要素の前に「,」を追加 --->
			<cfset tempSql = tempSql & "
			, '" & arguments.arg002[LoopCount] & "'
			">
		</cfloop>
		<cfset tempSql = tempSql & "
		)
		">
	</cfif>
</cfcase>
<cfcase Value="2"> <!--- コースIDをキーに --->
	<cfif 1 LTE ArrayLen(arguments.arg002)>
		<cfset tempSql = tempSql & "
		AND user_id = '" & arguments.arg002[1] & "'
		">
	</cfif>
	<cfset LoopMax = " & ArrayLen(arguments.arg003) & ">
	<cfif 1 LTE LoopMax>
		<cfset tempSql = tempSql & "
		AND course_id IN ('" & arguments.arg003[1] & "'
		">
		<cfloop index="LoopCount" from="2" to="#LoopMax#">
			<cfset tempSql = tempSql & "
			, '" & arguments.arg003[LoopCount] & "'
			">
		</cfloop>
		<cfset tempSql = tempSql & "
		)
		">
	</cfif>
</cfcase>
</cfswitch>
<cfset tempSql = tempSql & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_039">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO ASSIGN (user_id, course_id, entry_date, change_date)
VALUES (" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_041">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO ASSIGN (user_id, course_id, entry_date, change_date)
VALUES (" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_042">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT USER_MASTER.user_id,USER_MASTER.last_name,USER_MASTER.first_name
FROM USER_MASTER, belong
where USER_MASTER.user_id = belong.user_id
AND (
">
<cfloop index="i" from="1" to="#ArrayLen(arguments.arg001)#">
<cfif i NEQ 1>
<cfset tempSql = tempSql & "
 OR
">
</cfif>
<cfset tempSql = tempSql & "
belong.group_id = " & arguments.arg001[i] & "
">
</cfloop>
<cfset tempSql = tempSql & "
)

union

SELECT USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name
FROM USER_MASTER
WHERE USER_MASTER.user_type_id = 3
AND NOT EXISTS (
SELECT *
FROM belong
WHERE USER_MASTER.user_id = belong.user_id
)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_045">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
SELECT user_id
FROM COURSE_PROGRESS
WHERE user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND course_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'

UNION

SELECT user_id
FROM COURSE_PROGRESS
WHERE user_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
AND course_id = " & dao_n() & "'" & dao_escape(arguments.arg004) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_047">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT Dbo_USER_MASTER.user_id, Dbo_USER_MASTER.last_name, Dbo_USER_MASTER.first_name
FROM USER_MASTER Dbo_USER_MASTER, COURSE_PROGRESS Dbo_assign
WHERE (Dbo_assign.user_id = Dbo_USER_MASTER.user_id)
AND (Dbo_assign.course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_049">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO ASSIGN
( user_id, course_id, entry_date, change_date)
">
<cfset tempSql = tempSql & "
VALUES( " & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "', "&dao_now()&")
">
<cfset tempSql = tempSql & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_050">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
INSERT INTO COURSE_PROGRESS
( user_id, course_id, course_status, course_count, course_score, course_total_time, change_date )
">
<cfset tempSql = tempSql & "
VALUES( " & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'not attempted', 0, 0, " & dao_n() & "'0000:00:00', "&dao_now()&")
">
<cfset tempSql = tempSql & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_051">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT sco_id FROM CONSTRUCT
">
<cfset tempSql = tempSql & "
WHERE course_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
">
<cfset tempSql = tempSql & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- score`s default value is not (0) but (null) --->
<cffunction name="u_assign_cfc_052">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
INSERT INTO SCO_PROGRESS
( user_id, course_id, sco_id, status, lecture_count, entry, score, total_time, session_time, change_date )
">
<cfset tempSql = tempSql & "
VALUES( " & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'not attempted', 0, " & dao_n() & "'ab-initio', null, " & dao_n() & "'0000:00:00', " & dao_n() & "'0000:00:00', "&dao_now()&" )
">
<cfset tempSql = tempSql & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_054">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM ASSIGN
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_assign_cfc_056">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM ASSIGN
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
ここまで使ってない。
/////////////////////////////////////////////////////////////////////////////////////////////////--->




<cffunction name="u_assign_cfc_057">
	<cfset tempSql = "
SELECT USER_MASTER.*
FROM USER_MASTER
WHERE USER_MASTER.user_type_id = '3'
ORDER BY last_name_furi,first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------------------------------------------------- u_regist ---->
<!---/////////////////////////////////
使用停止
<cffunction name="u_regist_cfc_001">
	<cfset tempSql = "
SELECT MAX(user_id) AS max_user_id FROM USER_MASTER
">
	<cfreturn tempSql>
</cffunction>
//////////////////////////////////--->
<!---------------------------------------------->
<cffunction name="u_regist_cfc_005">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfargument name="arg009" required="true">
	<cfargument name="arg010" required="true">
	<cfargument name="arg011" required="true">
	<cfargument name="arg012" required="true">    <!--- 全コース割り当てフラグ追加 20061120 tanaka --->
	<!-----
	<cfset tempSql = "
INSERT INTO USER_MASTER
(user_id, logon, password,last_name, first_name, last_name_furi, first_name_furi, mailaddress, user_type_id, entry_date, change_date)
VALUES(" & dao_escape(arguments.arg001) & ", '" & dao_escape(arguments.arg002) & "', '" & dao_escape(arguments.arg003) & "', '" & dao_escape(arguments.arg004) & "', '" & dao_escape(arguments.arg005) & "', '" & dao_escape(arguments.arg006) & "', '" & dao_escape(arguments.arg007) & "', '" & dao_escape(arguments.arg008) & "', " & dao_escape(arguments.arg009) & ",'" & dao_escape(arguments.arg010) & " " & dao_escape(arguments.arg011) & "', Null)
">
----->
	<cfset tempSql = "
INSERT INTO USER_MASTER
(user_id, logon, password,last_name, first_name, last_name_furi, first_name_furi, mailaddress, user_type_id, entry_date, change_date, flag_all_course, initial_login_flag)
VALUES(" & dao_escape(arguments.arg001) & ", " & dao_n() & "'" & dao_escape(arguments.arg002) & "', " & dao_n() & "'" & dao_escape(arguments.arg003) & "', " & dao_n() & "'" & dao_escape(arguments.arg004) & "', " & dao_n() & "'" & dao_escape(arguments.arg005) & "', " & dao_n() & "'" & dao_escape(arguments.arg006) & "', " & dao_n() & "'" & dao_escape(arguments.arg007) & "', " & dao_n() & "'" & dao_escape(arguments.arg008) & "', " & dao_escape(arguments.arg009) & "," & dao_n() & "'" & dao_escape(arguments.arg010) & " " & dao_escape(arguments.arg011) & "', Null , " & dao_n() & "'" & dao_escape(arguments.arg012) & "', 1)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_006">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO belong
(user_id, group_id, entry_date, change_date)
VALUES(" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & "," & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_008">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
INSERT INTO COURSE_PROGRESS (user_id, course_id, course_status, course_count, course_score, course_total_time, change_date) VALUES (" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & ", " & dao_n() & "'not attempted', 0, 0, " & dao_n() & "'0000:00:00', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- score`s default value is not (0) but (null) --->
<cffunction name="u_regist_cfc_010">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "

INSERT INTO SCO_PROGRESS
( user_id, course_id, sco_id, status, lecture_count, entry, score, total_time, session_time, change_date )
VALUES( " & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & ", " & dao_escape(arguments.arg003) & ", " & dao_n() & "'not attempted', 0, " & dao_n() & "'ab-initio', null, " & dao_n() & "'0000:00:00', " & dao_n() & "'0000:00:00', "&dao_now()&" )

">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_011">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO assign
(user_id, course_id, entry_date, change_date)
VALUES(" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & "," & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_012">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
INSERT INTO COURSE_PROGRESS (user_id, course_id, course_status, course_count, course_score, course_total_time, change_date) VALUES (" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & ", " & dao_n() & "'not attempted', 0, 0, " & dao_n() & "'0000:00:00', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- score`s default value is not (0) but (null) --->
<cffunction name="u_regist_cfc_014">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "

INSERT INTO SCO_PROGRESS
( user_id, course_id, sco_id, status, lecture_count, entry, score, total_time, session_time, change_date )
VALUES( " & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & ", " & dao_escape(arguments.arg003) & ", " & dao_n() & "'not attempted', 0, " & dao_n() & "'ab-initio', null, " & dao_n() & "'0000:00:00', " & dao_n() & "'0000:00:00', "&dao_now()&" )

">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_015">
	<cfset tempSql = "
SELECT MAX(user_id) AS max_user_id FROM USER_MASTER
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_016">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfargument name="arg009" required="true">
	<cfset tempSql = "
INSERT INTO USER_MASTER
(user_id,logon,password,last_name,first_name,mailaddress,user_type_id,entry_date,change_date)
VALUES(" & dao_escape(arguments.arg001) & "," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "'," & dao_n() & "'" & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & "'," & dao_n() & "'" & dao_escape(arguments.arg006) & "'," & dao_escape(arguments.arg007) & ",
" & dao_n() & "'" & dao_escape(arguments.arg008) & " " & dao_escape(arguments.arg009) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_017">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO belong
(user_id, group_id, entry_date, change_date)
VALUES(" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & "," & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_019">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfargument name="arg009" required="true">
	<cfargument name="arg010" required="true">
	<cfargument name="arg011" required="true">
	<cfargument name="arg012" required="true">    <!--- 全コース割り当てフラグ追加 20061120 tanaka --->
<!----
	<cfset tempSql = "
UPDATE USER_MASTER SET logon='" & dao_escape(arguments.arg001) & "', password='" & dao_escape(arguments.arg002) & "', last_name='" & dao_escape(arguments.arg003) & "', first_name='" & dao_escape(arguments.arg004) & "',
last_name_furi='" & dao_escape(arguments.arg005) & "', first_name_furi='" & dao_escape(arguments.arg006) & "', mailaddress='" & dao_escape(arguments.arg007) & "', user_type_id=" & dao_escape(arguments.arg008) & ",
change_date='" & dao_escape(arguments.arg009) & " " & dao_escape(arguments.arg010) & "'
WHERE user_id = " & dao_escape(arguments.arg011) & "
">
---->
	<cfset tempSql = "
UPDATE USER_MASTER SET logon=" & dao_n() & "'" & dao_escape(arguments.arg001) & "', password=" & dao_n() & "'" & dao_escape(arguments.arg002) & "', last_name=" & dao_n() & "'" & dao_escape(arguments.arg003) & "', first_name=" & dao_n() & "'" & dao_escape(arguments.arg004) & "',
last_name_furi=" & dao_n() & "'" & dao_escape(arguments.arg005) & "', first_name_furi=" & dao_n() & "'" & dao_escape(arguments.arg006) & "', mailaddress=" & dao_n() & "'" & dao_escape(arguments.arg007) & "', user_type_id=" & dao_escape(arguments.arg008) & ",
change_date=" & dao_n() & "'" & dao_escape(arguments.arg009) & " " & dao_escape(arguments.arg010) & "'
, flag_all_course = " & dao_n() & "'" & dao_escape(arguments.arg012) & "'
WHERE user_id = " & dao_escape(arguments.arg011) & "
">

	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_021">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM belong
WHERE user_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_022">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO belong
(user_id, group_id, entry_date, change_date)
VALUES(" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & "," & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_026">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO assign
(user_id, course_id, entry_date, change_date)
VALUES(" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & "," & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_029">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
DELETE FROM assign
WHERE user_id = " & dao_escape(arguments.arg001) & "
AND course_id = " & dao_escape(arguments.arg002) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_032">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM assign
WHERE user_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_033">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select course_id from COURSE_MASTER where course_id not in (" & dao_escape(arguments.arg001) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_034">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select course_id , sco_id from CONSTRUCT where course_id in (" & dao_escape(arguments.arg001) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_035">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
INSERT INTO COURSE_PROGRESS (user_id, course_id, course_status, course_count, course_score, course_total_time, change_date) VALUES (" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & ", " & dao_n() & "'not attempted', 0, 0, " & dao_n() & "'0000:00:00', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- score`s default value is not (0) but (null) --->
<cffunction name="u_regist_cfc_037">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "

INSERT INTO SCO_PROGRESS
( user_id, course_id, sco_id, status, lecture_count, entry, score, total_time, session_time, change_date )
VALUES( " & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & ", " & dao_escape(arguments.arg003) & ", " & dao_n() & "'not attempted', 0, " & dao_n() & "'ab-initio', null, " & dao_n() & "'0000:00:00', " & dao_n() & "'0000:00:00', "&dao_now()&" )

">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_038">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select course_id , sco_id from CONSTRUCT where course_id in (" & dao_escape(arguments.arg001) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_039">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO assign
(user_id, course_id, entry_date, change_date)
VALUES(" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & "," & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_040">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
INSERT INTO COURSE_PROGRESS (user_id, course_id, course_status, course_count, course_score, course_total_time, change_date) VALUES (" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & ", " & dao_n() & "'not attempted', 0, 0, " & dao_n() & "'0000:00:00', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_042">
<!--- score`s default value is not (0) but (null) --->
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "

INSERT INTO SCO_PROGRESS
( user_id, course_id, sco_id, status, lecture_count, entry, score, total_time, session_time, change_date )
VALUES( " & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & ", " & dao_escape(arguments.arg003) & ", " & dao_n() & "'not attempted', 0, " & dao_n() & "'ab-initio', null, " & dao_n() & "'0000:00:00', " & dao_n() & "'0000:00:00', "&dao_now()&" )

">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_043">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM belong
WHERE user_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_044">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO belong
(user_id, group_id, entry_date, change_date)
VALUES(" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & "," & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_045">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM assign
WHERE user_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_046">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM course_progress
WHERE user_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_047">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM SCO_PROGRESS
WHERE user_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_049">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
INSERT INTO COURSE_PROGRESS (user_id, course_id, course_status, course_count, course_score, course_total_time, change_date) VALUES (" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & ", " & dao_n() & "'not attempted', 0, 0, " & dao_n() & "'0000:00:00', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- score`s default value is not (0) but (null) --->
<cffunction name="u_regist_cfc_051">
<!--- score`s default value is not (0) but (null) --->
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "

INSERT INTO SCO_PROGRESS
( user_id, course_id, sco_id, status, lecture_count, entry, score, total_time, session_time, change_date )
VALUES( " & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & ", " & dao_escape(arguments.arg003) & ", " & dao_n() & "'not attempted', 0, " & dao_n() & "'ab-initio', null, " & dao_n() & "'0000:00:00', " & dao_n() & "'0000:00:00', "&dao_now()&" )

">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_052">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO assign
(user_id, course_id, entry_date, change_date)
VALUES(" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & "," & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_053">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
INSERT INTO COURSE_PROGRESS (user_id, course_id, course_status, course_count, course_score, course_total_time, change_date) VALUES (" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & ", " & dao_n() & "'not attempted', 0, 0, " & dao_n() & "'0000:00:00', "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!--- score`s default value is not (0) but (null) --->
<cffunction name="u_regist_cfc_055">
<!--- score`s default value is not (0) but (null) --->
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "

INSERT INTO SCO_PROGRESS
( user_id, course_id, sco_id, status, lecture_count, entry, score, total_time, session_time, change_date )
VALUES( " & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & ", " & dao_escape(arguments.arg003) & ", " & dao_n() & "'not attempted', 0, " & dao_n() & "'ab-initio', null, " & dao_n() & "'0000:00:00', " & dao_n() & "'0000:00:00', "&dao_now()&" )

">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_056">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM belong
WHERE user_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_057">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM assign
WHERE user_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_058">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM course_progress
WHERE user_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_059">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM SCO_PROGRESS
WHERE user_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_060">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM USER_MASTER
WHERE user_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_064">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT USER_MASTER.user_id , USER_MASTER.last_name , USER_MASTER.first_name, USER_MASTER.last_name_furi, USER_MASTER.first_name_furi
FROM admin_group , belong , USER_MASTER
WHERE admin_group.group_id = belong.group_id AND
belong.user_id = USER_MASTER.user_id AND
admin_group.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'

union

SELECT USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name, USER_MASTER.last_name_furi, USER_MASTER.first_name_furi
FROM USER_MASTER
WHERE USER_MASTER.user_type_id = 3
AND NOT EXISTS (
SELECT *
FROM belong
WHERE USER_MASTER.user_id = belong.user_id
)
ORDER BY USER_MASTER.last_name_furi, USER_MASTER.first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_065">
	<cfset tempSql = "
SELECT DISTINCT * FROM GROUP_MASTER ORDER BY group_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_066">
	<cfset tempSql = "
SELECT DISTINCT * FROM GROUP_MASTER ORDER BY group_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_069">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "

SELECT GROUP_MASTER.group_id, GROUP_MASTER.group_name
FROM admin_group
LEFT JOIN GROUP_MASTER
ON admin_group.group_id = GROUP_MASTER.group_id
WHERE admin_group.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'

">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_073">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "

SELECT COURSE_MASTER.course_id, COURSE_MASTER.course_name
FROM admin_course
LEFT JOIN COURSE_MASTER
ON admin_course.course_id = COURSE_MASTER.course_id
WHERE admin_course.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'

">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_077">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<!---SQL--->
	<cfif arguments.arg007 is 1>
		<cfset tempSql = '
		SELECT USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name
		FROM   USER_MASTER
		WHERE  USER_MASTER.user_type_id = 3
		'>

		<cfif arguments.arg001 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.last_name LIKE " & dao_n() & "'%" & dao_escape(arguments.arg001) & "%'">
		</cfif>

		<cfif arguments.arg002 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.first_name LIKE " & dao_n() & "'%" & dao_escape(arguments.arg002) & "%'">
		</cfif>

		<cfif arguments.arg003 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.last_name_furi LIKE " & dao_n() & "'%" & dao_escape(arguments.arg003) & "%'">
		</cfif>

		<cfif arguments.arg004 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.first_name_furi LIKE " & dao_n() & "'%" & dao_escape(arguments.arg004) & "%'">
		</cfif>

		<cfif arguments.arg005 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.logon LIKE " & dao_n() & "'%" & dao_escape(arguments.arg005) & "%'">
		</cfif>

		<cfif arguments.arg006 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.mailaddress LIKE " & dao_n() & "'%" & dao_escape(arguments.arg006) & "%'">
		</cfif>

	<cfelse>
		<cfset tempSql = '
		SELECT	USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name,
				USER_MASTER.last_name_furi, USER_MASTER.first_name_furi
		FROM	USER_MASTER, admin_group, belong
		WHERE	USER_MASTER.user_type_id = 3
		AND		admin_group.group_id = belong.group_id
		AND		belong.user_id = USER_MASTER.user_id
		AND		admin_group.user_id =' & dao_escape(arguments.arg008) & '
		'>

		<cfif arguments.arg001 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.last_name LIKE " & dao_n() & "'%" & dao_escape(arguments.arg001) & "%'">
		</cfif>

		<cfif arguments.arg002 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.first_name LIKE " & dao_n() & "'%" & dao_escape(arguments.arg002) & "%'">
		</cfif>

		<cfif arguments.arg003 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.last_name_furi LIKE " & dao_n() & "'%" & dao_escape(arguments.arg003) & "%'">
		</cfif>

		<cfif arguments.arg004 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.first_name_furi LIKE " & dao_n() & "'%" & dao_escape(arguments.arg004) & "%'">
		</cfif>

		<cfif arguments.arg005 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.logon LIKE " & dao_n() & "'%" & dao_escape(arguments.arg005) & "%'">
		</cfif>

		<cfif arguments.arg006 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.mailaddress LIKE " & dao_n() & "'%" & dao_escape(arguments.arg006) & "%'">
		</cfif>

	<cfset tempSql = tempSql & '
		union
		SELECT	USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name,
				USER_MASTER.last_name_furi, USER_MASTER.first_name_furi
		FROM	USER_MASTER
		WHERE	USER_MASTER.user_type_id = 3
		AND		NOT EXISTS (
					SELECT	*
					FROM	belong
					WHERE	USER_MASTER.user_id = belong.user_id
				)'>

		<cfif arguments.arg001 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.last_name LIKE " & dao_n() & "'%" & dao_escape(arguments.arg001) & "%'">
		</cfif>

		<cfif arguments.arg002 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.first_name LIKE " & dao_n() & "'%" & dao_escape(arguments.arg002) & "%'">
		</cfif>

		<cfif arguments.arg003 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.last_name_furi LIKE " & dao_n() & "'%" & dao_escape(arguments.arg003) & "%'">
		</cfif>

		<cfif arguments.arg004 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.first_name_furi LIKE " & dao_n() & "'%" & dao_escape(arguments.arg004) & "%'">
		</cfif>

		<cfif arguments.arg005 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.logon LIKE " & dao_n() & "'%" & dao_escape(arguments.arg005) & "%'">
		</cfif>

		<cfif arguments.arg006 is not ''>
			<cfset tempSql = tempSql & " AND USER_MASTER.mailaddress LIKE " & dao_n() & "'%" & dao_escape(arguments.arg006) & "%'">
		</cfif>
	</cfif>
		<cfset tempSql = tempSql & " ORDER BY USER_MASTER.last_name_furi, USER_MASTER.first_name_furi">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="u_regist_cfc_078">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT USER_MASTER.user_id , USER_MASTER.last_name , USER_MASTER.first_name, USER_MASTER.last_name_furi, USER_MASTER.first_name_furi
FROM belong , USER_MASTER
WHERE belong.group_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND belong.user_id = USER_MASTER.user_id

UNION

SELECT USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name, USER_MASTER.last_name_furi, USER_MASTER.first_name_furi
FROM USER_MASTER
WHERE USER_MASTER.user_type_id = 3
AND NOT EXISTS (
SELECT *
FROM belong
WHERE USER_MASTER.user_id = belong.user_id
)
ORDER BY USER_MASTER.last_name_furi, USER_MASTER.first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!---追加 20061024 tanaka--->
<cffunction name="u_regist_cfc_079">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
DELETE FROM assign
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
AND course_id = '" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!---追加 20061024 tanaka--->
<cffunction name="u_regist_cfc_080">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
DELETE FROM course_progress
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
AND course_id = '" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!---追加 20061024 tanaka--->
<cffunction name="u_regist_cfc_081">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
DELETE FROM SCO_PROGRESS
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
AND course_id = '" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!---追加 20061024 tanaka--->
<cffunction name="u_regist_cfc_082">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO assign (
user_id,
course_id,
entry_date,
change_date
) VALUES (
" & dao_n() & "'" & dao_escape(arguments.arg001) & "',
" & dao_n() & "'" & dao_escape(arguments.arg002) & "',
" & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "',
Null
)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!---追加 20061024 tanaka--->
<cffunction name="u_regist_cfc_083">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
INSERT INTO COURSE_PROGRESS (
user_id,
course_id,
course_status,
course_count,
course_score,
course_total_time,
change_date
) VALUES (
" & dao_n() & "'" & dao_escape(arguments.arg001) & "',
" & dao_n() & "'" & dao_escape(arguments.arg002) & "',
" & dao_n() & "'not attempted',
0,
0,
" & dao_n() & "'0000:00:00',
"&dao_now()&"
)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!---追加 20061024 tanaka--->
<cffunction name="u_regist_cfc_084">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
INSERT INTO SCO_PROGRESS(
user_id,
course_id,
sco_id,
status,
lecture_count,
entry,
score,
total_time,
session_time,
change_date
) VALUES (
" & dao_n() & "'" & dao_escape(arguments.arg001) & "',
" & dao_n() & "'" & dao_escape(arguments.arg002) & "',
" & dao_n() & "'" & dao_escape(arguments.arg003) & "',
" & dao_n() & "'not attempted',
0,
" & dao_n() & "'ab-initio',
null,
" & dao_n() & "'0000:00:00',
" & dao_n() & "'0000:00:00',
"&dao_now()&"
)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!---追加 20061025 tanaka--->
<cffunction name="u_regist_cfc_085">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT COURSE_MASTER.*
FROM COURSE_MASTER, admin_course
WHERE admin_course.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
AND COURSE_MASTER.course_id = admin_course.course_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<!---追加 20061025 tanaka--->
<cffunction name="u_regist_cfc_086">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
DELETE FROM belong
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
AND group_id IN (
	SELECT admin_group.group_id
	FROM admin_group
	WHERE admin_group.user_id = '" & dao_escape(arguments.arg002) & "'
)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------------------------------------------------- ug_regist ---->
<cffunction name="ug_regist_cfc_004">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT GROUP_MASTER.group_id,GROUP_MASTER.group_name
FROM GROUP_MASTER , admin_group
WHERE GROUP_MASTER.group_id = admin_group.group_id AND
admin_group.user_id = " & dao_escape(arguments.arg001) & "
ORDER BY GROUP_MASTER.group_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_006">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name, USER_MASTER.last_name_furi, USER_MASTER.first_name_furi , '1' as belong_exist
FROM USER_MASTER, belong
where USER_MASTER.user_id = belong.user_id
AND belong.group_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'

union

SELECT USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name, USER_MASTER.last_name_furi, USER_MASTER.first_name_furi , null as belong_exist
FROM USER_MASTER
WHERE USER_MASTER.user_type_id = 3
AND NOT EXISTS (
SELECT *
FROM belong
WHERE USER_MASTER.user_id = belong.user_id
)
ORDER BY USER_MASTER.last_name_furi, USER_MASTER.first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_007">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "

SELECT USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name
FROM USER_MASTER, belong
WHERE USER_MASTER.user_id = belong.user_id
AND NOT EXISTS (
SELECT *
FROM belong
WHERE belong.group_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_011">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT USER_MASTER.user_id , USER_MASTER.last_name , USER_MASTER.first_name, USER_MASTER.last_name_furi, USER_MASTER.first_name_furi
FROM admin_group , belong , USER_MASTER
WHERE admin_group.group_id = belong.group_id AND
belong.user_id = USER_MASTER.user_id AND
admin_group.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'

union

SELECT USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name, USER_MASTER.last_name_furi, USER_MASTER.first_name_furi
FROM USER_MASTER
WHERE USER_MASTER.user_type_id = 3
AND NOT EXISTS (
SELECT *
FROM belong
WHERE USER_MASTER.user_id = belong.user_id
)
ORDER BY USER_MASTER.last_name_furi, USER_MASTER.first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_012">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT user_id,logon,password,last_name,first_name,mailaddress,user_type_id,group_id_1,group_id_2,group_id_3,entry_date
FROM USER_MASTER
WHERE user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
">
<CFLOOP index="LoopCount" from = "2" to="#dao_escape(arguments.arg002)#">
<cfset tempSql = tempSql & "
or user_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
</CFLOOP>
<cfset tempSql = tempSql & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_017">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
DELETE FROM belong
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
AND group_id = '" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_018">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO belong
(user_id, group_id, entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & " " & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_020">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO belong
(user_id, group_id, entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & " " & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_022">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM belong
WHERE user_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_023">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM belong
WHERE group_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_024">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT user_id
FROM belong
WHERE user_id in (" & dao_escape(arguments.arg001) & ")
GROUP BY user_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_026">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO belong
(user_id, group_id, entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & " " & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_027">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select user_id from (
select USER_MASTER.user_id , count(belong.user_id) as count
from USER_MASTER , belong
where USER_MASTER.user_id *= belong.user_id and USER_MASTER.user_id in (" & dao_escape(arguments.arg001) & ")
group by USER_MASTER.user_id
) as t1
where count = 0
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_028">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT DISTINCT(group_id)
FROM GROUP_MASTER
WHERE group_id <> " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_029">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO belong
(user_id, group_id, entry_date, change_date)
VALUES(" & dao_escape(arguments.arg001) & ", " & dao_escape(arguments.arg002) & "," & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & " " & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_030">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
SELECT user_id,logon,password,last_name,first_name,mailaddress,user_type_id,group_id_1,group_id_2,group_id_3,entry_date FROM USER_MASTER
WHERE user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
">
<CFLOOP index="LoopCount" from = "2" to="#dao_escape(arguments.arg002)#">
<cfset tempSql = tempSql & "
or user_id = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
</CFLOOP>
<cfset tempSql = tempSql & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_031">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfargument name="arg009" required="true">
	<cfargument name="arg010" required="true">
	<cfargument name="arg011" required="true">
	<cfargument name="arg012" required="true">
	<cfargument name="arg013" required="true">
	<cfset tempSql = "
UPDATE USER_MASTER SET logon=" & dao_n() & "'" & dao_escape(arguments.arg001) & "',password=" & dao_n() & "'" & dao_escape(arguments.arg002) & "',last_name=" & dao_n() & "'" & dao_escape(arguments.arg003) & "',first_name=" & dao_n() & "'" & dao_escape(arguments.arg004) & "',
mailaddress=" & dao_n() & "'" & dao_escape(arguments.arg005) & "',user_type_id=" & dao_n() & "'" & dao_escape(arguments.arg006) & "',group_id_1=" & dao_n() & "'" & dao_escape(arguments.arg007) & "',group_id_2=" & dao_n() & "'" & dao_escape(arguments.arg008) & "',group_id_3=" & dao_n() & "'" & dao_escape(arguments.arg009) & "',
entry_date=" & dao_n() & "'" & dao_escape(arguments.arg010) & "',change_date=" & dao_n() & "'" & dao_escape(arguments.arg011) & " " & dao_escape(arguments.arg012) & "'
WHERE user_id = " & dao_n() & "'" & dao_escape(arguments.arg013) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_035">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT GROUP_MASTER.group_id,GROUP_MASTER.group_name
FROM GROUP_MASTER , admin_group
WHERE GROUP_MASTER.group_id = admin_group.group_id AND
admin_group.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
ORDER BY GROUP_MASTER.group_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_039">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM belong
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_040">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
DELETE FROM belong
WHERE user_id = '" & dao_escape(arguments.arg001) & "'
AND group_id IN (" & dao_escape(arguments.arg002) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_042">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO belong
(user_id, group_id, entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & " " & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_043">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT group_id
FROM group_master
WHERE group_id NOT IN (" & dao_escape(arguments.arg001) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_044">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfset tempSql = "
INSERT INTO belong
(user_id, group_id, entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "', " & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "'," & dao_n() & "'" & dao_escape(arguments.arg005) & " " & dao_escape(arguments.arg006) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_048">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT DISTINCT USER_MASTER.user_id , USER_MASTER.last_name , USER_MASTER.first_name, USER_MASTER.last_name_furi, USER_MASTER.first_name_furi, USER_MASTER.user_type_id
FROM admin_group , belong , USER_MASTER
WHERE admin_group.group_id = belong.group_id AND
belong.user_id = USER_MASTER.user_id AND
admin_group.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'

union

SELECT USER_MASTER.user_id , USER_MASTER.last_name , USER_MASTER.first_name, USER_MASTER.last_name_furi, USER_MASTER.first_name_furi
FROM USER_MASTER
left join (
	select user_id from belong group by user_id
) as belong_uid on belong_uid.user_id = USER_MASTER.user_id
where belong.user_id is null
and USER_MASTER.user_type_id = 3
ORDER BY USER_MASTER.last_name_furi, USER_MASTER.first_name_furi

">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_049">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT DISTINCT GROUP_MASTER.group_id, GROUP_MASTER.group_name
FROM belong, GROUP_MASTER
WHERE belong.group_id = GROUP_MASTER.group_id
AND belong.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
ORDER BY GROUP_MASTER.group_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_055">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT GROUP_MASTER.group_id,GROUP_MASTER.group_name
FROM GROUP_MASTER , admin_group
WHERE GROUP_MASTER.group_id = admin_group.group_id AND
admin_group.user_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
ORDER BY GROUP_MASTER.group_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_056">
	<cfset tempSql = "
SELECT MAX(group_id) FROM GROUP_MASTER
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_057">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO GROUP_MASTER(group_id,group_name,entry_date,change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_059">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfset tempSql = "
INSERT INTO admin_group
(user_id, group_id, entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "',Null)
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_060">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfset tempSql = "
UPDATE GROUP_MASTER SET
group_name=" & dao_n() & "'" & dao_escape(arguments.arg001) & "',entry_date=" & dao_n() & "'" & dao_escape(arguments.arg002) & "',
change_date=" & dao_n() & "'" & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg004) & "'
WHERE group_id = " & dao_n() & "'" & dao_escape(arguments.arg005) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_061">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT DISTINCT user_id
FROM belong
WHERE group_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_062">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
DELETE FROM GROUP_MASTER
WHERE group_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_063">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfargument name="arg004" required="true">
	<cfargument name="arg005" required="true">
	<cfargument name="arg006" required="true">
	<cfargument name="arg007" required="true">
	<cfargument name="arg008" required="true">
	<cfargument name="arg009" required="true">
	<cfargument name="arg010" required="true">
	<cfset tempSql = "
UPDATE USER_MASTER SET
">
<cfif dao_escape(arguments.arg001) EQ "">
<cfset tempSql = tempSql & "
group_id_1 = null,
">
<cfelse>
<cfset tempSql = tempSql & "
group_id_1 = " & dao_n() & "'" & dao_escape(arguments.arg002) & "',
">
</cfif>
<cfif dao_escape(arguments.arg003) EQ "">
<cfset tempSql = tempSql & "
group_id_2 = null,
">
<cfelse>
<cfset tempSql = tempSql & "
group_id_2 = " & dao_n() & "'" & dao_escape(arguments.arg004) & "',
">
</cfif>
<cfif dao_escape(arguments.arg005) EQ "">
<cfset tempSql = tempSql & "
group_id_3 = null,
">
<cfelse>
<cfset tempSql = tempSql & "
group_id_3 = " & dao_n() & "'" & dao_escape(arguments.arg006) & "',
">
</cfif>
<cfset tempSql = tempSql & "
change_date=" & dao_n() & "'" & dao_escape(arguments.arg008) & " " & dao_escape(arguments.arg009) & "'
WHERE user_id = " & dao_n() & "'" & dao_escape(arguments.arg010) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="passhelp_cfc_003">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
insert into passhelp (usertype,title,contents) values (" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "'," & dao_n() & "'" & dao_escape(arguments.arg003) & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="passhelp_cfc_004">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfargument name="arg003" required="true">
	<cfset tempSql = "
update passhelp set
title=" & dao_n() & "'" & dao_escape(arguments.arg001) & "',
contents=" & dao_n() & "'" & dao_escape(arguments.arg002) & "'
where usertype = " & dao_n() & "'" & dao_escape(arguments.arg003) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_064">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
insert into belong (user_id , group_id , entry_date , change_date) values (" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "', "&dao_now()&" , "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_065">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name, USER_MASTER.last_name_furi, USER_MASTER.first_name_furi, '1' as belong_exist
FROM USER_MASTER, belong
where USER_MASTER.user_id = belong.user_id
AND belong.group_id = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'

union

SELECT	USER_MASTER.user_id, USER_MASTER.last_name, USER_MASTER.first_name, USER_MASTER.last_name_furi, USER_MASTER.first_name_furi, null as belong_exist
FROM	USER_MASTER
WHERE	USER_MASTER.user_type_id = 3
AND		NOT EXISTS (
		SELECT	*
		FROM	belong
		WHERE	USER_MASTER.user_id = belong.user_id
		)
ORDER BY USER_MASTER.last_name_furi, USER_MASTER.first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_066">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select user_id , group_id from belong where user_id in (" & ArrayToList(arguments.arg001) & ") order by user_id
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_067">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
delete from belong where user_id = '" & dao_escape(arguments.arg001) & "' and group_id = '" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_068">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
insert into belong (user_id , group_id , entry_date , change_date) values (" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "', "&dao_now()&" , "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_069">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
insert into belong (user_id , group_id , entry_date , change_date) values (" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "', "&dao_now()&" , "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_070">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
delete from belong where user_id = '" & dao_escape(arguments.arg001) & "' and group_id = '" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_071">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select group_id from group_master where group_id not in (" & dao_escape(arguments.arg001) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_072">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">
	<cfset tempSql = "
insert into belong (user_id , group_id , entry_date , change_date) values (" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) & "', "&dao_now()&" , "&dao_now()&")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_073">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
delete from GROUP_MASTER where group_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_074">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
delete from admin_group where group_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_075">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
delete from belong where group_id = '" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_076">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">

	<cfset var now = DateFormat(Now(),"YYYY/MM/DD") & ' ' & TimeFormat(Now(),"HH:MM:SS")>

	<cfset tempSql = "
update group_master set group_name = " & dao_n() & "'" & dao_escape(arguments.arg001) & "' , change_date= " & dao_n() & "'" & now & "' where group_id = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_077">
	<cfargument name="arg001" required="true">
	<cfargument name="arg002" required="true">

	<cfset var now = DateFormat(Now(),"YYYY/MM/DD") & ' ' & TimeFormat(Now(),"HH:MM:SS")>

	<cfset tempSql = "
INSERT INTO group_master
(group_name , group_id, entry_date, change_date)
VALUES(" & dao_n() & "'" & dao_escape(arguments.arg001) & "'," & dao_n() & "'" & dao_escape(arguments.arg002) &  "'," & dao_n() & "'" & now & "'," & dao_n() & "'" & now & "')
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_078">
	<cfset tempSql = "
SELECT MAX(group_id) + 1 as m_id FROM GROUP_MASTER
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_079">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT count(user_id) as cnt
FROM USER_MASTER
WHERE USER_MASTER.user_type_id = 3
AND NOT EXISTS (
	SELECT *
	FROM belong
	WHERE USER_MASTER.user_id = belong.user_id
)
AND user_id in (" & ArrayToList(arguments.arg001) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="ug_regist_cfc_080">
	<cfset tempSql = "
SELECT USER_MASTER.*, belong_uid.user_id as belong_exist
FROM USER_MASTER
left join (
	select user_id from belong group by user_id
) as belong_uid on USER_MASTER.user_id = belong_uid.user_id
WHERE USER_MASTER.user_type_id = 3
order by last_name_furi, first_name_furi
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_user_master_001">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT t1.first_name , t1.last_name , t1.first_name_furi , t1.last_name_furi ,
       t1.logon , t1.password , t1.user_id , t1.user_type_id, t1.mailaddress, t1.additional_data, t2.logon_date_last, t1.related_user_id,
       t1.flag_all_admin_course, t1.flag_all_admin_group
FROM   USER_MASTER as t1 left join USER_LOGON_LOG as t2
ON     t1.user_id = t2.user_id
WHERE  t1.user_id in (" & dao_escape(arguments.arg001) & ")
order by last_name_furi, first_name_furi, logon
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_user_master_001_sonylife">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
SELECT t1.first_name , t1.last_name , t1.first_name_furi , t1.last_name_furi ,
       t1.logon , t1.password , t1.user_id , t1.mailaddress, t2.logon_date_last, ifnull(t1.text_3, '999999') AS text_3
FROM   USER_MASTER as t1 left join USER_LOGON_LOG as t2
ON     t1.user_id = t2.user_id
WHERE  t1.user_id in (" & dao_escape(arguments.arg001) & ")
order by last_name_furi, first_name_furi, logon
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_user_master_002">
	<cfargument name="arg001" required="true">
	<cfset tempSql = "
select t1.user_id , t1.logon , t1.password , t1.last_name , t1.first_name , t1.last_name_furi , t1.first_name_furi ,
       t1.mailaddress , t1.flag_all_course , t2.mentor , t2.syozoku_name , t2.kinmu_code , t2.kinmu_name
from USER_MASTER as t1 inner join USER_MASTER_ADD_SSP as t2 on t1.user_id = t2.user_id
where  t2.mentor = " & dao_n() & "'" & dao_escape(arguments.arg001) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_sco_progress_001" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfargument name="arg003" required="true" type="string">
	<cfargument name="arg004" required="true" type="string">

	<cfset var sco_type = ''>
	<cfset var spr_type = ''>

	<cfif arguments.arg003 is 0>
		<cfset sco_type = ' AND SCO.sco_type = 1 '>
	</cfif>

	<cfif arguments.arg004 is not -1>
		<cfset spr_type = " AND SPR.type = " & dao_escape(arguments.arg004) & " ">
	</cfif>

	<cfset tempSql = "
SELECT ASG.user_id , CON.course_id , CON.sco_id , CON.order_no , CON.parent_sco_id ,
       USR.first_name , USR.last_name , USR.logon , CRS.course_name , SCO.sco_name , SCO.sco_type ,
       SCO.lecture_time_hour , SCO.lecture_time_min , SCO.max_score , SCO.mastery_score ,
       SCO.min_score , SCO.flag_trial , SCO.review_count , SCO.class_id ,
       ifnull(SP.status , 'not attempted') as status , ifnull(SP.lecture_count , 0) as lecture_count,
       ifnull(SP.entry , 'ab-initio') as entry , SP.location , ifnull(SP.score , 0) as score,
       SP_FIRST.start_date, SP.end_date ,
       ifnull(SP.total_time , '0000:00:00') as total_time , ifnull(SP.session_time , '0000:00:00') as session_time , SP.suspend , SP.score_date ,
       ifnull(SP_LAST.eLM_total_time, 0) AS eLM_total_time,
       ifnull(SP.eLM_session_time , 0) as eLM_session_time ,
       ifnull(SP_LAST.lecture_count, 0) AS m_lc,
       SPR.type , SP.flag_get_status , SP.flag_get_score,
       SCO.class_id, SCO.sco_kind, USR.first_name_furi , USR.last_name_furi , USR.mailaddress
FROM ASSIGN AS ASG
INNER JOIN CONSTRUCT AS CON ON ASG.course_id = CON.course_id
INNER JOIN SCO_MASTER AS SCO ON CON.sco_id = SCO.sco_id " & sco_type & "
INNER JOIN USER_MASTER AS USR ON ASG.user_id = USR.user_id
INNER JOIN COURSE_MASTER AS CRS ON ASG.course_id = CRS.course_id
LEFT JOIN SCO_PROGRESS_RECORD AS SPR ON ASG.user_id = SPR.user_id AND
                                        ASG.course_id = SPR.course_id AND
                                        CON.sco_id = SPR.sco_id " & spr_type & "
LEFT JOIN  SCO_PROGRESS AS SP ON SPR.user_id = SP.user_id AND
                                 SPR.course_id = SP.course_id AND
                                 SPR.sco_id = SP.sco_id AND
                                 SPR.lecture_count = SP.lecture_count
LEFT JOIN SCO_PROGRESS_RECORD AS SPR_FIRST ON ASG.user_id = SPR_FIRST.user_id AND
                                              ASG.course_id = SPR_FIRST.course_id AND
                                              CON.sco_id = SPR_FIRST.sco_id AND
                                              SPR_FIRST.type = 3
LEFT JOIN SCO_PROGRESS AS SP_FIRST ON SPR_FIRST.user_id = SP_FIRST.user_id AND
                                      SPR_FIRST.course_id = SP_FIRST.course_id AND
                                      SPR_FIRST.sco_id = SP_FIRST.sco_id AND
                                      SPR_FIRST.lecture_count = SP_FIRST.lecture_count
LEFT JOIN SCO_PROGRESS_RECORD AS SPR_LAST ON ASG.user_id = SPR_LAST.user_id AND
                                              ASG.course_id = SPR_LAST.course_id AND
                                              CON.sco_id = SPR_LAST.sco_id AND
                                              SPR_LAST.type = 1
LEFT JOIN SCO_PROGRESS AS SP_LAST ON SPR_LAST.user_id = SP_LAST.user_id AND
                                      SPR_LAST.course_id = SP_LAST.course_id AND
                                      SPR_LAST.sco_id = SP_LAST.sco_id AND
                                      SPR_LAST.lecture_count = SP_LAST.lecture_count
WHERE ASG.user_id in (" & dao_escape(arguments.arg001) & ") AND
      ASG.course_id in (" & dao_escape(arguments.arg002) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_sco_progress_002" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfargument name="arg003" required="true" type="string">
	<cfargument name="arg004" required="true" type="string">
	<cfargument name="arg005" required="true" type="string">
	<cfset tempSql = "
update SCO_PROGRESS
set    lecture_count = " & dao_escape(arguments.arg004) & ",
       change_date   = " & dao_n() & "'" & dao_escape(arguments.arg005) & "'
where  user_id = " & dao_escape(arguments.arg001) & " and
       course_id = " & dao_escape(arguments.arg002) & " and
       sco_id = " & dao_escape(arguments.arg003) & " and
       lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_sco_progress_003" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfargument name="arg003" required="true" type="string">
	<cfargument name="arg004" required="true" type="string">

	<cfset tempSql = "
select t1.user_id , t2.course_id , t2.sco_id , t2.order_no , t5.first_name , t5.last_name , t5.logon , t7.course_name , t6.sco_name , t6.sco_type ,
       t6.lecture_time_hour , t6.lecture_time_min , t6.max_score , t6.mastery_score , t6.min_score , t6.flag_trial , t6.review_count ,
       "&dao_ifnull()&"(t4.status , 'not attempted') as status , "&dao_ifnull()&"(t4.lecture_count , 0) as lecture_count ,
       "&dao_ifnull()&"(t4.entry , 'ab-initio') as entry , t4.location , "&dao_ifnull()&"(t4.score , 0) as score , t4.start_date , t4.end_date ,
       "&dao_ifnull()&"(t4.total_time , '0000:00:00') as total_time , "&dao_ifnull()&"(t4.session_time , '0000:00:00') as session_time , t4.suspend , t4.score_date ,
       "&dao_ifnull()&"(t4.eLM_total_time , 0) as eLM_total_time , "&dao_ifnull()&"(t4.eLM_session_time , 0) as eLM_session_time
from   ASSIGN as t1 inner join CONSTRUCT as t2 on t1.course_id = t2.course_id
       left outer join SCO_PROGRESS_RECORD as t3 on t1.user_id = t3.user_id and t2.sco_id = t3.sco_id
       left join SCO_PROGRESS as t4 on t3.user_id = t4.user_id and t3.sco_id = t4.sco_id and t3.lecture_count = t4.lecture_count
       inner join USER_MASTER as t5 on t1.user_id = t5.user_id
       inner join SCO_MASTER as t6 on t2.sco_id = t6.sco_id
       inner join COURSE_MASTER as t7 on t2.course_id = t7.course_id
where (t3.type is null or t3.type = " & dao_escape(arguments.arg004) & ")
and t1.user_id = " & dao_escape(arguments.arg001) & " and t2.parent_sco_id = " & dao_escape(arguments.arg002) & " and t2.course_id = " & dao_escape(arguments.arg003) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_sco_progress_004" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfargument name="arg003" required="true" type="string">
	<cfargument name="arg004" required="true" type="string">

	<cfset var sco_type = ''>
	<cfset var spr_type = ''>

	<cfif arguments.arg003 is 0>
		<cfset sco_type = ' AND SCO.sco_type = 1 '>
	</cfif>

	<cfif arguments.arg004 is not -1>
		<cfset spr_type = " AND SPR.type = " & dao_escape(arguments.arg004) & " ">
	</cfif>

	<cfset tempSql = "
SELECT USR.user_id , CON.course_id , CON.sco_id , CON.order_no , CON.parent_sco_id ,
       USR.first_name , USR.last_name , USR.logon , CRS.course_name , SCO.sco_name , SCO.sco_type ,
       SCO.lecture_time_hour , SCO.lecture_time_min , SCO.max_score , SCO.mastery_score ,
       SCO.min_score , SCO.flag_trial , SCO.review_count , SCO.class_id ,
       ifnull(SP.status , 'not attempted') as status , ifnull(SP.lecture_count , 0) as lecture_count,
       ifnull(SP.entry , 'ab-initio') as entry , SP.location , ifnull(SP.score , 0) as score,
       SP_FIRST.start_date, SP.end_date ,
       ifnull(SP.total_time , '0000:00:00') as total_time , ifnull(SP.session_time , '0000:00:00') as session_time , SP.suspend , SP.score_date ,
       ifnull(SP_LAST.eLM_total_time, 0) AS eLM_total_time,
       ifnull(SP.eLM_session_time , 0) as eLM_session_time ,
       ifnull(SP_LAST.lecture_count, 0) AS m_lc,
       SPR.type , SP.flag_get_status , SP.flag_get_score,
       SCO.class_id, SCO.sco_kind, USR.first_name_furi , USR.last_name_furi , USR.mailaddress
FROM USER_MASTER AS USR
INNER JOIN CONSTRUCT AS CON ON CON.course_id in (" & dao_escape(arguments.arg002) & ")
INNER JOIN SCO_MASTER AS SCO ON CON.sco_id = SCO.sco_id " & sco_type & "
INNER JOIN COURSE_MASTER AS CRS ON CON.course_id = CRS.course_id
LEFT JOIN SCO_PROGRESS_RECORD AS SPR ON USR.user_id = SPR.user_id AND
                                        CON.course_id = SPR.course_id AND
                                        CON.sco_id = SPR.sco_id " & spr_type & "
LEFT JOIN  SCO_PROGRESS AS SP ON SPR.user_id = SP.user_id AND
                                 SPR.course_id = SP.course_id AND
                                 SPR.sco_id = SP.sco_id AND
                                 SPR.lecture_count = SP.lecture_count
LEFT JOIN SCO_PROGRESS_RECORD AS SPR_FIRST ON USR.user_id = SPR_FIRST.user_id AND
                                              CON.course_id = SPR_FIRST.course_id AND
                                              CON.sco_id = SPR_FIRST.sco_id AND
                                              SPR_FIRST.type = 3
LEFT JOIN SCO_PROGRESS AS SP_FIRST ON SPR_FIRST.user_id = SP_FIRST.user_id AND
                                      SPR_FIRST.course_id = SP_FIRST.course_id AND
                                      SPR_FIRST.sco_id = SP_FIRST.sco_id AND
                                      SPR_FIRST.lecture_count = SP_FIRST.lecture_count
LEFT JOIN SCO_PROGRESS_RECORD AS SPR_LAST ON USR.user_id = SPR_LAST.user_id AND
                                              CON.course_id = SPR_LAST.course_id AND
                                              CON.sco_id = SPR_LAST.sco_id AND
                                              SPR_LAST.type = 1
LEFT JOIN SCO_PROGRESS AS SP_LAST ON SPR_LAST.user_id = SP_LAST.user_id AND
                                      SPR_LAST.course_id = SP_LAST.course_id AND
                                      SPR_LAST.sco_id = SP_LAST.sco_id AND
                                      SPR_LAST.lecture_count = SP_LAST.lecture_count
WHERE USR.user_id in (" & dao_escape(arguments.arg001) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_sco_progress_005" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfargument name="arg003" required="true" type="string">
	<cfargument name="arg004" required="true" type="string">

	<cfset tempSql = "
select t3.user_id , t3.course_id , t7.sco_id , t4.order_no , t3.first_name , t3.last_name , t3.logon , t8.course_name , t7.sco_name , t7.sco_type ,
       "&dao_ifnull()&"(t6.status , 'not attempted') as status , "&dao_ifnull()&"(t6.lecture_count , 0) as lecture_count ,
       "&dao_ifnull()&"(t6.entry , 'ab-initio') as entry , t6.location , "&dao_ifnull()&"(t6.score , 0) as score , t6.start_date , t6.end_date ,
       "&dao_ifnull()&"(t6.total_time , '0000:00:00') as total_time , "&dao_ifnull()&"(t6.session_time , '0000:00:00') as session_time , t6.suspend , t6.score_date
from  (
       select * from (
                      select user_id , last_name , first_name , logon from USER_MASTER where user_id = " & dao_escape(arguments.arg001) & "
                     ) as t1 ,
                     (
                      select course_id , course_name from COURSE_MASTER where course_id = " & dao_escape(arguments.arg003) & "
                     ) as t2
       ) as t3 inner join CONSTRUCT as t4 on t3.course_id = t4.course_id
               left join SCO_PROGRESS_RECORD as t5 on t4.course_id = t5.course_id and t4.sco_id = t5.sco_id and t3.user_id = t5.user_id
               left join SCO_PROGRESS as t6 on t5.course_id = t6.course_id and t5.user_id = t6.user_id and t5.sco_id = t6.sco_id and t5.lecture_count = t6.lecture_count
               inner join SCO_MASTER as t7 on t4.sco_id = t7.sco_id
               inner join COURSE_MASTER as t8 on t4.course_id = t8.course_id
where (t5.type is null or t5.type = " & dao_escape(arguments.arg004) & ")
and t4.parent_sco_id = " & dao_escape(arguments.arg002) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_sco_progress_006" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">

	<cfset tempSql = "
select t1.sco_id
from   CONSTRUCT as t1 inner join SCO_MASTER as t2 on t1.sco_id = t2.sco_id
where  t1.course_id = " & dao_escape(arguments.arg001) & " and
       t2.sco_type = 1
order  by order_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_sco_progress_007" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfargument name="arg003" required="true" type="string">
	<cfargument name="arg004" required="true" type="string">

	<cfset var type = ''>

	<cfif arguments.arg003 is 0>
		<cfset type = type & ' and t5.sco_type = 1'>
	</cfif>

	<cfif arguments.arg004 is not -1>
		<cfset type = type & " and (t3.type is null or t3.type = " & dao_escape(arguments.arg004) & ")">
	</cfif>

	<cfset tempSql = "
select t1.user_id , t2.course_id , t2.order_no , t2.sco_id , "&dao_ifnull()&"(t4.status , 'not attempted') as status ,
       t5.review_count , t4.flag_get_status , t4.flag_get_score , t5.class_id
from   ASSIGN as t1 inner join CONSTRUCT as t2 on t1.course_id = t2.course_id
       left outer join SCO_PROGRESS_RECORD as t3 on t1.user_id = t3.user_id and t2.sco_id = t3.sco_id
       left join SCO_PROGRESS as t4 on t3.user_id = t4.user_id and t3.sco_id = t4.sco_id and t3.lecture_count = t4.lecture_count
       left join SCO_MASTER as t5 on t2.sco_id = t5.sco_id
where  t1.user_id = " & dao_escape(arguments.arg001) & " and t1.course_id = " & dao_escape(arguments.arg002) & "
       " & type & "
order by t1.user_id , t2.course_id , t2.order_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_sco_progress_008" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfargument name="arg003" required="true" type="string">
	<cfargument name="arg004" required="true" type="string">

	<cfset var type = ''>

	<cfif arguments.arg003 is 0>
		<cfset type = type & 't7.sco_type = 1'>
	</cfif>

	<cfif arguments.arg003 is 0 and arguments.arg004 is not -1>
		<cfset type = type & ' and '>
	</cfif>

	<cfif arguments.arg004 is not -1>
		<cfset type = type & "(t5.type = " & dao_escape(arguments.arg004) & " or t5.type is null)">
	</cfif>

	<cfset tempSql = "
select t3.user_id , t3.course_id , t4.order_no , t4.sco_id , "&dao_ifnull()&"(t6.status , 'not attempted') as status ,
       t7.review_count , t6.flag_get_status , t6.flag_get_score , t7.class_id
from  (
       select * from (
                      select user_id , last_name , first_name , logon from USER_MASTER where user_id = " & dao_escape(arguments.arg001) & "
                     ) as t1 ,
                     (
                      select course_id , course_name from COURSE_MASTER where course_id = " & dao_escape(arguments.arg002) & "
                     ) as t2
       ) as t3 inner join CONSTRUCT as t4 on t3.course_id = t4.course_id
               left join SCO_PROGRESS_RECORD as t5 on t4.course_id = t5.course_id and t4.sco_id = t5.sco_id and t3.user_id = t5.user_id
               left join SCO_PROGRESS as t6 on t5.course_id = t6.course_id and t5.user_id = t6.user_id and t5.sco_id = t6.sco_id and t5.lecture_count = t6.lecture_count
               left join SCO_MASTER as t7 on t4.sco_id = t7.sco_id
where  " & type & "
order by t3.user_id , t3.course_id , t4.order_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_sco_progress_009" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">

	<cfset tempSql = "
select "&dao_ifnull()&"(max(lecture_count) , 0) as m_lc from SCO_PROGRESS
where  user_id = " & dao_escape(arguments.arg001) & " and
       sco_id = " & dao_escape(arguments.arg002) & "
">
	<cfreturn tempSql>
</cffunction>

<!---------------------------------------------->
<cffunction name="table_sco_progress_010" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfargument name="arg003" required="true" type="string">
	<cfargument name="arg004" required="true" type="string">
	<cfargument name="course_id_list" required="true" type="string">

	<cfset var type = ArrayNew(1)>
	<cfset var where = ''>
	<cfset var allGroup = false>
	<cfset var joinUsr = ''>

	<cfset where = 'WHERE (0=0)' >
	<cfif arguments.arg001 eq "">
		<cfset ArrayAppend(type, '0=1 ' )>
	<cfelseif arguments.arg001 neq "all" >
		<cfset arg1 = addSingleQuotesToList(arguments.arg001)>
		<cfset ArrayAppend(type, 'usr.logon IN (' & arg1 & ')' )>
	</cfif>

	<cfif arguments.arg002 is not '-9999'>
		<cfset ArrayAppend(type , 'sco.sco_id in (' & dao_escape(arguments.arg002) & ')' )>
	</cfif>

	<cfif arguments.arg003 is 0>
		<cfset ArrayAppend(type , 'sco.sco_type = 1')>
	</cfif>

	<cfif arguments.arg004 is not -1>
		<cfset ArrayAppend(type , '(spr.type = ' & dao_escape(arguments.arg004) & ' or spr.type is null)')>
	</cfif>

	<cfif course_id_list is not '-9999'>
		<cfset ArrayAppend(type , 'crs.course_id in (' & course_id_list & ')' )>
	</cfif>

	<cfset ArrayAppend(type , '(sco.sco_kind = 3)')>

	<cfset tempSqlSelect = " (
		SELECT usr.user_id, crs.course_id as course_id, sco.sco_id, con.order_no,
			usr.first_name, usr.last_name,
			usr.first_name_furi as first_name_furi, usr.last_name_furi as last_name_furi, usr.logon as logon,
			crs.course_name, sco.sco_name, sco.class_id,
			"&dao_ifnull()&"(spg.status, 'not attempted') AS status,
			"&dao_ifnull()&"(spg.lecture_count, 0) AS lecture_count,
			"&dao_ifnull()&"(spg.score, 0) AS score,
			spg.end_date,
			spg.flag_get_status,
			spg.flag_get_score,
			"&dao_ifnull()&"(spg.eLM_session_time, 0) AS eLM_session_time,
			spr.type,
			MIN(spg2.start_date) AS start_date,
			MAX("&dao_ifnull()&"(spg2.eLM_total_time, 0)) AS eLM_total_time,
			COUNT(DISTINCT spg2.lecture_count) AS m_lc,
			COUNT(hwf.lecture_count) AS hw_count
	">

	<cfset tempSqlFrom1 = "
		FROM
			USER_MASTER usr
			INNER JOIN (COURSE_MASTER crs INNER JOIN ASSIGN asg ON crs.course_id = asg.course_id) ON usr.user_id = asg.user_id
	">

	<cfset tempSqlFrom2 = "
		FROM
			USER_MASTER usr
			INNER JOIN COURSE_MASTER crs ON 0=0
	">

	<cfset tempSqlFrom = "
		INNER JOIN CONSTRUCT con ON crs.course_id = con.course_id
		INNER JOIN SCO_MASTER sco ON con.sco_id = sco.sco_id
		LEFT JOIN SCO_PROGRESS_RECORD spr ON usr.user_id = spr.user_id AND sco.sco_id = spr.sco_id
		LEFT JOIN SCO_PROGRESS spg ON usr.user_id = spg.user_id AND sco.sco_id = spg.sco_id AND spr.lecture_count = spg.lecture_count
		LEFT JOIN SCO_PROGRESS spg2 ON usr.user_id = spg2.user_id AND sco.sco_id = spg2.sco_id AND crs.course_id = spg2.course_id
		LEFT JOIN HW_FILE hwf ON usr.user_id = hwf.user_id AND sco.sco_id = hwf.sco_id
	">

	<cfset tempSqlWhere1 = "
		" & where & " AND " & ArrayToList(type , ' AND ') & "
	">

	<cfset tempSqlWhere2 = "
		" & where & " AND usr.flag_all_course = 1 AND " & ArrayToList(type , ' AND ') & "
	">

	<cfset tempSqlGroupBy = "
		GROUP BY usr.user_id, crs.course_id, sco.sco_id, con.order_no,
		         usr.first_name, usr.last_name, usr.logon,
		         usr.first_name_furi, usr.last_name_furi,
		         crs.course_name, sco.sco_name, sco.class_id,
		         spg.status, spg.lecture_count, spg.score, spg.end_date,
		         spg.flag_get_status, spg.flag_get_score,
		         spg.eLM_session_time, spr.type )
	">

	<cfset tempSql =
					tempSqlSelect & tempSqlFrom1 & tempSqlFrom & tempSqlWhere1 & tempSqlGroupBy &
					" UNION " &
					tempSqlSelect & tempSqlFrom2 & tempSqlFrom & tempSqlWhere2 & tempSqlGroupBy &
					" ORDER BY last_name_furi, first_name_furi, logon, course_id "
	>
	<cfreturn tempSql>
</cffunction>

<!---------------------------------------------->
<cffunction name="table_course_progress_001" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="any">
	<cfargument name="arg002" required="true" type="any">
	<cfargument name="arg003" required="true" type="any">

	<cfset var user_close = ''>
	<cfset var course_close = ''>

	<cfset user_close = 'in (' & dao_escape(arguments.arg001) & ')'>

	<cfif IsArray(arguments.arg002)>
		<cfset course_close = 'AND t4.course_id in (' & ArrayToList(arguments.arg002) & ')'>
	<cfelseif arguments.arg002 is not "">
		<cfset course_close = 'AND t4.course_id = (' & dao_escape(arguments.arg002) & ')'>
	</cfif>

	<cfset tempSql = "
select t2.sort,t2.course_type_sed,t4.user_id , t4.course_id , "&dao_ifnull()&"(t5.course_status , 'not attempted') as course_status , "&dao_ifnull()&"(t1.course_count , 0) as course_count ,
       "&dao_ifnull()&"(t1.course_score , 0) as course_score , "&dao_ifnull()&"(t1.course_total_time , '0000:00:00') as course_total_time , "&dao_ifnull()&"(t1.eLM_total_time , 0) as eLM_total_time ,
       "&dao_ifnull()&"(t5.c_progress , 0) as c_progress , t1.start_date as start_date , t5.end_date , t1.change_date , "&dao_ifnull()&"(t1.mail_flag , 0) as mail_flag , t1.score_date ,
       t2.complete_count , t2.course_guide , t2.course_name , t2.course_no , t2.course_time_hour , t2.course_time_min ,
       t2.regist_flag , t2.start_date as c_start_date , t3.logon , t3.first_name , t3.last_name , t2.entry_date , "&dao_ifnull()&"(t4.period_id , 0) as period_id
       , t3.last_name_furi, t3.first_name_furi, t3.mailaddress
from   ASSIGN as t4 left join COURSE_PROGRESS as t1 on t4.user_id = t1.user_id and t4.course_id = t1.course_id
       left join COURSE_PROGRESS_RECORD as t5 on t4.user_id = t5.user_id and t4.course_id = t5.course_id and t5.type=" & dao_escape(arguments.arg003) & "
       left join COURSE_MASTER as t2 on t4.course_id = t2.course_id
       left join USER_MASTER as t3 on t4.user_id = t3.user_id
where  t4.user_id #user_close# #course_close#
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_course_progress_002" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="any">
	<cfargument name="arg002" required="true" type="any">
	<cfargument name="arg003" required="true" type="any">

	<cfset var course_close = ''>

	<cfif IsArray(arguments.arg002)>
		<cfset course_close = 'where course_id in (' & ArrayToList(arguments.arg002) & ')'>
	<cfelseif arguments.arg002 is not "">
		<cfset course_close = 'where course_id = (' & dao_escape(arguments.arg002) & ')'>
	</cfif>

	<cfset tempSql = "
select  t3.sort, t3.course_type_sed, t3.user_id , t3.course_id , "&dao_ifnull()&"(t5.course_status , 'not attempted') as course_status , "&dao_ifnull()&"(t4.course_count , 0) as course_count ,
       "&dao_ifnull()&"(t4.course_score , 0) as course_score , "&dao_ifnull()&"(t4.course_total_time , '0000:00:00') as course_total_time , "&dao_ifnull()&"(t4.eLM_total_time , 0) as eLM_total_time ,
       "&dao_ifnull()&"(t5.c_progress , 0) as c_progress , t4.start_date as start_date , t5.end_date , t4.change_date , "&dao_ifnull()&"(t4.mail_flag , 0) as mail_flag , t4.score_date ,
       t3.complete_count , t3.course_guide , t3.course_name , t3.course_no , t3.course_time_hour , t3.course_time_min ,
       t3.regist_flag , t3.start_date as c_start_date , t3.logon , t3.first_name , t3.last_name , t3.entry_date , 0 as period_id
       , t3.last_name_furi, t3.first_name_furi, t3.mailaddress
from (
      select * from (
                      select user_id , last_name , first_name , logon , last_name_furi, first_name_furi, mailaddress from USER_MASTER where user_id in (" & dao_escape(arguments.arg001) & ")
                     ) as t1 ,
                     (
                      select sort,course_type_sed,course_id , course_name , complete_count , course_guide , course_no , course_time_hour , course_time_min ,
                      regist_flag , start_date , entry_date
                      from   COURSE_MASTER
                      #course_close#
                     ) as t2
) as t3 left join COURSE_PROGRESS as t4 on t3.course_id = t4.course_id and t3.user_id = t4.user_id
        left join COURSE_PROGRESS_RECORD as t5 on t3.user_id = t5.user_id and t3.course_id = t5.course_id and t5.type=" & dao_escape(arguments.arg003) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_assign_cfc_001" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfset tempSql = "
delete from ASSIGN
where  user_id = (" & dao_escape(arguments.arg001) & ") and
       course_id in (" & dao_escape(arguments.arg002) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_assign_cfc_002" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfset tempSql = "
delete from ASSIGN
where  user_id = (" & dao_escape(arguments.arg001) & ") and
       course_id in (" & dao_escape(arguments.arg002) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_assign_cfc_003" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfset tempSql = "
delete from ASSIGN
where  course_id = (" & dao_escape(arguments.arg001) & ") and
       user_id in (" & dao_escape(arguments.arg002) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_assign_cfc_004" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfargument name="arg003" required="true" type="string">
	<cfset tempSql = "
update ASSIGN
set    period_id = (" & dao_escape(arguments.arg003) & ")
where  user_id = (" & dao_escape(arguments.arg001) & ") and
       course_id = (" & dao_escape(arguments.arg002) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_assign_cfc_005" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfset tempSql = "
select t1.user_id , t1.course_id , t1.period_id , t2.logon , t2.first_name , t2.last_name ,
       t2.first_name_furi , t2.last_name_furi , t2.mailaddress
from   USER_MASTER as t2 left join ASSIGN as t1 on t2.user_id = t1.user_id
where  t2.logon in (" & arguments.arg001 & ") and
       t1.course_id = " & dao_escape(arguments.arg002) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_assign_cfc_006" output="yes" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="str_where" default="(0=0)" type="string">
	<cfset tempSql = "
		select t_CM.* , t_PE.period_name , "&dao_ifnull()&"(t_PE.period_type , 0) as period_type , "&dao_ifnull()&"(t_PE.days , 0) as days ,
			"&dao_ifnull()&"(
				cast(
					case
					when period_type = 1 then t_PE.start_date
					when period_type = 2 then t_PE.start_date
					when period_type = 3 then "&dao_date_add(dao_now(),-1)&"
					when period_type = 4 then "&dao_date_add(dao_now(),-1)&"
					else "&dao_date_add(dao_now(),-1)&"
					end
				as datetime)
				,
				"&dao_date_add(dao_now(),-1)&"
			) as pe_start_date,
			"&dao_ifnull()&"(
				cast(
					case
					when period_type = 1 then t_PE.end_date
					when period_type = 2 then "&dao_date_add("t_PE.start_date","days")&"
					when period_type = 3 then "&dao_date_add("t_AS.entry_date","days")&"
					when period_type = 4 then "&dao_date_add(""&dao_ifnull()&"(t_CP.start_date , "&dao_date_add(dao_now(),'1')&")",'days')&"
					else "&dao_date_add(dao_now(),1)&"
					end
				as datetime)
				,
				"&dao_date_add(dao_now(),1)&"
			) as pe_end_date
		from   ASSIGN as t_AS inner join COURSE_MASTER as t_CM on t_AS.course_id = t_CM.course_id
		left join PERIOD as t_PE on t_AS.period_id = t_PE.period_id
		left join COURSE_PROGRESS as t_CP on t_AS.course_id = t_CP.course_id and t_AS.user_id = t_CP.user_id
		where " & arguments.str_where & " AND t_AS.user_id = (" & arguments.arg001 & ")
		order by t_CM.sort
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_assign_cfc_007" output="no" returntype="string">
	<cfargument name="str_where" default="(0=0)" type="string">
	<cfset tempSql = "
select COURSE_MASTER.* , null as period_name , 0 as period_type , "&dao_date_add(dao_now(),-1)&" as pe_start_date ,
       "&dao_date_add(dao_now(),1)&" as pe_end_date , 0 as days
from   COURSE_MASTER
where " & arguments.str_where & "
order by sort
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_items_cfc_001" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfargument name="arg003" required="true" type="string">
	<cfargument name="arg004" required="true" type="string">
	<cfset tempSql = "
update ITEMS
set    lecture_count = " & dao_escape(arguments.arg004) & "
where  user_id = (" & dao_escape(arguments.arg001) & ") and
       course_id = (" & dao_escape(arguments.arg002) & ") and
       sco_id = (" & dao_escape(arguments.arg003) & ") and
       lecture_count = -1
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_sco_progress_record_001" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfset tempSql = "
delete from SCO_PROGRESS_RECORD
where  user_id = (" & dao_escape(arguments.arg001) & ") and
       sco_id = (" & dao_escape(arguments.arg002) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_course_progress_record_001" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfargument name="arg003" required="true" type="string">
	<cfset tempSql = "
delete from COURSE_PROGRESS_RECORD
where  user_id in (" & dao_escape(arguments.arg001) & ") and
       course_id in (" & dao_escape(arguments.arg002) & ") and
       type = " & dao_escape(arguments.arg003) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_construct_001" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfset tempSql = "
select t1.sco_id , t1.parent_sco_id , t2.sco_type
from   CONSTRUCT as t1 inner join SCO_MASTER as t2 on t1.sco_id = t2.sco_id
where  t1.course_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_construct_002" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfset tempSql = "
update CONSTRUCT set order_no = order_no + 1
where  course_id = " & dao_escape(arguments.arg001) & " and
       order_no >= " & dao_escape(arguments.arg002) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_construct_003" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfargument name="arg003" required="true" type="string">
	<cfargument name="arg004" required="true" type="string">
	<cfset tempSql = "
update CONSTRUCT set order_no = order_no + " & dao_escape(arguments.arg004) & "
where  course_id = " & dao_escape(arguments.arg001) & " and
       order_no >= " & dao_escape(arguments.arg002) & " and
       order_no <= " & dao_escape(arguments.arg003) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_construct_004" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="array">
	<cfargument name="arg003" required="true" type="string">
	<cfset tempSql = "
update CONSTRUCT set order_no = order_no + " & dao_escape(arguments.arg003) & "
where  course_id = " & dao_escape(arguments.arg001) & " and
       sco_id in (" & ArrayToList(arguments.arg002) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_construct_005" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="numeric">
	<cfargument name="arg002" required="true" type="numeric">
	<cfargument name="arg003" required="true" type="string">
	<cfargument name="arg004" required="true" type="array">
	<cfset tempSql = "
update CONSTRUCT set order_no = order_no " & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg002) &"
where  course_id = " & dao_escape(arguments.arg001) & " and
       sco_id in (" & ArrayToList(arguments.arg004) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_construct_006" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="numeric">
	<cfargument name="arg002" required="true" type="numeric">
	<cfargument name="arg003" required="true" type="string">
	<cfargument name="arg004" required="true" type="array">
	<cfset tempSql = "
update CONSTRUCT set order_no = order_no " & dao_escape(arguments.arg003) & " " & dao_escape(arguments.arg002) &"
where  course_id = " & dao_escape(arguments.arg001) & " and
       sco_id in (" & ArrayToList(arguments.arg004) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_construct_007" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="numeric">
	<cfargument name="arg002" required="true" type="numeric">
	<cfargument name="arg003" required="true" type="numeric">
	<cfset tempSql = "
update CONSTRUCT set order_no = order_no - " & dao_escape(arguments.arg003) &"
where  course_id = " & dao_escape(arguments.arg001) & " and
       order_no >= " & dao_escape(arguments.arg002) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_construct_008" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="numeric">
	<cfargument name="arg002" required="true" type="array"  >
	<cfset tempSql = "
delete from CONSTRUCT
where  course_id = " & dao_escape(arguments.arg001) & " and
       sco_id in (" & ArrayToList(arguments.arg002) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_course_master_001" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="any">

	<cfset tempSql = "
select max(sort) + 1 as m_sort
from   COURSE_MASTER
where  sort is not null and course_id <> " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_course_master_002" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="any">

	<cfset tempSql = "
delete from LABEL_CONSTRUCT
where course_id = " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_course_master_003" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="any">

	<cfset tempSql = "
update COURSE_MASTER
set    sort = sort - 1
where  sort >= " & dao_escape(arguments.arg001) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_course_master_004" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="any">
	<cfargument name="arg002" required="true" type="any">
	<cfset tempSql = "
select t1.user_id , t1.flag_all_course from USER_MASTER as t1 inner join #arguments.arg001# as t2 on t1.user_id = t2.user_id
where  t2.mentor = " & dao_n() & "'" & dao_escape(arguments.arg002) & "'
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_course_master_005" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="any">
	<cfargument name="arg002" required="true" type="any">
	<cfset tempSql = "
select t1.user_id , t1.flag_all_course from USER_MASTER as t1 inner join #arguments.arg001# as t2 on t1.user_id = t2.user_id
where  t2.mentor = " & dao_escape(arguments.arg002) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_course_master_006" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="any">
	<cfset tempSql = "
select distinct course_id from ASSIGN
where  user_id in (" & dao_escape(arguments.arg001) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_course_master_007" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="any">
	<cfset tempSql = "
select "&dao_ifnull()&"(t_BCM.category_id , -1) as category_id
from   COURSE_MASTER as t_CM left join BBS_CATEGORY_MASTER as t_BCM on t_CM.course_id = t_BCM.course_id and t_BCM.effective = 1
where  t_CM.course_id in (" & dao_escape(arguments.arg001) & ")
order  by t_CM.course_type_sed, t_CM.sort
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_admin_course_001" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="any">
	<cfargument name="arg002" required="true" type="any">

	<cfset tempSql = "
delete from admin_course
       where user_id = " & dao_escape(arguments.arg001) & " and
             course_id = " & dao_escape(arguments.arg002) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="make_course_list_001" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="any">

	<cfset tempSql = "
select t1.sco_id , t1.parent_sco_id , t1.order_no , t2.sco_name , t2.sco_type , t2.flag_trial ,
       t2.lecture_time_hour , t2.lecture_time_min , t2.review_count , t2.sco_kind, t2.class_id, t2.url
from   CONSTRUCT as t1 inner join SCO_MASTER as t2 on t1.sco_id = t2.sco_id
where  t1.course_id = " & dao_escape(arguments.arg001) & "
order  by order_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="make_course_list_002" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="any">
	<cfargument name="arg002" required="true" type="any">
	<cfargument name="arg003" required="true" type="any">
	<cfset tempSql = "
select t2.sco_id , t2.order_no , t6.sco_name , t6.sco_type , t2.parent_sco_id , t6.lecture_time_hour , t6.lecture_time_min , t6.flag_trial , t6.url , t6.review_count ,
       "&dao_ifnull()&"(t4.status , 'not attempted') as status , "&dao_ifnull()&"(t4.lecture_count , 0) as lecture_count ,
       "&dao_ifnull()&"(t4.entry , 'ab-initio') as entry , t4.location , "&dao_ifnull()&"(t4.score , 0) as score , t4.start_date , t4.end_date ,
       "&dao_ifnull()&"(t4.total_time , '0000:00:00') as total_time , "&dao_ifnull()&"(t4.session_time , '0000:00:00') as session_time , t4.suspend , t4.score_date
from   ASSIGN as t1 inner join CONSTRUCT as t2 on t1.course_id = t2.course_id
       left outer join SCO_PROGRESS_RECORD as t3 on t1.user_id = t3.user_id and t2.sco_id = t3.sco_id
       left join SCO_PROGRESS as t4 on t3.user_id = t4.user_id and t3.sco_id = t4.sco_id and t3.lecture_count = t4.lecture_count
       inner join SCO_MASTER as t6 on t2.sco_id = t6.sco_id
where (t3.type is null or t3.type = " & dao_escape(arguments.arg003) & ")
      and t1.user_id = " & dao_escape(arguments.arg001) & " and t1.course_id = " & dao_escape(arguments.arg002) & "
order by t2.order_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="make_course_list_003" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="any">
	<cfargument name="arg002" required="true" type="any">

	<cfset tempSql = "
select "&dao_ifnull()&"(max(lecture_count) , 0) as m_lc
from   SCO_PROGRESS
where  user_id = " & dao_escape(arguments.arg001) & " and
       sco_id  = " & dao_escape(arguments.arg002) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="make_course_list_004" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="any">
	<cfargument name="arg002" required="true" type="any">
	<cfargument name="arg003" required="true" type="any">

	<cfset tempSql = "
select "&dao_ifnull()&"(t5.status , 1) as status
from CONSTRUCT as t6 left join
(
select t3.sco_id , min("&dao_ifnull()&"(t4.status , 0)) as status
 from PRECONDITION as t3 left join
(select t1.course_id , t2.sco_id ,
case
when t2.status = 'completed' then 1
when t2.status = 'passed' then 1
else 0
end 'status'
from SCO_PROGRESS_RECORD as t1 inner join SCO_PROGRESS as t2 on t1.course_id = t2.course_id and t1.sco_id = t2.sco_id and t1.user_id = t2.user_id and t1.lecture_count = t2.lecture_count
where t1.user_id = " & dao_escape(arguments.arg001) & " and t1.course_id = " & dao_escape(arguments.arg002) & " and t1.type = " & dao_escape(arguments.arg003) & ") as t4 on t3.course_id = t4.course_id and t3.pre_sco_id = t4.sco_id
where t3.course_id = " & dao_escape(arguments.arg002) & "
group by t3.sco_id
) as t5 on t6.sco_id = t5.sco_id
where t6.course_id = " & dao_escape(arguments.arg002) & "
order by order_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="make_course_list_005" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="any">
	<cfargument name="arg002" required="true" type="any">

	<cfset tempSql = "
select t1.sco_id , "&dao_ifnull()&"(t2.m_lc , 0) as lecture_count
from CONSTRUCT as t1 left join
(select sco_id , max(lecture_count) as m_lc from SCO_PROGRESS where user_id = " & dao_escape(arguments.arg001) & " and course_id = " & dao_escape(arguments.arg002) & " group by sco_id) as t2 on t1.sco_id = t2.sco_id
where t1.course_id = " & dao_escape(arguments.arg002) & "
order by order_no
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_precondition_cfc_001" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="any">
	<cfargument name="arg002" required="true" type="any">

	<cfset tempSql = "
delete from PRECONDITION
where  course_id = " & dao_escape(arguments.arg001) & " and
       sco_id = " & dao_escape(arguments.arg002) & "
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_sco_master_001" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="array">

	<cfset tempSql = "
delete from SCO_MASTER
where  sco_id in (" & ArrayToList(arguments.arg001) & ")
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_sco_master_002" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="numeric">
	<cfargument name="arg002" required="true" type="numeric">

	<cfset var sql = ''>

	<cfif arguments.arg002 is not 0>
		<cfset sql = 'and t_SM.sco_type = ' & arguments.arg002>
	</cfif>

	<cfset tempSql = "
select t_SM.*
from   CONSTRUCT as t_CN inner join SCO_MASTER as t_SM
on     t_CN.sco_id = t_SM.sco_id
where  t_CN.course_id = (" & arguments.arg001 & ")
#sql#
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_sco_master_003" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">

	<cfset var sql = ''>

	<cfif arguments.arg001 is not "">
		<cfset sql = 'and t_CO.course_id in (' & arguments.arg001 & ')'>
	</cfif>

	<cfset tempSql = "
select t_CM.course_id , t_SM.sco_id , t_CM.course_name , t_SM.sco_name
from CONSTRUCT as t_CO inner join SCO_MASTER as t_SM on t_CO.sco_id = t_SM.sco_id
inner join COURSE_MASTER as t_CM on t_CO.course_id = t_CM.course_id
where sco_kind = 3
#sql#
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_information_001" output="no" returntype="string">

	<cfset var today = dateformat(now() , 'yyyy/mm/dd') & ' ' & timeformat(now() , 'HH:mm:ss')>

	<cfset tempSql = "
select serial , title , app_entry_date
from   INFORMATION
where  appear = 1 and
       effective = 1 and
       app_start_date <= '#today#' and '#today#' <= app_end_date
order  by app_entry_date desc
">
	<cfreturn tempSql>
</cffunction>
<!---------------------------------------------->
<cffunction name="table_period_cfc_001" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="numeric">
	<cfargument name="arg002" required="true" type="numeric">

	<cfset tempSql = "
select t_PE.period_name , "&dao_ifnull()&"(t_PE.period_type , 0) as period_type , t_PE.start_date , t_PE.end_date , "&dao_ifnull()&"(t_PE.days , 0) as days
from   ASSIGN as t_AS left join PERIOD as t_PE on t_AS.period_id = t_PE.period_id
where  t_AS.user_id = " & arguments.arg001 & " and
       t_AS.course_id = " & arguments.arg002 & "
">
	<cfreturn tempSql>
</cffunction>

<cffunction name="next_id" output="Yes">
	<cfset var returnVariables = 0>
	<cfset var result = 0>
	<cfset var temp = 0>
	<cfset var seed = TimeFormat(now() , "HHmmssL")>

	<cftry>

		<cfquery name="q_getSerial" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
		select max(serial) as m_serial from SEQUENCE_MASTER
		</cfquery>

		<cfif q_getSerial.m_serial is "">
			<cfset result = 0>
		<cfelse>
			<cfset result = q_getSerial.m_serial>
		</cfif>

		<cfset temp = Randomize(seed, "SHA1PRNG")>
		<cfset returnVariables = RandRange(100 , 1000 , "SHA1PRNG") + result>

		<cfquery name="q_setSerial" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			insert into SEQUENCE_MASTER (serial) values (#returnVariables#)
		</cfquery>

		<cfreturn returnVariables>

		<cfcatch type="any">
			<cfreturn false>
		</cfcatch>

	</cftry>
</cffunction>

<cffunction name="getQueryCategory1" output="no" returntype="string">
	<cfset sql = "
	SELECT serial FROM INFORMATION
		where
			effective=1
			and
			appear=1
			and
			(app_start_date<"&dao_now()&" and "&dao_date_add('app_end_date',1)&" >"&dao_now()&")
			and
			display_category=1
			and
			(
				display_all='all'
				or
				display_all='student_all'
			)
	">
	<cfreturn sql>
</cffunction>

<cffunction name="getQueryCategory1admin" output="no" returntype="string">
	<cfset sql = "
	SELECT serial FROM INFORMATION
		where
			effective=1
			and
			appear=1
			and
			(app_start_date<"&dao_now()&" and "&dao_date_add('app_end_date',1)&" >"&dao_now()&")
			and
			display_category=1
			and
			(
				display_all=" & dao_n() & "'all'
				or
				display_all=" & dao_n() & "'admin_all'
			)
	">
	<cfreturn sql>
</cffunction>

<cffunction name="getQueryCategory2" output="no" returntype="string">
	<cfargument name="user_id" required="true" type="string">
	<cfset var user_id_safe = dao_escape(user_id)>
	<cfset sql = "
	SELECT distinct serial FROM INFORMATION,INFORMATION_USER
		where
			effective=1
			and
			appear=1
			and
			(app_start_date<"&dao_now()&" and "&dao_date_add('app_end_date',1)&" >"&dao_now()&")
			and
			display_category=2
			and
			(
				INFORMATION_USER.information_id=INFORMATION.serial
				and
				INFORMATION_USER.user_id= '#PreserveSingleQuotes(user_id_safe)#'
			)
	">
	<cfreturn sql>
</cffunction>

<cffunction name="getQueryCategory3" output="no" returntype="string">
	<cfargument name="user_id" required="true" type="string">
	<cfset var user_id_safe = dao_escape(user_id)>
	<cfset sql = "
	SELECT distinct serial FROM INFORMATION,INFORMATION_GROUP,belong
		where
			effective=1
			and
			appear=1
			and
			(app_start_date<"&dao_now()&" and "&dao_date_add('app_end_date',1)&" >"&dao_now()&")
			and
			display_category=3
			and
			(
				INFORMATION_GROUP.information_id=INFORMATION.serial
				and
				INFORMATION_GROUP.group_id=belong.group_id
				and
				belong.user_id='#PreserveSingleQuotes(user_id_safe)#'
			)
	">
	<cfreturn sql>
</cffunction>

<cffunction name="getQueryCategory3admin" output="no" returntype="string">
	<cfargument name="user_id" required="true" type="string">
	<cfset var user_id_safe = dao_escape(user_id)>
	<cfset sql = "
	SELECT distinct serial FROM INFORMATION,INFORMATION_GROUP,admin_group
		where
			effective=1
			and
			appear=1
			and
			(app_start_date<"&dao_now()&" and "&dao_date_add('app_end_date',1)&" >"&dao_now()&")
			and
			display_category=3
			and
			(
				INFORMATION_GROUP.information_id=INFORMATION.serial
				and
				INFORMATION_GROUP.group_id=admin_group.group_id
				and
				admin_group.user_id = '#PreserveSingleQuotes(user_id_safe)#'
			)
	UNION
	SELECT distinct serial FROM INFORMATION,USER_MASTER
		where
			effective=1
			and
			appear=1
			and
			(app_start_date<"&dao_now()&" and "&dao_date_add('app_end_date',1)&" >"&dao_now()&")
			and
			INFORMATION.display_category=3
			and
			(USER_MASTER.user_type_id = 1 or USER_MASTER.flag_all_admin_group = 1)
			and
			USER_MASTER.user_id='#PreserveSingleQuotes(user_id_safe)#'
	">
	<cfreturn sql>
</cffunction>

<cffunction name="getQueryCategory4" output="no" returntype="string">
	<cfargument name="user_id" required="true" type="string">
	<cfset var user_id_safe = dao_escape(user_id)>
	<cfset sql = "
	SELECT distinct serial
	FROM INFORMATION
	INNER JOIN INFORMATION_COURSE ON INFORMATION_COURSE.information_id=INFORMATION.serial
	INNER JOIN USER_MASTER as um ON um.user_id = '#PreserveSingleQuotes(user_id_safe)#'
		where
			effective=1
			and
			appear=1
			and
			(app_start_date<"&dao_now()&" and "&dao_date_add('app_end_date',1)&" >"&dao_now()&")
			and
			display_category=4
			and
			INFORMATION_COURSE.course_id = 0
			and
			(um.flag_all_course = 1 or um.user_id in (select an.user_id from ASSIGN as an, COURSE_MASTER as cm where an.course_id = cm.course_id))
	UNION
	SELECT distinct serial
	FROM INFORMATION
	INNER JOIN INFORMATION_COURSE ON INFORMATION_COURSE.information_id = INFORMATION.serial AND
	                                 INFORMATION_COURSE.course_id != 0 AND
	                                 INFORMATION_COURSE.period_id IN (-1, 0)
	INNER JOIN ASSIGN ON INFORMATION_COURSE.course_id=ASSIGN.course_id
		where
			effective=1
			and
			appear=1
			and
			(app_start_date<"&dao_now()&" and "&dao_date_add('app_end_date',1)&" >"&dao_now()&")
			and
			display_category=4
			and
			ASSIGN.user_id='#PreserveSingleQuotes(user_id_safe)#'
	UNION
	SELECT distinct serial
	FROM INFORMATION
	INNER JOIN INFORMATION_COURSE ON INFORMATION_COURSE.information_id = INFORMATION.serial AND
	                                 INFORMATION_COURSE.course_id != 0 AND
	                                 INFORMATION_COURSE.period_id IN (-1, 0)
	INNER JOIN USER_MASTER ON USER_MASTER.user_id = '#PreserveSingleQuotes(user_id_safe)#' AND
	                          USER_MASTER.flag_all_course = 1
		where
			effective=1
			and
			appear=1
			and
			(app_start_date<"&dao_now()&" and "&dao_date_add('app_end_date',1)&" >"&dao_now()&")
			and
			INFORMATION.display_category=4
	">
	<cfdump var="#sql#">
	<cfreturn sql>
</cffunction>

<cffunction name="getQueryCategory4admin" output="no" returntype="string">
	<cfargument name="user_id" required="true" type="string">
	<cfset var user_id_safe = dao_escape(user_id)>
	<cfset sql = "
	SELECT distinct serial FROM INFORMATION,INFORMATION_COURSE,admin_course
	INNER JOIN USER_MASTER as um ON um.user_id = '#PreserveSingleQuotes(user_id_safe)#'
		where
			effective=1
			and
			appear=1
			and
			(app_start_date<"&dao_now()&" and "&dao_date_add('app_end_date',1)&" >"&dao_now()&")
			and
			display_category=4
			and
			(
				INFORMATION_COURSE.information_id=INFORMATION.serial and
				(( INFORMATION_COURSE.course_id=0  and ( um.flag_all_admin_course = 1  or um.user_id in (select ac.user_id from admin_course as ac, COURSE_MASTER as cm where ac.course_id = cm.course_id)))
				or
				( INFORMATION_COURSE.course_id=admin_course.course_id
				and
				admin_course.user_id='#PreserveSingleQuotes(user_id_safe)#'
				))
			)
	UNION
	SELECT distinct serial FROM INFORMATION,USER_MASTER
		where
			effective=1
			and
			appear=1
			and
			(app_start_date<"&dao_now()&" and "&dao_date_add('app_end_date',1)&" >"&dao_now()&")
			and
			(
				INFORMATION.display_category = 4 and
				(USER_MASTER.flag_all_admin_course = 1 or USER_MASTER.user_type_id = 1)
				and
				USER_MASTER.user_id='#PreserveSingleQuotes(user_id_safe)#'
			)
	">
	<cfdump var="#sql#">
	<cfreturn sql>
</cffunction>

<cffunction name="getQueryCategory5" output="no" returntype="string">
	<cfargument name="user_id" required="true" type="string">
	<cfset var user_id_safe = dao_escape(user_id)>
	<cfset sql = "
	SELECT serial
	FROM INFORMATION
	INNER JOIN INFORMATION_PERIOD ON INFORMATION_PERIOD.information_id=INFORMATION.serial
	INNER JOIN ASSIGN ON INFORMATION_PERIOD.period_id=ASSIGN.period_id
	INNER JOIN USER_MASTER ON ASSIGN.user_id = USER_MASTER.user_id
		where
			effective=1
			and
			appear=1
			and
			(app_start_date<"&dao_now()&" and "&dao_date_add('app_end_date',1)&" >"&dao_now()&")
			and
			display_category=4
			and
			ASSIGN.user_id='#PreserveSingleQuotes(user_id_safe)#'
	">
	<cfdump var="#sql#">
	<cfreturn sql>
</cffunction>

<cffunction name="send_mail_001" output="no" returntype="string">
	<cfargument name="mailto"         required="true" type="string">
	<cfargument name="mailfrom"       required="true" type="string">
	<cfargument name="mailcc"         required="true" type="string">
	<cfargument name="mailbcc"        required="true" type="string">
	<cfargument name="replyto"        required="true" type="string">
	<cfargument name="failto"         required="true" type="string">
	<cfargument name="charset"        required="true" type="string">
	<cfargument name="MIMEAttach"     required="true" type="string">
	<cfargument name="subject"        required="true" type="string">
	<cfargument name="contents"       required="true" type="string">
	<cfargument name="course_id"      required="true" type="string">
	<cfargument name="scheduled_time" required="true" type="string">
	<cfargument name="admin_id"       required="true" type="string">
	<cfargument name="priority"       required="true" type="string">
	<cfargument name="mail_kind"      required="true" type="string">
<cfset sql="INSERT INTO MAIL_MASTER (
 mailto,
 mailfrom,
 mailcc,
 mailbcc,
 replyto,
 failto,
 charset,
 MIMEAttach,
 subject,
 contents,
 course_id,
 scheduled_time,
 admin_id,
 priority,
 mail_kind
)
VALUES (
 " & dao_n() & "'#dao_escape(mailto)#',
 " & dao_n() & "'#dao_escape(mailfrom)#',
 " & dao_n() & "'#dao_escape(mailcc)#',
 " & dao_n() & "'#dao_escape(mailbcc)#',
 " & dao_n() & "'#dao_escape(replyto)#',
 " & dao_n() & "'#dao_escape(failto)#',
 " & dao_n() & "'#dao_escape(charset)#',
 " & dao_n() & "'#dao_escape(MIMEAttach)#',
 " & dao_n() & "'#dao_escape(subject)#',
 " & dao_n() & "'#dao_escape(contents)#',
  #course_id#,
 " & dao_n() & "'#scheduled_time#',
  #admin_id#,
  #priority#,
  #mail_kind#
);">
	<cfreturn sql>
</cffunction>

<cffunction name="send_mail_002" output="no" returntype="string">
	<cfargument name="mailto"         required="true" type="string">
	<cfargument name="mailfrom"       required="true" type="string">
	<cfargument name="mailcc"         required="true" type="string">
	<cfargument name="mailbcc"        required="true" type="string">
	<cfargument name="replyto"        required="true" type="string">
	<cfargument name="failto"         required="true" type="string">
	<cfargument name="charset"        required="true" type="string">
	<cfargument name="MIMEAttach"     required="true" type="string">
	<cfargument name="subject"        required="true" type="string">
	<cfargument name="contents"       required="true" type="string">
	<cfargument name="course_id"      required="true" type="string">
	<cfargument name="scheduled_time" required="true" type="string">
	<cfargument name="admin_id"       required="true" type="string">
	<cfargument name="priority"       required="true" type="string">
	<cfargument name="mail_kind"      required="true" type="string">
<cfset sql="INSERT INTO MAIL_MASTER (
 mailto,
 mailfrom,
 mailcc,
 mailbcc,
 replyto,
 failto,
 charset,
 MIMEAttach,
 subject,
 contents,
 course_id,
 scheduled_time,
 admin_id,
 priority,
 mail_kind,
 generated,
 first_time,
 last_time,
 sent_count
)
VALUES (
 " & dao_n() & "'#dao_escape(mailto)#',
 " & dao_n() & "'#dao_escape(mailfrom)#',
 " & dao_n() & "'#dao_escape(mailcc)#',
 " & dao_n() & "'#dao_escape(mailbcc)#',
 " & dao_n() & "'#dao_escape(replyto)#',
 " & dao_n() & "'#dao_escape(failto)#',
 " & dao_n() & "'#dao_escape(charset)#',
 " & dao_n() & "'#dao_escape(MIMEAttach)#',
 " & dao_n() & "'#dao_escape(subject)#',
 " & dao_n() & "'#dao_escape(contents)#',
  #course_id#,
 " & dao_n() & "'#scheduled_time#',
  #admin_id#,
  #priority#,
  #mail_kind#,
  1,
 " & dao_n() & "'#scheduled_time#',
 " & dao_n() & "'#scheduled_time#',
 1
);">
	<cfreturn sql>
</cffunction>


<cffunction name="send_mail_delay" output="no" returntype="string">
	<cfset var sql	= "">
	<cfif this.is_timeset>
		<cfset sql="
		select
			PERIOD.period_type,
			PERIOD.period_id,
			ASSIGN.user_id,
			USER_MASTER.user_id mentor_id,
			ASSIGN.course_id,
			NOTIFICATION.effective_student_1 effective_student,
			NOTIFICATION.title_1 title,
			NOTIFICATION.contents_1 contents,
			NOTIFICATION.effective_mentor_1 effective_mentor,
			NOTIFICATION.title_mentor_1 title_mentor,
			NOTIFICATION.contents_mentor_1 contents_mentor,
			COURSE_PROGRESS_RECORD.c_progress progress
		from PERIOD
		join NOTIFICATION on NOTIFICATION.effective_1=1
			and NOTIFICATION.course_id = PERIOD.course_id
			and #dao_date_format(dao_date_add('PERIOD.end_date','-NOTIFICATION.notice_1'), "%Y-%m-%d", true)# = #dao_date_format(dao_now(), "%Y-%m-%d", true)#
		join ASSIGN on ASSIGN.period_id=PERIOD.period_id
		left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id
			and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
		left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
		left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
		join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
		where PERIOD.period_type=1
			and NOTIFICATION.type=3
			and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_1
				and COURSE_PROGRESS_RECORD.type=2)
		union all
		select
			PERIOD.period_type,
			PERIOD.period_id,
			ASSIGN.user_id,
			USER_MASTER.user_id mentor_id,
			ASSIGN.course_id,
			NOTIFICATION.effective_student_2 effective_student,
			NOTIFICATION.title_2 title,
			NOTIFICATION.contents_2 contents,
			NOTIFICATION.effective_mentor_2 effective_mentor,
			NOTIFICATION.title_mentor_2 title_mentor,
			NOTIFICATION.contents_mentor_2 contents_mentor,
			COURSE_PROGRESS_RECORD.c_progress progress
		from PERIOD
		join NOTIFICATION on NOTIFICATION.effective_2=1
			and NOTIFICATION.course_id=PERIOD.course_id
			and #dao_date_format(dao_date_add('PERIOD.end_date','-NOTIFICATION.notice_2'), "%Y-%m-%d", true)# = #dao_date_format(dao_now(), "%Y-%m-%d", true)#
		join ASSIGN on ASSIGN.period_id=PERIOD.period_id
		left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id
			and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
		left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
		left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
		join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
		where PERIOD.period_type=1
			and NOTIFICATION.type=3
			and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_2
				and COURSE_PROGRESS_RECORD.type=2)
		union all
		select
			PERIOD.period_type,
			PERIOD.period_id,
			ASSIGN.user_id,
			USER_MASTER.user_id mentor_id,
			ASSIGN.course_id,
			NOTIFICATION.effective_student_3 effective_student,
			NOTIFICATION.title_3 title,
			NOTIFICATION.contents_3 contents,
			NOTIFICATION.effective_mentor_3 effective_mentor,
			NOTIFICATION.title_mentor_3 title_mentor,
			NOTIFICATION.contents_mentor_3 contents_mentor,
			COURSE_PROGRESS_RECORD.c_progress progress
		from PERIOD
		join NOTIFICATION on NOTIFICATION.effective_3=1
			and NOTIFICATION.course_id=PERIOD.course_id
			and #dao_date_format(dao_date_add('PERIOD.end_date','-NOTIFICATION.notice_3'), "%Y-%m-%d", true)# = #dao_date_format(dao_now(), "%Y-%m-%d", true)#
		join ASSIGN on ASSIGN.period_id=PERIOD.period_id
		left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id
			and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
		left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
		left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
		join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
		where PERIOD.period_type=1
			and NOTIFICATION.type=3
			and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_3
				and COURSE_PROGRESS_RECORD.type=2)
		union all
		select
			PERIOD.period_type,
			PERIOD.period_id,
			ASSIGN.user_id,
			USER_MASTER.user_id mentor_id,
			ASSIGN.course_id,
			NOTIFICATION.effective_student_1 effective_student,
			NOTIFICATION.title_1 title,
			NOTIFICATION.contents_1 contents,
			NOTIFICATION.effective_mentor_1 effective_mentor,
			NOTIFICATION.title_mentor_1 title_mentor,
			NOTIFICATION.contents_mentor_1 contents_mentor,
			COURSE_PROGRESS_RECORD.c_progress progress
		from PERIOD
		join NOTIFICATION on NOTIFICATION.effective_1=1
			and NOTIFICATION.course_id=PERIOD.course_id
			and #dao_date_format(dao_date_add('PERIOD.start_date','PERIOD.days-1-NOTIFICATION.notice_1'), "%Y-%m-%d", true)# = #dao_date_format(dao_now(), "%Y-%m-%d", true)#
		join ASSIGN on ASSIGN.period_id=PERIOD.period_id
		left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id
			and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
		left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
		left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
		join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
		where PERIOD.period_type=2
			and NOTIFICATION.type=3
			and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_1
				and COURSE_PROGRESS_RECORD.type=2)
		union all
		select
			PERIOD.period_type,
			PERIOD.period_id,
			ASSIGN.user_id,
			USER_MASTER.user_id mentor_id,
			ASSIGN.course_id,
			NOTIFICATION.effective_student_2 effective_student,
			NOTIFICATION.title_2 title,
			NOTIFICATION.contents_2 contents,
			NOTIFICATION.effective_mentor_2 effective_mentor,
			NOTIFICATION.title_mentor_2 title_mentor,
			NOTIFICATION.contents_mentor_2 contents_mentor,
			COURSE_PROGRESS_RECORD.c_progress progress
		from PERIOD
		join NOTIFICATION on NOTIFICATION.effective_2=1
			and NOTIFICATION.course_id=PERIOD.course_id
			and #dao_date_format(dao_date_add('PERIOD.start_date','PERIOD.days-1-NOTIFICATION.notice_2'), "%Y-%m-%d", true)# = #dao_date_format(dao_now(), "%Y-%m-%d", true)#
		join ASSIGN on ASSIGN.period_id=PERIOD.period_id
		left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id
			and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
		left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
		left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
		join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
		where PERIOD.period_type=2
			and NOTIFICATION.type=3
			and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_2
				and COURSE_PROGRESS_RECORD.type=2)
		union all
		select
			PERIOD.period_type,
			PERIOD.period_id,
			ASSIGN.user_id,
			USER_MASTER.user_id mentor_id,
			ASSIGN.course_id,
			NOTIFICATION.effective_student_3 effective_student,
			NOTIFICATION.title_3 title,
			NOTIFICATION.contents_3 contents,
			NOTIFICATION.effective_mentor_3 effective_mentor,
			NOTIFICATION.title_mentor_3 title_mentor,
			NOTIFICATION.contents_mentor_3 contents_mentor,
			COURSE_PROGRESS_RECORD.c_progress progress
		from PERIOD
		join ASSIGN on ASSIGN.period_id=PERIOD.period_id
		join NOTIFICATION on NOTIFICATION.effective_3=1
			and NOTIFICATION.course_id=PERIOD.course_id
			and #dao_date_format(dao_date_add('PERIOD.start_date','PERIOD.days-1-NOTIFICATION.notice_3'), "%Y-%m-%d", true)# = #dao_date_format(dao_now(), "%Y-%m-%d", true)#
		left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id
			and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
		left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
		left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
		join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
		where PERIOD.period_type=2
			and NOTIFICATION.type=3
			and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_3
				and COURSE_PROGRESS_RECORD.type=2)
		union all
		select
			PERIOD.period_type,
			PERIOD.period_id,
			ASSIGN.user_id,
			USER_MASTER.user_id mentor_id,
			ASSIGN.course_id,
			NOTIFICATION.effective_student_1 effective_student,
			NOTIFICATION.title_1 title,
			NOTIFICATION.contents_1 contents,
			NOTIFICATION.effective_mentor_1 effective_mentor,
			NOTIFICATION.title_mentor_1 title_mentor,
			NOTIFICATION.contents_mentor_1 contents_mentor,
			COURSE_PROGRESS_RECORD.c_progress progress
		from PERIOD
		join ASSIGN on ASSIGN.period_id=PERIOD.period_id
		join NOTIFICATION on NOTIFICATION.effective_1=1
			and NOTIFICATION.course_id=PERIOD.course_id
			and #dao_date_format(dao_date_add('ASSIGN.entry_date','PERIOD.days-1-NOTIFICATION.notice_1'), "%Y-%m-%d", true)# = #dao_date_format(dao_now(), "%Y-%m-%d", true)#
		left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id
			and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
		left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
		left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
		join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
		where PERIOD.period_type=3
			and NOTIFICATION.type=3
			and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_1
				and COURSE_PROGRESS_RECORD.type=2)
		union all
		select
			PERIOD.period_type,
			PERIOD.period_id,
			ASSIGN.user_id,
			USER_MASTER.user_id mentor_id,
			ASSIGN.course_id,
			NOTIFICATION.effective_student_2 effective_student,
			NOTIFICATION.title_2 title,
			NOTIFICATION.contents_2 contents,
			NOTIFICATION.effective_mentor_2 effective_mentor,
			NOTIFICATION.title_mentor_2 title_mentor,
			NOTIFICATION.contents_mentor_2 contents_mentor,
			COURSE_PROGRESS_RECORD.c_progress progress
		from PERIOD
		join ASSIGN on ASSIGN.period_id=PERIOD.period_id
		join NOTIFICATION on NOTIFICATION.effective_2=1
			and NOTIFICATION.course_id=PERIOD.course_id
			and #dao_date_format(dao_date_add('ASSIGN.entry_date','PERIOD.days-1-NOTIFICATION.notice_2'), "%Y-%m-%d", true)# = #dao_date_format(dao_now(), "%Y-%m-%d", true)#
		left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id
			and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
		left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
		left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
		join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
		where PERIOD.period_type=3
			and NOTIFICATION.type=3
			and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_2
				and COURSE_PROGRESS_RECORD.type=2)
		union all
		select
			PERIOD.period_type,
			PERIOD.period_id,
			ASSIGN.user_id,
			USER_MASTER.user_id mentor_id,
			ASSIGN.course_id,
			NOTIFICATION.effective_student_3 effective_student,
			NOTIFICATION.title_3 title,
			NOTIFICATION.contents_3 contents,
			NOTIFICATION.effective_mentor_3 effective_mentor,
			NOTIFICATION.title_mentor_3 title_mentor,
			NOTIFICATION.contents_mentor_3 contents_mentor,
			COURSE_PROGRESS_RECORD.c_progress progress
		from PERIOD
		join ASSIGN on ASSIGN.period_id=PERIOD.period_id
		join NOTIFICATION on NOTIFICATION.effective_3=1
			and NOTIFICATION.course_id=PERIOD.course_id
			and #dao_date_format(dao_date_add('ASSIGN.entry_date','PERIOD.days-1-NOTIFICATION.notice_3'), "%Y-%m-%d", true)# = #dao_date_format(dao_now(), "%Y-%m-%d", true)#
		left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id
			and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
		left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
		left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
		join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
		where PERIOD.period_type=3
			and NOTIFICATION.type=3
			and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_3
				and COURSE_PROGRESS_RECORD.type=2)
		union all
		select
			PERIOD.period_type,
			PERIOD.period_id,
			ASSIGN.user_id,
			USER_MASTER.user_id mentor_id,
			ASSIGN.course_id,
			NOTIFICATION.effective_student_1 effective_student,
			NOTIFICATION.title_1 title,
			NOTIFICATION.contents_1 contents,
			NOTIFICATION.effective_mentor_1 effective_mentor,
			NOTIFICATION.title_mentor_1 title_mentor,
			NOTIFICATION.contents_mentor_1 contents_mentor,
			COURSE_PROGRESS_RECORD.c_progress progress
		from PERIOD
		join ASSIGN on ASSIGN.period_id=PERIOD.period_id
		join NOTIFICATION on NOTIFICATION.effective_1=1
			and NOTIFICATION.course_id=PERIOD.course_id
		join COURSE_PROGRESS on ASSIGN.user_id=COURSE_PROGRESS.user_id
			and ASSIGN.course_id=COURSE_PROGRESS.course_id
			and #dao_date_format(dao_date_add('COURSE_PROGRESS.start_date','PERIOD.days-1-NOTIFICATION.notice_1'), "%Y-%m-%d", true)# = #dao_date_format(dao_now(), "%Y-%m-%d", true)#
		left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id
			and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
		left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
		left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
		join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
		where PERIOD.period_type=4
			and NOTIFICATION.type=3
			and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_1
				and COURSE_PROGRESS_RECORD.type=2)
		union all
		select
			PERIOD.period_type,
			PERIOD.period_id,
			ASSIGN.user_id,
			USER_MASTER.user_id mentor_id,
			ASSIGN.course_id,
			NOTIFICATION.effective_student_2 effective_student,
			NOTIFICATION.title_2 title,
			NOTIFICATION.contents_2 contents,
			NOTIFICATION.effective_mentor_2 effective_mentor,
			NOTIFICATION.title_mentor_2 title_mentor,
			NOTIFICATION.contents_mentor_2 contents_mentor,
			COURSE_PROGRESS_RECORD.c_progress progress
		from PERIOD
		join ASSIGN on ASSIGN.period_id=PERIOD.period_id
		join NOTIFICATION on NOTIFICATION.effective_2=1
			and NOTIFICATION.course_id=PERIOD.course_id
		join COURSE_PROGRESS on ASSIGN.user_id=COURSE_PROGRESS.user_id
			and ASSIGN.course_id=COURSE_PROGRESS.course_id
			and #dao_date_format(dao_date_add('COURSE_PROGRESS.start_date','PERIOD.days-1-NOTIFICATION.notice_2'), "%Y-%m-%d", true)# = #dao_date_format(dao_now(), "%Y-%m-%d", true)#
		left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id
			and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
		left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
		left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
		join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
		where PERIOD.period_type=4
			and NOTIFICATION.type=3
			and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_2
				and COURSE_PROGRESS_RECORD.type=2)
		union all
		select
			PERIOD.period_type,
			PERIOD.period_id,
			ASSIGN.user_id,
			USER_MASTER.user_id mentor_id,
			ASSIGN.course_id,
			NOTIFICATION.effective_student_3 effective_student,
			NOTIFICATION.title_3 title,
			NOTIFICATION.contents_3 contents,
			NOTIFICATION.effective_mentor_3 effective_mentor,
			NOTIFICATION.title_mentor_3 title_mentor,
			NOTIFICATION.contents_mentor_3 contents_mentor,
			COURSE_PROGRESS_RECORD.c_progress progress
		from PERIOD
		join ASSIGN on ASSIGN.period_id=PERIOD.period_id
		join NOTIFICATION on NOTIFICATION.effective_3=1
			and NOTIFICATION.course_id=PERIOD.course_id
		join COURSE_PROGRESS on ASSIGN.user_id=COURSE_PROGRESS.user_id
			and ASSIGN.course_id=COURSE_PROGRESS.course_id
			and #dao_date_format(dao_date_add('COURSE_PROGRESS.start_date','PERIOD.days-1-NOTIFICATION.notice_3'), "%Y-%m-%d", true)# = #dao_date_format(dao_now(), "%Y-%m-%d", true)#
		left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id
			and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
		left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
		left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
		join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
		where PERIOD.period_type=4
			and NOTIFICATION.type=3
			and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_3
				and COURSE_PROGRESS_RECORD.type=2)
		">
	<cfelse>
<cfset sql="
select
  PERIOD.period_type,
  PERIOD.period_id,
  ASSIGN.user_id,
  USER_MASTER.user_id mentor_id,
  ASSIGN.course_id,
  NOTIFICATION.effective_student_1 effective_student,
  NOTIFICATION.title_1 title,
  NOTIFICATION.contents_1 contents,
  NOTIFICATION.effective_mentor_1 effective_mentor,
  NOTIFICATION.title_mentor_1 title_mentor,
  NOTIFICATION.contents_mentor_1 contents_mentor,
  COURSE_PROGRESS_RECORD.c_progress progress
from PERIOD
join NOTIFICATION on NOTIFICATION.effective_1=1 and NOTIFICATION.course_id = PERIOD.course_id
 and "&dao_date_add('PERIOD.end_date',"-NOTIFICATION.notice_1")&">"&dao_date_add(dao_now(),-1)&"
 and "&dao_date_add('PERIOD.end_date',"-NOTIFICATION.notice_1")&"<"&dao_now()&"
join ASSIGN on ASSIGN.period_id=PERIOD.period_id
left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
where PERIOD.period_type=1
and NOTIFICATION.type=3
and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_1 and COURSE_PROGRESS_RECORD.type=2)
union all
select
  PERIOD.period_type,
  PERIOD.period_id,
  ASSIGN.user_id,
  USER_MASTER.user_id mentor_id,
  ASSIGN.course_id,
  NOTIFICATION.effective_student_2 effective_student,
  NOTIFICATION.title_2 title,
  NOTIFICATION.contents_2 contents,
  NOTIFICATION.effective_mentor_2 effective_mentor,
  NOTIFICATION.title_mentor_2 title_mentor,
  NOTIFICATION.contents_mentor_2 contents_mentor,
  COURSE_PROGRESS_RECORD.c_progress progress
from PERIOD
join NOTIFICATION on NOTIFICATION.effective_2=1 and NOTIFICATION.course_id=PERIOD.course_id
 and "&dao_date_add('PERIOD.end_date','-NOTIFICATION.notice_2')&">"&dao_date_add(dao_now(),-1)&"
 and "&dao_date_add('PERIOD.end_date','-NOTIFICATION.notice_2')&"<"&dao_now()&"
join ASSIGN on ASSIGN.period_id=PERIOD.period_id
left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
where PERIOD.period_type=1
 and NOTIFICATION.type=3
and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_2 and COURSE_PROGRESS_RECORD.type=2)
union all
select
  PERIOD.period_type,
  PERIOD.period_id,
  ASSIGN.user_id,
  USER_MASTER.user_id mentor_id,
  ASSIGN.course_id,
  NOTIFICATION.effective_student_3 effective_student,
  NOTIFICATION.title_3 title,
  NOTIFICATION.contents_3 contents,
  NOTIFICATION.effective_mentor_3 effective_mentor,
  NOTIFICATION.title_mentor_3 title_mentor,
  NOTIFICATION.contents_mentor_3 contents_mentor,
  COURSE_PROGRESS_RECORD.c_progress progress
from PERIOD
join NOTIFICATION on NOTIFICATION.effective_3=1 and NOTIFICATION.course_id=PERIOD.course_id
 and "&dao_date_add('PERIOD.end_date','-NOTIFICATION.notice_3')&">"&dao_date_add(dao_now(),-1)&"
 and "&dao_date_add('PERIOD.end_date','-NOTIFICATION.notice_3')&"<"&dao_now()&"
join ASSIGN on ASSIGN.period_id=PERIOD.period_id
left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
where PERIOD.period_type=1
 and NOTIFICATION.type=3
and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_3 and COURSE_PROGRESS_RECORD.type=2)
union all
select
  PERIOD.period_type,
  PERIOD.period_id,
  ASSIGN.user_id,
  USER_MASTER.user_id mentor_id,
  ASSIGN.course_id,
  NOTIFICATION.effective_student_1 effective_student,
  NOTIFICATION.title_1 title,
  NOTIFICATION.contents_1 contents,
  NOTIFICATION.effective_mentor_1 effective_mentor,
  NOTIFICATION.title_mentor_1 title_mentor,
  NOTIFICATION.contents_mentor_1 contents_mentor,
  COURSE_PROGRESS_RECORD.c_progress progress
from PERIOD
join NOTIFICATION on NOTIFICATION.effective_1=1 and NOTIFICATION.course_id=PERIOD.course_id
 and "&dao_date_add('PERIOD.start_date','PERIOD.days-1-NOTIFICATION.notice_1')&">"&dao_date_add(dao_now(),-1)&"
 and "&dao_date_add('PERIOD.start_date','PERIOD.days-1-NOTIFICATION.notice_1')&"<"&dao_now()&"
join ASSIGN on ASSIGN.period_id=PERIOD.period_id
left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
where PERIOD.period_type=2
and NOTIFICATION.type=3
and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_1 and COURSE_PROGRESS_RECORD.type=2)
union all
select
  PERIOD.period_type,
  PERIOD.period_id,
  ASSIGN.user_id,
  USER_MASTER.user_id mentor_id,
  ASSIGN.course_id,
  NOTIFICATION.effective_student_2 effective_student,
  NOTIFICATION.title_2 title,
  NOTIFICATION.contents_2 contents,
  NOTIFICATION.effective_mentor_2 effective_mentor,
  NOTIFICATION.title_mentor_2 title_mentor,
  NOTIFICATION.contents_mentor_2 contents_mentor,
  COURSE_PROGRESS_RECORD.c_progress progress
from PERIOD
join NOTIFICATION on NOTIFICATION.effective_2=1 and NOTIFICATION.course_id=PERIOD.course_id
 and "&dao_date_add('PERIOD.start_date','PERIOD.days-1-NOTIFICATION.notice_2')&">"&dao_date_add(dao_now(),-1)&"
 and "&dao_date_add('PERIOD.start_date','PERIOD.days-1-NOTIFICATION.notice_2')&"<"&dao_now()&"
join ASSIGN on ASSIGN.period_id=PERIOD.period_id
left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
where PERIOD.period_type=2
and NOTIFICATION.type=3
and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_2 and COURSE_PROGRESS_RECORD.type=2)
union all
select
  PERIOD.period_type,
  PERIOD.period_id,
  ASSIGN.user_id,
  USER_MASTER.user_id mentor_id,
  ASSIGN.course_id,
  NOTIFICATION.effective_student_3 effective_student,
  NOTIFICATION.title_3 title,
  NOTIFICATION.contents_3 contents,
  NOTIFICATION.effective_mentor_3 effective_mentor,
  NOTIFICATION.title_mentor_3 title_mentor,
  NOTIFICATION.contents_mentor_3 contents_mentor,
  COURSE_PROGRESS_RECORD.c_progress progress
from PERIOD
join ASSIGN on ASSIGN.period_id=PERIOD.period_id
join NOTIFICATION on NOTIFICATION.effective_3=1 and NOTIFICATION.course_id=PERIOD.course_id
 and "&dao_date_add('PERIOD.start_date','PERIOD.days-1-NOTIFICATION.notice_3')&">"&dao_date_add(dao_now(),-1)&"
 and "&dao_date_add('PERIOD.start_date','PERIOD.days-1-NOTIFICATION.notice_3')&"<"&dao_now()&"
left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
where PERIOD.period_type=2
and NOTIFICATION.type=3
and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_3 and COURSE_PROGRESS_RECORD.type=2)
union all
select
  PERIOD.period_type,
  PERIOD.period_id,
  ASSIGN.user_id,
  USER_MASTER.user_id mentor_id,
  ASSIGN.course_id,
  NOTIFICATION.effective_student_1 effective_student,
  NOTIFICATION.title_1 title,
  NOTIFICATION.contents_1 contents,
  NOTIFICATION.effective_mentor_1 effective_mentor,
  NOTIFICATION.title_mentor_1 title_mentor,
  NOTIFICATION.contents_mentor_1 contents_mentor,
  COURSE_PROGRESS_RECORD.c_progress progress
from PERIOD
join ASSIGN on ASSIGN.period_id=PERIOD.period_id
join NOTIFICATION on NOTIFICATION.effective_1=1 and NOTIFICATION.course_id=PERIOD.course_id
 and "&dao_date_add('ASSIGN.entry_date','PERIOD.days-1-NOTIFICATION.notice_1')&">"&dao_date_add(dao_now(),-1)&"
 and "&dao_date_add('ASSIGN.entry_date','PERIOD.days-1-NOTIFICATION.notice_1')&"<"&dao_now()&"
left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
where PERIOD.period_type=3
and NOTIFICATION.type=3
and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_1 and COURSE_PROGRESS_RECORD.type=2)
union all
select
  PERIOD.period_type,
  PERIOD.period_id,
  ASSIGN.user_id,
  USER_MASTER.user_id mentor_id,
  ASSIGN.course_id,
  NOTIFICATION.effective_student_2 effective_student,
  NOTIFICATION.title_2 title,
  NOTIFICATION.contents_2 contents,
  NOTIFICATION.effective_mentor_2 effective_mentor,
  NOTIFICATION.title_mentor_2 title_mentor,
  NOTIFICATION.contents_mentor_2 contents_mentor,
  COURSE_PROGRESS_RECORD.c_progress progress
from PERIOD
join ASSIGN on ASSIGN.period_id=PERIOD.period_id
join NOTIFICATION on NOTIFICATION.effective_2=1 and NOTIFICATION.course_id=PERIOD.course_id
 and "&dao_date_add('ASSIGN.entry_date','PERIOD.days-1-NOTIFICATION.notice_2')&">"&dao_date_add(dao_now(),-1)&"
 and "&dao_date_add('ASSIGN.entry_date','PERIOD.days-1-NOTIFICATION.notice_2')&"<"&dao_now()&"
left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
where PERIOD.period_type=3
and NOTIFICATION.type=3
and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_2 and COURSE_PROGRESS_RECORD.type=2)
union all
select
  PERIOD.period_type,
  PERIOD.period_id,
  ASSIGN.user_id,
  USER_MASTER.user_id mentor_id,
  ASSIGN.course_id,
  NOTIFICATION.effective_student_3 effective_student,
  NOTIFICATION.title_3 title,
  NOTIFICATION.contents_3 contents,
  NOTIFICATION.effective_mentor_3 effective_mentor,
  NOTIFICATION.title_mentor_3 title_mentor,
  NOTIFICATION.contents_mentor_3 contents_mentor,
  COURSE_PROGRESS_RECORD.c_progress progress
from PERIOD
join ASSIGN on ASSIGN.period_id=PERIOD.period_id
join NOTIFICATION on NOTIFICATION.effective_3=1 and NOTIFICATION.course_id=PERIOD.course_id
 and "&dao_date_add('ASSIGN.entry_date','PERIOD.days-1-NOTIFICATION.notice_3')&">"&dao_date_add(dao_now(),-1)&"
 and "&dao_date_add('ASSIGN.entry_date','PERIOD.days-1-NOTIFICATION.notice_3')&"<"&dao_now()&"
left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
where PERIOD.period_type=3
and NOTIFICATION.type=3
and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_3 and COURSE_PROGRESS_RECORD.type=2)
union all
select
  PERIOD.period_type,
  PERIOD.period_id,
  ASSIGN.user_id,
  USER_MASTER.user_id mentor_id,
  ASSIGN.course_id,
  NOTIFICATION.effective_student_1 effective_student,
  NOTIFICATION.title_1 title,
  NOTIFICATION.contents_1 contents,
  NOTIFICATION.effective_mentor_1 effective_mentor,
  NOTIFICATION.title_mentor_1 title_mentor,
  NOTIFICATION.contents_mentor_1 contents_mentor,
  COURSE_PROGRESS_RECORD.c_progress progress
from PERIOD
join ASSIGN on ASSIGN.period_id=PERIOD.period_id
join NOTIFICATION on NOTIFICATION.effective_1=1 and NOTIFICATION.course_id=PERIOD.course_id
join COURSE_PROGRESS on ASSIGN.user_id=COURSE_PROGRESS.user_id and ASSIGN.course_id=COURSE_PROGRESS.course_id
 and "&dao_date_add('COURSE_PROGRESS.start_date','PERIOD.days-1-NOTIFICATION.notice_1')&">"&dao_date_add(dao_now(),-1)&"
 and "&dao_date_add('COURSE_PROGRESS.start_date','PERIOD.days-1-NOTIFICATION.notice_1')&"<"&dao_now()&"
left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
where PERIOD.period_type=4
and NOTIFICATION.type=3
and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_1 and COURSE_PROGRESS_RECORD.type=2)
union all
select
  PERIOD.period_type,
  PERIOD.period_id,
  ASSIGN.user_id,
  USER_MASTER.user_id mentor_id,
  ASSIGN.course_id,
  NOTIFICATION.effective_student_2 effective_student,
  NOTIFICATION.title_2 title,
  NOTIFICATION.contents_2 contents,
  NOTIFICATION.effective_mentor_2 effective_mentor,
  NOTIFICATION.title_mentor_2 title_mentor,
  NOTIFICATION.contents_mentor_2 contents_mentor,
  COURSE_PROGRESS_RECORD.c_progress progress
from PERIOD
join ASSIGN on ASSIGN.period_id=PERIOD.period_id
join NOTIFICATION on NOTIFICATION.effective_2=1 and NOTIFICATION.course_id=PERIOD.course_id
join COURSE_PROGRESS on ASSIGN.user_id=COURSE_PROGRESS.user_id and ASSIGN.course_id=COURSE_PROGRESS.course_id
 and "&dao_date_add('COURSE_PROGRESS.start_date','PERIOD.days-1-NOTIFICATION.notice_2')&">"&dao_date_add(dao_now(),-1)&"
 and "&dao_date_add('COURSE_PROGRESS.start_date','PERIOD.days-1-NOTIFICATION.notice_2')&"<"&dao_now()&"
left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
where PERIOD.period_type=4
and NOTIFICATION.type=3
and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_2 and COURSE_PROGRESS_RECORD.type=2)
union all
select
  PERIOD.period_type,
  PERIOD.period_id,
  ASSIGN.user_id,
  USER_MASTER.user_id mentor_id,
  ASSIGN.course_id,
  NOTIFICATION.effective_student_3 effective_student,
  NOTIFICATION.title_3 title,
  NOTIFICATION.contents_3 contents,
  NOTIFICATION.effective_mentor_3 effective_mentor,
  NOTIFICATION.title_mentor_3 title_mentor,
  NOTIFICATION.contents_mentor_3 contents_mentor,
  COURSE_PROGRESS_RECORD.c_progress progress
from PERIOD
join ASSIGN on ASSIGN.period_id=PERIOD.period_id
join NOTIFICATION on NOTIFICATION.effective_3=1 and NOTIFICATION.course_id=PERIOD.course_id
join COURSE_PROGRESS on ASSIGN.user_id=COURSE_PROGRESS.user_id and ASSIGN.course_id=COURSE_PROGRESS.course_id
 and "&dao_date_add('COURSE_PROGRESS.start_date','PERIOD.days-1-NOTIFICATION.notice_3')&">"&dao_date_add(dao_now(),-1)&"
 and "&dao_date_add('COURSE_PROGRESS.start_date','PERIOD.days-1-NOTIFICATION.notice_3')&"<"&dao_now()&"
left join COURSE_PROGRESS_RECORD on COURSE_PROGRESS_RECORD.user_id=ASSIGN.user_id and COURSE_PROGRESS_RECORD.course_id=ASSIGN.course_id
left join USER_MASTER_ADD_SSP on ASSIGN.user_id=USER_MASTER_ADD_SSP.user_id
left join USER_MASTER on USER_MASTER_ADD_SSP.mentor=USER_MASTER.logon
join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
where PERIOD.period_type=4
and NOTIFICATION.type=3
and (COURSE_PROGRESS_RECORD.c_progress is NULL or COURSE_PROGRESS_RECORD.c_progress<NOTIFICATION.achievement_3 and COURSE_PROGRESS_RECORD.type=2)
">
	</cfif>
	<cfreturn sql>
</cffunction>

<cffunction name="send_mail_info" output="no" returntype="string">
	<cfset var sql	= "">
	<cfif this.is_timeset>
		<cfset sql="
			select
				ASSIGN.user_id,
				NOTIFICATION.title_1 title,
				NOTIFICATION.contents_1 contents,
				ASSIGN.course_id,
				PERIOD.period_id
			from PERIOD
			join ASSIGN on ASSIGN.period_id=PERIOD.period_id
			join NOTIFICATION on NOTIFICATION.effective_1=1
				and NOTIFICATION.course_id = ASSIGN.course_id
				and "&dao_date_format(dao_date_add('PERIOD.start_date','-NOTIFICATION.notice_1'), "%Y-%m-%d", true) & "=" & dao_date_format(dao_now(), "%Y-%m-%d", true)&"
			join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
			where (PERIOD.PERIOD_type=1 or PERIOD.PERIOD_type=2) and NOTIFICATION.type=6
			union all
			select
				ASSIGN.user_id,
				NOTIFICATION.title_2 title,
				NOTIFICATION.contents_2 contents,
				ASSIGN.course_id,
				PERIOD.period_id
			from PERIOD
			join ASSIGN on ASSIGN.period_id=PERIOD.period_id
			join NOTIFICATION on NOTIFICATION.effective_2=1
				and NOTIFICATION.course_id = ASSIGN.course_id
				and "&dao_date_format(dao_date_add('PERIOD.start_date','-NOTIFICATION.notice_2'), "%Y-%m-%d", true) & "=" & dao_date_format(dao_now(), "%Y-%m-%d")&"
			join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
			where (PERIOD.PERIOD_type=1 or PERIOD.PERIOD_type=2) and NOTIFICATION.type=6
			union all
			select
				ASSIGN.user_id,
				NOTIFICATION.title_3 title,
				NOTIFICATION.contents_3 contents,
				ASSIGN.course_id,
				PERIOD.period_id
			from PERIOD
			join ASSIGN on ASSIGN.period_id=PERIOD.period_id
			join NOTIFICATION on NOTIFICATION.effective_3=1
				and NOTIFICATION.course_id = ASSIGN.course_id
				and "&dao_date_format(dao_date_add('PERIOD.start_date','-NOTIFICATION.notice_3'), "%Y-%m-%d", true) & "=" & dao_date_format(dao_now(), "%Y-%m-%d")&"
			join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
			where (PERIOD.PERIOD_type=1 or PERIOD.PERIOD_type=2) and NOTIFICATION.type=6
			">
	<cfelse>
<cfset sql="
select
  ASSIGN.user_id,
  NOTIFICATION.title_1 title,
  NOTIFICATION.contents_1 contents,
  ASSIGN.course_id
 ,PERIOD.period_id
from PERIOD
join ASSIGN on ASSIGN.period_id=PERIOD.period_id
join NOTIFICATION on NOTIFICATION.effective_1=1 and NOTIFICATION.course_id = ASSIGN.course_id
 and "&dao_date_add('PERIOD.start_date','-NOTIFICATION.notice_1')&">"&dao_date_add(dao_now(),-1)&"
 and "&dao_date_add('PERIOD.start_date','-NOTIFICATION.notice_1')&"<"&dao_now()&"
join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
where (PERIOD.period_type=1 or PERIOD.period_type=2) and NOTIFICATION.type=6
union all
select
  ASSIGN.user_id,
  NOTIFICATION.title_2 title,
  NOTIFICATION.contents_2 contents,
  ASSIGN.course_id
 ,PERIOD.period_id
from PERIOD
join ASSIGN on ASSIGN.period_id=PERIOD.period_id
join NOTIFICATION on NOTIFICATION.effective_2=1 and NOTIFICATION.course_id = ASSIGN.course_id
 and "&dao_date_add('PERIOD.start_date','-NOTIFICATION.notice_2')&">"&dao_date_add(dao_now(),-1)&"
 and "&dao_date_add('PERIOD.start_date','-NOTIFICATION.notice_2')&"<"&dao_now()&"
join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
where (PERIOD.period_type=1 or PERIOD.period_type=2) and NOTIFICATION.type=6
union all
select
  ASSIGN.user_id,
  NOTIFICATION.title_3 title,
  NOTIFICATION.contents_3 contents,
  ASSIGN.course_id
 ,PERIOD.period_id
from PERIOD
join ASSIGN on ASSIGN.period_id=PERIOD.period_id
join NOTIFICATION on NOTIFICATION.effective_3=1 and NOTIFICATION.course_id = ASSIGN.course_id
 and "&dao_date_add('PERIOD.start_date','-NOTIFICATION.notice_3')&">"&dao_date_add(dao_now(),-1)&"
 and "&dao_date_add('PERIOD.start_date','-NOTIFICATION.notice_3')&"<"&dao_now()&"
join COURSE_MASTER on COURSE_MASTER.course_id = NOTIFICATION.course_id
where (PERIOD.period_type=1 or PERIOD.period_type=2) and NOTIFICATION.type=6
">
	</cfif>
	<cfreturn sql>
</cffunction>

<!---------------------------------------------->
<cffunction name="send_mail_term_period">
	<cfargument name="arg001" required="true">	<!--- user_id --->
	<cfargument name="arg002" required="true">	<!--- course_id  --->
	<cfset var tempSql = ''>
	<cfset arg001_safe = dao_escape(arg001)>
	<cfset arg002_safe = dao_escape(arg002)>
	<cfset tempSql = "
select start_date,end_date,period_type,days from ASSIGN join PERIOD on ASSIGN.period_id=PERIOD.period_id where ASSIGN.user_id='#PreserveSingleQuotes(arg001_safe)#' and PERIOD.period_type=1 and PERIOD.course_id='#PreserveSingleQuotes(arg002_safe)#'
union all
select start_date,"&dao_date_add('start_date','days')&",period_type,days from ASSIGN join PERIOD on ASSIGN.period_id=PERIOD.period_id where ASSIGN.user_id='#PreserveSingleQuotes(arg001_safe)#' and PERIOD.period_type=2 and PERIOD.course_id='#PreserveSingleQuotes(arg002_safe)#'
union all
select ASSIGN.entry_date start_date,NULL,period_type,days from ASSIGN join PERIOD on ASSIGN.period_id=PERIOD.period_id where ASSIGN.user_id='#PreserveSingleQuotes(arg001_safe)#' and PERIOD.period_type=3 and PERIOD.course_id='#PreserveSingleQuotes(arg002_safe)#'
union all
select COURSE_PROGRESS.start_date,NULL,period_type,days from ASSIGN join PERIOD on ASSIGN.period_id=PERIOD.period_id join COURSE_PROGRESS on COURSE_PROGRESS.course_id = ASSIGN.course_id and COURSE_PROGRESS.user_id = ASSIGN.user_id where ASSIGN.user_id='#PreserveSingleQuotes(arg001_safe)#' and PERIOD.period_type=4 and PERIOD.course_id='#PreserveSingleQuotes(arg002_safe)#'
">
	<cfreturn tempSql>
</cffunction>
<!--- -------------------------------------- --->
<cffunction name="enquete_cfc_001">
	<cfargument name="answer_struct" required="true">
	<cfset var tempSql = "">
	<cfif answer_struct.forSave eq -1>
		<cfset tempSql = "
INSERT INTO T_ANSWER (
	ENQUETE_NO,
	ANSWER_CODE,
	ZIP_CODE,
	ADDRESS_PREF,
	ADDRESS_1,
	ADDRESS_2,
	FAMILY_NAME,
	FIRST_NAME,
	FAMILY_NAME_READ,
	FIRST_NAME_READ,
	AGE,
	SEX,
	TEL_NO,
	FAX_NO,
	MAIL_ADDRESS,
	REPLIED_FLG,
	ANSWER_ACCOUNT,
	ANSWERED_DATE,
	REMOTE_HOST,
	REMOTE_IP,
	SAVED_FLG,
	DEL_FLG,
	ETC1,
	ETC2,
	ETC3,
	ETC4,
	ETC5
)
VALUES (
	#dao_n()#'#dao_escape(answer_struct.ENQUETE_NO)#',
	#dao_n()#'#dao_escape(answer_struct.ANSWER_CODE)#',
	#dao_n()#'#dao_escape(answer_struct.ZIP_CODE_1)#-#dao_escape(answer_struct.ZIP_CODE_2)#',
	#dao_n()#'#dao_escape(answer_struct.ADDRESS_PREF)#',
	#dao_n()#'#dao_escape(answer_struct.ADDRESS_1)#',
	#dao_n()#'#dao_escape(answer_struct.ADDRESS_2)#',
	#dao_n()#'#dao_escape(answer_struct.FAMILY_NAME)#',
	#dao_n()#'#dao_escape(answer_struct.FIRST_NAME)#',
	#dao_n()#'#dao_escape(answer_struct.FAMILY_NAME_READ)#',
	#dao_n()#'#dao_escape(answer_struct.FIRST_NAME_READ)#',
	#dao_n()#'#dao_escape(answer_struct.AGE)#',
	#dao_n()#'#dao_escape(answer_struct.SEX)#',
	#dao_n()#'#dao_escape(answer_struct.TEL_NO_1)#-#dao_escape(answer_struct.TEL_NO_2)#-#dao_escape(answer_struct.TEL_NO_3)#',
	#dao_n()#'#dao_escape(answer_struct.FAX_NO_1)#-#dao_escape(answer_struct.FAX_NO_2)#-#dao_escape(answer_struct.FAX_NO_3)#',
	#dao_n()#'#dao_escape(answer_struct.MAIL_ADDRESS)#',
	0,
	#dao_n()#'#dao_escape(answer_struct.ANSWER_ACCOUNT)#',
	Now(),
	#dao_n()#'#dao_escape(answer_struct.REMOTE_HOST)#',
	#dao_n()#'#dao_escape(answer_struct.REMOTE_IP)#',
	#dao_n()#'#dao_escape(answer_struct.SAVED_FLG)#',
	0,
	#dao_n()#'#dao_escape(answer_struct.ETC1)#',
	#dao_n()#'#dao_escape(answer_struct.ETC2)#',
	#dao_n()#'#dao_escape(answer_struct.ETC3)#',
	#dao_n()#'#dao_escape(answer_struct.ETC4)#',
	#dao_n()#'#dao_escape(answer_struct.ETC5)#'
		)">
	<cfelse>
		<cfset answer_struct.ANSWER_CODE = answer_struct.forSave>
		<cfset tempSql = "
UPDATE	T_ANSWER
SET		ZIP_CODE = #dao_n()#'#dao_escape(answer_struct.ZIP_CODE_1)#-#dao_escape(answer_struct.ZIP_CODE_2)#',
		ADDRESS_PREF = #dao_n()#'#dao_escape(answer_struct.ADDRESS_PREF)#',
		ADDRESS_1 = #dao_n()#'#dao_escape(answer_struct.ADDRESS_1)#',
		ADDRESS_2 = #dao_n()#'#dao_escape(answer_struct.ADDRESS_2)#',
		FAMILY_NAME = #dao_n()#'#dao_escape(answer_struct.FAMILY_NAME)#',
		FIRST_NAME = #dao_n()#'#dao_escape(answer_struct.FIRST_NAME)#',
		FAMILY_NAME_READ = #dao_n()#'#dao_escape(answer_struct.FAMILY_NAME_READ)#',
		FIRST_NAME_READ = #dao_n()#'#dao_escape(answer_struct.FIRST_NAME_READ)#',
		AGE = #dao_n()#'#dao_escape(answer_struct.AGE)#',
		SEX = #dao_n()#'#dao_escape(answer_struct.SEX)#',
		TEL_NO = #dao_n()#'#dao_escape(answer_struct.TEL_NO_1)#-#dao_escape(answer_struct.TEL_NO_2)#-#dao_escape(answer_struct.TEL_NO_3)#',
		FAX_NO = #dao_n()#'#dao_escape(answer_struct.FAX_NO_1)#-#dao_escape(answer_struct.FAX_NO_2)#-#dao_escape(answer_struct.FAX_NO_3)#',
		MAIL_ADDRESS = #dao_n()#'#dao_escape(answer_struct.MAIL_ADDRESS)#',
		REPLIED_FLG = 0,
		ANSWER_ACCOUNT = #dao_n()#'#dao_escape(answer_struct.ANSWER_ACCOUNT)#',
		ANSWERED_DATE = Now(),
		REMOTE_HOST = #dao_n()#'#dao_escape(answer_struct.REMOTE_HOST)#',
		REMOTE_IP = #dao_n()#'#dao_escape(answer_struct.REMOTE_IP)#',
		SAVED_FLG = #dao_n()#'#dao_escape(answer_struct.SAVED_FLG)#',
		DEL_FLG = 0,
		ETC1 = #dao_n()#'#dao_escape(answer_struct.ETC1)#',
		ETC2 = #dao_n()#'#dao_escape(answer_struct.ETC2)#',
		ETC3 = #dao_n()#'#dao_escape(answer_struct.ETC3)#',
		ETC4 = #dao_n()#'#dao_escape(answer_struct.ETC4)#',
		ETC5 = #dao_n()#'#dao_escape(answer_struct.ETC5)#'
WHERE	ENQUETE_NO = #dao_n()#'#dao_escape(answer_struct.ENQUETE_NO)#'
		AND ANSWER_CODE = #dao_n()#'#dao_escape(answer_struct.ANSWER_CODE)#'
		">
	</cfif>
	<cfreturn tempSql>
</cffunction>
<!--- -------------------------------------- --->
<cffunction name="MailInfoSender_001">
	<cfset var tempSql = "SELECT * FROM INFOSENDER_TEMPORARY WHERE sent_flag = 0 LIMIT 1000;">
	<cfreturn tempSql>
</cffunction>
<!--- -------------------------------------- --->
<cffunction name="MailDelaySender_001">
	<cfset var tempSql = "SELECT * FROM DELAYSENDER_TEMPORARY WHERE sent_flag = 0 LIMIT 1000;">
	<cfreturn tempSql>
</cffunction>

<cffunction name="user_logon_log_all_get_latest_logon_date">
    <cfargument name = "user_id" type = "numeric"/>
    <cfset var tempSql = '
      SELECT logon_date FROM USER_LOGON_LOG_ALL
      WHERE user_id = #user_id#
      ORDER BY serial DESC
      LIMIT 1
    ' />
    <cfreturn tempSql />
</cffunction>
<!--- 2020/01/17 ito c_csv_co_sco ADD start --->
<!---------------------------------------------->
<cffunction name="table_sco_progress_004_for_co_sco" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfargument name="arg003" required="true" type="string">
	<cfargument name="arg004" required="true" type="string">

	<cfset var sco_type = ''>
	<cfset var spr_type = ''>
	<cfset var cprd_type = ''>

	<cfif arguments.arg003 is 0>
		<cfset sco_type = ' AND SCO.sco_type = 1 '>
	</cfif>

	<cfif arguments.arg004 is not -1>
		<cfset spr_type = " AND SPR.type = " & dao_escape(arguments.arg004) & " ">
		<cfset cprd_type = " AND CPRD.type = " & dao_escape(arguments.arg004) & " ">
	</cfif>

	<cfset tempSql = "
SELECT USR.user_id , CON.course_id , CON.sco_id , CON.order_no , CON.parent_sco_id ,
       USR.first_name , USR.last_name , USR.logon , CRS.course_name , SCO.sco_name , SCO.sco_type ,
       SCO.lecture_time_hour , SCO.lecture_time_min , SCO.max_score , SCO.mastery_score ,
       SCO.min_score , SCO.flag_trial , SCO.review_count , SCO.class_id ,
       ifnull(SP.status , 'not attempted') as status , ifnull(SP.lecture_count , 0) as lecture_count,
       ifnull(SP.entry , 'ab-initio') as entry , SP.location , ifnull(SP.score , 0) as score,
       SP_FIRST.start_date, SP.end_date ,
       ifnull(SP.total_time , '0000:00:00') as total_time , ifnull(SP.session_time , '0000:00:00') as session_time , SP.suspend , SP.score_date ,
       ifnull(SP_LAST.eLM_total_time, 0) AS eLM_total_time,
       ifnull(SP.eLM_session_time , 0) as eLM_session_time ,
       ifnull(SP_LAST.lecture_count, 0) AS m_lc,
       SPR.type , SP.flag_get_status , SP.flag_get_score,
       SCO.class_id, SCO.sco_kind, USR.first_name_furi , USR.last_name_furi , USR.mailaddress
	   ,CPRD.course_status, CPRD.c_progress, CPR.course_count, CPR.start_date as cpr_start_date, CPRD.end_date as cprd_end_date, ifnull(CPR.eLM_total_time, 0) as cpr_eLM_total_time
FROM USER_MASTER AS USR
INNER JOIN CONSTRUCT AS CON ON CON.course_id in (" & dao_escape(arguments.arg002) & ")
INNER JOIN SCO_MASTER AS SCO ON CON.sco_id = SCO.sco_id " & sco_type & "
INNER JOIN COURSE_MASTER AS CRS ON CON.course_id = CRS.course_id
LEFT JOIN SCO_PROGRESS_RECORD AS SPR ON USR.user_id = SPR.user_id AND
                                        CON.course_id = SPR.course_id AND
                                        CON.sco_id = SPR.sco_id " & spr_type & "
LEFT JOIN  SCO_PROGRESS AS SP ON SPR.user_id = SP.user_id AND
                                 SPR.course_id = SP.course_id AND
                                 SPR.sco_id = SP.sco_id AND
                                 SPR.lecture_count = SP.lecture_count
LEFT JOIN SCO_PROGRESS_RECORD AS SPR_FIRST ON USR.user_id = SPR_FIRST.user_id AND
                                              CON.course_id = SPR_FIRST.course_id AND
                                              CON.sco_id = SPR_FIRST.sco_id AND
                                              SPR_FIRST.type = 3
LEFT JOIN SCO_PROGRESS AS SP_FIRST ON SPR_FIRST.user_id = SP_FIRST.user_id AND
                                      SPR_FIRST.course_id = SP_FIRST.course_id AND
                                      SPR_FIRST.sco_id = SP_FIRST.sco_id AND
                                      SPR_FIRST.lecture_count = SP_FIRST.lecture_count
LEFT JOIN SCO_PROGRESS_RECORD AS SPR_LAST ON USR.user_id = SPR_LAST.user_id AND
                                              CON.course_id = SPR_LAST.course_id AND
                                              CON.sco_id = SPR_LAST.sco_id AND
                                              SPR_LAST.type = 1
LEFT JOIN SCO_PROGRESS AS SP_LAST ON SPR_LAST.user_id = SP_LAST.user_id AND
                                      SPR_LAST.course_id = SP_LAST.course_id AND
                                      SPR_LAST.sco_id = SP_LAST.sco_id AND
                                      SPR_LAST.lecture_count = SP_LAST.lecture_count
LEFT JOIN COURSE_PROGRESS_RECORD AS CPRD ON CPRD.user_id = SPR.user_id AND
                                      CPRD.course_id = SPR.course_id
                                      " & cprd_type & "
LEFT JOIN COURSE_PROGRESS AS CPR ON CPR.user_id = SPR.user_id AND
                                      CPR.course_id = SPR.course_id
WHERE USR.user_id in (" & dao_escape(arguments.arg001) & ")
">
	<cfreturn tempSql>
</cffunction>

<!---------------------------------------------->
<cffunction name="table_sco_progress_001_for_co_sco" output="no" returntype="string">
	<cfargument name="arg001" required="true" type="string">
	<cfargument name="arg002" required="true" type="string">
	<cfargument name="arg003" required="true" type="string">
	<cfargument name="arg004" required="true" type="string">

	<cfset var sco_type = ''>
	<cfset var spr_type = ''>
	<cfset var cprd_type = ''>

	<cfif arguments.arg003 is 0>
		<cfset sco_type = ' AND SCO.sco_type = 1 '>
	</cfif>

	<cfif arguments.arg004 is not -1>
		<cfset spr_type = " AND SPR.type = " & dao_escape(arguments.arg004) & " ">
		<cfset cprd_type = " AND CPRD.type = " & dao_escape(arguments.arg004) & " ">
	</cfif>

	<cfset tempSql = "
SELECT ASG.user_id , CON.course_id , CON.sco_id , CON.order_no , CON.parent_sco_id ,
       USR.first_name , USR.last_name , USR.logon , CRS.course_name , SCO.sco_name , SCO.sco_type ,
       SCO.lecture_time_hour , SCO.lecture_time_min , SCO.max_score , SCO.mastery_score ,
       SCO.min_score , SCO.flag_trial , SCO.review_count , SCO.class_id ,
       ifnull(SP.status , 'not attempted') as status , ifnull(SP.lecture_count , 0) as lecture_count,
       ifnull(SP.entry , 'ab-initio') as entry , SP.location , ifnull(SP.score , 0) as score,
       SP_FIRST.start_date, SP.end_date ,
       ifnull(SP.total_time , '0000:00:00') as total_time , ifnull(SP.session_time , '0000:00:00') as session_time , SP.suspend , SP.score_date ,
       ifnull(SP_LAST.eLM_total_time, 0) AS eLM_total_time,
       ifnull(SP.eLM_session_time , 0) as eLM_session_time ,
       ifnull(SP_LAST.lecture_count, 0) AS m_lc,
       SPR.type , SP.flag_get_status , SP.flag_get_score,
       SCO.class_id, SCO.sco_kind, USR.first_name_furi , USR.last_name_furi , USR.mailaddress
	   ,CPRD.course_status, CPRD.c_progress, CPR.course_count, CPR.start_date as cpr_start_date, CPRD.end_date as cprd_end_date, ifnull(CPR.eLM_total_time, 0) as cpr_eLM_total_time
FROM ASSIGN AS ASG
INNER JOIN CONSTRUCT AS CON ON ASG.course_id = CON.course_id
INNER JOIN SCO_MASTER AS SCO ON CON.sco_id = SCO.sco_id " & sco_type & "
INNER JOIN USER_MASTER AS USR ON ASG.user_id = USR.user_id
INNER JOIN COURSE_MASTER AS CRS ON ASG.course_id = CRS.course_id
LEFT JOIN SCO_PROGRESS_RECORD AS SPR ON ASG.user_id = SPR.user_id AND
                                        ASG.course_id = SPR.course_id AND
                                        CON.sco_id = SPR.sco_id " & spr_type & "
LEFT JOIN  SCO_PROGRESS AS SP ON SPR.user_id = SP.user_id AND
                                 SPR.course_id = SP.course_id AND
                                 SPR.sco_id = SP.sco_id AND
                                 SPR.lecture_count = SP.lecture_count
LEFT JOIN SCO_PROGRESS_RECORD AS SPR_FIRST ON ASG.user_id = SPR_FIRST.user_id AND
                                              ASG.course_id = SPR_FIRST.course_id AND
                                              CON.sco_id = SPR_FIRST.sco_id AND
                                              SPR_FIRST.type = 3
LEFT JOIN SCO_PROGRESS AS SP_FIRST ON SPR_FIRST.user_id = SP_FIRST.user_id AND
                                      SPR_FIRST.course_id = SP_FIRST.course_id AND
                                      SPR_FIRST.sco_id = SP_FIRST.sco_id AND
                                      SPR_FIRST.lecture_count = SP_FIRST.lecture_count
LEFT JOIN SCO_PROGRESS_RECORD AS SPR_LAST ON ASG.user_id = SPR_LAST.user_id AND
                                              ASG.course_id = SPR_LAST.course_id AND
                                              CON.sco_id = SPR_LAST.sco_id AND
                                              SPR_LAST.type = 1
LEFT JOIN SCO_PROGRESS AS SP_LAST ON SPR_LAST.user_id = SP_LAST.user_id AND
                                      SPR_LAST.course_id = SP_LAST.course_id AND
                                      SPR_LAST.sco_id = SP_LAST.sco_id AND
                                      SPR_LAST.lecture_count = SP_LAST.lecture_count
LEFT JOIN COURSE_PROGRESS_RECORD AS CPRD ON CPRD.user_id = ASG.user_id AND
                                      CPRD.course_id = ASG.course_id
                                      " & cprd_type & "
LEFT JOIN COURSE_PROGRESS AS CPR ON CPR.user_id = ASG.user_id AND
                                      CPR.course_id = ASG.course_id
WHERE ASG.user_id in (" & dao_escape(arguments.arg001) & ") AND
      ASG.course_id in (" & dao_escape(arguments.arg002) & ")
">
	<cfreturn tempSql>
</cffunction>
<!--- 2020/01/17 ito c_csv_co_sco ADD end --->
</cfcomponent>
