$(function(){$.ajax({url:"/Dist/rebateTotal",type:"post",dataType:"json",success:function(a){if(1==a.status){var b=a.orderList;$("#ddzs_t").text(b.series_today[6]),$("#ddzs_y").text(b.series_today[5]),$("#chart_ddzs").text("").highcharts({chart:{backgroundColor:"#eee",events:{load:function(){$("#loading_chart_ddzs").hide(),$("#chart_ddzs").show()}}},credits:{enabled:!1},title:{text:null},subtitle:{text:null},xAxis:{categories:b.day},yAxis:{title:{text:null}},series:[{name:"返利笔数",type:"line",color:"#ff9e00",data:b.series_today}]})}else $("#loading_chart_ddzs").hide(),$("#chart_ddzs").css("height","auto").text("暂无数据").show()}}),$.ajax({url:"/Dist/rebateSum",type:"post",dataType:"json",success:function(a){if(1==a.status){var b=a.orderList;$("#fxddzs_t").text(b.series_today[6]),$("#fxddzs_y").text(b.series_today[5]),$("#chart_fxddzs").text("").highcharts({chart:{backgroundColor:"#eee",events:{load:function(){$("#loading_chart_fxddzs").hide(),$("#chart_fxddzs").show()}}},credits:{enabled:!1},title:{text:null},subtitle:{text:null},xAxis:{categories:b.day},yAxis:{title:{text:null}},series:[{name:"返利金额",type:"line",color:"#ff9e00",data:b.series_today}]})}else $("#loading_chart_fxddzs").hide(),$("#chart_fxddzs").css("height","auto").text("暂无数据").show()}})});