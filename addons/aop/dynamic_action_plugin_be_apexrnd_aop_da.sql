set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.4.00.12'
,p_default_workspace_id=>36378915130075744
,p_default_application_id=>232
,p_default_owner=>'APEXOFFICEPRINT'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/be_apexrnd_aop_da
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(871611474419502909)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'BE.APEXRND.AOP_DA'
,p_display_name=>'APEX Office Print (AOP)'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_render_function=>'aop_api2_pkg.f_render_aop'
,p_ajax_function=>'aop_api2_pkg.f_ajax_aop'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'APEX Office Print (AOP) was created by APEX R&D to facilitate printing documents in Oracle Application Express (APEX) based on an Office document (Word, Excel or Powerpoint).',
'This plugin can only be used to print to AOP and is copyrighted by APEX R&D. If you have any questions please contact support@apexofficeprint.com.',
'We hope you enjoy AOP!'))
,p_version_identifier=>'2.4'
,p_about_url=>'https://www.apexofficeprint.com'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(871627982664848805)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>1000
,p_prompt=>'AOP URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'http://www.apexofficeprint.com/api/'
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'URL to APEX Office Print server. <br/>',
'When installed on the same server as the database using the default port you can use http://localhost:8010/ <br/>',
'To use AOP as a service, you can use http(s)://www.apexofficeprint.com/api/ <br/>',
'When using HTTPS, make sure to add the certificate to the wallet of your database. Alternatively you can setup a proxy rule in your webserver to do the HTTPS handshaking so the AOP plugin can call a local url. Instructions how to setup both options c'
||'an be found in the documentation.<br/>',
'When running AOP on the Oracle Cloud (Schema service) you are obliged to use HTTPS, so the url should be https://www.apexofficeprint.com/api/'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(758444766102884098)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>2000
,p_prompt=>'API key'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>30
,p_max_length=>50
,p_is_translatable=>false
,p_help_text=>'Enter your API key found on your account when you login at https://www.apexofficeprint.com.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(458258699512362258)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>3
,p_display_sequence=>3000
,p_prompt=>'Debug'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(758444766102884098)
,p_depending_on_condition_type=>'NOT_NULL'
,p_lov_type=>'STATIC'
,p_null_text=>'No'
,p_help_text=>'By default debug is turned off.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(458266166185363648)
,p_plugin_attribute_id=>wwv_flow_api.id(458258699512362258)
,p_display_sequence=>10
,p_display_value=>'Remote'
,p_return_value=>'Yes'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Enabling remote debug will capture the JSON and is made available in your dashboard at https://www.apexofficeprint.com.',
'This makes it easier to debug your JSON, check if it''s valid and contact us in case you need support.',
'This option only works when you use http(s)://www.apexofficeprint.com/api in your AOP settings.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(204507345216388831)
,p_plugin_attribute_id=>wwv_flow_api.id(458258699512362258)
,p_display_sequence=>20
,p_display_value=>'Local'
,p_return_value=>'Local'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Enabling local debug will download the JSON that is sent to the AOP server component. ',
'This makes it easier to debug your JSON, check if it''s valid and contact us in case you need support.',
'Note that the output file will not be produced and the server will never be called.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(461146085877546065)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>4
,p_display_sequence=>4000
,p_prompt=>'Converter'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(871627982664848805)
,p_depending_on_condition_type=>'NOT_IN_LIST'
,p_depending_on_expression=>'http://apexofficeprint.com/api/,http://www.apexofficeprint.com/api/,https://www.apexofficeprint.com/api/'
,p_lov_type=>'STATIC'
,p_null_text=>'LibreOffice'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'To transform an Office document to PDF, APEX Office Print is using an external converter.',
'By default LibreOffice is used, but you can select another converter on request.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(461168519543573113)
,p_plugin_attribute_id=>wwv_flow_api.id(461146085877546065)
,p_display_sequence=>10
,p_display_value=>'MS Office (Windows only)'
,p_return_value=>'officetopdf'
,p_help_text=>'Uses Microsoft Office to do the conversion and following module http://officetopdf.codeplex.com'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(461168968704576292)
,p_plugin_attribute_id=>wwv_flow_api.id(461146085877546065)
,p_display_sequence=>20
,p_display_value=>'Abiword (Linux only)'
,p_return_value=>'abiword'
,p_help_text=>'Uses http://www.abiword.org'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(871629093638874004)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>23
,p_prompt=>'Data Source'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(835022693277906041)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'URL'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<pre>',
'select ',
'  ''file1'' as filename,  ',
'  cursor( ',
'    select',
'      c.cust_first_name, ',
'      c.cust_last_name, ',
'      c.cust_city, ',
'      cursor(select o.order_total, ''Order '' || rownum as order_name,',
'                cursor(select p.product_name, i.quantity, i.unit_price, APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as image ',
'                         from demo_order_items i, demo_product_info p ',
'                        where o.order_id = i.order_id ',
'                          and i.product_id = p.product_id ',
'                      ) product                 ',
'               from demo_orders o ',
'              where c.customer_id = o.customer_id ',
'            ) orders ',
'    from demo_customers c ',
'    where customer_id = :id ',
'  ) as data ',
'from dual ',
'</pre>'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'Create a new REST web service with a GET, source type "Query" and format "JSON".<br/>',
'Here''s an example of a query which contains a parameter too:',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(330734020729635939)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>27
,p_prompt=>'Special'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(835022693277906041)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'SQL,IR'
,p_lov_type=>'STATIC'
,p_help_text=>'Specific features of APEX Office Print'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(330755117330638523)
,p_plugin_attribute_id=>wwv_flow_api.id(330734020729635939)
,p_display_sequence=>10
,p_display_value=>'Treat all numbers as strings'
,p_return_value=>'NUMBER_TO_STRING'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'There''s a limitation in APEX with the cursor() statement in SQL that it doesn''t remember which datatype the column is in. So when doing to_char(0.9,''990D00'') it will return 0.9 as number instead of as string ''0.90''. To resolve this, enable this check'
||'box and concatenate your number with ''!FMT!'' e.g. ''!FMT!''||to_char(35, ''990D00'') - !FMT! stands for format.',
'</p>',
'<p>',
'Alternatively if you format your number with the currency sign to_char(35,''FML990D00'') Oracle will recognise it as a string and you don''t need to use this checkbox.',
'</p>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(330755426768640001)
,p_plugin_attribute_id=>wwv_flow_api.id(330734020729635939)
,p_display_sequence=>20
,p_display_value=>'Report as Labels'
,p_return_value=>'REPORT_AS_LABELS'
,p_help_text=>'Check this box in case you want to use the Classic or Interactive Report data source but print them as Labels (using the Mailings feature in Word).'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(388869584664002517)
,p_plugin_attribute_id=>wwv_flow_api.id(330734020729635939)
,p_display_sequence=>30
,p_display_value=>'IR: Show Filters on top'
,p_return_value=>'FILTERS_ON_TOP'
,p_help_text=>'When there''re filters applied to the Interactive Report, this checkbox will print them above the report.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(388893469056006231)
,p_plugin_attribute_id=>wwv_flow_api.id(330734020729635939)
,p_display_sequence=>40
,p_display_value=>'IR: Show Highlights on top'
,p_return_value=>'HIGHLIGHTS_ON_TOP'
,p_help_text=>'When there''re highlights applied to the Interactive Report, this checkbox will print them above the report.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(394840201775124300)
,p_plugin_attribute_id=>wwv_flow_api.id(330734020729635939)
,p_display_sequence=>50
,p_display_value=>'IR: Show header with filter (Excel)'
,p_return_value=>'HEADER_WITH_FILTER'
,p_help_text=>'When exporting the Interactive Report to Excel, show the header with filter option.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(399804491543007017)
,p_plugin_attribute_id=>wwv_flow_api.id(330734020729635939)
,p_display_sequence=>60
,p_display_value=>'IR: Use Saved Report instead of Report in Session'
,p_return_value=>'ALWAYS_REPORT_ALIAS'
,p_help_text=>'When defining the Interactive Report source ir1|my_saved_report, the "my_saved_report" will be used, even when the person is looking at a different report in his session session.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(201140414156663459)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Init PL/SQL Code'
,p_attribute_type=>'PLSQL'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<pre>',
'aop_api2_pkg.g_output_filename       := ''output'';',
'aop_api2_pkg. g_rpt_header_font_size := ''12'';',
'</pre>'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'You can define global variables of the aop_api2_pkg in this area.<br/>',
'</p>',
'Available variables:',
'<pre>',
'-- Global variables',
'g_output_filename         varchar2(100) := null;',
'g_language                varchar2(2)   := ''en'';  -- Language can be: en, fr, nl, de',
'g_rpt_header_font_name    varchar2(50)  := '''';    -- Arial - see https://www.microsoft.com/typography/Fonts/product.aspx?PID=163',
'g_rpt_header_font_size    varchar2(3)   := '''';    -- 14',
'g_rpt_header_font_color   varchar2(50)  := '''';    -- #071626',
'g_rpt_header_back_color   varchar2(50)  := '''';    -- #FAFAFA',
'g_rpt_header_border_width varchar2(50)  := '''';    -- 1 ; ''0'' = no border',
'g_rpt_header_border_color varchar2(50)  := '''';    -- #000000',
'g_rpt_data_font_name      varchar2(50)  := '''';    -- Arial - see https://www.microsoft.com/typography/Fonts/product.aspx?PID=163',
'g_rpt_data_font_size      varchar2(3)   := '''';    -- 14',
'g_rpt_data_font_color     varchar2(50)  := '''';    -- #000000',
'g_rpt_data_back_color     varchar2(50)  := '''';    -- #FFFFFF',
'g_rpt_data_border_width   varchar2(50)  := '''';    -- 1 ; ''0'' = no border ',
'g_rpt_data_border_color   varchar2(50)  := '''';    -- #000000',
'g_rpt_data_alt_row_color  varchar2(50)  := '''';    -- #FFFFFF for no alt row color, use same color as g_rpt_data_back_color',
'</pre>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(871653189287838477)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>31
,p_prompt=>'Output Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'docx'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(871653786268839903)
,p_plugin_attribute_id=>wwv_flow_api.id(871653189287838477)
,p_display_sequence=>10
,p_display_value=>'docx'
,p_return_value=>'docx'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(871654579151843153)
,p_plugin_attribute_id=>wwv_flow_api.id(871653189287838477)
,p_display_sequence=>20
,p_display_value=>'xlsx'
,p_return_value=>'xlsx'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(871654978289843617)
,p_plugin_attribute_id=>wwv_flow_api.id(871653189287838477)
,p_display_sequence=>30
,p_display_value=>'pptx'
,p_return_value=>'pptx'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(871655377210844150)
,p_plugin_attribute_id=>wwv_flow_api.id(871653189287838477)
,p_display_sequence=>40
,p_display_value=>'pdf'
,p_return_value=>'pdf'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(871655776348844541)
,p_plugin_attribute_id=>wwv_flow_api.id(871653189287838477)
,p_display_sequence=>50
,p_display_value=>'rtf'
,p_return_value=>'rtf'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(871656175269845012)
,p_plugin_attribute_id=>wwv_flow_api.id(871653189287838477)
,p_display_sequence=>60
,p_display_value=>'html'
,p_return_value=>'html'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(871783604536766405)
,p_plugin_attribute_id=>wwv_flow_api.id(871653189287838477)
,p_display_sequence=>70
,p_display_value=>'Defined by APEX Item'
,p_return_value=>'apex_item'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(835022693277906041)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>20
,p_prompt=>'Data Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'SQL'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(799672387584451941)
,p_plugin_attribute_id=>wwv_flow_api.id(835022693277906041)
,p_display_sequence=>10
,p_display_value=>'SQL'
,p_return_value=>'SQL'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Enter a select statement in which you can use a cursor to do nested records. Use "" as alias for column names to force lower case column names.<br/>',
'Note that you can use bind variables e.g. :PXX_ITEM.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(388554088552704497)
,p_plugin_attribute_id=>wwv_flow_api.id(835022693277906041)
,p_display_sequence=>15
,p_display_value=>'PL/SQL Function (returning SQL)'
,p_return_value=>'PLSQL_SQL'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Enter a PL/SQL procedure that returns as select statement in which you can use a cursor to do nested records. Use "" as alias for column names to force lower case column names.<br/>',
'Note that you can use bind variables e.g. :PXX_ITEM.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(835023688748908163)
,p_plugin_attribute_id=>wwv_flow_api.id(835022693277906041)
,p_display_sequence=>20
,p_display_value=>'PL/SQL Function (returning JSON)'
,p_return_value=>'PLSQL'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Return JSON as defined in the URL example above.',
'(see example in help of Data Source)'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(835023290689907199)
,p_plugin_attribute_id=>wwv_flow_api.id(835022693277906041)
,p_display_sequence=>30
,p_display_value=>'URL (returning JSON)'
,p_return_value=>'URL'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'The Source should point to a URL that returns a JSON object with following format:',
'{',
'  "filename": "file1",',
'  "data":[{...}]',
'}',
'If the URL is using an APEX/ORDS REST call it will automatically be wrapped with additional JSON: {"items":[...]} This is ok as the plugin removes it for you.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(665703823212327638)
,p_plugin_attribute_id=>wwv_flow_api.id(835022693277906041)
,p_display_sequence=>40
,p_display_value=>'Classic and/or Interactive Report(s)'
,p_return_value=>'IR'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(799637234456196557)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>10
,p_prompt=>'Template Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'AOP Template'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'<b>AOP Template</b>: will generate a Word document with a starting template based on the data (JSON) that is submitted. <br/>',
'Documentation is also added on the next page(s) that describe the functions AOP will understand.',
'</p>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(758185409424624058)
,p_plugin_attribute_id=>wwv_flow_api.id(799637234456196557)
,p_display_sequence=>5
,p_display_value=>'Static Application Files'
,p_return_value=>'APEX'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Enter the filename of the file uploaded to your Shared Components > Static Application Files<br/>',
'e.g. aop_template_d01.docx'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(645792387773287822)
,p_plugin_attribute_id=>wwv_flow_api.id(799637234456196557)
,p_display_sequence=>7
,p_display_value=>'Static Workspace Files'
,p_return_value=>'WORKSPACE'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Enter the filename of the file uploaded to your Shared Components > Static Workspace Files<br/>',
'e.g. aop_template_d01.docx'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(799639787850197258)
,p_plugin_attribute_id=>wwv_flow_api.id(799637234456196557)
,p_display_sequence=>10
,p_display_value=>'SQL'
,p_return_value=>'SQL'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Query that returns two columns: template_type and file (in this order) <br/>',
'- template_type: docx,xlsx,pptx <br/>',
'- file: blob column'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(799640227387197984)
,p_plugin_attribute_id=>wwv_flow_api.id(799637234456196557)
,p_display_sequence=>20
,p_display_value=>'PL/SQL Function (returning JSON)'
,p_return_value=>'PLSQL'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Return JSON object with following format: ',
'<pre>',
'{',
'  "file":"clob base 64 data",',
'  "template_type":"docx,xlsx,pptx"',
'}',
'</pre>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(799640595961198791)
,p_plugin_attribute_id=>wwv_flow_api.id(799637234456196557)
,p_display_sequence=>30
,p_display_value=>'Filename (with path relative to AOP server)'
,p_return_value=>'FILENAME'
,p_help_text=>'Enter the path and filename of the template which is stored on the same server AOP is running at.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(388370934821250651)
,p_plugin_attribute_id=>wwv_flow_api.id(799637234456196557)
,p_display_sequence=>40
,p_display_value=>'URL (returning file)'
,p_return_value=>'URL'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Enter the url to your template in docx, xlsx or pptx. <br/>',
'e.g. http://apexofficeprint.com/templates/aop_template_d01.docx'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(871782783198761186)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>11
,p_prompt=>'Template Source'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(799637234456196557)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'APEX,WORKSPACE,FILENAME,URL'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'Reference a file in Shared Components > Static Application Files',
'</p>',
'<p>',
'Reference a file on the server. Include the path relative to the AOP executable.',
'</p>',
'<pre>',
'aop_template.docx',
'</pre>'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'The template needs to be base64 encoded. You can use the apex_web_service.blob2clobbase64 package to do this. <br/>',
'Below you find some examples. You can use substitution variables in the select statement.',
'</p>',
'<b>Filename (with path relative to AOP server)</b>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(871784192028772209)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>32
,p_prompt=>'Output Type APEX Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(871653189287838477)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'apex_item'
,p_help_text=>'APEX item that contains the output type. See Output Type help text for valid list of output types.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(699792625408995417)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>12
,p_prompt=>'Template Source'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(799637234456196557)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SQL'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<pre>',
' select template_type, template_blob',
'  from aop_template  ',
' where id = :P1_TEMPLATE_ID ',
'</pre>'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'When you use your own table (or the one that is provided in the sample AOP app) to store the template documents, this select statement might help:',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(699793447184001801)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>13
,p_prompt=>'Template Source'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(799637234456196557)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PLSQL'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'An example where a table is used inside the PL/SQL code:',
'</p>',
'<pre>',
'declare ',
'  l_return        clob; ',
'  l_template      clob; ',
'  l_template_type aop_template.template_type%type; ',
'begin ',
'  select template_type, apex_web_service.blob2clobbase64(template_blob) template ',
'    into l_template_type, l_template ',
'    from aop_template ',
'   where id = :p4_template;',
'',
'  l_return := ''{ "file": "'' || replace(l_template,''"'', ''\u0022'') ',
'              || ''",'' || '' "template_type": "'' || replace(l_template_type,''"'', ''\u0022'') ',
'              || ''" }''; ',
'',
'  return l_return;',
'end;',
'</pre>'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'The JSON format should be file and template_type. You can use substitution variables in the PL/SQL code. <br/>',
'The structure is like this:',
'</p>',
'<pre>',
'declare ',
'  l_return        clob; ',
'begin ',
'  l_return := ''"file": "",'' || ',
'              '' "template_type": "docx"''; ',
'',
'  return l_return; ',
'end;',
'</pre>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(699795999125054051)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>21
,p_prompt=>'Data Source'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(835022693277906041)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SQL'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Details of a customer e.g. for a letter</p>',
'<pre>',
'select',
'    ''file1'' as "filename",',
'    cursor',
'    (select ',
'         c.cust_first_name as "cust_first_name",',
'         c.cust_last_name as "cust_last_name",',
'         c.cust_city as "cust_city"',
'       from demo_customers c',
'      where c.customer_id = 1 ',
'    ) as "data"',
'from dual',
'</pre>',
'',
'<p>List of all customers e.g. to send letter to all</p>',
'<pre>',
'select',
'    ''file1'' as "filename",',
'    cursor',
'    (select ',
'       cursor(select',
'                  c.cust_first_name as "cust_first_name",',
'                  c.cust_last_name as "cust_last_name",',
'                  c.cust_city as "cust_city" ',
'                from demo_customers c) as "customers"',
'       from dual) as "data"',
'from dual ',
'</pre>',
'',
'<p>Details of all orders of a customer e.g. for invoices</p>',
'<pre>',
'select',
'  ''file1'' as "filename", ',
'  cursor(',
'    select',
'      c.cust_first_name as "cust_first_name",',
'      c.cust_last_name as "cust_last_name",',
'      c.cust_city as "cust_city",',
'      cursor(select o.order_total as "order_total", ',
'                    ''Order '' || rownum as "order_name",',
'                cursor(select p.product_name as "product_name", ',
'                              i.quantity as "quantity",',
'                              i.unit_price as "unit_price", APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"',
'                         from demo_order_items i, demo_product_info p',
'                        where o.order_id = i.order_id',
'                          and i.product_id = p.product_id',
'                      ) "product"',
'               from demo_orders o',
'              where c.customer_id = o.customer_id',
'            ) "orders"',
'    from demo_customers c',
'    where customer_id = 1',
'  ) as "data"',
'from dual',
'</pre>',
'',
'<p>Example of a SQL statement for a Column Chart</p>',
'<pre>',
'select',
'    ''file1'' as "filename",',
'    cursor(select',
'        cursor(select',
'            c.cust_first_name || '' '' || c.cust_last_name as "customer",',
'            c.cust_city                                  as "city"    ,',
'            o.order_total                                as "total"   ,',
'            o.order_timestamp                            as "timestamp"',
'          from demo_customers c, demo_orders o',
'          where c.customer_id = o.customer_id',
'          order by c.cust_first_name || '' '' || c.cust_last_name     ',
'        ) as "orders",',
'        cursor(select',
'            ''column'' as "type",',
'           ''My Column Chart'' as "name",   ',
'            cursor',
'            (select',
'                576     as "width" ,',
'                336     as "height",',
'                ''Title'' as "title in chart" ,',
'                ''true''  as "grid"  ,',
'                ''true''  as "border"',
'              from dual',
'            ) as "options",',
'            cursor(select',
'                ''column'' as "name",',
'                cursor',
'                (select',
'                    c.cust_first_name || '' '' || c.cust_last_name as "x",',
'                    sum(o.order_total)                           as "y"',
'                  from demo_customers c, demo_orders o',
'                  where c.customer_id = o.customer_id',
'                  group by c.cust_first_name || '' '' || c.cust_last_name',
'                 order by c.cust_first_name || '' '' || c.cust_last_name',
'                ) as "data"',
'              from dual) as "columns"',
'          from dual) as "chart"',
'      from dual) as "data"',
'  from dual ',
'</pre>'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'A SQL statement is the easiest to use, but some complex statements might not run.<br/>',
'Images need to be base64 encoded. You can reference items by using :ITEM ',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(699796448694058397)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>22
,p_prompt=>'Data Source'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(835022693277906041)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PLSQL,PLSQL_SQL'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<pre>',
'declare',
'  l_cursor sys_refcursor;',
'  l_return clob;',
'begin',
'  apex_json.initialize_clob_output(dbms_lob.call, true, 2) ;',
'  open l_cursor for ',
'  select ''file1'' as "filename",',
'  cursor',
'    (select',
'        c.cust_first_name as "cust_first_name",',
'        c.cust_last_name  as "cust_last_name" ,',
'        c.cust_city       as "cust_city"      ,',
'        cursor',
'        (select',
'            o.order_total      as "order_total",',
'            ''Order '' || rownum as "order_name" ,',
'            cursor',
'            (select',
'                p.product_name                                    as "product_name",',
'                i.quantity                                        as "quantity"    ,',
'                i.unit_price                                      as "unit_price"  ,',
'                apex_web_service.blob2clobbase64(p.product_image) as "image"',
'              from',
'                demo_order_items i,',
'                demo_product_info p',
'              where',
'                o.order_id       = i.order_id',
'                and i.product_id = p.product_id',
'            ) "product"',
'        from',
'          demo_orders o',
'        where',
'          c.customer_id = o.customer_id',
'        ) "orders"',
'      from',
'        demo_customers c',
'      where',
'        customer_id = :P4_CUSTOMER_ID',
'    ) as "data" ',
'  from dual;',
'  apex_json.write(l_cursor) ;',
'  l_return := apex_json.get_clob_output;',
'  return l_return;',
'end;',
'</pre>'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'By using PL/SQL to create your own JSON, you''re more flexible. You can use bind variables and page items.',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(665927063426951185)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>25
,p_prompt=>'Region Static Id(s)'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(835022693277906041)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'IR'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'Define one or more Static Id(s) of the report region. Static ids should be separated by a comma. e.g. ir1,ir2 <br/>',
'You can set the Static ID of the region in the region attributes.',
'</p>'))
);
end;
/
begin
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(666311896909317341)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_prompt=>'Output To'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Browser'
,p_help_text=>'By default the file that''s generated by AOP, will be downloaded by the Browser and saved on your harddrive.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(666317020009318765)
,p_plugin_attribute_id=>wwv_flow_api.id(666311896909317341)
,p_display_sequence=>10
,p_display_value=>'Procedure'
,p_return_value=>'PROCEDURE'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This option will call a procedure in a specific format. This option is useful in case you don''t need the file on your own harddrive, but for example you want to mail the document automatically.',
'In that case you can create a procedure that adds the generated document as an attachment to your apex_mail.send.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(666317383199320315)
,p_plugin_attribute_id=>wwv_flow_api.id(666311896909317341)
,p_display_sequence=>20
,p_display_value=>'Procedure and Browser'
,p_return_value=>'PROCEDURE_BROWSER'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This option allows you to call a procedure first and next download the file to your harddrive.',
'An example is when you first want to store the generated document in a table before letting the browser to download it.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(666317777720351646)
,p_plugin_id=>wwv_flow_api.id(871611474419502909)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_prompt=>'Procedure Name'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(666311896909317341)
,p_depending_on_condition_type=>'NOT_NULL'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'Create following procedure in the database:',
'</p>',
'<pre>',
'create procedure send_email_prc(',
'    p_output_blob      in blob,',
'    p_output_filename  in varchar2,',
'    p_output_mime_type in varchar2)',
'is',
'  l_id number;',
'begin',
'  l_id := apex_mail.send( ',
'            p_to => ''support@apexofficeprint.com'', ',
'            p_from => ''support@apexofficeprint.com'', ',
'            p_subj => ''Mail from APEX with attachment'', ',
'            p_body => ''Please review the attachment.'', ',
'            p_body_html => ''<b>Please</b> review the attachment.'') ;',
'  apex_mail.add_attachment( ',
'      p_mail_id    => l_id, ',
'      p_attachment => p_output_blob, ',
'      p_filename   => p_output_filename, ',
'      p_mime_type  => p_output_mime_type) ;',
'  commit;    ',
'end send_email_prc;',
'</pre>'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Enter only the procedure name in this field (so without parameters) for example "download_prc".',
'The procedure in the database needs to be structured with the parameters as in the example. ',
'The procedure name can be any name, but the parameters need to match exactly as in the example.',
'You can add other parameters with a default value.'))
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
