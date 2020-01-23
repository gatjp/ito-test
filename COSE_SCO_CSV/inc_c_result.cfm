<cfprocessingdirective pageencoding="UTF-8">

<cfinclude template="menu.cfm">
<cfset menu.setCode("course")>
<cfset cjsLabel=[]>
<cfset cjsData=[]>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function frm_submit(arg1){
	if(arg1 == 3){
		window.document.form1.mode.value = "c_csv_response_all";
	}else if(arg1 == 2){
		window.document.form1.mode.value = "c_csv_fa";
	}else if(arg1 == 1){
		window.document.form1.mode.value = "c_csv";
	}else if(arg1 == 4){
		window.document.form1.mode.value = "c_csv_sco_list";
	}else if(arg1 == 5){
		window.document.form1.mode.value = "c_csv_time";
	}else if(arg1 == 6){
		window.document.form1.mode.value = "c_csv_test_score";
	}else if(arg1 == 7){
		window.document.form1.mode.value = "BACK2CG";
	// <!--- 2020/01/17 ito c_csv_co_sco ADD start --->
	}else if(arg1 == 8){
		window.document.form1.mode.value = "c_csv_co_sco";
	// <!--- 2020/01/17 ito c_csv_co_sco ADD end --->
	}else{
		window.document.form1.mode.value = "BACK2S";
	}
	//alert(window.document.form1.mode.value);
	window.document.form1.submit();
}

function clear_result(arg_uid){
	if(confirm('<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_inc_c_result_true:ja=成績クリアすると復元できませんがよろしいですか？')#</cfoutput>')){
		location.href = '<cfoutput>index.cfm?mode=cr&uid=' + arg_uid + '&clear_result&#params2url(params)#</cfoutput>' + '&cr_count=' + <cfoutput>#variables.cr_count#</cfoutput>;
	}
}
//-->
</script>
</head>
<body>
<cfoutput>#strTopicPath#</cfoutput>
<br>
<cfset menu.showMenu()>

<cfif lsObj.get_value('course.score_by_group') eq 1 or lsObj.get_value('customer_name') eq 'sato'>
	<cfset cid_safe=dao_escape(cid)>
	<cfset group_id_safe=dao_escape(group_id)>
	<cfquery name="c_sum" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
		select *
		from SUMMARY_COURSE_PROGRESS_GROUP as scpg
		where scpg.group_id = '#PreserveSingleQuotes(group_id_safe)#' and scpg.course_id = '#PreserveSingleQuotes(cid_safe)#'
	</cfquery>
</cfif>

<table cellpadding="3" cellspacing="0" class="form">
	<tr>
		<th nowrap class="form"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_coursename:ja=コース名')#</cfoutput></th>
		<td nowrap class="form"><cfoutput>#str_course_name#</cfoutput>&nbsp;</td>
	</tr>
<cfif variables.sco_id neq -1>
	<tr>
		<th nowrap class="form"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_textname:ja=教材名')#</cfoutput></th>
		<td nowrap class="form"><cfoutput>#str_sco_name#</cfoutput>&nbsp;</td>
	</tr>
	<tr>
		<th nowrap class="form"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_textkind:ja=教材種別')#</cfoutput></th>
		<td nowrap class="form"><cfoutput>#str_sco_type#</cfoutput>&nbsp;</td>
	</tr>
</cfif>
	<cfif flag_score_by_group and group_id neq -1>
		<cfquery name="q_g" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			select group_name from GROUP_MASTER where group_id = '#PreserveSingleQuotes(group_id_safe)#'
		</cfquery>
		<tr>
			<th nowrap class="form"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_groupname:ja=グループ名')#</cfoutput></th>
		<td nowrap class="form"><cfoutput>#q_g.group_name#</cfoutput>&nbsp;</td>
		</tr>
		<tr>
			<th nowrap class="form"><cfoutput>#Session.termObj.get_term('eLM_admin_c_assign_course_count')#</cfoutput></th>
			<td nowrap class="form"><cfoutput>#output_count(c_sum.n_assign, assign_count_all, c_assign_num, admin_info, group_id)#</cfoutput></td>
		</tr>
		<tr>
			<th nowrap class="form"><cfoutput>#Session.termObj.get_term('eLM_admin_c_assign_attend_count:ja=受講人数(人)')#</cfoutput></th>
			<td nowrap class="form"><cfoutput>#c_sum.n_attend#</cfoutput></td>
		</tr>
		<tr>
			<th nowrap class="form"><cfoutput>#Session.termObj.get_term('eLM_admin_c_assign_attend_rate:ja=受講率(%)')#</cfoutput></th>
			<td nowrap class="form"><cfoutput>#c_sum.r_attend#</cfoutput></td>
		</tr>
		<tr>
			<th nowrap class="form"><cfoutput>#Session.termObj.get_term('eLM_admin_c_assign_completed_rate:ja=修了率(%)')#</cfoutput></th>
			<td nowrap class="form"><cfoutput>#c_sum.r_completed#</cfoutput></td>
		</tr>
		<tr>
			<th nowrap class="form"><cfoutput>#Session.termObj.get_term('eLM_admin_c_assign_progress_ave_rate:ja=平均進捗率(%)')#</cfoutput></th>
			<td nowrap class="form"><cfoutput>#c_sum.r_ave_progress#</cfoutput></td>
		</tr>
	<cfelse>
		<tr>
			<th nowrap class="form"><cfoutput>#Session.termObj.get_term('eLM_admin_c_assign_course_count')#</cfoutput></th>
			<td nowrap class="form">
				<cfoutput>#output_count(assign_count, assign_count_all, c_assign_num, admin_info)#</cfoutput>
			</td>
		</tr>
	</cfif>
</table>

<form name="frm_u_search" action="<cfoutput>#CGI.SCRIPT_NAME#?mode=cr&#params2url(params_for_search)#</cfoutput>" method="POST">
	<input type="hidden" name="gid" value="<cfoutput>#HTMLEditFormat(variables.group_id)#</cfoutput>">
<fieldset>
	<legend><strong><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_usersearch:ja=ユーザー検索')#</cfoutput></strong></legend>
	<table>
		<tr>
			<td><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_freeword')#</cfoutput></td>
			<td>
				<input name="u_search_word" id="u_search_word" type="text" style="width:200px; margin-left: 10px;" value="<cfoutput>#HTMLEditFormat(variables.u_search_word)#</cfoutput>">
			</td>
		</tr>
		<cfif (lsObj.get_value('course.score_by_group') eq 1 or lsObj.get_value('customer_name') eq 'sato') and group_id is not -1>
		<cfelse>
			<tr>
				<td><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_groupsearch')#</cfoutput></td>
				<td>
					<span style="width:200px; margin-left: 10px;">
						<select name="u_search_group" id="u_search_group">
							<option value="">---<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_choose1:ja=選択してください')#</cfoutput>---</option>
							<cfoutput>#variables.group_option_list#</cfoutput>
						</select>
					</span>
				</td>
			</tr>
		</cfif>
	</table>
<cfif customer_name eq "sonylife">
	<tr>
		<td><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_studentsearch:ja=履修対象者検索')#</cfoutput></td>
		<td>
			<span style="width:200px; margin-left: 10px;">
			<select name="u_search_val1" id="u_search_val1"><option value="">---<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_choose2:ja=選択してください')#</cfoutput>---</option>
			<cfoutput>
				<option value="1"<cfif variables.u_search_val1 eq "1"> selected</cfif>>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_friststudy:ja=一次履修者')#</option>
				<option value="2"<cfif variables.u_search_val1 eq "2"> selected</cfif>>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_secordstudy:ja=二次履修者')#</option>
				<option value="3"<cfif variables.u_search_val1 eq "3"> selected</cfif>>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_muststudy:ja=必須履修者')#</option>
				<option value="4"<cfif variables.u_search_val1 eq "4"> selected</cfif>>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_needstudy:ja=任意履修者')#</option>
			</cfoutput>
			</select>
			</span>
		</td>
	</tr>
</cfif>
	</table>
	<div style="margin-top: 10px; margin-bottom: 5px; margin-left: 20px;">
		<input type="submit" name="u_search_course" value="<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_search:ja=検索')#</cfoutput>">&nbsp;&nbsp;
		<input type="submit" name="u_search_course_clear" value="<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_searchdelete:ja=検索解除')#</cfoutput>">
	</div>
</fieldset>
</form>
<br>
[ <cfif variables.status eq "" or variables.status eq "all"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_showall1:ja=すべて表示')#</cfoutput><cfelse><a href="<cfoutput>#CGI.SCRIPT_NAME#?mode=cr&gid=#variables.group_id#&status=all&#params2url(params_for_status)#</cfoutput>"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_showall2:ja=すべて表示')#</cfoutput></a></cfif> ]&nbsp;
[ <cfif variables.status eq "not_attempted"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_shownotakecourse1:ja=未履修のみ表示')#</cfoutput><cfelse><a href="<cfoutput>#CGI.SCRIPT_NAME#?mode=cr&gid=#variables.group_id#&status=not_attempted&#params2url(params_for_status)#</cfoutput>"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_shownotakecourse2:ja=未履修のみ表示')#</cfoutput></a></cfif> ]&nbsp;
[ <cfif variables.status eq "incomplete"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_showtakingcourse1:ja=履修中のみ表示')#</cfoutput><cfelse><a href="<cfoutput>#CGI.SCRIPT_NAME#?mode=cr&gid=#variables.group_id#&status=incomplete&#params2url(params_for_status)#</cfoutput>"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_showtakingcourse2:ja=履修中のみ表示')#</cfoutput></a></cfif> ]&nbsp;
[ <cfif variables.status eq "completed"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_showtakedcourse1:ja=修了のみ表示')#</cfoutput><cfelse><a href="<cfoutput>#CGI.SCRIPT_NAME#?mode=cr&gid=#variables.group_id#&status=completed&#params2url(params_for_status)#</cfoutput>"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_showtakedcourse2:ja=修了のみ表示')#</cfoutput></a></cfif> ]&nbsp;
<br><br>

<cfif lsObj.get_value("record.graph")>
<form method="POST" action="index.cfm" style="float:left;">
	<input type="hidden" name="mode" value="cr">
	<input type="hidden" name="graph_c" value="none">
	<cfoutput>#hidden_str#</cfoutput>
	<input type="submit" name="course_graph" value="&nbsp;&nbsp;<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_u_result_list:ja=一覧表')#</cfoutput>&nbsp;&nbsp;">&nbsp;
</form>

<form method="POST" action="index.cfm" style="float:left;">
	<input type="hidden" name="mode" value="cr">
	<input type="hidden" name="graph_c" value="times">
	<cfoutput>#hidden_str#</cfoutput>
	<input type="submit" name="user_graph" value="&nbsp;<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_u_result_studytimesgraph:ja=学習回数グラフ')#</cfoutput>&nbsp;">&nbsp;
</form>

<form method="POST" action="index.cfm" style="float:left;">
	<input type="hidden" name="mode" value="cr">
	<input type="hidden" name="graph_c" value="progress">
	<cfoutput>#hidden_str#</cfoutput>
	<input type="submit" name="user_graph" value="&nbsp;<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_u_result_progressgraph:ja=進捗率グラフ')#</cfoutput>&nbsp;">&nbsp;&nbsp;
</form>

<cfif lsObj.get_value("record.total_time") is 1>
<form method="POST" action="index.cfm" style="float:left;">
	<input type="hidden" name="mode" value="cr">
	<input type="hidden" name="graph_c" value="time">
	<cfoutput>#hidden_str#</cfoutput>
	<input type="submit" name="user_graph" value="&nbsp;<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_u_result_timegraph:ja=累計時間グラフ')#</cfoutput>&nbsp;">&nbsp;&nbsp;
</form>
</cfif>
<br><br>
</cfif>
<br>

<cfoutput>#make_pager(ArrayLen(result_array) , variables.cr_count , params_add_mode , Session.termObj.get_term('eLM_common_nextpage:ja=次の%s件', page_size) , Session.termObj.get_term('eLM_common_backpage:ja=前の%s件', page_size), "cr_count")#</cfoutput>
<cfset startindex = variables.cr_count>
<cfset endindex = variables.cr_count + page_size - 1>
<cfif endindex gt ArrayLen(result_array)><cfset endindex = ArrayLen(result_array)></cfif>
<cfif not isDefined("Session.result_graph_c") or Session.result_graph_c is "none">
	<table cellpadding="3" cellspacing="0" class="solid">
		<tr align="center" bgcolor="<cfoutput>#bg_color#</cfoutput>">
			<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_operate:ja=操作')#</cfoutput></td>
			<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_listname:ja=姓')#</cfoutput></td>
			<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_listlastname:ja=名')#</cfoutput></td>
			<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_listname_kana:ja=姓（ふりがな）')#</cfoutput></td>
			<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_listlastname_kana:ja=名（ふりがな）')#</cfoutput></td>
			<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_listuserid:ja=ユーザID')#</cfoutput></td>
			<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_listmailaddress:ja=メールアドレス')#</cfoutput></td>
			<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_listpiont:ja=成績')#</cfoutput></td>
			<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_progress:ja=進捗率')#</cfoutput></td>
			<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_studytimes:ja=学習回数')#</cfoutput></td>
	<cfif lsObj.get_value("record.begin_time") is 1>
			<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_studybegintime:ja=学習開始日時')#</cfoutput></td>
	</cfif>
	<cfif lsObj.get_value("record.complete_time") is 1>
			<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_studyovertime:ja=学習修了日時')#</cfoutput></td>
	</cfif>
	<cfif lsObj.get_value("record.total_time") is 1>
			<td align="left" nowrap class="bg_t_header"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_studytotaltime:ja=累積時間')#</cfoutput></td>
	</cfif>
		</tr>
	
	<cfoutput>
	<cfloop index="LoopIndex" from="#startindex#" to="#endindex#">
		<tr>
			<td align="left" nowrap>[ <a href="<cfoutput>#CGI.SCRIPT_NAME#?mode=cr2&from=cr&cr_count=#variables.cr_count#&uid=#result_array[LoopIndex][13]#&#params2url(params)#</cfoutput>"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_listdetail:ja=詳細')#</cfoutput></a> ]&nbsp;<cfif menu_auth.admin_report.auth_delete eq 0>[ <a href="javascript:clear_result(#result_array[LoopIndex][13]#);"><cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_listpiontclear1:ja=成績クリア')#</cfoutput></a> ]<cfelse><span class="text12_gray">[ <cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_listpiontclear2:ja=成績クリア')#</cfoutput> ]</span></cfif></td>
			<td align="left" nowrap>#result_array[LoopIndex][14]#&nbsp;</td>
			<td align="left" nowrap>#result_array[LoopIndex][15]#&nbsp;</td>
			<td align="left" nowrap>#result_array[LoopIndex][16]#&nbsp;</td>
			<td align="left" nowrap>#result_array[LoopIndex][17]#&nbsp;</td>
			<td align="left" nowrap>#result_array[LoopIndex][1]#&nbsp;</td>
			<td align="left" nowrap>#result_array[LoopIndex][18]#&nbsp;</td>
			<td align="left" nowrap>#result_array[LoopIndex][5]#&nbsp;</td>
			<td align="right" nowrap>#result_array[LoopIndex][7]#&nbsp;</td>
			<td align="right" nowrap>#result_array[LoopIndex][6]#&nbsp;</td>
	<cfif lsObj.get_value("record.begin_time") is 1>
			<td align="center" nowrap>#result_array[LoopIndex][8]#&nbsp;</td>
	</cfif>
	<cfif lsObj.get_value("record.complete_time") is 1>
			<td align="center" nowrap>#result_array[LoopIndex][10]#&nbsp;</td>
	</cfif>
	<cfif lsObj.get_value("record.total_time") is 1>
			<td align="center" nowrap>#result_array[LoopIndex][11]#&nbsp;</td>
	</cfif>
	
		</tr>
	</cfloop>
	</cfoutput>
	
	</table>
<cfelseif Session.result_graph_c is "times">
	<cfif endindex eq 0>
		<cfoutput><p>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_no_data_for_graph:ja=データが1件もありません。')#<p></cfoutput>
	<cfelse>
		<cfoutput>
			<cfloop index="LoopIndex" from="#startindex#" to="#endindex#">
				<cfset label = "#result_array[LoopIndex][14]&result_array[LoopIndex][15]#">
				<cfset label_s = "#ExLeft(label, lsObj.get_value("bargraph.label_length"))#">
				<cfif label neq label_s>
					<cfset label_s = "#ExLeft(label, lsObj.get_value("bargraph.label_length") - 1)#...">
				</cfif>
        <cfset ArrayAppend(cjsLabel, label_s)>
        <cfset ArrayAppend(cjsData, result_array[LoopIndex][6])>
			</cfloop>
		</cfoutput>
    <!--- Chart.js 表示 --->
    <cfset graphTitle = Session.termObj.get_term('eLM_admin_course_report3_inc_u_result_studytimesgraph')>
    <cfset graphUnit = '回'>
    <cfinclude template="inc_chartjs_option.cfm">
	</cfif>
<cfelseif Session.result_graph_c is "progress">
	<cfif endindex eq 0>
		<cfoutput><p>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_no_data_for_graph:ja=データが1件もありません。')#<p></cfoutput>
	<cfelse>
		<cfoutput>
			<cfloop index="LoopIndex" from="#startindex#" to="#endindex#">
				<cfset label = "#result_array[LoopIndex][14]&result_array[LoopIndex][15]#">
				<cfset label_s = "#ExLeft(label, lsObj.get_value("bargraph.label_length"))#">
				<cfif label neq label_s>
					<cfset label_s = "#ExLeft(label, lsObj.get_value("bargraph.label_length") - 1)#...">
				</cfif>
        <cfset ArrayAppend(cjsLabel, label_s)>
        <cfset ArrayAppend(cjsData, replace(result_array[LoopIndex][7],"%",""))>
			</cfloop>
		</cfoutput>
    <!--- Chart.js 表示 --->
    <cfset graphTitle = Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_studyovertime')>
    <cfset graphUnit = '%'>
    <cfinclude template="inc_chartjs_option.cfm">
	</cfif>
<cfelseif Session.result_graph_c is "time">
	<cfif endindex eq 0>
		<cfoutput><p>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_no_data_for_graph:ja=データが1件もありません。')#<p></cfoutput>
	<cfelse>
		<cfoutput>
			<cfloop index="LoopIndex" from="#startindex#" to="#endindex#">
			<cfset minutes = ListGetAt(result_array[LoopIndex][11],1,":")*60+ListGetAt(result_array[LoopIndex][11],2,":")+ListGetAt(result_array[LoopIndex][11],3,":")/60>
				<cfset label = "#result_array[LoopIndex][14]&result_array[LoopIndex][15]#">
				<cfset label_s = "#ExLeft(label, lsObj.get_value("bargraph.label_length"))#">
				<cfif label neq label_s>
					<cfset label_s = "#ExLeft(label, lsObj.get_value("bargraph.label_length") - 1)#...">
				</cfif>
        <cfset ArrayAppend(cjsLabel, label_s)>
        <cfset ArrayAppend(cjsData, Round(minutes*100)/100)>
			</cfloop>
		</cfoutput>
    <!--- Chart.js 表示 --->
    <cfset graphTitle = Session.termObj.get_term('eLM_admin_course_report3_inc_u_result_timegraph')>
    <cfset graphUnit = '分'>
    <cfinclude template="inc_chartjs_option.cfm">
	</cfif>
</cfif>

<br>
<form name="form1" method="POST" action="index.cfm?header=no_header">
	<input type="hidden" name="mode" id="mode" value="c_csv">
	<cfoutput>#hidden_str#</cfoutput>
	<cfif lsObj.get_value('course.score_by_group') eq 1 or lsObj.get_value('customer_name') eq 'sato'>
		<input type="button" name="BACK2CG" value="&nbsp;<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_goback:ja=戻　る')#</cfoutput>&nbsp;" onclick="frm_submit(7)">&nbsp;&nbsp;
	<cfelse>
		<input type="button" name="BACK2S" value="&nbsp;<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_goback:ja=戻　る')#</cfoutput>&nbsp;" onclick="frm_submit(0)">&nbsp;&nbsp;
	</cfif>
<cfif rec_csv_download EQ 1>
	<input type="button" name="submit1" id="submit1" value="<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_csvdownload:ja=CSVダウンロード')#</cfoutput>" onclick="frm_submit(1)">&nbsp;&nbsp;
<cfif customer_name neq 'ssp' or admin_info.user_type_id is 1>
	<input type="button" name="submit4" id="submit4" value="<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_csvpiont:ja=CSV（教材成績）')#</cfoutput>" onclick="frm_submit(4)">&nbsp;&nbsp;
	<input type="button" name="submit3" id="submit3" value="<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_csvtest:ja=CSV（テスト教材解答）')#</cfoutput>" onclick="frm_submit(3)">&nbsp;&nbsp;
	<input type="button" name="submit5" id="submit5" value="<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_csvtime:ja=CSV（受講時間分析）')#</cfoutput>" onClick="frm_submit(5)">&nbsp;&nbsp;
	<input type="button" name="submit6" id="submit6" value="<cfoutput>#Session.termObj.get_term('eLM_admin_course_report3_inc_c_result_csvtestscorefrequency:ja=CSV（テスト教材点数分布）')#</cfoutput>" onClick="frm_submit(6)">&nbsp;&nbsp;
	<!--- 2020/01/17 ito c_csv_co_sco ADD start --->
	<input type="button" name="submit8" id="submit8" value="CSV（コース全体）" onclick="frm_submit(8)">&nbsp;&nbsp;
	<!--- 2020/01/17 ito c_csv_co_sco ADD end --->
</cfif>
</cfif>
</form>
<br>
</body>
</html>
