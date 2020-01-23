<cfform format="HTML">
<cfprocessingdirective pageencoding="UTF-8">
<cfsetting enablecfoutputonly="NO"><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>ユーザマスタ</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<br>
<!--- ★★初期値セット★★ --->


<!--- ★★ 検索条件 ★★ --->
<table>
    <tr>
        <b>◆検索条件◆</b>
    </tr>
	<tr>
		<td>
            <!---<cfoutput>#Session.termObj.get_term('eLM_admin_user_list_search_free_word')#</cfoutput>--->
            名：
        </td>
		<td>
            <cfif isDefined("form.search_submit")>
                <cfinput name="user_name" type="text" size="30" value=#form.user_name#/>
            <cfelse>
                <cfinput name="user_name" type="text" size="30" value=""/>
            </cfif>
			<!---<input name="sw" type="text" style="width:200px; margin-left: 10px;" value="<cfoutput>#HTMLeditformat(sw)#</cfoutput>">--->
		</td>
	</tr>
</table><br>
<cfinput name="search_submit" value="再検索" type="submit"/>
<br>

<!--- ★★ユーザー検索★★ --->
<!--- selectオブジェクト作成 --->
<cfset Variables.TempSelectObj = dao_select("USER_MASTER")>

<!--- where指定 --->
<cfif isDefined("form.search_submit")>
    <cfif not form.user_name eq ''>
        <cfset Variables.TempSelectObj = dao_like(Variables.TempSelectObj, "first_name", "#form.user_name#")>
    </cfif>
</cfif>
<!---<cfdump var="#Variables.TempSelectObj#">--->

<!--- ★★ 新規登録時 ★★ --->
<cfif isDefined("form.new")>
    <cflocation url="edit.cfm">
</cfif>



<!--- result取得 --->
<cfset q_user = dao_result("#Application.dsn#", Variables.TempSelectObj)>
<br>
<br>

<!--- ★★ 検索結果 ★★ --->
<b>◆検索結果◆</b><br>
<cfoutput>取得結果 #q_user.recordcount# 件</cfoutput>
<table cellpadding="3" cellspacing="0" class="solid">
    <!--- カラム --->
	<tr align="center" bgcolor="#E4E4E4">
        <td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_user_list_function')#</cfoutput></td>
		<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_user_list_last_name')#</cfoutput></td>
		<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_user_list_first_name')#</cfoutput></td>
		<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_user_list_last_name_kana')#</cfoutput></td>
		<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_user_list_first_name_kana')#</cfoutput></td>
		<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_user_list_user_id')#</cfoutput></td>
		<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_user_list_mailaddress')#</cfoutput></td>
		<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_user_list_use_state')#</cfoutput></td>
	</tr>

    <!--- 結果 --->
	<cfoutput query="q_user">
		<tr <cfif flag_stop is 1>bgcolor="##BBBBBB"</cfif>>
            <td align="center" nowrap>[ <a href="edit.cfm?serial=#user_id#">#Session.termObj.get_term('eLM_admin_user_list_edit')#</a> ] </td>
			<td align="left" nowrap>#last_name#</td>
			<td align="left" nowrap>#first_name#</td>
			<td align="left" nowrap>#last_name_furi#</td>
			<td align="left" nowrap>#first_name_furi#</td>
			<td align="left" nowrap>#logon#</td>
			<td align="left" nowrap><a href="mailto:#mailaddress#">#mailaddress#</td>
			<td align="right" nowrap>
			<cfif flag_stop neq 1>
				#Session.termObj.get_term('eLM_admin_user_list_use_state_use')#
			<cfelse>
				#Session.termObj.get_term('eLM_admin_user_list_use_state_stop')#
			</cfif>	
			</td>
		</tr>
	</cfoutput>	
</table>

<br>
<cfinput name="new" value="新規登録" type="submit"/><br>
<b>※Inssert自体はできるが、必要事項を全て入力しているわけではないので整合性はとれていない。非推奨</b>
<!---
<cfoutput><strong>↓検索結果dump↓</strong></cfoutput>
<cfdump var = #q_user#>
--->

</body>
</html>

</cfform>