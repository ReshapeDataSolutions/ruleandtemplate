

#shinyserver start point----
 shinyServer(function(input, output,session) {
   
   
   
   #preview--------------
   #读取文件
   var_file_expInfo = tsui::var_file(id = 'file_expInfo')
   var_file_expInfo2 = tsui::var_file(id = 'file_expInfo2') 
   shiny::observeEvent(input$btn_preview,{
     
     #code here
     #begin
     #print(input$btn_preview)
     #获取文件名
     file_name = var_file_expInfo()
     #library(readxl)
     #读取excel
     data <- readxl::read_excel(file_name,sheet = "凭证规则表", col_types = c("text", "text", "text", 
                                                                         "text", "text", "text"))
     data=as.data.frame(data)
     data=tsdo::na_standard(data)
   
     #print(data)
     #显示列表
     tsui::run_dataTable2(id = 'dt_expInfo',data = data)
   
     
   })
   
   #更新规则表
   shiny::observeEvent(input$btn_ruleUpdate,{
      
    
      file_name = var_file_expInfo()
      #library(readxl)
      #读取excel
      data <- readxl::read_excel(file_name,sheet = "凭证规则表", col_types = c("text", "text", "text", 
                                                                          "text", "text", "text"))
      data=as.data.frame(data)
      data=tsdo::na_standard(data)
      #上传至数据库至规则暂存表
      tsda::db_writeTable2(token = '057A7F0E-F187-4975-8873-AF71666429AB',table_name = 'rds_hrv_src_rule_voucherInput',r_object = data,append = TRUE)
      #删除规则表已有数据
      spresdSheetpkg::deleteCache_rule()
      #将暂存表数据插入规则表
      spresdSheetpkg::insertCache_rule()
      #删除规则暂存表数据
      spresdSheetpkg::deleteAllcache_rule()
      tsui::pop_notice("规则表更新成功")
      
   })
   
   #模板表预览
   
   shiny::observeEvent(input$btn_preview2,{
      
      #获取文件名
      file_name = var_file_expInfo2()
      #library(readxl)
      #读取excel
      data <- readxl::read_excel(file_name,sheet = "凭证模板表",col_types = c("text", 
                                                                         "text", "text", "numeric", "text", 
                                                                         "text", "text", "numeric", "text", 
                                                                         "text", "numeric", "text", "text", 
                                                                         "numeric", "numeric", "numeric", 
                                                                         "text", "text"))
      data=as.data.frame(data)
      data=tsdo::na_standard(data)
      
      tsui::run_dataTable2(id = 'dt_expInfo2',data = data)
      
      
   })
   
   #更新模板表
   
   shiny::observeEvent(input$btn_templateUpdate,{
      
      
      file_name = var_file_expInfo2()
      data <- readxl::read_excel(file_name,sheet = "凭证模板表",col_types = c("text", 
                                                                         "text", "text", "numeric", "text", 
                                                                         "text", "text", "numeric", "text", 
                                                                         "text", "text", "text", "text", 
                                                                         "text", "numeric", "numeric", 
                                                                         "text", "text"))
      data=as.data.frame(data)
      data=tsdo::na_standard(data)
      #上传至数据库至模板暂存表
      tsda::db_writeTable2(token = '057A7F0E-F187-4975-8873-AF71666429AB',table_name = 'rds_hrv_src_tpl_voucherInput',r_object = data,append = TRUE)
      #删除模板表已有数据
      spresdSheetpkg::deleteCache_template()
      #将暂存表数据插入模板表
      spresdSheetpkg::insertCache_template()
      #删除规则暂存表数据
      spresdSheetpkg::deleteAllcache_template()
      tsui::pop_notice("模板表更新成功")
      
   })
   
   #更新科目
   
   shiny::observeEvent(input$btn_acctUpdate,{
      
      
      file_name = var_file_expInfo3()
      data <- readxl::read_excel(file_name,sheet = "科目", col_types = c("text", 
                                                                                       "text", "text", "numeric", "text", 
                                                                                       "text", "text", "text", "numeric", 
                                                                                       "text", "text", "text", "numeric", 
                                                                                       "text", "text", "text", "text", "text", 
                                                                                       "text", "text"))
      data=as.data.frame(data)
      data=tsdo::na_standard(data)
      #上传至数据库至科目暂存表
      tsda::db_writeTable2(token = '057A7F0E-F187-4975-8873-AF71666429AB',table_name = 'rds_hrv_src_md_acctInput',r_object = data,append = TRUE)
      #删除科目表已有数据
      spresdSheetpkg::deleteCache_acct()
      #将暂存表数据插入科目表
      spresdSheetpkg::insertCache_acct()
      #删除规则暂存表数据
      spresdSheetpkg::deleteAllcache_acct()
      tsui::pop_notice("科目更新成功")
      
   })
   #部门对照
   shiny::observeEvent(input$btn_deptUpdate,{
      
      
      file_name = var_file_expInfo3()
      data <- readxl::read_excel(file_name,sheet = "核算维度-部门对照", 
                                 col_types = c("text", "text", "numeric", 
                                               "text", "text", "text", "text", "text"))
      data=as.data.frame(data)
      data=tsdo::na_standard(data)
      #上传至数据库至部门对照暂存表
      tsda::db_writeTable2(token = '057A7F0E-F187-4975-8873-AF71666429AB',table_name = 'rds_hrv_src_md_deptrInput',r_object = data,append = TRUE)
      #删除部门表已有数据
      spresdSheetpkg::deleteCache_dept()
      #将暂存表数据插入部门表
      spresdSheetpkg::insertCache_dept()
      #删除部门暂存表数据
      spresdSheetpkg::deleteAllcache_dept()
      tsui::pop_notice("部门对照表更新成功")
      
   })
   
   
   #重分类更新
   shiny::observeEvent(input$btn_acctreclassUpdate,{
      
      
      file_name = var_file_expInfo3()
      data <- readxl::read_excel(file_name,
                                 sheet = "核算维度-重分类", col_types = c("numeric", 
                                                                   "text", "text", "text", "text", "text", 
                                                                   "text")
                                 )
      data=as.data.frame(data)
      data=tsdo::na_standard(data)
      #上传至数据库至重分类暂存表
      tsda::db_writeTable2(token = '057A7F0E-F187-4975-8873-AF71666429AB',table_name = 'rds_hrv_src_md_acctreclassInput',r_object = data,append = TRUE)
      #删除重分类已有数据
      spresdSheetpkg::deleteCache_acctreclass()
      #将暂存表数据插入重分类
      spresdSheetpkg::insertCache_acctreclass()
      #删除重分类暂存表数据
      spresdSheetpkg::deleteAllcache_acctreclass()
      tsui::pop_notice("核算维度_重分类更新成功")
      
   })
   #责任中心
   shiny::observeEvent(input$btn_workcenterUpdate,{
      
      
      file_name = var_file_expInfo3()
      data <- readxl::read_excel(file_name,sheet = "核算维度-责任中心", 
                                 col_types = c("numeric", "text", "text", 
                                               "text", "text", "text"))
      data=as.data.frame(data)
      data=tsdo::na_standard(data)
      #上传至数据库至重分类暂存表
      tsda::db_writeTable2(token = '057A7F0E-F187-4975-8873-AF71666429AB',table_name = 'rds_hrv_src_md_workcenterInput',r_object = data,append = TRUE)
      #删除重分类已有数据
      spresdSheetpkg::deleteCache_workcenter()
      #将暂存表数据插入重分类
      spresdSheetpkg::insertCache_workcenter()
      #删除重分类暂存表数据
      spresdSheetpkg::deleteAllcache_workcenter()
      tsui::pop_notice("核算维度_责任中心更新成功")
      
   })
   
   
   #研发项目对照
   shiny::observeEvent(input$btn_rditemUpdate,{
      
      
      file_name = var_file_expInfo3()
      data <- readxl::read_excel(file_name,sheet = "研发项目对照", col_types = c("text", 
                                                                           "text", "text", "text"))
      data=as.data.frame(data)
      data=tsdo::na_standard(data)
      #上传至数据库至研发暂存表
      tsda::db_writeTable2(token = '057A7F0E-F187-4975-8873-AF71666429AB',table_name = 'rds_hrv_src_md_rditemInput',r_object = data,append = TRUE)
      #删除研发已有数据
      spresdSheetpkg::deleteCache_rditem()
      #将暂存表数据插入研发
      spresdSheetpkg::insertCache_rditem()
      #删除研发暂存表数据
      spresdSheetpkg::deleteAllcache_rditem()
      tsui::pop_notice("研发项目对照更新成功")
      
   })
   
  
   
   
  
   
   
  
})
