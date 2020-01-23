<cfprocessingdirective pageencoding="UTF-8">
<!---////////////////////////////////////////
          スコープに関係ない関数集(function.cfmから移行)
/////////////////////////////////////////--->

<!---////////////////////////////////////////
関数名	fn_QueryToStruct
戻り値	Convert from QueryObject to Struct
/////////////////////////////////////////--->
<cffunction name="fn_QueryToStruct" access="public" returntype="any" output="false"
 hint="Converts an entire query or the given record to a struct. This might return a structure (single record) or an array of structures.">


 <!--- Define arguments. --->
 <cfargument name="Query" type="query" required="true" />
 <cfargument name="Row" type="numeric" required="false" default="0" />


 <cfscript>


 // Define the local scope.
 var LOCAL = StructNew();


 // Determine the indexes that we will need to loop over.
 // To do so, check to see if we are working with a given row,
 // or the whole record set.
 if (ARGUMENTS.Row){


 // We are only looping over one row.
 LOCAL.FromIndex = ARGUMENTS.Row;
 LOCAL.ToIndex = ARGUMENTS.Row;


 } else {


 // We are looping over the entire query.
 LOCAL.FromIndex = 1;
 LOCAL.ToIndex = ARGUMENTS.Query.RecordCount;


 }


 // Get the list of columns as an array and the column count.
 LOCAL.Columns = ListToArray( ARGUMENTS.Query.ColumnList );
 LOCAL.ColumnCount = ArrayLen( LOCAL.Columns );


 // Create an array to keep all the objects.
 LOCAL.DataArray = ArrayNew( 1 );


 // Loop over the rows to create a structure for each row.
 for (LOCAL.RowIndex = LOCAL.FromIndex ; LOCAL.RowIndex LTE LOCAL.ToIndex ; LOCAL.RowIndex = (LOCAL.RowIndex + 1)){


 // Create a new structure for this row.
 ArrayAppend( LOCAL.DataArray, StructNew() );


 // Get the index of the current data array object.
 LOCAL.DataArrayIndex = ArrayLen( LOCAL.DataArray );


 // Loop over the columns to set the structure values.
 for (LOCAL.ColumnIndex = 1 ; LOCAL.ColumnIndex LTE LOCAL.ColumnCount ; LOCAL.ColumnIndex = (LOCAL.ColumnIndex + 1)){


 // Get the column value.
 LOCAL.ColumnName = LOCAL.Columns[ LOCAL.ColumnIndex ];


 // Set column value into the structure.
 LOCAL.DataArray[ LOCAL.DataArrayIndex ][ LOCAL.ColumnName ] = ARGUMENTS.Query[ LOCAL.ColumnName ][ LOCAL.RowIndex ];


 }


 }





 // At this point, we have an array of structure objects that
 // represent the rows in the query over the indexes that we
 // wanted to convert. If we did not want to convert a specific
 // record, return the array. If we wanted to convert a single
 // row, then return the just that STRUCTURE, not the array.
 if (ARGUMENTS.Row){


 // Return the first array item.
 return( LOCAL.DataArray[ 1 ] );


 } else {


 // Return the entire array.
 return( LOCAL.DataArray );


 }


 </cfscript>
</cffunction>

<!---////////////////////////////////////////
関数名	isNumericOrDie
引数1	文字列、または文字列を含んでいる変数の名前
引数2	ブランクと未定義を許すフラグ。
		True：引数１がブランクでも未定義でも可とする。False：引数１が数字以外通さない。
戻り値	なし
説明	引数は文字列を含んでいる変数の場合はELM_URLに飛ばす。それ以外の場合は何もしない。
		CFのIsNumeric()関数は"1e2"など指数も可とするので、使えない。
/////////////////////////////////////////--->
<cffunction name="isNumericOrDie">
	<cfargument name="argString" required="yes" type="any">
	<cfargument name="allowBlankFlag" required="no" type="boolean" default="false">

   	<cfset var ret = true>

   	<cfif IsDefined( argString )>
   		<!--- 引数は定義されている場合 --->
	   	<cfset val = Evaluate( argString )>
	   	<cfif Not isNumericEx( val )>
	   		<!--- 引数は数字以外の場合、ブランクフラグによって判断する --->
		   	<cfif Not (allowBlankFlag eq "true" and val eq "")>
			   	<cfset ret = "false">
			</cfif>
		</cfif>
	<cfelse>
   		<!--- 引数は未定義の場合、ブランクフラグによって判断する --->
	   	<cfset ret = allowBlankFlag>
	</cfif>

	<!--- エラーと判断される場合、ELM_URLに飛ばす --->
   	<cfif ret eq "false">
		<cflocation url="#eLM_URL#/redirect.cfm">
	</cfif>
</cffunction>

<!---////////////////////////////////////////
関数名	addSingleQuotesToList
引数1	IDリスト
戻り値	シングルクオートを加えたリスト
説明	Query中にINの条件に入れているリストにシングルクオートを加える。
        0,1,2 -> N'0', N'1', N'2'
        (SQL Server で Unicode 文字列定数を処理するときは、すべての Unicode 文字列の前に N プレフィックスを付ける必要がある)
/////////////////////////////////////////--->
<cffunction name="addSingleQuotesToList">
	<cfargument name="IDList" required="yes" type="string">

   	<cfset var ret = "">

	<!--- 0,1,2 -> N'0', N'1', N'2' --->
	<cfloop index="item" list="#IDList#">
		<cfset ret = ret & dao_n() & "'" & dao_escape(item) &  "'" & ",">
	</cfloop>

	<!--- 最後余計なカンマを削除 --->
	<cfif Len(ret) gt 1 >
		<cfset ret = Mid( ret, 1, Len(ret)-1 ) >
	</cfif>

	<cfreturn ret>

</cffunction>

<!---////////////////////////////////////////
関数名	isNumericEx
引数	任意の文字列値
戻り値	True：引数は数値 False：引数は数値以外
説明	引数は数値かどうかの判定を行う。
/////////////////////////////////////////--->
<cffunction name="isNumericEx">
	<cfargument name="argString" required="yes" type="string">

   	<cfset var ret = true>								<!--- 戻り値の初期値 --->
	<cfset var regex = "^[-+]?[0-9]*[.]?[0-9]+$" >		<!--- 数字の正規表現 --->

	<cfif Not REFind( #regex#, argString )>
		<!--- 数字以外の場合 --->
	   	<cfset ret = "false">
	</cfif>

	<cfreturn ret>

</cffunction>

<!---////////////////////////////////////////
関数名	isInt
引数	任意の文字列値
戻り値	True：引数は数値 False：引数は数値以外
説明	引数は整数かどうかの判定を行う。
/////////////////////////////////////////--->
<cffunction name="isInt">
	<cfargument name="argString" required="yes" type="string">

   	<cfset var ret = true>						<!--- 戻り値の初期値 --->
	<cfset var regex = "^[-+]?[0-9]*$" >		<!--- 整数の正規表現 --->

	<cfif Not REFind( #regex#, argString )>
		<!--- 数字以外の場合 --->
	   	<cfset ret = "false">
	</cfif>

	<cfreturn ret>

</cffunction>

<!---////////////////////////////////////////
関数名	isPositiveInteger
引数	任意の文字列値
戻り値	True：引数は整数 False：引数は整数以外
説明	引数は整数かどうかの判定を行う。数字のみTrue、小数点と符号はFalse。
/////////////////////////////////////////--->
<cffunction name="isPositiveInteger">
	<cfargument name="argString" required="yes" type="string">

   	<cfset var ret = true>						<!--- 戻り値の初期値 --->
	<cfset var regex = "^[0-9]+$" >				<!--- 正数の正規表現 --->

	<cfif Not REFind( #regex#, argString ) >
		<!--- 正数以外の場合 --->
	   	<cfset ret = "false">
	</cfif>

	<cfreturn ret>

</cffunction>

<!---////////////////////////////////////////
関数名	isNumericOrError
引数	任意の文字列またはリスト
戻り値	なし
説明	引数に数値以外の値（空白も含む）がある場合はランタイムエラーを出す。
/////////////////////////////////////////--->
<cffunction name="isNumericOrError">
	<cfargument name="argString" required="yes" type="string">

	<cfif ( Len( argString ) eq 0 )>
		<cfthrow message = "illegal numeric value">
	</cfif>

	<cfloop index = "listElement" list = #argString#>
		<cfif Not isNumericEx( listElement )>
			<cfthrow message = "illegal numeric value">
		</cfif>
	</cfloop>

</cffunction>

<!---////////////////////////////////////////
関数名	make_pager
引数1	最大件数
引数2	現在のページ
引数3	パラメータ（リンクを飛ばす条件）
引数4	「次の20件」などの表示名
引数5	「前の20件」などの表示名
引数6	make_pager を使っていなかったところに適用するためにつけた切り替えフラグ
引数7	一画面に出したい最大件数
戻り値	文字列
説明	件数を区切ってページを表示する。
/////////////////////////////////////////--->
<cffunction name="make_pager_getUnit">
	<cfargument name="unit" default="-1">
	<cfset var lsObj = ''>
	<cfif unit eq "-1">
		<cfif IsDefined("SERVICE_ADDRESS")>
			<cfobject component="#SERVICE_ADDRESS#.table_lms_setting" name="lsObj">
		<cfelseif IsDefined("application.SERVICE_ADDRESS")>
			<cfobject component="#application.SERVICE_ADDRESS#.table_lms_setting" name="lsObj">
		</cfif>
		<cfset unit=lsObj.get_value("pager.default_unit")>
	</cfif>
	<cfreturn unit>
</cffunction>

<cffunction name="make_pager" output="No">
	<cfargument name="max_count" required="Yes">
	<cfargument name="now" default="1"><!---はじめからmake_pagerを使っていた箇所では、ここに次ページの最初の項目の番号が降ってくる。そうでないところでは何ページ目かが返ってくる。そのためにあとでの flag による切り替えが必要になる。--->
	<cfargument name="params" default="">
	<cfargument name="next" default="next">
	<cfargument name="back" default="back">
	<cfargument name="countname" default="count">
	<cfargument	name="flag" required="no" type="boolean" default="false">
	<cfargument name="unit" default="-1">
	<cfargument name="onclickfunc" default="">
	<cfset var contents = ''>
	<cfset var loop_count = ''>
	<cfset var now_page ="">
	<cfset var param_list = ''>
	<cfset var target = CGI.SCRIPT_NAME & '?' & countname & '='>

	<cfif not isNumericEx(now)>
		<cfset now	= 1>
	</cfif>

	<cfif not isNumericEx(unit)>
		<cfset unit	= -1>
	</cfif>

	<cfif now gt max_count and now neq "1">
		<cfset max_count = now>
	</cfif>

	<cfset unit = make_pager_getUnit(unit)>

	<cfset loop_count = max_count \ unit>

	<cfif flag eq false>
		<cfset now_page=((now - 1) \ unit) + 1>
	<cfelse>
		<cfset now_page=now>
	</cfif>

	<cfif IsStruct(params)>
		<cfloop collection=#params# item="key">
			<cfset param_list = param_list & '&' & key & '=' & URLEncodedFormat(StructFind(params , key))>
		</cfloop>
	<cfelseif IsDefined("params") and params neq "">
		<cfset param_list= param_list & '&' & params>
	</cfif>


	<cfif max_count mod unit is not 0>
		<cfset loop_count = loop_count + 1>
	</cfif>

	<!---左端、1ページ戻るところの設定--->
	<cfif flag eq false>
		<cfif now lte unit>
			<cfset contents = '<span class="text12_gray">&lt;&lt;' & HTMLEditFormat(back)& '</span>'>
		<cfelseif onclickfunc is not "">
			<cfset contents = contents & make_herf_onclick_link( now - unit , onclickfunc, back, "left" ) >
		<cfelse>
			<cfset contents = '<span><a href="' & HTMLEditFormat(target) & now - unit & HTMLEditFormat(param_list) & '">&lt;&lt;' & back & '</a></span>'>
		</cfif>
	<cfelse>
		<cfif now lte 1>
			<cfset contents = '<span class="text12_gray">&lt;&lt;' & HTMLEditFormat(back) & '</span>'>
		<cfelseif onclickfunc is not "">
			<cfset contents = contents & make_herf_onclick_link( now - 1 , onclickfunc, back, "left" ) >
		<cfelse>
			<cfset contents = '<span><a href="' & HTMLEditFormat(target) & now - 1 & HTMLEditFormat(param_list) & '">&lt;&lt;' & back & '</a></span>'>
		</cfif>
	</cfif>
	<!---左端終了--->

	<cfset page_cnt = 7>

	<!---中央、何ページ目か表示するところ--->
	<cfif flag eq false>
		<cfif loop_count gt 0>
			<cfloop index="i" from="1" to="#loop_count#">
				<cfif i eq now_page>
					<cfset contents = contents & ' <b>' & i & '</b> '>
				<cfelseif (i eq 1) or (i eq loop_count) or (i ge now_page-page_cnt and i le now_page+page_cnt)>
					<cfif (i eq loop_count) and (now_page lt loop_count - page_cnt -1)>
						<cfset contents = contents & ' ... '>
					</cfif>
					<cfif onclickfunc is "">
						<cfset contents = contents & ' <a href="' & HTMLEditFormat(target) & unit * (i - 1) + 1 & HTMLEditFormat(param_list) & '">' & i & '</a> '>
					<cfelse>
						<cfset contents = contents & make_herf_onclick_link( unit * (i - 1) + 1 , onclickfunc, i, "off" ) >
					</cfif>
					<cfif (i eq 1) and (now_page gt 1 + page_cnt +1)>
						<cfset contents = contents & ' ... '>
					</cfif>
				</cfif>
			</cfloop>
		<cfelse>
			<cfset contents = contents & ' <b> 1 </b> '>
		</cfif>
	<cfelse>
		<cfif loop_count gt 0>
			<cfloop index="i" from="1" to="#loop_count#">
				<cfif i eq now>
					<cfset contents = contents & ' <b>' & i & '</b> '>
				<cfelseif (i eq 1) or (i eq loop_count) or (i ge now-page_cnt and i le now+page_cnt)>
					<cfif (i eq loop_count) and (now lt loop_count - page_cnt -1)>
						<cfset contents = contents & ' ... '>
					</cfif>
					<cfif onclickfunc is "">
						<cfset contents = contents & ' <a href="' & HTMLEditFormat(target) & i & HTMLEditFormat(param_list) & '">' & i & '</a> '>
					<cfelse>
						<cfset contents = contents & make_herf_onclick_link( i, onclickfunc, i, "off" ) >
					</cfif>
					<cfif (i eq 1) and (now gt 1 + page_cnt +1)>
						<cfset contents = contents & ' ... '>
					</cfif>
				</cfif>
			</cfloop>
		<cfelse>
			<cfset contents = contents & ' <b> 1 </b>'>
		</cfif>
	</cfif>
	<!---中央終了--->

	<!---右端、1ページ進むところの設定--->
	<cfif flag eq false>
		<cfif max_count - unit lt now>
			<cfset contents = contents & '<span class="text12_gray">' & HTMLEditFormat(next) & '&gt;&gt;</span>'>
		<cfelseif onclickfunc is not "">
			<cfset contents = contents & make_herf_onclick_link( now_page * unit + 1 , onclickfunc, next ) >
		<cfelse>
			<cfset contents = contents & '<span><a href="' & HTMLEditFormat(target) & now_page * unit + 1 & HTMLEditFormat(param_list) & '">' & HTMLEditFormat(next) & '&gt;&gt;</a></span>'>
		</cfif>
	<cfelse>
		<cfif loop_count - now lt 1>
			<cfset contents = contents & '<span class="text12_gray">' & HTMLEditFormat(next) & '&gt;&gt;</span>'>
		<cfelseif onclickfunc is not "">
			<cfset contents = contents & make_herf_onclick_link( now + 1 , onclickfunc, next ) >
		<cfelse>
			<cfset contents = contents & '<span><a href="' & HTMLEditFormat(target) & now + 1 & HTMLEditFormat(param_list) & '">' & next & '&gt;&gt;</a></span>'>
		</cfif>
	</cfif>
	<!---右端終了--->

	<!---現在表示しているページに載っているのが何番目から何番目か/全件--->
	<cfif loop_count eq 0>
		<cfset start_num=0>
		<cfset end_num=0>
	<cfelse>
		<cfloop index="i" from="0" to="#loop_count#">
			<cfif i eq now_page>
				<cfset start_num=unit*(i-1) + 1>
				<cfset end_num=unit*i>
				<cfif end_num gt max_count>
					<cfset end_num = max_count>
				</cfif>
			</cfif>
		</cfloop>
	</cfif>
	<cfset contents = contents & '&nbsp;' & '&nbsp;(' & start_num & '&nbsp;' & '-' & '&nbsp;' &  end_num & '&nbsp;/&nbsp;' &  max_count & ')'  >
	<cfset contents = contents & '</div>' >

	<cfreturn contents>
</cffunction>

<cffunction name="make_user_pager" output="No">
	<cfargument name="max_count" required="Yes">
	<cfargument name="now" default="1"><!---はじめからmake_pagerを使っていた箇所では、ここに次ページの最初の項目の番号が降ってくる。そうでないところでは何ページ目かが返ってくる。そのためにあとでの flag による切り替えが必要になる。--->
	<cfargument name="params" default="">
	<cfargument name="next" default="next">
	<cfargument name="back" default="back">
	<cfargument name="countname" default="count">
	<cfargument	name="flag" required="no" type="boolean" default="false">
	<cfargument name="unit" default="-1">
	<cfargument name="onclickfunc" default="">
	<cfset var contents = '<div class="pager_wrapper cf mg_bottom_15">'>
	<cfset var loop_count = ''>
	<cfset var now_page ="">
	<cfset var param_list = ''>
	<cfset var target = CGI.SCRIPT_NAME & '?' & countname & '='>

	<cfif not isNumericEx(now)>
		<cfset now	= 1>
	</cfif>

	<cfif not isNumericEx(unit)>
		<cfset unit	= -1>
	</cfif>

	<cfif now gt max_count and now neq "1">
		<cfset max_count = now>
	</cfif>

	<cfset unit = make_pager_getUnit(unit)>

	<cfset loop_count = max_count \ unit>

	<cfif flag eq false>
		<cfset now_page=((now - 1) \ unit) + 1>
	<cfelse>
		<cfset now_page=now>
	</cfif>

	<cfif IsStruct(params)>
		<cfloop collection=#params# item="key">
			<cfset param_list = param_list & '&' & key & '=' & URLEncodedFormat(StructFind(params , key))>
		</cfloop>
	<cfelseif IsDefined("params") and params neq "">
		<cfset param_list= param_list & '&' & params>
	</cfif>


	<cfif max_count mod unit is not 0>
		<cfset loop_count = loop_count + 1>
	</cfif>

	<!---現在表示しているページに載っているのが何番目から何番目か/全件--->
	<cfif loop_count eq 0>
		<cfset start_num=0>
		<cfset end_num=0>
	<cfelse>
		<cfloop index="i" from="0" to="#loop_count#">
			<cfif i eq now_page>
				<cfset start_num=unit*(i-1) + 1>
				<cfset end_num=unit*i>
				<cfif end_num gt max_count>
					<cfset end_num = max_count>
				</cfif>
			</cfif>
		</cfloop>
	</cfif>
 	<cfset contents = contents & '<div class="pager_left">' & Session.termObj.get_term('eLM_common_user_pager_all') & '<span>' &  max_count >
 	<cfset contents = contents & '</span>' & Session.termObj.get_term('eLM_common_user_pager_mid') & '<span>' >
	<cfset contents = contents & '&nbsp;' & start_num & '&nbsp;' & '-' & '&nbsp;' &  end_num >
 	<cfset contents = contents & '</span>' & Session.termObj.get_term('eLM_common_user_pager_end') & '</div>' >

	<!---右端、1ページ戻るところの設定--->
 	<cfset contents = contents & '<div class="pager_right"> <ol>' >
 	<cfset contents = contents & '<li class="pager_prev">' >
	<cfif flag eq false>
		<cfif now lte unit>
			<cfset contents = contents &  '<span class="text12_gray">&laquo; ' & HTMLEditFormat(back)& '</span>'>
		<cfelseif onclickfunc is not "">
			<cfset contents = contents & make_herf_onclick_link( now - unit , onclickfunc, back, "left" ) >
		<cfelse>
			<cfset contents = contents & '<span><a href="' & HTMLEditFormat(target) & now - unit & HTMLEditFormat(param_list) & '"> &laquo; ' & back & '</a></span>'>
		</cfif>
	<cfelse>
		<cfif now lte 1>
			<cfset contents = contents & '<span class="text12_gray">&laquo; ' & HTMLEditFormat(back) & '</span>'>
		<cfelseif onclickfunc is not "">
			<cfset contents = contents & make_herf_onclick_link( now - 1 , onclickfunc, back, "left" ) >
		<cfelse>
			<cfset contents = contents & '<span><a href="' & HTMLEditFormat(target) & now - 1 & HTMLEditFormat(param_list) & '">&laquo; ' & back & '</a></span>'>
		</cfif>
	</cfif>
 	<cfset contents = contents & '</li>' >
	<!---左端終了--->

	<cfset page_cnt = 7>

	<!---中央、何ページ目か表示するところ--->
	<cfif flag eq false>
		<cfif loop_count gt 0>
			<cfloop index="i" from="1" to="#loop_count#">
				<cfif i eq now_page>
					<cfif i eq 1>
						<cfset contents = contents & '<li class="pager_first"> <b>' & i & '</b> </li>'>
					<cfelse>
						<cfset contents = contents & '<li> <b>' & i & '</b> </li>'>
					</cfif>
				<cfelseif (i eq 1) or (i eq loop_count) or (i ge now_page-page_cnt and i le now_page+page_cnt)>
					<cfif (i eq loop_count) and (now_page lt loop_count - page_cnt -1)>
						<cfset contents = contents & ' ... '>
					</cfif>
					<cfif onclickfunc is "">
						<cfif i eq 1>
							<cfset contents = contents & '<li class="pager_first"> <a href="' & HTMLEditFormat(target) & unit * (i - 1) + 1 & HTMLEditFormat(param_list) & '">' & i & '</a> </li>'>
						<cfelse>
							<cfset contents = contents & '<li> <a href="' & HTMLEditFormat(target) & unit * (i - 1) + 1 & HTMLEditFormat(param_list) & '">' & i & '</a> </li>'>
						</cfif>
					<cfelse>
						<cfset contents = contents & make_herf_onclick_link( unit * (i - 1) + 1 , onclickfunc, i, "off" ) >
					</cfif>
					<cfif (i eq 1) and (now_page gt 1 + page_cnt +1)>
						<cfset contents = contents & ' ... '>
					</cfif>
				</cfif>
			</cfloop>
		<cfelse>
			<cfset contents = contents & '<li class="pager_first"><b> 1 </b></li>'>
		</cfif>
	<cfelse>
		<cfif loop_count gt 0>
			<cfloop index="i" from="1" to="#loop_count#">
				<cfif i eq now>
					<cfif i eq 1>
						<cfset contents = contents & '<li class="pager_first"> <b>' & i & '</b> </li>'>
					<cfelse>
						<cfset contents = contents & '<li> <b>' & i & '</b> </li>'>
					</cfif>
				<cfelseif (i eq 1) or (i eq loop_count) or (i ge now-page_cnt and i le now+page_cnt)>
					<cfif (i eq loop_count) and (now lt loop_count - page_cnt -1)>
						<cfset contents = contents & ' ... '>
					</cfif>
					<cfif onclickfunc is "">
						<cfif i eq 1>
							<cfset contents = contents & '<li class="pager_first"> <a href="' & HTMLEditFormat(target) & i & HTMLEditFormat(param_list) & '">' & i & '</a> </li>'>
						<cfelse>
							<cfset contents = contents & '<li> <a href="' & HTMLEditFormat(target) & i & HTMLEditFormat(param_list) & '">' & i & '</a> </li>'>
						</cfif>
					<cfelse>
						<cfset contents = contents & make_herf_onclick_link( i, onclickfunc, i, "off" ) >
					</cfif>
					<cfif (i eq 1) and (now gt 1 + page_cnt +1)>
						<cfset contents = contents & ' ... '>
					</cfif>
				</cfif>
			</cfloop>
		<cfelse>
			<cfset contents = contents & '<li class="pager_first"><b> 1 </b></li>'>
		</cfif>
	</cfif>
	<!---中央終了--->

	<!---右端、1ページ進むところの設定--->
 	<cfset contents = contents & '<li class="pager_next">' >
	<cfif flag eq false>
		<cfif max_count - unit lt now>
			<cfset contents = contents & '<span class="text12_gray">' & HTMLEditFormat(next) & ' &raquo;</span>'>
		<cfelseif onclickfunc is not "">
			<cfset contents = contents & make_herf_onclick_link( now_page * unit + 1 , onclickfunc, next ) >
		<cfelse>
			<cfset contents = contents & '<span><a href="' & HTMLEditFormat(target) & now_page * unit + 1 & HTMLEditFormat(param_list) & '">' & HTMLEditFormat(next) & ' &raquo;</a></span>'>
		</cfif>
	<cfelse>
		<cfif loop_count - now lt 1>
			<cfset contents = contents & '<span class="text12_gray">' & HTMLEditFormat(next) & ' &raquo;</span>'>
		<cfelseif onclickfunc is not "">
			<cfset contents = contents & make_herf_onclick_link( now + 1 , onclickfunc, next ) >
		<cfelse>
			<cfset contents = contents & '<span><a href="' & HTMLEditFormat(target) & now + 1 & HTMLEditFormat(param_list) & '">' & next & ' &raquo;</a></span>'>
		</cfif>
	</cfif>
 	<cfset contents = contents & '</li>' >
	<!---右端終了--->
 	<cfset contents = contents & '</ol></div></div><br>' >

	<cfreturn contents>
</cffunction>

<cffunction name="make_herf_onclick_link" access="public" returntype="string" output="no">
	<cfargument name="content" required="Yes">
	<cfargument name="func_name" required="Yes">
	<cfargument name="expression" required="Yes">
	<cfargument name="arrow_flg" default="right" >

	<cfset var ret = "">

	<cfset ret = '<span><a href="javascript:void(0)" onclick="' & HTMLEditFormat(func_name) & '('>
	<cfset ret = ret & "'" & HTMLEditFormat(content) & "'" >
	<cfset ret = ret & ')' & ';return false;' & '">'>
	<cfif arrow_flg is "right">
		<cfset ret = ret & HTMLEditFormat(expression)& '&gt;&gt;</a></span>'>
	<cfelseif arrow_flg is "left">
		<cfset ret = ret & '&lt;&lt;' & HTMLEditFormat(expression) & '</a></span>&nbsp;'>
	<cfelse>
		<cfset ret = ret & expression & '</a> </span>'>
	</cfif>

	<cfreturn ret>

</cffunction>

<!---////////////////////////////////////////
関数名	make_favicon_link
戻り値	favicon_path, favicon_urlを含んだ、<link> タグを返す関数
/////////////////////////////////////////--->
<cffunction name="make_favicon_link" access="public" returntype="string" output="no">
	<cfobject component="#SERVICE_ADDRESS#.table_lms_setting" name="lsObj">
	<cfset link_tag = '<link rel="icon" href="' & "#application.eLM_URL#" & "#lsObj.get_value('favicon')#" & '"/>'>
	<cfset link_tag = link_tag & '<link rel="Shortcut icon" type="img/x-icon" href="' & "#application.eLM_URL#" & "#lsObj.get_value('favicon')#" & '"/>'>
	<cfset link_tag = link_tag & '<link rel="Shortcut icon" type="img/x-icon" href="' & "#application.eLM_PATH#" & "#lsObj.get_value('favicon')#" & '"/>'>
	<cfreturn link_tag>
</cffunction>

<!---//////////////////////////////////////////////////
ログイン中のユーザ数を数える
///////////////////////////////////////////////////--->

<cffunction name="count_current_users" output="true" returntype="numeric" access="public">
  <cfset var objUL = "">
  <cfset var ret = "">
  <cfset var q_get_user_logon = "">

  <cfobject component="#SERVICE_ADDRESS#.table_user_logon" name="objUL">

  <!--- タイムアウト時間を過ぎているユーザーを削除 --->
  <cfset ret = objUL.delete_timeout_user()>

  <cfquery name="q_get_user_logon" datasource="#application.DSN#" username="#application.DUN#" password="#application.DUP#">
    SELECT COUNT(L.user_id) AS num
    FROM USER_LOGON L
    INNER JOIN USER_MASTER U ON L.user_id = U.user_id AND U.user_type_id IN (3, 4)
  </cfquery>

  <!--- 同時ログインユーザ数を返す --->
  <cfreturn #q_get_user_logon.num#>

</cffunction>

<!---
ログインユーザ数制限の適合をチェックする
true : ログインできる
false : ログインできない
--->
<cffunction name="check_current_users" output="true" returntype="boolean" access="public">
	<cfset var objLs = "">
	<cfset var current_users = count_current_users()>
	<cfobject component="#SERVICE_ADDRESS#.table_lms_setting" name="objLs">
	<cfif current_users gte objLs.get_value("concurrent_login_max")>
		<cfreturn false>
	</cfif>
	<cfreturn true>
</cffunction>

<cffunction name="getDefaultLangCode" returnType="string" access="public">
	<cfset var lsObj = ''>
	<cfset var listAccept = CGI.HTTP_ACCEPT_LANGUAGE>
	<cfset var arrAccept  = listToArray(listAccept)>
	<cfset var accept = ''>
	<cfset var qLangs = ''>
	<cfset var qLangSearch = ''>
	<cfset var i = 0>
	<cfquery name="qLangs" datasource="#application.DSN#" username="#application.DUN#" password="#application.DUP#">
		SELECT lang_code FROM TERM_MASTER WHERE effective = 1
	</cfquery>

	<cfloop index="i" from="1" to="#ArrayLen(arrAccept)#">
		<cfset accept = trim(arrAccept[i])>
		<cfif REFindNoCase("^ja", accept) neq 0>
			<cfquery name="qLangSearch" dbtype="query">
				SELECT * FROM qLangs WHERE lang_code = 'ja'
			</cfquery>
			<cfif qLangSearch.recordCount gt 0>
				<cfreturn 'ja'>
			</cfif>
		<cfelseif REFindNoCase("^en", accept) neq 0>
			<cfquery name="qLangSearch" dbtype="query">
				SELECT * FROM qLangs WHERE lang_code = 'en'
			</cfquery>
			<cfif qLangSearch.recordCount gt 0>
				<cfreturn 'en'>
			</cfif>
		<cfelseif REFindNoCase("^ko", accept) neq 0>
			<cfquery name="qLangSearch" dbtype="query">
				SELECT * FROM qLangs WHERE lang_code = 'kr'
			</cfquery>
			<cfif qLangSearch.recordCount gt 0>
				<cfreturn 'kr'>
			</cfif>
		<cfelseif REFindNoCase("^zh[-_](tw|hk)", accept) neq 0>
			<cfquery name="qLangSearch" dbtype="query">
				SELECT * FROM qLangs WHERE lang_code = 'tw'
			</cfquery>
			<cfif qLangSearch.recordCount gt 0>
				<cfreturn 'tw'>
			</cfif>
		<cfelseif REFindNoCase("^zh", accept) neq 0>
			<cfquery name="qLangSearch" dbtype="query">
				SELECT * FROM qLangs WHERE lang_code = 'cn'
			</cfquery>
			<cfif qLangSearch.recordCount gt 0>
				<cfreturn 'cn'>
			</cfif>
		</cfif>
	</cfloop>

	<cfif IsDefined("SERVICE_ADDRESS")>
		<cfobject component="#SERVICE_ADDRESS#.table_lms_setting" name="lsObj">
	<cfelseif IsDefined("application.SERVICE_ADDRESS")>
		<cfobject component="#application.SERVICE_ADDRESS#.table_lms_setting" name="lsObj">
	<cfelse>
		<cfreturn 'ja'>
	</cfif>
	<cfreturn lsObj.get_value('lang_code')>
</cffunction>

<!---//////////////////////////////////////////////////
全角空白も取れるTrim関数
///////////////////////////////////////////////////--->
<cffunction name="trim_ex" output="true" returntype="string" access="public">
	<cfargument name="argString" required="yes" type="string">
	<cfset ret = "">
	<cfif argString neq "">
		<cfset ret = REReplace(argString, "^[　 ]*|[　 ]*$", " ", "all")>
		<cfset ret = Trim(ret)>
	</cfif>
	<cfreturn ret>
</cffunction>

<!---//////////////////////////////////////////////////
ASPモードとき、運用期間中かどうか判断する関数
///////////////////////////////////////////////////--->
<cffunction name="asp_period_chk" output="true" returntype="string" access="public">
	<cfset ret = "true">

	<cfif application.eLM_TYPE eq "ASP">
		<cfquery name="asp_master" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
			select start_date_free as start_date, end_date
			from ASP_MASTER
		</cfquery>
		<!--- ASP_MASTERの運用開始日、運用終了日期間外の場合、戻り値に false を返す --->
		<cfif asp_master.recordcount gt 0>
			<cfset now_date = DateFormat(now() , "yyyy-mm-dd") & " " & TimeFormat(now() , "HH:mm:ss") >
			<cfif now_date lt asp_master.start_date or now_date gt asp_master.end_date >
				<cfset ret = "false">
			</cfif>
		<cfelse>
			<cfset ret = "false">
		</cfif>
	</cfif>

	<cfreturn ret>
</cffunction>

<!---//////////////////////////////////////////////////
ディレクトリの容量を調べる関数。
特に、ASPモードのときのコースの容量について注意を喚起するために使う。
単純にディレクトリ内のファイルのバイト数の合計を出力。
結果を使うとき見やすくするためにMBにするなどの処理をかけた方がいい。
整形用にconv_bite関数を用意した。
///////////////////////////////////////////////////--->
<cffunction name="calc_dir_vol" output="true" returntype="numeric" access="public">
	<cfargument name="root_dir_name" required="yes" type="string">
	<cfargument name="next_dir_name" required="no"  type="string" default="">
	<cfset var i = 0>
	<cfset var now_dir_name = root_dir_name>
	<cfset var dir_size = 0>
	<cfset var q_dir = "">

	<cfif next_dir_name neq "">
		<cfset now_dir_name = root_dir_name & "/" & next_dir_name>
	</cfif>

	<cfdirectory directory="#now_dir_name#" name="q_dir" action="list">
	<cfloop query="q_dir">
		<cfset i = q_dir.currentRow>
		<cfif q_dir.type eq "file">
			<cfset dir_size = dir_size + q_dir.size>
		<cfelseif q_dir.type eq "dir">
			<cfset dir_size = dir_size + calc_dir_vol(now_dir_name, q_dir.name)>
		</cfif>
	</cfloop>
	<cfreturn dir_size>
</cffunction>

<!---//////////////////////////////////////////////////
バイト数をMBやGBに直す関数。
数字と単位を分けて構造体で返す。
端数は切り上げ。
///////////////////////////////////////////////////--->
<cffunction name="conv_bite" output="true" returntype="struct" access="public">
	<cfargument name="input_bite" required="yes" type="numeric">
	<cfset var num				= 1>
	<cfset var ret_struct		= StructNew()>
	<cfset var unit_arr			= ArrayNew(1)>
	<cfset ret_struct.int		= input_bite>
	<cfset ret_struct.unit		= 1>
	<cfset unit_arr[1]			= "B">
	<cfset unit_arr[2]			= "KB">
	<cfset unit_arr[3]			= "MB">
	<cfset unit_arr[4]			= "GB">
	<cfset unit_arr[5]			= "TB">

	<cfloop condition="ret_struct.int GREATER THAN 1024">
		<cfset ret_struct.int = ret_struct.int / 1024>
		<cfset ret_struct.unit = ret_struct.unit + 1>
	</cfloop>

	<cfset ret_struct.int = round(ret_struct.int)>
	<cfloop index="i" from="1" to="#ArrayLen(unit_arr)#">
		<cfif i eq ret_struct.unit>
			<cfset ret_struct.unit = unit_arr[i]>
			<cfbreak>
		</cfif>
	</cfloop>
	<cfreturn ret_struct>
</cffunction>

<!---//////////////////////////////////////////////////
CSVファイルを読み込み時のエラー制御
///////////////////////////////////////////////////--->
<cffunction name="read_csv" output="true" returntype="struct" access="public">
	<cfargument name="arg_file_name" required="yes" type="string">
	<cfargument name="charset_input" required="no" type="string" default="#lsObj.get_value("csv.CHARSET_INPUT")#">

	<cfset var ret = "">
	<cfset var ret_struct		= StructNew()>
	<cfset ret_struct.error		= false>
	<cfset ret_struct.result	= "">

	<!--- 拡張子判断 --->
	<cfif not (cffile.serverFileExt is "csv" or cffile.serverFileExt is "txt") >
		<cfset ret_struct.error		= true>
		<cfset ret_struct.result	= #Session.termObj.get_term("eLM_csv_read_ext_error_msg:ja=CSVファイル以外はアップロードできません。")#>
		<cfreturn ret_struct>
	</cfif>

	<!--- CSVファイルの読み込み処理 --->
	<cftry>
		<cffile action="read" file="#arg_file_name#" variable="ret" charset="#charset_input#">
		<cfset ret_struct.result = ret >

	<cfcatch type="any">
		<cfset ret_struct.error		= true>
		<cfset ret_struct.result	= #Session.termObj.get_term("eLM_csv_read_error_msg:ja=下記のようなエラーが出ております。<br> CSVファイルを確認し、再度アップロードしてください。")#>
		<cfset ret_struct.result	= ret_struct.result & "<br><br>[">
		<cfset ret_struct.result	= ret_struct.result & cfcatch.message>
		<cfset ret_struct.result	= ret_struct.result & "]">

	</cfcatch>
	</cftry>

	<cfreturn ret_struct>
</cffunction>


<!---
関数名	get_admin_type_and_flag_all_admin_course_and_group
引数1	user_id
戻り値	管理者のuser_type_idとflag_all_admin_course/groupまたはの値。
説明	管理者の権限判定用
--->
<cffunction name="get_admin_type_and_flag_all_admin_course_and_group">
	<cfargument name="user_id" require="yes" type="numeric">
	<cfset var q_admin_info = "">

	<cfquery name="q_admin_info" username="#application.DUN#" password="#application.DUP#" datasource="#application.DSN#">
		SELECT user_type_id, flag_all_admin_course, flag_all_admin_group
		FROM USER_MASTER
		WHERE user_id = #user_id#
	</cfquery>
	<cfreturn q_admin_info>
</cffunction>


<cffunction name="get_batch_progress">
	<cfargument name="msg" required="yes" type="string">
	<cfset var script	= "
		<script language='JavaScript'>
			window.document.getElementById('progress').innerHTML='#msg#'
		</script>">
	<cfreturn script>
</cffunction>


<cffunction name="get_success_comment">
	<cfargument name="method_name" required="true" type="string">
	<cfreturn '<div><font color="blue">SUCCESS the test method #method_name#</font></div><br />'>
</cffunction>


<cffunction name="get_fail_comment">
	<cfargument name="method_name" required="true" type="string">
	<cfreturn '<div><font color="red">FAIL the test method #method_name#</font></div><br />'>
</cffunction>

<cffunction name="struct2hidden">
	<cfargument name="vars" required="Yes" type="Struct">
	<cfset var hiddens			= ''>
	<cfset var hiddens_array	= ArrayNew(1)>
	<cfset var i				= 1>
	<cfloop collection="#vars#" item="element">
		<cfset hiddens_array[i]	= '<input type="hidden" id="#HTMLEditFormat(element)#" name="#HTMLEditFormat(element)#" value="#HTMLEditFormat(StructFind(vars, element))#">'>
		<cfset i				= i + 1>
	</cfloop>
	<cfreturn ArrayToList(hiddens_array, #Chr(10)#)>
</cffunction>

<cffunction name="csrf_valid_ref">
	<cfargument name="ref">
	<cfargument name="dest">
	<cfset var lsObj = CreateObject("component", Application.SERVICE_ADDRESS & ".table_lms_setting")>
	<cfset var urls = ArrayNew(1)>
	<cfset var tmp = 0>
	<cfset var is_correct = false>

	<cfif ref eq "">
		<cfset urls = ListToArray(lsObj.get_value("csrf.accesible_urls_without_ref"), Chr(13) & Chr(10))>
		<cfloop index="i" from="1" to="#ArrayLen(urls)#">
			<cfset is_correct = (urls[i] eq dest) or is_correct>
		</cfloop>
	<cfelse>
		<cfset urls = ListToArray(lsObj.get_value("csrf.ref_urls"), Chr(13) & Chr(10))>
		<cfloop index="i" from="1" to="#ArrayLen(urls)#">
			<cfset tmp = REFind("^" & urls[i], ref)>
			<cfset is_correct = (tmp eq 1) or is_correct>
		</cfloop>
	</cfif>

	<cfreturn is_correct>
</cffunction>

<cffunction name="csrf_redirect">
	<cfargument name="ref">
	<cfargument name="dest">
	<cfif not csrf_valid_ref(ref, dest)>
		<cflog file="csrf" type="error" text="referrer:#ref#;access_to=#dest#">
		<cflocation url="#lsObj.get_value("csrf.redirect_to")#" addToken="no">
	</cfif>
</cffunction>

<!--- カレンダーのヘッダー情報取得 --->
<cffunction name="make_month_calendar_header">

	<cfset str_table = '<tr><th style="width: 12.5%" class="sun">' & Session.termObj.get_term('eLM_user_cal_sunday') & '</th>'>
	<cfset str_table = str_table & '<th style="width: 12.5%" class="day">' & Session.termObj.get_term('eLM_user_cal_monday') & '</th>'>
	<cfset str_table = str_table & '<th style="width: 12.5%" class="day">' & Session.termObj.get_term('eLM_user_cal_tuesday') & '</th>'>
	<cfset str_table = str_table & '<th style="width: 12.5%" class="day">' & Session.termObj.get_term('eLM_user_cal_wednesday') & '</th>'>
	<cfset str_table = str_table & '<th style="width: 12.5%" class="day">' & Session.termObj.get_term('eLM_user_cal_thursday') & '</th>'>
	<cfset str_table = str_table & '<th style="width: 12.5%" class="day">' & Session.termObj.get_term('eLM_user_cal_friday') & '</th>'>
	<cfset str_table = str_table & '<th style="width: 12.5%" class="sat">' & Session.termObj.get_term('eLM_user_cal_saturday') & '</th></tr>'>

	<cfreturn str_table>

</cffunction>

<!--- 該当月のカレンダーの開始日を算出 --->
<cffunction name="get_first_day_of_month_cal">
	<cfargument name="show_date" required="yes">

	<cfif IsDate(show_date) >
		<cfset the_date = show_date >
	<cfelse>
		<cfset the_date = Now() >
	</cfif>

	<!--- 表示月の開始日を算出 --->
	<cfset first_day_of_this_month = CreateDate(Year(the_date),Month(the_date),'01') >

	<!--- 該当月のカレンダーの開始日を算出 --->
	<cfset first_day_of_this_cal = DateAdd('d', -(DayOfWeek(first_day_of_this_month) - 1), first_day_of_this_month) >

	<cfreturn first_day_of_this_cal>

</cffunction>

<!--- 該当月のカレンダーの最後日を算出 --->
<cffunction name="get_end_day_of_month_cal">
	<cfargument name="show_date" required="yes">

	<cfif IsDate(show_date) >
		<cfset the_date = show_date >
	<cfelse>
		<cfset the_date = Now() >
	</cfif>

	<!--- 表示月の最後日を算出 --->
	<cfset first_day_of_next_month = CreateDate(Year(DateAdd('m', 1, the_date)), Month(DateAdd('m', 1, the_date)),'01') >
	<cfset end_day_of_this_month = DateAdd('d', -1, first_day_of_next_month) >

	<!--- 該当月のカレンダーの最後日を算出 --->
	<cfset end_day_of_this_cal = DateAdd('d', +(8 - DayOfWeek(end_day_of_this_month)), end_day_of_this_month) >

	<cfreturn end_day_of_this_cal>

</cffunction>

<!--- 表示日の設定 --->
<cffunction name="set_day_class">
	<cfargument name="show_date" required="yes">
	<cfargument name="holiday_struct" type="struct" required="yes">

	<cfif DateCompare(DateFormat(Now(),"yyyy/mm/dd"), DateFormat(show_date,"yyyy/mm/dd")) EQ 0>
		<cfset str = '<td class="now-num">' >
	<cfelse>
		<cfif (DayOfWeek(now_day) EQ 1) || structKeyExists(holiday_struct, show_date)>
			<cfset str ='<td class="sun-num">' >
		<cfelseif DayOfWeek(now_day) EQ 7>
			<cfset str = '<td class="sat-num">' >
		<cfelse>
			<cfset str = '<td class="mon-num">' >
		</cfif>
	</cfif>

	<!--- 月／日 表示 --->
	<cfset str = str & DateFormat(show_date,"m/d") >

	<cfreturn str>

</cffunction>

<!--- 祝日情報取得 --->
<cffunction name="get_holiday_struct">
	<cfargument name="show_date" required="yes">

	<cfquery name="get_holiday_list" username="#application.DUN#" password="#application.DUP#" datasource="#Application.dsn#">
		select holiday_date, holiday_name from HOLIDAY_MASTER where status = 0 order by holiday_date
	</cfquery>

	<cfset holiday_struct = structNew()>
	<cfloop query="get_holiday_list">
		<cfset tname = get_holiday_list.holiday_name>
		<cfset holiday_struct[CreateDate(DateFormat(show_date, "yyyy"), DateFormat(get_holiday_list.holiday_date, "mm"), DateFormat(get_holiday_list.holiday_date, "dd"))] = tname>
	</cfloop>

	<cfreturn holiday_struct>

</cffunction>

<!--- コピーライトに現在年を設定する --->
<cffunction name="set_now_year">
	<cfargument name="copy_right_str" required="yes">

	<cfset var ret = "">
	<cfset var pos = "">
	<cfset var obj = "">

	<cfset pos = Find("-", copy_right_str)>
	<cfset obj = Mid(copy_right_str, pos + 1, 4)>
	<cfset ret = Replace(copy_right_str, obj,  dateformat(now() , "yyyy"))>

	<cfreturn ret>

</cffunction>

<!--- USER_AGENT によってSPとPCの切り分け --->
<cffunction name="sp_redirect">

	<cfset var cgi_hua = #CGI.HTTP_USER_AGENT#>
	<cfset var cgi_sn = #CGI.SCRIPT_NAME#>
	<cfset var cgi_cqs = #CGI.QUERY_STRING#>
	<cfset var re_url = "" >
	<cfset var is_sp = 0>
	<cfset var sp_ary =  ListToArray(lsObj.get_value("user_sp.list"), ",") >

	<!--- USER_AGENTにスマホキーワードをヒントしたら --->
	<cfloop index="j" from="1" to="#ArrayLen(sp_ary)#">
		<cfif REFindNoCase(sp_ary[j], cgi_hua) >
			<cfset is_sp = 1>
		</cfif>
	</cfloop>

	<cfif is_sp eq 1>
		<!--- スマホからアクセスした場合 --->

		<cfset chk_url = del_extra_slash("/" & UPPER_FOLDER & "/" & eLM_FOLDER & '/sp/frameset.cfm')>
		<cfset location_url = application.eLM_URL & '/sp/frameset.cfm'>
		<cfif lsObj.get_value('customer_name') eq 'keyence'>
			<cfset location_url = application.eLM_URL & '/sp/logout_frameload.cfm'>
		</cfif>

		<cfif findNoCase("user", cgi_sn)>
			<cfif cookie.elm_from_sp eq 0>
				<cfif cgi_cqs eq "">
					<cfset re_url = re_url & Replace(cgi_sn, "user/", "sp/")>
				<cfelse>
					<cfset re_url = re_url & Replace(cgi_sn, "user/", "sp/") & "?" & cgi_cqs>
				</cfif>
				<cflocation url= "#re_url#">
			<cfelse>
				<cfset chk_url = del_extra_slash("/" & UPPER_FOLDER & "/" & eLM_FOLDER & '/user/frameset.cfm')>
				<cfset location_url = application.eLM_URL & '/user/frameset.cfm'>
				<cfif lsObj.get_value('customer_name') eq 'keyence'>
					<cfset location_url = application.eLM_URL & '/user/logout_frameload.cfm'>
				</cfif>
			</cfif>
		</cfif>

	<cfelse>
		<!--- PCからアクセスした場合 --->

		<cfset chk_url = del_extra_slash("/" & UPPER_FOLDER & "/" & eLM_FOLDER & '/user/frameset.cfm')>
		<cfset location_url = application.eLM_URL & '/user/frameset.cfm'>
		<cfif lsObj.get_value('customer_name') eq 'keyence'>
			<cfset location_url = application.eLM_URL & '/user/logout_frameload.cfm'>
		</cfif>

		<cfif findNoCase("sp", cgi_sn)>
			<cfif cgi_cqs eq "">
				<cfset re_url = re_url & Replace(cgi_sn, "sp/", "user/")>
			<cfelse>
				<cfset re_url = re_url & Replace(cgi_sn, "sp/", "user/") & "?" & cgi_cqs>
			</cfif>
			<cflocation url= "#re_url#">
		</cfif>

	</cfif>
</cffunction>

<!--- 教材のURLから動画教材かどうかを判断 --->
<cffunction name="is_movie_sco">
	<cfargument name="sco_url" required="yes">

	<cfset var ret = 0>
	<cfset var movie_keyword = lsObj.get_value("MOVIE_UPLOAD.USE")>

	<cfif findNoCase(movie_keyword, sco_url)>
		<cfset ret = 1>
	</cfif>

	<cfreturn ret>

</cffunction>

<!--- 動画視聴詳細履歴のLRSリンクに暗号キー作成 --->
<cffunction name="make_lrs_movie_key">
	<cfargument name="uid" required="yes">
	<cfargument name="sid" required="yes">
	<cfargument name="lec" required="yes">

	<cfset var str = "">
	<cfset str = arguments.uid & "_" & arguments.sid & "_"  & arguments.lec & "_" & lsObj.get_value("LRS.COMMON_KEY")>

	<cfreturn hash(str, lsObj.get_value("LRS.KEY_ENC_CODE"))>

</cffunction>

<!--- SPかどうか判別 --->
<cffunction name="is_sp">
        <cfset var cgi_hua = #CGI.HTTP_USER_AGENT#>
        <cfset var is_sp = 0>
        <cfset var sp_ary =  ListToArray(lsObj.get_value("user_sp.list"), ",") >

        <!--- USER_AGENTにスマホキーワードをヒントしたら --->
        <cfloop index="j" from="1" to="#ArrayLen(sp_ary)#">
                <cfif REFindNoCase(sp_ary[j], cgi_hua) >
                        <cfset is_sp = 1>
                </cfif>
        </cfloop>

        <cfreturn is_sp>
</cffunction>
