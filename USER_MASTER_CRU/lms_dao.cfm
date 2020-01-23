<cfprocessingdirective pageencoding="UTF-8">
<!---

##################
### データ構造 ###
##################

rowオブジェクト：
　フィールド名をキーとした連想配列。
　１レコードを表す。

selectオブジェクト：
　以下の形式の連想配列。
　'tbl_name' => テーブル名
　'orderby' => dao_orderbyで設定したソート条件
　'limit' => dao_limitで設定したリミット
　'where_eq' => dao_eqで設定した条件のリスト
　'where_ne' => dao_neで設定した条件のリスト
　'where_like' => dao_likeで設定した条件のリスト

############################
### INSERT,UPDATE,DELETE ###
############################

--- エスケープする ---

--->

<cffunction name="dao_escape" output="No">
	<cfargument name="str" type="string">
	<cfif Application.SqlStringComponent eq "eLM_sqlstrings_mysql">
		<cfreturn Replace(Replace(str,"\","\\","ALL"),"'","''","ALL")>
	<cfelse>
		<cfreturn Replace(str, "'", "''", "ALL")>
	</cfif>
</cffunction>

<cffunction name="dao_date_add" output="No">
	<cfargument name="arg1" type="string">
	<cfargument name="arg2" type="string">
	<cfif Application.SqlStringComponent eq "eLM_sqlstrings_mysql">
		<cfreturn " date_add(#arg1#,INTERVAL #arg2# DAY) ">
	<cfelse>
		<cfreturn " dateadd(d,#arg2#,#arg1#) ">
	</cfif>
</cffunction>

<cffunction name="dao_date_format" output="No">
	<cfargument name="date_str">
	<cfargument name="format">
	<cfargument name="is_need_eval" default="false">
	<cfset var sql	= "">
	<cfif Application.SqlStringComponent eq "eLM_sqlstrings_mysql">
		<cfif is_need_eval>
			<cfset sql	= "date_format(" & date_str & ",'" & dao_date_format_str(format) & "')">
		<cfelse>
			<cfset sql	= "date_format('" & date_str & "','" & dao_date_format_str(format) & "')">
		</cfif>
	<cfelse>
		<cfif is_need_eval>
			<cfset sql	= "Format(" & datestr & ",'" & dao_date_format_str(format) & "')">
		<cfelse>
			<cfset sql	= "Format('" & datestr & "','" & dao_date_format_str(format) & "')">
		</cfif>
	</cfif>
	<cfreturn sql>
</cffunction>

<cffunction name="dao_date_format_str" output="No">
	<cfargument name="format">
	<cfset var format_str	= "">
	<cfif Application.SqlStringComponent eq "eLM_sqlstrings_mysql">
		<cfset format_str	= format>
	<cfelse>
		<cfif format eq "%Y-%m-%d">
			<cfset format_str	= "yyyy-mm-dd">
		</cfif>
	</cfif>
	<cfreturn format_str>
</cffunction>

<cffunction name="dao_now" output="No">
	<cfif Application.SqlStringComponent eq "eLM_sqlstrings_mysql">
		<cfreturn "now()">
	<cfelse>
		<cfreturn "getdate()">
	</cfif>
</cffunction>

<cffunction name="dao_ifnull" output="No">
	<cfif Application.SqlStringComponent eq "eLM_sqlstrings_mysql">
		<cfreturn "ifnull">
	<cfelse>
		<cfreturn "isnull">
	</cfif>
</cffunction>

<cffunction name="dao_n" output="No">
	<cfif Application.SqlStringComponent eq "eLM_sqlstrings_mssql">
		<cfreturn "N">
	<cfelse>
		<cfreturn "">
	</cfif>
</cffunction>

<!---

--- シリアル番号を返す ---
関数名；dao_get_serial
引数０：DSN
引数１：テーブル名
返り値：使用可能なシリアル番号

--->

<cffunction name="dao_get_serial" output="No">
	<cfargument name="dsn" type="string" required="Yes">
	<cfargument name="table_name" type="string" required="Yes">

	<cftry>

		<cftransaction action="begin">
		
		<cfquery datasource="#dsn#" username="#application.DUN#" password="#application.DUP#">
		update SERIAL_MASTER set next_id = next_id + 1 where table_name = '#PreserveSingleQuotes(table_name)#'
		</cfquery>

		<cfquery name="q_getSerial" datasource="#dsn#" username="#application.DUN#" password="#application.DUP#">
		select next_id from SERIAL_MASTER where table_name = '#PreserveSingleQuotes(table_name)#'
		</cfquery>

		<cftransaction action="commit" />
		<cfreturn q_getSerial.next_id>

		<cfcatch type="any">
			<cftransaction action="rollback" />
			<cfreturn false>
		</cfcatch>

	</cftry>

</cffunction>

<!---

--- シリアル番号を返す(トランザクションなし) ---
トランザクションの内部でコールする場合はこちら
関数名；dao_get_serial_no_tran
引数０：DSN
引数１：テーブル名
返り値：使用可能なシリアル番号

--->

<cffunction name="dao_get_serial_no_tran" output="No">
	<cfargument name="dsn" type="string" required="Yes">
	<cfargument name="table_name" type="string" required="Yes">

	<cftry>
		
		<cfquery datasource="#dsn#" username="#application.DUN#" password="#application.DUP#">
		update SERIAL_MASTER set next_id = next_id + 1 where table_name = '#PreserveSingleQuotes(table_name)#'
		</cfquery>

		<cfquery name="q_getSerial" datasource="#dsn#" username="#application.DUN#" password="#application.DUP#">
		select next_id from SERIAL_MASTER where table_name = '#PreserveSingleQuotes(table_name)#'
		</cfquery>

		<cfreturn q_getSerial.next_id>

		<cfcatch type="any">
			<cfreturn false>
		</cfcatch>

	</cftry>

</cffunction>

<!---
--- 新規レコードをひとつ挿入（INSERT）する ---
関数名：dao_put
引数０：DSN
引数１：テーブル名
引数２：rowオブジェクト
--->
<cffunction Name="dao_put" output="Yes">
	<cfargument name="tbl_name" type="string" required="Yes">
	<cfargument name="row" required="Yes">
	<cfargument name="keyList">
	<cfset var conditionString="">
	<cfset var setString="">
	<cfset var keyString="">

	<cfif isDefined("keyList")>
		<cfset setArray = ArrayNew(1)>
		<cfloop collection="#row#" item="field">
			<cfif ListFindNoCase(KeyList,field) is 0>
				<cfset ArrayAppend(setArray, field & "=" & dao_n() & "'" & dao_escape(row[field]) & "'")>
			</cfif>
		</cfloop>
		<cfset setString = ArrayToList(setArray,',')>
		
		<cfset conditionArray = ArrayNew(1)>
		<cfloop list="#keyList#" index="field">
			<cfif ListFindNoCase(KeyList,field) is not 0>
				<cfset ArrayAppend(conditionArray, field & "=" & dao_n() & "'" & dao_escape(row[field]) & "'")>
			</cfif>
		</cfloop>
		<cfset conditionString = ArrayToList(conditionArray,' and ')>	
		<cfquery name="select" username="#application.DUN#" password="#application.DUP#" datasource="#Application.dsn#">
			select * from #PreserveSingleQuotes(tbl_name)# where #PreserveSingleQuotes(conditionString)#
		</cfquery>
		<cfif select.recordCount gt 0>
			<cfquery name="update" username="#application.DUN#" password="#application.DUP#" datasource="#Application.dsn#">
				update #PreserveSingleQuotes(tbl_name)# set #PreserveSingleQuotes(setString)# where #PreserveSingleQuotes(conditionString)#
			</cfquery>
		<cfelse>
			<cfset keys = ArrayNew(1)>
			<cfset vals = ArrayNew(1)>
			<cfloop collection="#row#" item="item">
				<cfset dummy = ArrayAppend(keys,item)>
				<cfset dummy = ArrayAppend(vals, dao_n() & "'" & dao_escape(row[item]) & "'")>
			</cfloop>
			<cfset keyString = ArrayToList(keys,',')>
			<cfset valString = ArrayToList(vals,',')>		
			<cfquery name="insert" username="#application.DUN#" password="#application.DUP#" datasource="#Application.dsn#">
				insert into #PreserveSingleQuotes(tbl_name)# (#PreserveSingleQuotes(keyString)#) values (#PreserveSingleQuotes(valString)#)
			</cfquery>
		</cfif>
	<cfelse>
		<cfset keys = ArrayNew(1)>
		<cfset vals = ArrayNew(1)>
		<cfloop collection="#row#" item="item">
			<cfset dummy = ArrayAppend(keys,item)>
			<cfset dummy = ArrayAppend(vals, dao_n() & "'" & dao_escape(row[item]) & "'")>
		</cfloop>
		<cfset keyString = ArrayToList(keys,',')>
		<cfset valString = ArrayToList(vals,',')>
		<cfquery name="insert" username="#application.DUN#" password="#application.DUP#" datasource="#Application.dsn#">
			insert into #PreserveSingleQuotes(tbl_name)# (#PreserveSingleQuotes(keyString)#) values (#PreserveSingleQuotes(valString)#)
		</cfquery>
		
	</cfif>
</cffunction>

<!--- 新規レコードをひとつ挿入（INSERT）する ---
関数名：dao_insert
引数０：DSN
引数１：テーブル名
引数２：rowオブジェクト
返り値：プライマリーキーの値
--->

<cffunction Name="dao_insert" output="No">
	<cfargument name="dsn" type="string" required="Yes">
	<cfargument name="tbl_name" type="string" required="Yes">
	<cfargument name="row" required="Yes">
	<cfreturn dao_insert_ex(dsn,tbl_name,row,"serial")>
</cffunction>

<!---

--- 新規レコードをひとつ挿入（INSERT）する (トランザクションなし) ---
トランザクションの内部でコールする場合はこちら
関数名：dao_insert_no_tran
引数０：DSN
引数１：テーブル名
引数２：rowオブジェクト
返り値：プライマリーキーの値

--->

<cffunction Name="dao_insert_no_tran" output="No">
	<cfargument name="dsn" type="string" required="Yes">
	<cfargument name="tbl_name" type="string" required="Yes">
	<cfargument name="row" required="Yes">
	<cfreturn dao_insert_ex_no_tran(dsn,tbl_name,row,"serial")>
</cffunction>


<!---
--- 新規レコードをひとつ挿入（INSERT）する ※キー名称変更可能版 ---
関数名：dao_insert_ex
引数０：DSN
引数１：テーブル名
引数２：rowオブジェクト
引数３：プライマリーキーの名称
返り値：プライマリーキーの値

--->

<cffunction Name="dao_insert_ex" output="No">
	<cfargument name="dsn" type="string" required="Yes">
	<cfargument name="tbl_name" type="string" required="Yes">
	<cfargument name="row" required="Yes">
	<cfargument name="id_name" type="string" required="Yes">
	<cfset var keys_str="">
	<cfset var vals_str="">
<!---
	<cftransaction>
--->

		<cfset keys = ArrayNew(1)>
		<cfset vals = ArrayNew(1)>
		
		<cfloop collection=#row# item="it">

			<!--- フィールド名をセットする --->
			<cfset dummy = ArrayAppend(keys,dao_escape(it))>

			<!--- 値をセットする（IsArrayの場合はNULLと扱う） --->
 			<cfif IsArray(StructFind(row, it)) >
				<cfset dummy = ArrayAppend(vals,"NULL")>
			<cfelse>
				<cfset dummy = ArrayAppend(vals,"" & dao_n() & "'" & dao_escape(StructFind(row, it)) & "'")>
			</cfif>

		</cfloop>

		<cfset keys_str = ArrayToList(keys,',')>
		<cfset vals_str = ArrayToList(vals,',')>

		<cfquery name="insert" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
			insert into #PreserveSingleQuotes(tbl_name)# (#PreserveSingleQuotes(keys_str)#) values (#PreserveSingleQuotes(vals_str)#)
		</cfquery>
		<cfquery name="insert_id" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
			select max(#PreserveSingleQuotes(id_name)#) as max_id from #PreserveSingleQuotes(tbl_name)#
		</cfquery>
		<cfif insert_id.max_id is "">
			<cfset insert_id.max_id = 0>
		</cfif>

	<!---</cftransaction>--->
	<cfreturn insert_id.max_id>

</cffunction>

<!---

--- 新規レコードをひとつ挿入（INSERT）する ※キー名称変更可能版、トランザクションなし ---
関数名：dao_insert_ex_no_tran
引数０：DSN
引数１：テーブル名
引数２：rowオブジェクト
引数３：プライマリーキーの名称
返り値：プライマリーキーの値

--->

<cffunction Name="dao_insert_ex_no_tran" output="Yes">
	<cfargument name="dsn" type="string" required="Yes">
	<cfargument name="tbl_name" type="string" required="Yes">
	<cfargument name="row" required="Yes">
	<cfargument name="id_name" type="string" required="Yes">
	<cfset var keys_str="">
	<cfset var vals_str="">

	<cfset keys = ArrayNew(1)>
	<cfset vals = ArrayNew(1)>
	<cfloop collection=#row# item="it">

		<!--- フィールド名をセットする --->
		<cfset dummy = ArrayAppend(keys,dao_escape(it))>

		<!--- 値をセットする（IsArrayの場合はNULLと扱う） --->
		<cfif IsArray(StructFind(row, it)) >
			<cfset dummy = ArrayAppend(vals,"NULL")>
		<cfelse>
			<cfset dummy = ArrayAppend(vals,"" & dao_n() & "'" & dao_escape(StructFind(row, it)) & "'")>
		</cfif>

	</cfloop>

	<cfset keys_str = ArrayToList(keys,',')>
	<cfset vals_str = ArrayToList(vals,',')>
	<cfquery name="insert" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
		insert into #PreserveSingleQuotes(tbl_name)# (#PreserveSingleQuotes(keys_str)#) values (#PreserveSingleQuotes(vals_str)#)
	</cfquery>
	<cfquery name="insert_id" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
		select max(#PreserveSingleQuotes(id_name)#) as max_id from #PreserveSingleQuotes(tbl_name)#
	</cfquery>
	<cfif insert_id.max_id is "">
		<cfset insert_id.max_id = 0>
	</cfif>

	<cfreturn insert_id.max_id>

</cffunction>


<cffunction Name="dao_multiple_insert" output="Yes">
	<cfargument name="table_name"	required="true"	type="string">
	<cfargument name="data"			required="true"	type="array">
	<cfset var key_list	= "">
	<cfset var temp_sql	= ArrayNew(1)>
	<cfset var sqls		= ArrayNew(1)>
	<cfset var sql_list	= "">
	<cfset var lsObj	= createObject("component", Application.SERVICE_ADDRESS & ".table_lms_setting")>

	<cfif ArrayLen(data) NEQ 0>
		<cfset key_list		= StructKeyList(data[1])>
		<cfset divided_data	= divide_array_by_multiple_count(data)>
		<cfsetting requestTimeOut="#lsObj.get_value("db.multiple_time")#">
		<cfloop index="i" from="1" to="#ArrayLen(divided_data)#">
			<cfset sqls	= ArrayNew(1)>
			<cfloop index="j" from="1" to="#ArrayLen(divided_data[i])#">
				<cfset temp_sql	= ArrayNew(1)>
				<cfloop index="item" list="#key_list#">
					<cfset ArrayAppend(temp_sql, dao_n() & "'" & dao_escape(divided_data[i][j][item])  & "'")>
				</cfloop>
				<cfset ArrayAppend(sqls, "(" & ArrayToList(temp_sql) & ")")>
			</cfloop>
			<cfset sql_list	= ArrayToList(sqls)>
			<cfquery name="insert" username="#application.DUN#" password="#application.DUP#" datasource="#Application.dsn#">
				INSERT INTO #table_name#
				(#PreserveSingleQuotes(key_list)#)
				VALUES
				#PreserveSingleQuotes(sql_list)#
			</cfquery>
		</cfloop>
	</cfif>
</cffunction>


<!---

--- レコードをひとつ更新（UPDATE）する ---
関数名：dao_update
引数０：DSN
引数１：テーブル名
引数２：プライマリーキーの値
引数３：rowオブジェクト
返り値：なし

--->

<cffunction Name="dao_update" output="No">
	<cfargument name="dsn" type="string" required="Yes">
	<cfargument name="tbl_name" type="string" required="Yes">
	<cfargument name="id" type="string" required="Yes">
	<cfargument name="row" required="Yes">
	<cfreturn dao_update_ex(dsn,tbl_name,id,row,"serial")>
</cffunction>

<!---

--- レコードをひとつ更新（UPDATE）する (トランザクションなし) ---
トランザクションの内部でコールする場合はこちら
関数名：dao_update_no_tran
引数０：DSN
引数１：テーブル名
引数２：プライマリーキーの値
引数３：rowオブジェクト
返り値：なし

--->

<cffunction Name="dao_update_no_tran" output="No">
	<cfargument name="dsn" type="string" required="Yes">
	<cfargument name="tbl_name" type="string" required="Yes">
	<cfargument name="id" type="string" required="Yes">
	<cfargument name="row" required="Yes">
	<cfreturn dao_update_ex_no_tran(dsn,tbl_name,id,row,"serial")>
</cffunction>

<!---
--- レコードをひとつ更新（UPDATE）する ※キー名称変更可能版 ---
関数名：dao_update_ex
引数０：DSN
引数１：テーブル名
引数２：プライマリーキーの値
引数３：rowオブジェクト
引数４：プライマリーキーの名称
返り値：なし
--->
<cffunction Name="dao_update_ex" output="No">
	<cfargument name="dsn" type="string" required="Yes">
	<cfargument name="tbl_name" type="string" required="Yes">
	<cfargument name="id" type="string" required="Yes">
	<cfargument name="row" required="Yes">
	<cfargument name="id_name" type="string" required="Yes">
	<cfset var sets_str="">
	<cfset var id_safe=dao_escape(id)>

	<!---<cftransaction>--->
		<cfset sets = ArrayNew(1)>
		
		<cfloop collection=#row# item="it">
			<!--- 値をセットする（IsArrayの場合はNULLと扱う） --->
 			<cfif IsArray(StructFind(row, it)) >
				<cfset dummy = ArrayAppend(sets,it & "= NULL")>
			<cfelse>
				<cfset dummy = ArrayAppend(sets,it & "=" & dao_n() & "'" & dao_escape(StructFind(row, it)) & "'")>
			</cfif>
		</cfloop>

		<cfset sets_str = ArrayToList(sets,',')>

		<cfquery name="update" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
			update #PreserveSingleQuotes(tbl_name)# set #PreserveSingleQuotes(sets_str)# where #PreserveSingleQuotes(id_name)# = '#PreserveSingleQuotes(id_safe)#'
		</cfquery>

	<!---</cftransaction>--->
	<cfreturn true>
</cffunction>

<!---
--- レコードをひとつ更新（UPDATE）する ※キー名称変更可能版 (トランザクションなし) ---
トランザクションの内部でコールする場合はこちら
関数名：dao_update_ex_no_tran
引数０：DSN
引数１：テーブル名
引数２：プライマリーキーの値
引数３：rowオブジェクト
引数４：プライマリーキーの名称
返り値：なし
--->
<cffunction Name="dao_update_ex_no_tran" output="No">
	<cfargument name="dsn" type="string" required="Yes">
	<cfargument name="tbl_name" type="string" required="Yes">
	<cfargument name="id" type="string" required="Yes">
	<cfargument name="row" required="Yes">
	<cfargument name="id_name" type="string" required="Yes">
	<cfset var sets_str="">
	<cfset var id_safe=dao_escape(id)>

	<cfset sets = ArrayNew(1)>
	<cfloop collection=#row# item="it">
		<!--- 値をセットする（IsArrayの場合はNULLと扱う） --->
		<cfif IsArray(StructFind(row, it)) >
			<cfset dummy = ArrayAppend(sets,it & "= NULL")>
		<cfelse>
			<cfset dummy = ArrayAppend(sets,it & "=" & dao_n() & "'" & dao_escape(StructFind(row, it)) & "'")>
		</cfif>
	</cfloop>

	<cfset sets_str = ArrayToList(sets,',')>
	<cfquery name="update" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
		update #PreserveSingleQuotes(tbl_name)# set #PreserveSingleQuotes(sets_str)# where #PreserveSingleQuotes(id_name)# = '#PreserveSingleQuotes(id_safe)#'
	</cfquery>

	<cfreturn true>
</cffunction>

<!---

--- 特定のフィールドにNullを入れる(アップデート専用) ---
関数名：dao_update_null
引数０：DSN
引数１：テーブル名
引数２：プライマリーキーの値
引数３：プライマリーキーの名称
引数４：フィールドの名称(Nullを入れたいフィールドの名前)
返り値：なし

--->

<cffunction Name="dao_update_null" output="No">
	<cfargument name="dsn" type="string" required="Yes">
	<cfargument name="tbl_name" type="string" required="Yes">
	<cfargument name="id" type="string" required="Yes">
	<cfargument name="id_name" type="string" required="Yes">
	<cfargument name="field_name" type="string" required="Yes">
	<cfset var id_safe=dao_escape(id)>

	<!---<cftransaction>--->
		<cfset sets = ArrayNew(1)>
		<cfloop collection=#row# item="it">
			<cfset dummy = ArrayAppend(sets,it & "=" & dao_n() & "'" & dao_escape(StructFind(row, it)) & "'")>
		</cfloop>
		<cfset sets_str = ArrayToList(sets,',')>
		<cfquery name="update" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
			update #PreserveSingleQuotes(tbl_name)# set #PreserveSingleQuotes(field_name)# = Null where #PreserveSingleQuotes(id_name)# = '#PreserveSingleQuotes(id_safe)#'
		</cfquery>
	<!---</cftransaction>--->

	<cfreturn true>
</cffunction>


<!---

--- レコードをひとつ削除（DELETE）する ---
関数名；dao_delete
引数０：DSN
引数１：テーブル名
引数２：プライマリーキーの値
返り値：なし

--->

<cffunction Name="dao_delete" output="No">
	<cfargument name="dsn" type="string" required="Yes">
	<cfargument name="tbl_name" type="string" required="Yes">
	<cfargument name="id" type="string" required="Yes">
	<cfset var id_safe=dao_escape(id)>
	<!---<cftransaction>--->
		<cfquery name="update" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
			delete from #PreserveSingleQuotes(tbl_name)# where serial = '#PreserveSingleQuotes(id_safe)#'
		</cfquery>
	<!---</cftransaction>--->

	<cfreturn true>
</cffunction>

<!---

--- レコードをひとつ削除（DELETE）する ※キー名称変更可能版 ---
関数名；dao_delete_ex
引数０：DSN
引数１：テーブル名
引数２：プライマリーキーの値
引数３：プライマリーキーの名称
返り値：なし

--->

<cffunction Name="dao_delete_ex" output="No">
	<cfargument name="dsn" type="string" required="Yes">
	<cfargument name="tbl_name" type="string" required="Yes">
	<cfargument name="id" type="string" required="Yes">
	<cfargument name="id_name" type="string" required="Yes">
	<cfset var id_safe=dao_escape(id)>
	<!---
	<cftransaction>
	--->
		<cfquery name="update" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
			delete from #PreserveSingleQuotes(tbl_name)# where #PreserveSingleQuotes(id_name)# = '#PreserveSingleQuotes(id_safe)#'
		</cfquery>
	<!---
	</cftransaction>
	--->

	<cfreturn true>
</cffunction>

<!---

--- レコードをひとつ削除（DELETE）する ※キー名称変更可能版 (トランザクションなし) ---
トランザクションの内部でコールする場合はこちら
関数名；dao_delete_ex_no_tran
引数０：DSN
引数１：テーブル名
引数２：プライマリーキーの値
引数３：プライマリーキーの名称
返り値：なし

--->

<cffunction Name="dao_delete_ex_no_tran" output="No">
	<cfargument name="dsn" type="string" required="Yes">
	<cfargument name="tbl_name" type="string" required="Yes">
	<cfargument name="id" type="string" required="Yes">
	<cfargument name="id_name" type="string" required="Yes">
	<cfset var id_safe=dao_escape(id)>

	<cfquery name="update" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
		delete from #PreserveSingleQuotes(tbl_name)# where #PreserveSingleQuotes(id_name)# = '#PreserveSingleQuotes(id_safe)#'
	</cfquery>

	<cfreturn true>
</cffunction>

<cffunction Name="dao_delete_ex_multikey_no_tran" output="Yes">
	<cfargument name="tbl_name" type="string" required="Yes">
	<cfargument name="row" required="Yes">
	<cfargument name="keyList" required="Yes">
	
	<cfset setArray = ArrayNew(1)>
	<cfset conditionArray = ArrayNew(1)>
	<cfloop list="#keyList#" index="field">
		<cfif ListFindNoCase(KeyList,field) is not 0>
			<cfset ArrayAppend(conditionArray, field & "=" & dao_n() & "'" & dao_escape(row[field]) & "'")>
		</cfif>
	</cfloop>
	<cfset conditionString = ArrayToList(conditionArray,' and ')>
	
	<cfquery name="delete" username="#application.DUN#" password="#application.DUP#" datasource="#Application.dsn#">
		delete from #PreserveSingleQuotes(tbl_name)# where #PreserveSingleQuotes(conditionString)#
	</cfquery>
</cffunction>


<cffunction Name="dao_multiple_delete" output="Yes">
	<cfargument name="table_name"		required="true"		type="string">
	<cfargument name="use_other_keys"	required="true"		type="boolean">
	<cfargument name="delete_id_name"	required="true"		type="string">
	<cfargument name="delete_ids"		required="true">
	<cfargument name="key_info"			required="false"	type="array">
	<cfset var temp_sql	= ArrayNew(1)>
	<cfset var sqls		= ArrayNew(1)>
	<cfset var ids_safe	= "">
	<cfset var sql_list	= "">

	<cfif IsArray(delete_ids)>
		<cfset ids_safe	= addSingleQuotesToList(ArrayToList(delete_ids))>
	<cfelse>
		<cfset ids_safe	= addSingleQuotesToList(delete_ids)>
	</cfif>

	<cfif ids_safe neq "">
		<cfif use_other_keys>
			<cfloop index="i" from="1" to="#ArrayLen(key_info)#">
				<cfset ArrayAppend(sqls, " AND " & key_info[i].key_name & "=" & dao_n() & "'" & dao_escape(key_info[i].key_value) & "'")>
			</cfloop>
			<cfset sql_list	= ArrayToList(sqls)>
	
			<cfquery username="#application.DUN#" password="#application.DUP#" datasource="#Application.dsn#">
				DELETE
				FROM #table_name#
				WHERE
				#PreserveSingleQuotes(delete_id_name)# in (#PreserveSingleQuotes(ids_safe)#)
				#PreserveSingleQuotes(sql_list)#
			</cfquery>
		<cfelse>
			<cfquery username="#application.DUN#" password="#application.DUP#" datasource="#Application.dsn#">
				DELETE
				FROM #table_name#
				WHERE
				#PreserveSingleQuotes(delete_id_name)# in (#PreserveSingleQuotes(ids_safe)#)
			</cfquery>
		</cfif>
	</cfif>
</cffunction>


<!---

###################
### SELECT 関連 ###
###################

--- selectオブジェクトのコンストラクタ ---
関数名：dao_select
引数１：テーブル名
返り値：selectオブジェクト

--->

<cffunction Name="dao_select" output="No">
	<cfargument name="tbl_name" type="string" required="Yes">
	<cfset select_obj = StructNew()>
	<cfset select_obj.tbl_name = tbl_name>
	<cfset select_obj.orderby = ''>
	<cfset select_obj.limit = ''>
	<cfset select_obj.where_eq = ArrayNew(1)>
	<cfset select_obj.where_ne = ArrayNew(1)>
	<cfset select_obj.where_like = ArrayNew(1)>
	<cfset select_obj.where_in = ArrayNew(1)>
	<cfset select_obj.where_notin = ArrayNew(1)>
	<cfset select_obj.where_gt = ArrayNew(1)>
	<cfset select_obj.where_ge = ArrayNew(1)>
	<cfset select_obj.where_lt = ArrayNew(1)>
	<cfset select_obj.where_le = ArrayNew(1)>
	<cfreturn select_obj>
</cffunction>

<!---

###################
### SELECT 関連 ###
###################

--- dao_search_limit用のselectオブジェクトのコンストラクタ ---
関数名：dao_select_for_dao_search_limit
引数１：テーブル名
返り値：selectオブジェクト

--->

<cffunction Name="dao_select_for_dao_search_limit" output="No">
	<cfargument name="table_list" type="any" required="Yes">
	<cfset select_obj = StructNew()>
	<cfset select_obj.table_list = table_list>
	<cfset select_obj.search_word="">
	<cfset select_obj.field_list ="">
	<cfset select_obj.return_field="">
	<cfset select_obj.join_cond="">
	<cfset select_obj.orderby = ''>
	<cfset select_obj.limit = ''>
	<cfset select_obj.where_eq = ArrayNew(1)>
	<cfset select_obj.where_ne = ArrayNew(1)>
	<cfset select_obj.where_like = ArrayNew(1)>
	<cfset select_obj.where_in = ArrayNew(1)>
	<cfset select_obj.where_notin = ArrayNew(1)>
	<cfset select_obj.where_gt = ArrayNew(1)>
	<cfset select_obj.where_ge = ArrayNew(1)>
	<cfset select_obj.where_lt = ArrayNew(1)>
	<cfset select_obj.where_le = ArrayNew(1)>
	<cfreturn select_obj>
</cffunction>

<!---

--- selectオブジェクトに絞込条件（ {key} = '{value}'）を追加 ---
関数名：dao_eq
引数１：selectオブジェクト
引数２：フィールド名
引数３：フィールド値
返り値：selectオブジェクト

--->

<cffunction Name="dao_eq" output="No">
	<cfargument name="select_obj" type="struct" required="Yes">
	<cfargument name="key" type="string" required="Yes">
	<cfargument name="val" type="string" required="Yes">
	<cfset temp = ArrayAppend(select_obj.where_eq , key & "=" & dao_n() & "'" & dao_escape(val) & "'")>
	<cfreturn select_obj>
</cffunction>

<!---

--- selectオブジェクトに絞込条件（ {key} != '{value}'）を追加 ---
関数名：dao_ne
引数１：selectオブジェクト
引数２：フィールド名
引数３：フィールド値
返り値：selectオブジェクト

--->

<cffunction Name="dao_ne" output="No">
	<cfargument name="select_obj" type="struct" required="Yes">
	<cfargument name="key" type="string" required="Yes">
	<cfargument name="val" type="string" required="Yes">
	<cfset temp = ArrayAppend(select_obj.where_ne , key & "!=" & dao_n() & "'" & dao_escape(val) & "'")>
	<cfreturn select_obj>
</cffunction>

<!---

--- selectオブジェクトに絞込条件（ {key} > '{value}'）を追加 ---
関数名：dao_gt
引数１：selectオブジェクト
引数２：フィールド名
引数３：フィールド値
返り値：selectオブジェクト

--->

<cffunction Name="dao_gt" output="No">
	<cfargument name="select_obj" type="struct" required="Yes">
	<cfargument name="key" type="string" required="Yes">
	<cfargument name="val" type="string" required="Yes">
	<cfset temp = ArrayAppend(select_obj.where_gt , key & ">" & dao_n() & "'" & dao_escape(val) & "'")>
	<cfreturn select_obj>
</cffunction>

<!---

--- selectオブジェクトに絞込条件（ {key} >= '{value}'）を追加 ---
関数名：dao_ge
引数１：selectオブジェクト
引数２：フィールド名
引数３：フィールド値
返り値：selectオブジェクト

--->

<cffunction Name="dao_ge" output="No">
	<cfargument name="select_obj" type="struct" required="Yes">
	<cfargument name="key" type="string" required="Yes">
	<cfargument name="val" type="string" required="Yes">
	<cfset temp = ArrayAppend(select_obj.where_ge , key & ">=" & dao_n() & "'" & dao_escape(val) & "'")>
	<cfreturn select_obj>
</cffunction>

<!---

--- selectオブジェクトに絞込条件（ {key} < '{value}'）を追加 ---
関数名：dao_lt
引数１：selectオブジェクト
引数２：フィールド名
引数３：フィールド値
返り値：selectオブジェクト

--->

<cffunction Name="dao_lt" output="No">
	<cfargument name="select_obj" type="struct" required="Yes">
	<cfargument name="key" type="string" required="Yes">
	<cfargument name="val" type="string" required="Yes">
	<cfset temp = ArrayAppend(select_obj.where_lt , key & "<" & dao_n() & "'" & dao_escape(val) & "'")>
	<cfreturn select_obj>
</cffunction>

<!---

--- selectオブジェクトに絞込条件（ {key} <= '{value}'）を追加 ---
関数名：dao_le
引数１：selectオブジェクト
引数２：フィールド名
引数３：フィールド値
返り値：selectオブジェクト

--->

<cffunction Name="dao_le" output="No">
	<cfargument name="select_obj" type="struct" required="Yes">
	<cfargument name="key" type="string" required="Yes">
	<cfargument name="val" type="string" required="Yes">
	<cfset temp = ArrayAppend(select_obj.where_le , key & "<=" & dao_n() & "'" & dao_escape(val) & "'")>
	<cfreturn select_obj>
</cffunction>

<!---

--- selectオブジェクトに絞込条件（ {key} like '%{value}%' ）を追加 ---
関数名：dao_like
引数１：selectオブジェクト
引数２：フィールド名
引数３：like句の'%ここ%'。ここの部分
返り値：selectオブジェクト

--->

<cffunction Name="dao_like" output="No">
	<cfargument name="select_obj" type="struct" required="Yes">
	<cfargument name="key" type="string" required="Yes">
	<cfargument name="val" type="string" required="Yes">
	<cfset temp = ArrayAppend(select_obj.where_like , key & " like " & dao_n() & "'%" & dao_escape(val) & "%'")>
	<cfreturn select_obj>
</cffunction>

<!---

--- selectオブジェクトに絞り込み条件({key} in ({value}))を設定 ---
関数名：dao_in
引数１：selectオブジェクト
引数２：フィールド名
引数３：in句の(ここ)。ここの部分。カンマ区切りで。
返り値：selectオブジェクト
--->

<cffunction Name="dao_in" output="No">
	<cfargument name="select_obj" type="struct" required="Yes">
	<cfargument name="key" type="string" required="Yes">
	<cfargument name="val" type="string" required="Yes">
	<cfif val eq "">
		<cfset temp = ArrayAppend(select_obj.where_eq , "1=0")>
	<cfelse>
		<cfset temp = ArrayAppend(select_obj.where_in , key & " in (" & addSingleQuotesToList(val) & ")")>
	</cfif>
	<cfreturn select_obj>
</cffunction>

<!---

--- selectオブジェクトに絞り込み条件({key} not in ({value}))を設定 ---
関数名：dao_notin
引数１：selectオブジェクト
引数２：フィールド名
引数３：not in句の(ここ)。ここの部分。カンマ区切りで。
返り値：selectオブジェクト
--->

<cffunction Name="dao_notin" output="No">
	<cfargument name="select_obj" type="struct" required="Yes">
	<cfargument name="key" type="string" required="Yes">
	<cfargument name="val" type="string" required="Yes">
	<cfif val neq "">
		<cfset temp = ArrayAppend(select_obj.where_notin , key & " not in (" & dao_escape(val) & ")")>
	</cfif>
	<cfreturn select_obj>
</cffunction>

<!---

--- selectオブジェクトにソート条件をを設定 ---
関数名：dao_orderby
引数１：selectオブジェクト
引数２：フィールド名をカンマ区切りで、descとかも書ける。
返り値：selectオブジェクト
--->

<cffunction Name="dao_orderby" output="No">
	<cfargument name="select_obj" type="struct" required="Yes">
	<cfargument name="orderby" type="string" required="Yes">
	<cfset select_obj.orderby=orderby>
	<cfreturn select_obj>
</cffunction>

<!---

--- selectオブジェクトにlimitを設定 ---
関数名：dao_limit
引数１：selectオブジェクト
引数２：件数
返り値：selectオブジェクト
--->

<cffunction Name="dao_limit" output="No">
	<cfargument name="select_obj" type="struct" required="Yes">
	<cfargument name="limit" type="string" required="Yes">
	<cfset select_obj.limit=limit>
	<cfreturn select_obj>
</cffunction>

<!---

--- selectオブジェクトに設定した絞込条件でselect文を実行して件数カウント ---
関数名：dao_count
引数０：DSN
引数１：selectオブジェクト
引数２：フィールド名をカンマ区切りで、descとかも書ける。
返り値：rowオブジェクトのリスト

--->

<cffunction Name="dao_count" output="No">
	<cfargument name="dsn" type="string" required="Yes">
	<cfargument name="select_obj" type="struct" required="Yes">

	<cfset var eq_list = ArrayToList(select_obj.where_eq)>
	<cfset var ne_list = ArrayToList(select_obj.where_ne)>
	<cfset var gt_list = ArrayToList(select_obj.where_gt)>
	<cfset var ge_list = ArrayToList(select_obj.where_ge)>
	<cfset var lt_list = ArrayToList(select_obj.where_lt)>
	<cfset var le_list = ArrayToList(select_obj.where_le)>
	<cfset var like_list = ArrayToList(select_obj.where_like)>
	<cfset var in_list = ArrayToList(select_obj.where_in , "|")>
	<cfset var notin_list = ArrayToList(select_obj.where_notin , "|")>
	<cfset var order_text = ''>

	<cfset cond = ''>

	<cfloop index="index_eq" list="#eq_list#">
		<cfset cond = cond & ' and ' & index_eq>
	</cfloop>
	<cfloop index="index_ne" list="#ne_list#">
		<cfset cond = cond & ' and ' & index_ne>
	</cfloop>
	<cfloop index="index_gt" list="#gt_list#">
		<cfset cond = cond & ' and ' & index_gt>
	</cfloop>
	<cfloop index="index_ge" list="#ge_list#">
		<cfset cond = cond & ' and ' & index_ge>
	</cfloop>
	<cfloop index="index_lt" list="#lt_list#">
		<cfset cond = cond & ' and ' & index_lt>
	</cfloop>
	<cfloop index="index_le" list="#le_list#">
		<cfset cond = cond & ' and ' & index_le>
	</cfloop>
	<cfloop index="index_like" list="#like_list#">
		<cfset cond = cond & ' and ' & index_like>
	</cfloop>
	<cfloop index="index_in" list="#in_list#" delimiters="|">
		<cfset cond = cond & ' and ' & index_in>
	</cfloop>
	<cfloop index="index_notin" list="#notin_list#" delimiters="|">
		<cfset cond = cond & ' and ' & index_notin>
	</cfloop>
	<cfquery name="table" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
		select count(*) as dao_cnt from #select_obj.tbl_name# where 1 = 1 #PreserveSingleQuotes(cond)#
	</cfquery>

	<cfreturn table.dao_cnt>

</cffunction>

<!---

--- selectオブジェクトに設定した絞込条件、ソート条件でselect文を実行する ---
関数名：dao_result
引数０：DSN
引数１：selectオブジェクト
返り値：rowオブジェクトのリスト

--->

<cffunction Name="dao_result" output="No">
	<cfargument name="dsn" type="string" required="Yes">
	<cfargument name="select_obj" type="struct" required="Yes">

	<cfset var eq_list = ArrayToList(select_obj.where_eq)>
	<cfset var ne_list = ArrayToList(select_obj.where_ne)>
	<cfset var gt_list = ArrayToList(select_obj.where_gt)>
	<cfset var ge_list = ArrayToList(select_obj.where_ge)>
	<cfset var lt_list = ArrayToList(select_obj.where_lt)>
	<cfset var le_list = ArrayToList(select_obj.where_le)>
	<cfset var like_list = ArrayToList(select_obj.where_like)>
	<cfset var in_list = ArrayToList(select_obj.where_in , "|")>
	<cfset var notin_list = ArrayToList(select_obj.where_notin , "|")>
	<cfset var tbl_name=select_obj.tbl_name>
	<cfset var order_text = ''>
	<cfset var cond="">
	<cfset var limit_text="">
	<cfset var top_text="">

	<cfset cond = ''>
	<cfloop index="index_eq" list="#eq_list#">
		<cfset cond = cond & ' and ' & index_eq>
	</cfloop>
	<cfloop index="index_ne" list="#ne_list#">
		<cfset cond = cond & ' and ' & index_ne>
	</cfloop>
	<cfloop index="index_gt" list="#gt_list#">
		<cfset cond = cond & ' and ' & index_gt>
	</cfloop>
	<cfloop index="index_ge" list="#ge_list#">
		<cfset cond = cond & ' and ' & index_ge>
	</cfloop>
	<cfloop index="index_lt" list="#lt_list#">
		<cfset cond = cond & ' and ' & index_lt>
	</cfloop>
	<cfloop index="index_le" list="#le_list#">
		<cfset cond = cond & ' and ' & index_le>
	</cfloop>
	<cfloop index="index_like" list="#like_list#">
		<cfset cond = cond & ' and ' & index_like>
	</cfloop>
	<cfloop index="index_in" list="#in_list#" delimiters="|">
		<cfset cond = cond & ' and ' & index_in>
	</cfloop>
	<cfloop index="index_notin" list="#notin_list#" delimiters="|">
		<cfset cond = cond & ' and ' & index_notin>
	</cfloop>
	<cfif select_obj.orderby is not "">
		<cfset order_text = ' order by ' & select_obj.orderby>
	</cfif>
	<cfset top_text = ''>
	<cfset limit_text = ''>
	<cfif select_obj.limit is not "">
		<cfif Application.SqlStringComponent eq "eLM_sqlstrings_mysql">
			<cfset limit_text = ' limit ' & select_obj.limit>
		<cfelse>
			<cfset top_text = ' top ' & select_obj.limit>
		</cfif>
	</cfif>
	<cfquery name="table" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
		select #PreserveSingleQuotes(top_text)# * from #PreserveSingleQuotes(tbl_name)# where 1 = 1 #PreserveSingleQuotes(cond)# #PreserveSingleQuotes(order_text)# #PreserveSingleQuotes(limit_text)#
	</cfquery>

	<cfreturn table>

</cffunction>

<!---

--- プライマリーキーを指定して１レコード取り出す ---
関数名：dao_load
引数０：DSN
引数１：テーブル名
引数２：プライマリキーの値
返り値：rowオブジェクトのリスト

--->

<cffunction Name="dao_load" output="No">
<cfargument name="dsn" type="string" required="Yes">
<cfargument name="tbl_name" required="Yes">
<cfargument name="id" required="Yes">
<cfset id_safe=dao_escape(id)>
	<!---<cftransaction>--->
		<cfquery name="row" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
			select * from #PreserveSingleQuotes(tbl_name)# where serial = '#PreserveSingleQuotes(id_safe)#'
		</cfquery>
	<!---</cftransaction>--->
	<cfreturn row>

</cffunction>

<!---

--- フィールド名を指定して最大値を返す ---
関数名：dao_max_data
引数０：DSN
引数１：テーブル名
引数２：フィールドの名称
返り値：フィールドの最大値

--->

<cffunction Name="dao_max_data" output="No">
<cfargument name="dsn" type="string" required="Yes">
<cfargument name="table_name" required="Yes">
<cfargument name="field_name" required="Yes">

<cfset var row = ''>

	<!---<cftransaction>--->
		<cfquery name="row" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
			SELECT MAX(#PreserveSingleQuotes(field_name)#) AS max_data FROM #PreserveSingleQuotes(table_name)#
		</cfquery>
	<!---</cftransaction>--->
	<cfif IsNumeric(row.max_data)>
		<cfset return_val = row.max_data>
	<cfelse>
		<cfset return_val = 0>
	</cfif>
	<cfreturn return_val>

</cffunction>

<!---////////////////////////////////////////////////////////////////////////
関数名	dao_freeword
引数3	sw          string	必須	検索文字列　文字列
引数4	fields      string	必須	検索対象のフィールドリスト　文字列
戻り値	文字列（クエリの一部）
説明	フリーワード検索専用のクエリジェネレータ
		検索文字列が複数の場合、指定された文字列でand検索
		フィールドリストが複数の場合、フィールドリスト全てをor検索
/////////////////////////////////////////////////////////////////////////--->
<cffunction name="dao_freeword" access="public" output="No" returntype="string">
	<cfargument name="sw" required="yes">
	<cfargument name="fields" required="yes">
	
	<cfset field_array = ListToArray(fields,',')>
	<cfset search_conds = ''>
	<cfif sw is not "">
		<cfset search_word = replace(sw , '　' , ' ' , 'all')>
		<cfset search_word_array = ListtoArray(search_word , ' ')>
		<cfset search_conds = ' AND '>
		<cfloop index="j" from="1" to="#ArrayLen(search_word_array)#">
			<cfset search_conds = search_conds & '('>
			<cfloop index="k" from="1" to="#ArrayLen(field_array)#">
				<cfset search_conds = search_conds & field_array[k] & " like " & dao_n() & "'%" & dao_escape(search_word_array[j]) & "%' OR ">
			</cfloop>
			<cfset search_conds = Left(search_conds , Len(search_conds) - 4)>
			<cfset search_conds = search_conds & ') AND'>
		</cfloop>
		<cfset search_conds = Left(search_conds , Len(search_conds) - 4)>
	</cfif>
	<cfreturn search_conds>
</cffunction>

<!---////////////////////////////////////////////////////////////////////////
関数名	dao_search
引数1	dsn				string			必須	データソース名　文字列
引数2	table_list		array,string	必須	検索対象のテーブルリスト　配列、文字列
引数3	search_word		array,string	必須	検索文字列　配列、文字列
引数4	field_list		array,string	必須	検索対象のフィールドリスト　テーブル名.フィールド名の形式　配列、文字列
引数5	condition		array,string			絞り込み条件　上記検索とは別に絞込みをしたい時に利用　配列　文字列
引数6	join_cond		array,string					テーブルの結合条件　引数2が複数の場合必須　文字列
引数7	return_field	array,string			表示するフィールドリスト　テーブル名.フィールド名の形式
												エイリアス可　配列、文字列
引数8	sort			string					ソート順
戻り値	クエリオブジェクト
説明	フリーワード検索専用のクエリジェネレータ
		検索文字列が複数の場合、指定された文字列でand検索
		フィールドリストが複数の場合、フィールドリスト全てをor検索
		テーブルの結合は全て外部結合
/////////////////////////////////////////////////////////////////////////--->
<cffunction name="dao_search" output="No">
	<cfargument name="dsn" required="yes" type="string">		<!--- dsn --->
	<cfargument name="table_list" required="Yes" type="any">	<!--- テーブルリスト --->
	<cfargument name="search_word" required="yes" type="any">	<!--- 検索条件 --->
	<cfargument name="field_list" requried="Yes" type="any">	<!--- フィールドリスト --->
	<cfargument name="condition" default="" type="any">			<!--- 絞り込み条件 --->
	<cfargument name="join_cond" default="" type="any">		<!--- 結合条件 --->
	<cfargument name="return_field" default="" type="any">		<!--- 表示するフィールドリスト --->
	<cfargument name="sort" default="" type="string">			<!--- ソート順 --->

	<cfset var tables = ''>
	<cfset var fileds = ''>
	<cfset var conds = ''>
	<cfset var return_fields = ''>
	<cfset var search_conds = ''>
	<cfset var sort_conds = ''>
	<cfset var conditions= ''>
	<cfset var search_word_array = ArrayNew(1)>
	<cfset var field_array = ArrayNew(1)>


	<cfif IsArray(table_list)>
		<cfset tables = table_list[1]>
		<cfloop index="loopIndex" from="2" to="#ArrayLen(table_list)#">
			<cfset tables = tables & " LEFT JOIN " & table_list[loopIndex]>
			<cfif isArray(join_cond)>
				<cfif ArrayLen(join_cond) gte loopIndex - 1>
					<cfset tables = tables & " ON " & join_cond[loopIndex - 1]>
				</cfif>
			<cfelse>
				<cfif loopIndex eq 2>
					<cfset tables = tables & " ON " & join_cond>
				</cfif>
			</cfif>
		</cfloop>
	<cfelse>
		<cfset tables = table_list>
	</cfif>

	<cfif IsArray(condition)>
		<cfif ArrayLen(condition) is not 0>
			<cfset conditions = ' AND ' & ArrayToList(condition , ' AND ')>
		</cfif>
	<cfelse>
		<cfif condition is not "">
			<cfset conditions = ' AND ' & condition>
		</cfif>
	</cfif>

	<cfif IsArray(return_field)>
		<cfif ArrayLen(return_field) is 0>
			<cfset return_fields = '*'>
		<cfelse>
			<cfset return_fields = ArrayToList(return_field)>
		</cfif>
	<cfelse>
		<cfif return_field is "">
			<cfset return_fields = '*'>
		<cfelse>
			<cfset return_fields =return_field>
		</cfif>
	</cfif>

	<cfif not IsArray(field_list)>
		<cfset field_array[1] = field_list>
	<cfelse>
		<cfset field_array = field_list>
	</cfif>

	<cfif not IsArray(search_word)>
		<cfset search_word_array[1] = search_word>
	<cfelse>
		<cfset search_word_array = search_word>
	</cfif>

	<cfif search_word_array[1] is not "" and ArrayLen(field_array) is not 0>
		<cfset search_conds = 'AND '>
		<cfloop index="j" from="1" to="#ArrayLen(search_word_array)#">
			<cfset search_conds = search_conds & '('>
			<cfloop index="k" from="1" to="#ArrayLen(field_array)#">
				<!---<cfoutput>#search_word_array[j]#,#field_array[k]#</cfoutput><br>--->
				<cfset search_conds = search_conds & field_array[k] & " like " & dao_n() & "'%" & dao_escape(search_word_array[j]) & "%' OR ">
			</cfloop>
			<cfset search_conds = Left(search_conds , Len(search_conds) - 4)>
			<cfset search_conds = search_conds & ') AND'>
		</cfloop>
		<cfset search_conds = Left(search_conds , Len(search_conds) - 4)>
	</cfif>

	<cfif sort is not "">
		<cfset sort_conds = 'order by ' & sort>
	</cfif>

	<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
	SELECT #PreserveSingleQuotes(return_fields)# FROM #PreserveSingleQuotes(tables)# where 1 = 1 #PreserveSingleQuotes(conditions)# #PreserveSingleQuotes(search_conds)# #PreserveSingleQuotes(sort_conds)#
	</cfquery>

	<cfreturn result>

</cffunction>


<!---////////////////////////////////////////////////////////////////////////
関数名	dao_search_limit
引数1	dsn				string			必須	データソース名　文字列
引数2	table_list		array,string	必須	検索対象のテーブルリスト　配列、文字列
引数3	search_word		array,string	必須	検索文字列　配列、文字列
引数4	field_list		array,string	必須	検索対象のフィールドリスト　テーブル名.フィールド名の形式　配列、文字列
引数5	condition		array,string			絞り込み条件　上記検索とは別に絞込みをしたい時に利用　配列　文字列
引数6	join_cond		array,string					テーブルの結合条件　引数2が複数の場合必須　文字列
引数7	return_field	array,string			表示するフィールドリスト　テーブル名.フィールド名の形式
												エイリアス可　配列、文字列
引数8	sort			string					ソート順
引数8	limit			string					ソート順
引数9	return_type		string					戻り値のタイプ　default:query
戻り値	クエリオブジェクト
説明	フリーワード検索専用のクエリジェネレータ
		検索文字列が複数の場合、指定された文字列でand検索
		フィールドリストが複数の場合、フィールドリスト全てをor検索
		テーブルの結合は全て外部結合
/////////////////////////////////////////////////////////////////////////--->
<cffunction name="dao_search_limit" output="No">
	<cfargument name="dsn" required="yes" type="string">			<!--- dsn --->
	<cfargument name="cond" required="yes" type="struct">
	<cfargument name="return_type" default="query" type="string">	<!--- 戻り値のタイプ --->
	<cfset var table_list=cond.table_list>
	<cfset var search_word=cond.search_word>
	<cfset var field_list=cond.field_list>
	<cfset var eq_list = ArrayToList(cond.where_eq)>
	<cfset var ne_list = ArrayToList(cond.where_ne)>
	<cfset var gt_list = ArrayToList(cond.where_gt)>
	<cfset var ge_list = ArrayToList(cond.where_ge)>
	<cfset var lt_list = ArrayToList(cond.where_lt)>
	<cfset var le_list = ArrayToList(cond.where_le)>
	<cfset var like_list = ArrayToList(cond.where_like)>
	<cfset var in_list = ArrayToList(cond.where_in , "|")>
	<cfset var notin_list = ArrayToList(cond.where_notin , "|")>
	<cfset var join_cond=cond.join_cond>
	<cfset var return_field=cond.return_field>
	<cfset var sort=cond.orderby>
	<cfset var limit=cond.limit>
	<cfset var tables = ''>
	<cfset var fileds = ''>
	<cfset var return_fields = ''>
	<cfset var search_conds = ''>
	<cfset var sort_conds = ''>
	<cfset var conditions= ''>
	<cfset var search_word_array = ArrayNew(1)>
	<cfset var field_array = ArrayNew(1)>
	<cfset var result = ''>

	<cfif IsArray(table_list)>
		<cfset tables = table_list[1]>
		<cfloop index="loopIndex" from="2" to="#ArrayLen(table_list)#">
			<cfset tables = tables & " LEFT JOIN " & table_list[loopIndex]>
			<cfif isArray(join_cond)>
				<cfif ArrayLen(join_cond) gte loopIndex - 1>
					<cfset tables = tables & " ON " & join_cond[loopIndex - 1]>
				</cfif>
			<cfelse>
				<cfif loopIndex eq 2>
					<cfset tables = tables & " ON " & join_cond>
				</cfif>
			</cfif>
		</cfloop>
	<cfelse>
		<cfset tables = table_list>
	</cfif>

	<cfset conditions = ''>
	<cfloop index="index_eq" list="#eq_list#">
		<cfset conditions = conditions & ' and ' & index_eq>
	</cfloop>
	<cfloop index="index_ne" list="#ne_list#">
		<cfset conditions = conditions & ' and ' & index_ne>
	</cfloop>
	<cfloop index="index_gt" list="#gt_list#">
		<cfset conditions = conditions & ' and ' & index_gt>
	</cfloop>
	<cfloop index="index_ge" list="#ge_list#">
		<cfset conditions = conditions & ' and ' & index_ge>
	</cfloop>
	<cfloop index="index_lt" list="#lt_list#">
		<cfset conditions = conditions & ' and ' & index_lt>
	</cfloop>
	<cfloop index="index_le" list="#le_list#">
		<cfset conditions = conditions & ' and ' & index_le>
	</cfloop>
	<cfloop index="index_like" list="#like_list#">
		<cfset conditions = conditions & ' and ' & index_like>
	</cfloop>
	<cfloop index="index_in" list="#in_list#" delimiters="|">
		<cfset conditions = conditions & ' and ' & index_in>
	</cfloop>
	<cfloop index="index_notin" list="#notin_list#" delimiters="|">
		<cfset conditions = conditions & ' and ' & index_notin>
	</cfloop>

	<cfif IsArray(return_field)>
		<cfif ArrayLen(return_field) is 0>
			<cfset return_fields = '*'>
		<cfelse>
			<cfset return_fields = ArrayToList(return_field)>
		</cfif>
	<cfelse>
		<cfif return_field is "">
			<cfset return_fields = '*'>
		<cfelse>
			<cfset return_fields =return_field>
		</cfif>
	</cfif>

	<cfif not IsArray(field_list)>
		<cfset field_array[1] = field_list>
	<cfelse>
		<cfset field_array = field_list>
	</cfif>

	<cfif not IsArray(search_word)>
		<cfset search_word_array[1] = search_word>
	<cfelse>
		<cfset search_word_array = search_word>
	</cfif>

	<cfif search_word_array[1] is not "" and ArrayLen(field_array) is not 0>
		<cfset search_conds = 'AND '>
		<cfloop index="j" from="1" to="#ArrayLen(search_word_array)#">
			<cfset search_conds = search_conds & '('>
			<cfloop index="k" from="1" to="#ArrayLen(field_array)#">
				<!---<cfoutput>#search_word_array[j]#,#field_array[k]#</cfoutput><br>--->
				<cfset search_conds = search_conds & field_array[k] & " like " & dao_n() & "'%" & dao_escape(search_word_array[j]) & "%' OR ">
			</cfloop>
			<cfset search_conds = Left(search_conds , Len(search_conds) - 4)>
			<cfset search_conds = search_conds & ') AND'>
		</cfloop>
		<cfset search_conds = Left(search_conds , Len(search_conds) - 4)>
	</cfif>

	<cfif sort is not "">
		<cfset sort_conds = 'order by ' & sort>
	</cfif>

	<cfset top_text = ''>
	<cfset limit_text = ''>
	<cfif limit is not "">
		<cfif Application.SqlStringComponent eq "eLM_sqlstrings_mysql">
			<cfset limit_text = ' limit ' & limit>
		<cfelse>
			<cfset top_text = ' top ' & limit>
		</cfif>
	</cfif>

	<cfif return_type is 'query'>

		<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
		SELECT #PreserveSingleQuotes(top_text)# #PreserveSingleQuotes(return_fields)# FROM #PreserveSingleQuotes(tables)# where 1 = 1 #PreserveSingleQuotes(conditions)# #PreserveSingleQuotes(search_conds)# #PreserveSingleQuotes(sort_conds)# #PreserveSingleQuotes(limit_text)#
		</cfquery>

	<cfelseif return_type is 'simple_sql'>

		<cfset result = 'SELECT ' & return_fields & ' FROM ' & tables & ' where 1 = 1 ' & conditions & ' ' & search_conds>

	<cfelse>

		<cfset result = 'SELECT ' & top_text & ' ' & return_fields & ' FROM ' & tables & ' where 1 = 1 ' & conditions & ' ' & search_conds & ' ' & sort_conds & ' ' & limit_text>

	</cfif>

	<cfreturn result>

</cffunction>

<!---////////////////////////////////////////////////////////////////////////
関数名	dao_search_count
引数1	dsn				string			必須	データソース名　文字列
引数2	table_list		array,string	必須	検索対象のテーブルリスト　配列、文字列
引数3	search_word		array,string	必須	検索文字列　配列、文字列
引数4	field_list		array,string	必須	検索対象のフィールドリスト　テーブル名.フィールド名の形式　配列、文字列
引数5	condition		array,string			絞り込み条件　上記検索とは別に絞込みをしたい時に利用　配列　文字列
引数6	join_cond		array,string					テーブルの結合条件　引数2が複数の場合必須　文字列
引数7	return_field	array,string			表示するフィールドリスト　テーブル名.フィールド名の形式
												エイリアス可　配列、文字列
引数8	sort			string					ソート順
戻り値	クエリオブジェクト
説明	フリーワード検索専用のクエリジェネレータ
		検索文字列が複数の場合、指定された文字列でand検索
		フィールドリストが複数の場合、フィールドリスト全てをor検索
		テーブルの結合は全て外部結合
/////////////////////////////////////////////////////////////////////////--->
<cffunction name="dao_search_count" output="Yes">
	<cfargument name="dsn" required="yes" type="string">		<!--- dsn --->
	<cfargument name="cond" required="yes" type="struct">
	<cfset var table_list=cond.table_list>
	<cfset var search_word=cond.search_word>
	<cfset var field_list=cond.field_list>
	<cfset var eq_list = ArrayToList(cond.where_eq)>
	<cfset var ne_list = ArrayToList(cond.where_ne)>
	<cfset var gt_list = ArrayToList(cond.where_gt)>
	<cfset var ge_list = ArrayToList(cond.where_ge)>
	<cfset var lt_list = ArrayToList(cond.where_lt)>
	<cfset var le_list = ArrayToList(cond.where_le)>
	<cfset var like_list = ArrayToList(cond.where_like)>
	<cfset var in_list = ArrayToList(cond.where_in , "|")>
	<cfset var notin_list = ArrayToList(cond.where_notin , "|")>
	<cfset var join_cond=cond.join_cond>
	<cfset var return_field=cond.return_field>
	<cfset var sort=cond.orderby>

	<cfset var tables = ''>
	<cfset var fileds = ''>
	<cfset var return_fileds = ''>
	<cfset var search_conds = ''>
	<cfset var sort_conds = ''>
	<cfset var conditions= ''>
	<cfset var search_word_array = ArrayNew(1)>
	<cfset var field_array = ArrayNew(1)>

	<cfset var temp_cond="">
	<cfif IsArray(table_list)>
		<cfset tables = table_list[1]>
		<cfloop index="loopIndex" from="2" to="#ArrayLen(table_list)#">
			<cfset tables = tables & " LEFT JOIN " & table_list[loopIndex]>
			<cfif isArray(join_cond)>
				<cfif ArrayLen(join_cond) gte loopIndex - 1>
					<cfset tables = tables & " ON " & join_cond[loopIndex - 1]>
				</cfif>
			<cfelse>
				<cfif loopIndex eq 2>
					<cfset tables = tables & " ON " & join_cond>
				</cfif>
			</cfif>
		</cfloop>
	<cfelse>
		<cfset tables = table_list>
	</cfif>

	<cfloop index="index_eq" list="#eq_list#">
		<cfset conditions = conditions & ' and ' & index_eq>
	</cfloop>
	<cfloop index="index_ne" list="#ne_list#">
		<cfset conditions = conditions & ' and ' & index_ne>
	</cfloop>
	<cfloop index="index_gt" list="#gt_list#">
		<cfset conditions = conditions & ' and ' & index_gt>
	</cfloop>
	<cfloop index="index_ge" list="#ge_list#">
		<cfset conditions = conditions & ' and ' & index_ge>
	</cfloop>
	<cfloop index="index_lt" list="#lt_list#">
		<cfset conditions = conditions & ' and ' & index_lt>
	</cfloop>
	<cfloop index="index_le" list="#le_list#">
		<cfset conditions = conditions & ' and ' & index_le>
	</cfloop>
	<cfloop index="index_like" list="#like_list#">
		<cfset conditions = conditions & ' and ' & index_like>
	</cfloop>
	<cfloop index="index_in" list="#in_list#" delimiters="|">
		<cfset conditions = conditions & ' and ' & index_in>
	</cfloop>
	<cfloop index="index_notin" list="#notin_list#" delimiters="|">
		<cfset conditions = conditions & ' and ' & index_notin>
	</cfloop>

	<cfif IsArray(return_field)>
		<cfif ArrayLen(return_field) is 0>
			<cfset return_fileds = '*'>
		<cfelse>
			<cfset return_fileds= ArrayToList(return_field)>
		</cfif>
	<cfelse>
		<cfif return_field is "">
			<cfset return_fileds = '*'>
		<cfelse>
			<cfset return_fileds =return_field>
		</cfif>
	</cfif>

	<cfif not IsArray(field_list)>
		<cfset field_array[1] = field_list>
	<cfelse>
		<cfset field_array = field_list>
	</cfif>

	<cfif not IsArray(search_word)>
		<cfset search_word_array[1] = search_word>
	<cfelse>
		<cfset search_word_array = search_word>
	</cfif>

	<cfif search_word_array[1] is not "" and ArrayLen(field_array) is not 0>
		<cfset search_conds = 'AND '>
		<cfloop index="j" from="1" to="#ArrayLen(search_word_array)#">
			<cfset search_conds = search_conds & '('>
			<cfloop index="k" from="1" to="#ArrayLen(field_array)#">
				<!---<cfoutput>#search_word_array[j]#,#field_array[k]#</cfoutput><br>--->
				<cfset search_conds = search_conds & field_array[k] & " like " & dao_n() & "'%" & search_word_array[j] & "%' OR ">
			</cfloop>
			<cfset search_conds = Left(search_conds , Len(search_conds) - 4)>
			<cfset search_conds = search_conds & ') AND'>
		</cfloop>
		<cfset search_conds = Left(search_conds , Len(search_conds) - 4)>
	</cfif>

	<cfif sort is not "">
		<cfset sort_conds = 'order by ' & sort>
	</cfif>

	<cfquery name="result" username="#application.DUN#" password="#application.DUP#" datasource="#dsn#">
	SELECT count(*) as dao_cnt FROM #PreserveSingleQuotes(tables)# where 1 = 1 #PreserveSingleQuotes(conditions)# #PreserveSingleQuotes(search_conds)# #PreserveSingleQuotes(sort_conds)#
	</cfquery>

	<cfreturn result.dao_cnt>

</cffunction>

<cffunction name="dao_next_id" output="Yes">
	<cfset var returnVariables = 0>
	<cfset var result = 0>
	<cfset var temp = 0>
	<cfset var seed = 0>
	
	<cfobject type="Java" action="Create" class="java.lang.Math" name="math">
	<cfset seed = int(math.random() * 1000000000)>

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


<cffunction name="dao_get_recordCount_for_key">
	<cfargument name="table_name"			required="true"	type="string">
	<cfargument name="key_name"				required="true" type="string">
	<cfargument name="key_values"			required="true">
	<cfargument name="is_use_other_keys"	required="false" type="boolean" default="false">
	<cfargument name="other_keys"			required="false" type="struct">
	<cfset var q_count	= "">
	<cfset var table_name_safe	= dao_escape(table_name)>
	<cfset var key_name_safe	= dao_escape(key_name)>
	<cfset var key_values_list	= "">

	<cfif IsArray(key_values)>
		<cfset key_values_list	= addSingleQuotesToList(ArrayToList(key_values))>
	<cfelse>
		<cfset key_values_list	= addSingleQuotesToList(key_values)>
	</cfif>

	<cfif is_use_other_keys>
	<cfelse>
		<cfquery name="q_count" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			SELECT count(*) AS count
			FROM #PreserveSingleQuotes(table_name_safe)#
			WHERE #PreserveSingleQuotes(key_name_safe)# in (#PreserveSingleQuotes(key_values_list)#)
		</cfquery>
	</cfif>

	<cfreturn q_count.count>
</cffunction>


<cffunction name="divide_array_by_multiple_count">
	<cfargument name="data" required="true" type="array">
	<cfset var divided_data		= ArrayNew(2)>
	<cfset var j				= 1>
	<cfset var lsObj			= "">
	<cfobject component="#application.SERVICE_ADDRESS#.table_lms_setting" name="lsObj">

	<cfloop index="i" from="1" to="#ArrayLen(data)#">
		<cfset ArrayAppend(divided_data[j], data[i])>

		<cfif i MOD lsObj.get_value('db.multiple_count') EQ 0>
			<cfset j	= j + 1>
		</cfif>
	</cfloop>

	<cfreturn divided_data>
</cffunction>
