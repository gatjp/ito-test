<cfform format="HTML">
<cfprocessingdirective pageencoding="UTF-8">
<cfsetting enablecfoutputonly="NO"><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>ユーザ更新</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<br>
<b>ユーザ更新</b>
<br>
<!--- ★★初期値セット★★ --->
<cfparam name="serial" default="">
<cfset variables.serial = serial>
<cfset flag_stop_on = "1"> <!--- 利用停止のDB値 --->
<cfset flag_stop_off = "0"> <!--- 利用中のDB値 --->
<cfobject component="#SERVICE_ADDRESS#.form" name="formMaker">

<!--- ★★ユーザ情報再取得★★ --->
<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>
<cfset Variables.TempSelectObj = dao_eq(Variables.TempSelectObj, "user_id", "#variables.serial#")>
<cfset data_select = dao_result(application.DSN, Variables.TempSelectObj)>

<table cellpadding="5" cellspacing="0" class="form">
	<!--- 必須コメント --->
	<tr>
		<th class="form"><span class="text10_red">*</span>　<cfoutput>#Session.termObj.get_term('eLM_admin_user_edit_necessary')#</cfoutput></th>
		<td class="form">&nbsp;</td>
	</tr>
	<!--- ログオンID --->
	<tr>
		<th class="form"><span class="text10_red">*</span>　<cfoutput>#Session.termObj.get_term('eLM_admin_admin_edit_user_id')#</cfoutput></th>
		<td class="form"><cfinput name="logon_tx" type="text" size="30" value=#data_select.logon#/></td>
	</tr>
	<!---<cfoutput>#formMaker.getForm()#</cfoutput>--->
	<!--- 姓 --->
	<tr>
		<th class="form"><span class="text10_red">*</span>　<cfoutput>#Session.termObj.get_term('eLM_admin_user_list_last_name')#</cfoutput></th>
		<td class="form"><cfinput name="last_name_tx" type="text" size="30" value=#data_select.last_name#/></td>
	</tr>
	<!--- 名 --->
	<tr>
		<th class="form"><span class="text10_red">*</span>　<cfoutput>#Session.termObj.get_term('eLM_admin_user_list_first_name')#</cfoutput></th>
		<td class="form"><cfinput name="first_name_tx" type="text" size="30" value=#data_select.first_name#/></td>
	</tr>
	<!--- 姓（ふりがな） --->
	<tr>
		<th class="form"><span class="text10_red">*</span>　<cfoutput>#Session.termObj.get_term('eLM_admin_user_list_last_name_kana')#</cfoutput></th>
		<td class="form"><cfinput name="last_name_furi_tx" type="text" size="30" value=#data_select.last_name_furi#/></td>
	</tr>
	<!--- 名（ふりがな） --->
	<tr>
		<th class="form"><span class="text10_red">*</span>　<cfoutput>#Session.termObj.get_term('eLM_admin_user_list_first_name_kana')#</cfoutput></th>
		<td class="form"><cfinput name="first_name_furi_tx" type="text" size="30" value=#data_select.first_name_furi#/></td>
	</tr>
	<!--- メールアドレス --->
	<tr>
		<th class="form"><cfoutput>#Session.termObj.get_term('eLM_admin_user_list_mailaddress')#</cfoutput></th>
		<td class="form"><cfinput name="mailaddress_tx" type="text" size="30" value=#data_select.mailaddress#/></td>
	</tr>
	<!--- 利用状況 --->
	<tr>
		<th class="form"><span class="text10_red">*</span>　<cfoutput>#Session.termObj.get_term('eLM_admin_user_edit_use_state:ja=利用状況')#</cfoutput></th>
		<td class="form">
			<input type="radio" name="flag_stop" id="flag_stop" value="0"<cfif data_select.flag_stop neq 1> checked</cfif>><cfoutput>#Session.termObj.get_term('eLM_admin_user_edit_use_state_use:ja=利用中')#</cfoutput>　
			<input type="radio" name="flag_stop" id="flag_stop" value="1"<cfif data_select.flag_stop eq 1> checked</cfif>><cfoutput>#Session.termObj.get_term('eLM_admin_user_edit_use_state_stop:ja=利用停止')#</cfoutput>　
		</td>
	</tr>
</table>
<br>
<cfinput name="write_submit" value="登録" type="submit"/>  <cfinput name="back_submit" value="戻る" type="submit"/>

<!--- ★★戻るボタン押下★★ --->
<cfif isDefined("form.back_submit")>
	<cflocation url="top.cfm">
</cfif>

<!--- ★★更新ボタン押下★★ --->
<cfif isDefined("form.write_submit")>
	<!--- 画面情報を保持 --->
	<cfset temp_struct = StructNew()>
	<cfset temp_struct.logon = "#form.logon_tx#">
	<cfset temp_struct.last_name = "#form.last_name_tx#">
	<cfset temp_struct.first_name = "#form.first_name_tx#">
	<cfset temp_struct.last_name_furi = "#form.last_name_furi_tx#">
	<cfset temp_struct.first_name_furi = "#form.first_name_furi_tx#">
	<cfset temp_struct.mailaddress = "#form.mailaddress_tx#">
	<cfif form.flag_stop eq 0>
		<cfset temp_struct.flag_stop = flag_stop_off>
	<cfelseif form.flag_stop eq 1>
		<cfset temp_struct.flag_stop = flag_stop_on>
	</cfif>
	
	<!--- 登録処理 --->
	<cfif #variables.serial# eq ''>
		<!--- 新規登録 --->
		<cfinvoke
			component="#SERVICE_ADDRESS#.u_regist"
			method="New_registration"
			returnVariable="new_user_id"
		>
		<cfset temp_struct.user_id = new_user_id>
		<cfset dao_put("USER_MASTER",temp_struct,"user_id")>
	<cfelse>
		<!--- 前画面から引き継いだシリアル情報が存在すれば更新 --->
		<cfset dao_update_ex("#application.DSN#", "USER_MASTER", "#variables.serial#", temp_struct, "user_id")>
	</cfif>
	
	<!--- 更新後トップ画面へ戻る --->
	<cflocation url="top.cfm">
</cfif>

</body>
</html>

</cfform>