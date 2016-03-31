<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<!-------------------head part---------------->
<head lang="en">
	<meta charset="UTF-8">
	<title>VIMMS dashboard</title>
    <script type="text/javascript" src="d3/d3.js" charset="UTF-8"></script>
    <script type="text/javascript" src="ajax.js" charset="UTF-8"></script>
    <link type="text/css" rel="stylesheet" href="dashboard.css">
    <link rel="shortcut icon" href="image/favicon.ico">
</head>
<!------------------body part----------------->
<body>
<!------------------header part--------------->
    <header id="top_header">
        <!-- left side-->
        <span id="LOGO"><span id="LOGO_white">V I</span> M M S</span>
        <!-- right side-->
        <div id="LOGO_table">
            <div id="LOGO_row">
                <div id="LOGO_message" class="LOGO_cell">
                    <img id="top_mes" src="image/top_mes.png" height="24"
                         onmouseover="top_mes_over();" onmouseout="top_mes_out();">
                </div>
                <div id="LOGO_email" class="LOGO_cell">
                    <img id="top_email" src="image/top_email.png" height="24"
                         onmouseover="top_email_over();" onmouseout="top_email_out();">
                </div>
                <div id="LOGO_person" class="LOGO_cell">
                    <span id="person"><%= session.getAttribute("username") %></span>
                </div>
                <div id="LOGO_menu" class="LOGO_cell">
                    <img id="top_menu" src="image/top_menu.png" height="24"
                         onmouseover="top_menu_over();" onmouseout="top_menu_out();">
                </div>
            </div>
        </div>
    </header>
<!----------------navigator part------------------>
<div id="navigator">
    <div id="navi_ul">
        <!-- menu part-->
        <div id="none">
            <img id="none_img" src="image/nav_menu.png" height="24">
        </div>
        <!-- search part-->
        <div id="search">
            <input type="text" id="input_search" placeholder="Search...">
            <img src="image/nav_search.png" height="12">
        </div>
        <!-- user resources part-->
        <div id="resources">
            <div id="DashBoard" class="resources_row"
                onclick="toDbLocation();">
                <div class="resources_cell cell_img"><img src="image/nav_home.png" class="nav_img" height="24"></div>
                <div class="resources_cell cell_word">Dashboard</div>
                <div class="resources_cell cell_res"><</div>
            </div>
            <div id="VM1" class="resources_row"
                 onclick="toVmLocation('1');">
                <div class="resources_cell cell_img"><img src="image/nav_data_pm.png"  class="nav_img" height="24"></div>
                <div id="navname_vm1" class="resources_cell cell_word">PM1 <img id="status_vm1" src="image/halted.png" height="12"></div>
                <div class="resources_cell cell_res"><</div>
            </div>
            <div id="VM2" class="resources_row"  style="background-color: rgb(47,50,58)"
                 onclick="toVmLocation('2');">
                <div class="resources_cell cell_img"><img src="image/nav_data_pm.png"  class="nav_img" height="24"></div>
                <div id="navname_vm2" class="resources_cell cell_word"style="color: rgb(28,168,221)">PM2 <img id="status_vm2" src="image/halted.png" height="12"></div>
                <div class="resources_cell cell_res"><</div>
            </div>
            <div id="VM3" class="resources_row"
                 onclick="toVmLocation('3');">
                <div class="resources_cell cell_img"><img src="image/nav_data_vm.png"  class="nav_img" height="24"></div>
                <div id="navname_vm3" class="resources_cell cell_word">VM1 <img id="status_vm3" src="image/halted.png" height="12"></div>
                <div class="resources_cell cell_res"><</div>
            </div>
            <div id="VM4" class="resources_row"
                 onclick="toVmLocation('4');">
                <div class="resources_cell cell_img"><img src="image/nav_data_vm.png"  class="nav_img" height="24"></div>
                <div id="navname_vm4" class="resources_cell cell_word">VM2 <img id="status_vm4" src="image/halted.png" height="12"></div>
                <div class="resources_cell cell_res"><</div>
            </div>

        </div>
    </div>
</div>
<!---------------------------panel part--------------------------->
<div id="PANEL">
    <div id="PANEL_outline">
        <!-- --------------------header----------------------------------->
        <header id="PANEL_header">
            <span id="PANEL_header_word">PM2</span>
            <span id="PANEL_header_word2">statistics and more</span>
            <img src="image/panel_config.png" id="PANEL_header_img">
        </header>
        <!-- ------------------------navigator------------------------->
        <div id="PANEL_navigator">
            <span id="PANEL_nav_path">
                <img src="image/panel_home.png" id="PANEL_path_img" height="16">
                <span id="PANEL_path_word">Home  >  PM2</span>
            </span>
            <span id="PANEL_calendar">
                <img src="image/panel_calendar.png" id="PANEL_cal_img" height="16">
                <span id="PANEL_cal_word">Date</span>
                <img src="image/panel_cal_down.png" id="PANEL_cal_img2" height="16">
            </span>

        </div>

        <!-- ---------------------chart table----------------------------------->
        <div id="PANEL_chart">

                <div id="secondrow_chart1" class="secondrow_cell">
                    <svg id="chart_cpu">
                        <defs>
                            <linearGradient id="grad0" x1="0%" y1="0%" x2="0%" y2="100%">
                                <stop offset="0%" style="stop-color:rgb(23,142,187);stop-opacity:1" />
                                <stop offset="100%" style="stop-color:rgb(63,185,231);stop-opacity:1" />
                            </linearGradient>
                        </defs>
                    </svg>
                </div>
                <div id="secondrow_chart2" class="secondrow_cell">
                    <svg id="chart_mem">
                        <defs>
                            <linearGradient id="grad1" x1="0%" y1="0%" x2="0%" y2="100%">
                                <stop offset="0%" style="stop-color:rgb(50,17,181);stop-opacity:1" />
                                <stop offset="100%" style="stop-color:rgb(147,123,242);stop-opacity:1" />

                            </linearGradient>
                        </defs>
                    </svg>
                </div>
                <div id="secondrow_chart3" class="secondrow_cell">
                    <svg id="chart_net">
                        <defs>
                            <linearGradient id="grad2" x1="0%" y1="0%" x2="0%" y2="100%">
                                <stop offset="0%" style="stop-color:rgb(255,0,0);stop-opacity:1" />
                                <stop offset="100%" style="stop-color:rgb(241,124,103);stop-opacity:1" />
                            </linearGradient>
                        </defs>
                    </svg>
                </div>
                <div id="secondrow_chart4" class="secondrow_cell">
                    <svg id="chart_net_rx">
                        <defs>
                            <linearGradient id="grad3" x1="0%" y1="0%" x2="0%" y2="100%">
                                <stop offset="0%" style="stop-color:rgb(1,104,188);stop-opacity:1" />
                                <stop offset="100%" style="stop-color:rgb(88,196,255);stop-opacity:1" />
                            </linearGradient>
                        </defs>
                    </svg>
                </div>


        </div>
    </div>

</div>

<script type="text/javascript">
//-----------------------------hover process----------------------------------------
    function top_mes_over(){
        document.getElementById("top_mes").src = "image/top_mes2.png";
    }

    function top_mes_out(){

        document.getElementById("top_mes").src = "image/top_mes.png";
    }

    function top_email_over(){
        document.getElementById("top_email").src = "image/top_email2.png";
    }

    function top_email_out(){

        document.getElementById("top_email").src = "image/top_email.png";
    }


    function top_menu_over(){
        document.getElementById("top_menu").src = "image/top_menu2.png";
    }

    function top_menu_out(){

        document.getElementById("top_menu").src = "image/top_menu.png";
    }


//---------ajax for getting status task



var jVM1_name = "";
var jVM1_status = "";
var jVM2_name = "";
var jVM2_status = "";
var jPM1_name = "";
var jPM1_status = "";
var jPM2_name = "";
var jPM2_status = "";
var jTime = "";

var statusQueue = [];

var xmlhttp3 = CreateXHR();
xmlhttp3.open("GET","/STATUSget",true);
xmlhttp3.send();

xmlhttp3.onreadystatechange = function(){
    if(xmlhttp3.readyState == 4 && xmlhttp3.status == 200){
        var getedJSON = xmlhttp3.responseText;
        var obj = JSON.parse(getedJSON);



        jVM1_name = obj.vm1_name;
        jVM1_status = obj.vm1_status;
        jVM2_name = obj.vm2_name;
        jVM2_status = obj.vm2_status;
        jPM1_name = obj.pm1_name;
        jPM1_status =  obj.pm1_status;
        jPM2_name =  obj.pm2_name;
        jPM2_status =  obj.pm2_status;
        jTime = obj.time_now;

        statusQueue.push(jPM1_status);
        statusQueue.push(jPM2_status);
        statusQueue.push(jVM1_status);
        statusQueue.push(jVM2_status);

        document.getElementById("navname_vm1").firstChild.nodeValue = jPM1_name+" ";
        document.getElementById("navname_vm2").firstChild.nodeValue = jPM2_name+" ";
        document.getElementById("navname_vm3").firstChild.nodeValue = jVM1_name+" ";
        document.getElementById("navname_vm4").firstChild.nodeValue = jVM2_name+" ";

        document.getElementById("PANEL_header_word").innerText = jPM2_name;
        document.getElementById("PANEL_path_word").innerText = "Home  >  "+jPM2_name;

        document.getElementById("PANEL_cal_word").innerText = jTime;

        for(var i = 1;i<=4;i++){
            if((statusQueue[i-1] == "halted")||(statusQueue[i-1] == "unknow")){

                document.getElementById("status_vm"+i).src = "image/halted.png";

            }else if(statusQueue[i-1] == "running"){

                document.getElementById("status_vm"+i).src = "image/running.png";

            }else{

            }
        }



    }
}

function toDbLocation(){
	var jsPost = function(action, values) {
	    var id = Math.random();
	    document.write('<form id="post' + id + '" name="post'+ id +'" action="' + action + '" method="post">');
	    for (var key in values) {
	        document.write('<input type="hidden" name="' + key + '" value="' + values[key] + '" />');
	    }
	    document.write('</form>');    
	    document.getElementById('post' + id).submit();
	}
	 
	jsPost('Machines.do', {
	    'machines': 'dashboard.jsp'
	});
}

function toVmLocation(locationNumber){
    if((statusQueue[locationNumber-1] == "halted")||(statusQueue[locationNumber-1] == "unknow")){
        alert("Sorry, the panel is Not Running");
    }else if(statusQueue[locationNumber-1] == "running") {
        //window.location.href = "VM" + locationNumber + ".html";
    	var jsPost = function(action, values) {
    	    var id = Math.random();
    	    document.write('<form id="post' + id + '" name="post'+ id +'" action="' + action + '" method="post">');
    	    for (var key in values) {
    	        document.write('<input type="hidden" name="' + key + '" value="' + values[key] + '" />');
    	    }
    	    document.write('</form>');    
    	    document.getElementById('post' + id).submit();
    	}
    	 
    	jsPost('Machines.do', {
    	    'machines': 'VM' + locationNumber + '.jsp'
    	});
    }else{
        alert("status error");
    }
}

//---------------------chart cpu----------------------------------------------------
var padding = 40;
var head_height = 20;
var chart1_title = "CPU performance";
var chart1_subtitle = "%";
var chartm_title = "Mem performance";
var chartm_subtitle = "%";
var chartn_title = "Network transferred ";
var chartn_subtitle = "kps";
var chartrx_title = "Network received ";
var chartrx_subtitle = "kps";
var foot_height = 50;

var xmlhttp;
var receJSON1 = [];
var receCpu0 = [];
var receCpu1 = [];
var receCpu2 = [];
var receCpu3 = [];
var receMem1 = [];
var receNetwork1 = [];
var receNetworkrx = [];
var receTime1 = [];
var receID1 = [];
var receAmount;
var finalTime = 0;

var ajaxReq = new AjaxRequest();
var xmlhttp2;
var lineNames=["cpu0","cpu1","cpu2","cpu3"]; //保存系列名称
var lineColor=["rgb(28,168,221)","rgb(106,73,237)","#FF4040","rgb(0,122,225)"];
var lineNamesm=["Memory"];
var lineColorm=["rgb(106,73,237)"];
var lineNamesn=["Net tx"];
var lineColorn=["#FF4040"];
var lineNamesrx=["Net rx"];
var lineColorrx=["rgb(0,122,225)"];

var dataset = [];
var dataset1 = [];
var dataset2 = [];
var dataset3 = [];
var xMarks = [];
var datasetm = [];
var xMarksm = [];
var datasetn = [];
var xMarksn = [];
var datasetrx = [];
var xMarksrx = [];
var w = 500;
var h = 225;

var highestValue = 0;


//create data

getData();
//-----------------------------for cpu chart
//create svg

var svg = d3.select("#chart_cpu")
    .attr("width",w)
    .attr("height",h);

//add background
svg.append("g")
    .append("rect")
    .attr("x",0)
    .attr("y",0)
    .attr("width",w)
    .attr("height",h)
    .style("fill","rgb(47,50,58)")
    .style("stroke-width",1)
    .style("stroke","rgb(47,50,58)");

//add titles

if(chart1_title != ""){
    svg.append("g")
        .append("text")
        .text(chart1_title)
        .attr("class","chart1_title")
        .attr("x",w/2)
        .attr("y",head_height);

}

if(chart1_subtitle != ""){
    svg.append("g")
        .append("text")
        .text(chart1_subtitle)
        .attr("class","chart1_subtitle")
        .attr("x",20)
        .attr("y",20);

}


//add scaleor

var xScale = d3.scale.linear()
    .domain([0,dataset.length-1])
    .range([padding,w-padding]);

var yScale = d3.scale.linear()
    .domain([0,1])
    .range([h-foot_height,padding]);

//define inner line

var xInner = d3.svg.axis()
    .scale(xScale)
    .tickSize(-(h-padding-foot_height),0,0)
    .orient("bottom")
    .ticks(dataset.length);

svg.append("g")
    .attr("class","chart1_inner_line")
    .attr("transform","translate(0,"+(h-foot_height)+")")
    .call(xInner)
    .selectAll("text")
    .text("");

var yInner = d3.svg.axis()
    .scale(yScale)
    .tickSize(-(w-padding*2),0,0)
    .tickFormat("")
    .orient("left")
    .ticks(10);

svg.append("g")
    .attr("class","chart1_inner_line")
    .attr("transform","translate("+padding+",0)")
    .call(yInner);


//define axis

var xAxis = d3.svg.axis()
    .scale(xScale)
    .orient("bottom")
    .ticks(dataset.length);

//define axis bar

var xBar = svg.append("g")
    .attr("class","axis")
    .attr("transform","translate(0,"+(h-foot_height)+")")
    .call(xAxis)
    .selectAll("text")
    .text(function(d){
        return xMarks[d];
    });


//define y axis
var yAxis = d3.svg.axis()
    .scale(yScale)
    .orient("left")
    .ticks(10);

//define axis bar

var yBar = svg.append("g")
    .attr("class","axis")
    .attr("transform","translate("+padding+",0)")
    .call(yAxis);

//add legend

var legend=svg.append("g");
addLegend();


//添加图例
function addLegend()
{
    var textGroup=legend.selectAll("text")
        .data(lineNames);
    textGroup.exit().remove();
    legend.selectAll("text")
        .data(lineNames)
        .enter()
        .append("text")
        .text(function(d){return d;})
        .attr("class","legend")
        .attr("x", function(d,i) {return i*100;})
        .attr("y",0)
        .attr("fill",function(d,i){ return lineColor[i];});
    var rectGroup=legend.selectAll("rect")
        .data(lineNames);
    rectGroup.exit().remove();
    legend.selectAll("rect")
        .data(lineNames)
        .enter()
        .append("rect")
        .attr("x", function(d,i) {return i*100-20;})
        .attr("y",-10)
        .attr("width",12)
        .attr("height",12)
        .attr("fill",function(d,i){ return lineColor[i];});
    legend.attr("transform","translate("+((w-lineNames.length*100)/2)+","+(h-10)+")");
}



//add lines

var lineFunction = d3.svg.line()
    .interpolate("linear")
    .x(function(d,i){
        return xScale(i);
    })
    .y(function(d){
        return yScale(d);
    });

//add polyline


var path = svg.append("path")
    .attr("d",lineFunction(dataset)+" L "+(w-padding)+","+(h-foot_height)+" L "+padding+","+(h-foot_height))
    .attr("class","thepath")
    .style("fill","url(#grad0)")
    .style("fill-opacity",0.2)
    .style("stroke-width",1)
    .style("stroke",lineColor[0])
    .style("stroke-opacity",0.8);


var path2 = svg.append("path")
    .attr("d",lineFunction(dataset1)+" L "+(w-padding)+","+(h-foot_height)+" L "+padding+","+(h-foot_height))
    .attr("class","thepath")
    .style("fill","url(#grad1)")
    .style("fill-opacity",0.2)
    .style("stroke-width",1)
    .style("stroke",lineColor[1])
    .style("stroke-opacity",0.8);

var path3 = svg.append("path")
    .attr("d",lineFunction(dataset2)+" L "+(w-padding)+","+(h-foot_height)+" L "+padding+","+(h-foot_height))
    .attr("class","thepath")
    .style("fill","url(#grad2)")
    .style("fill-opacity",0.2)
    .style("stroke-width",1)
    .style("stroke",lineColor[2])
    .style("stroke-opacity",0.8);

var path4 = svg.append("path")
    .attr("d",lineFunction(dataset3)+" L "+(w-padding)+","+(h-foot_height)+" L "+padding+","+(h-foot_height))
    .attr("class","thepath")
    .style("fill","url(#grad3)")
    .style("fill-opacity",0.2)
    .style("stroke-width",1)
    .style("stroke",lineColor[3])
    .style("stroke-opacity",0.8);

//-----------------------------for cpu chart end-----------------


//-----------------------------for mem chart------------------------
//create svg

var svg_m = d3.select("#chart_mem")
    .attr("width",w)
    .attr("height",h);

//add background
svg_m.append("g")
    .append("rect")
    .attr("x",0)
    .attr("y",0)
    .attr("width",w)
    .attr("height",h)
    .style("fill","rgb(47,50,58)")
    .style("stroke-width",2)
    .style("stroke","rgb(47,50,58)");

//add titles

if(chartm_title != ""){
    svg_m.append("g")
        .append("text")
        .text(chartm_title)
        .attr("class","chart1_title")
        .attr("x",w/2)
        .attr("y",head_height);

}

if(chartm_subtitle != ""){
    svg_m.append("g")
        .append("text")
        .text(chartm_subtitle)
        .attr("class","chart1_subtitle")
        .attr("x",20)
        .attr("y",20);

}


//add scaleor

var xScalem = d3.scale.linear()
    .domain([0,datasetm.length-1])
    .range([padding,w-padding]);

var yScalem = d3.scale.linear()
    .domain([0,10])
    .range([h-foot_height,padding]);

//define inner line

var xInnerm = d3.svg.axis()
    .scale(xScalem)
    .tickSize(-(h-padding-foot_height),0,0)
    .orient("bottom")
    .ticks(datasetm.length);


svg_m.append("g")
    .attr("class","chart1_inner_line")
    .attr("transform","translate(0,"+(h-foot_height)+")")
    .call(xInnerm)
    .selectAll("text")
    .text("");

var yInnerm = d3.svg.axis()
    .scale(yScalem)
    .tickSize(-(w-padding*2),0,0)
    .tickFormat("")
    .orient("left")
    .ticks(10);

svg_m.append("g")
    .attr("class","chart1_inner_line")
    .attr("transform","translate("+padding+",0)")
    .call(yInnerm);


//define axis

var xAxism = d3.svg.axis()
    .scale(xScalem)
    .orient("bottom")
    .ticks(datasetm.length);

//define axis bar

var xBarm = svg_m.append("g")
    .attr("class","axis")
    .attr("transform","translate(0,"+(h-foot_height)+")")
    .call(xAxism)
    .selectAll("text")
    .text(function(d){
        return xMarksm[d];
    });


//define y axis
var yAxism = d3.svg.axis()
    .scale(yScalem)
    .orient("left")
    .ticks(10);

//define axis bar

var yBarm = svg_m.append("g")
    .attr("class","axis")
    .attr("transform","translate("+padding+",0)")
    .call(yAxism);


var legendm=svg_m.append("g");
addLegendm();


//添加图例
function addLegendm()
{
    var textGroup=legendm.selectAll("text")
        .data(lineNamesm);
    textGroup.exit().remove();
    legendm.selectAll("text")
        .data(lineNamesm)
        .enter()
        .append("text")
        .text(function(d){return d;})
        .attr("class","legend")
        .attr("x", function(d,i) {return i*100;})
        .attr("y",0)
        .attr("fill",function(d,i){ return lineColorm[i];});
    var rectGroup=legendm.selectAll("rect")
        .data(lineNamesm);
    rectGroup.exit().remove();
    legendm.selectAll("rect")
        .data(lineNamesm)
        .enter()
        .append("rect")
        .attr("x", function(d,i) {return i*100-20;})
        .attr("y",-10)
        .attr("width",12)
        .attr("height",12)
        .attr("fill",function(d,i){ return lineColorm[i];});
    legendm.attr("transform","translate("+((w-lineNamesm.length*100)/2)+","+(h-10)+")");
}



//add lines


var lineFunctionm = d3.svg.line()
    .interpolate("linear")
    .x(function(d,i){
        return xScalem(i);
    })
    .y(function(d){
        return yScalem(d);
    });

//add polyline


var pathm = svg_m.append("path")
    .attr("d",lineFunctionm(datasetm)+" L "+(w-padding)+","+(h-foot_height)+" L "+padding+","+(h-foot_height))
    .attr("class","thepath")
    .style("fill","url(#grad1)")
    .style("fill-opacity",0.6)
    .style("stroke-width",1)
    .style("stroke",lineColorm[0])
    .style("stroke-opacity",0.6);

//-----------------------------for mem chart end-----------------



//-----------------------------for network chart------------------------
//create svg

var svg_n = d3.select("#chart_net")
    .attr("width",w)
    .attr("height",h);

//add background
svg_n.append("g")
    .append("rect")
    .attr("x",0)
    .attr("y",0)
    .attr("width",w)
    .attr("height",h)
    .style("fill","rgb(47,50,58)")
    .style("stroke-width",2)
    .style("stroke","rgb(47,50,58)");

//add titles

if(chartn_title != ""){
    svg_n.append("g")
        .append("text")
        .text(chartn_title)
        .attr("class","chart1_title")
        .attr("x",w/2)
        .attr("y",head_height);

}

var chartsubn;
if(chartn_subtitle != ""){
    chartsubn = svg_n.append("g")
        .append("text")
        .text(chartn_subtitle)
        .attr("class","chart1_subtitle")
        .attr("x",20)
        .attr("y",20);

}


//add scaleor

var xScalen = d3.scale.linear()
    .domain([0,datasetn.length-1])
    .range([padding,w-padding]);

var yScalen = d3.scale.linear()
    .domain([0,100])
    .range([h-foot_height,padding]);

//define inner line

var xInnern = d3.svg.axis()
    .scale(xScalen)
    .tickSize(-(h-padding-foot_height),0,0)
    .orient("bottom")
    .ticks(datasetn.length);


svg_n.append("g")
    .attr("class","chart1_inner_line")
    .attr("transform","translate(0,"+(h-foot_height)+")")
    .call(xInnern)
    .selectAll("text")
    .text("");

var yInnern = d3.svg.axis()
    .scale(yScalen)
    .tickSize(-(w-padding*2),0,0)
    .tickFormat("")
    .orient("left")
    .ticks(10);

svg_n.append("g")
    .attr("class","chart1_inner_line")
    .attr("transform","translate("+padding+",0)")
    .call(yInnern);


//define axis

var xAxisn = d3.svg.axis()
    .scale(xScalen)
    .orient("bottom")
    .ticks(datasetn.length);

//define axis bar

var xBarn = svg_n.append("g")
    .attr("class","axis")
    .attr("transform","translate(0,"+(h-foot_height)+")")
    .call(xAxisn)
    .selectAll("text")
    .text(function(d){
        return xMarksn[d];
    });


//define y axis
var yAxisn = d3.svg.axis()
    .scale(yScalen)
    .orient("left")
    .ticks(10);

//define axis bar

var yBarn = svg_n.append("g")
    .attr("class","axis")
    .attr("transform","translate("+padding+",0)")
    .call(yAxisn);


var legendn=svg_n.append("g");
addLegendn();


//添加图例
function addLegendn()
{
    var textGroup=legendn.selectAll("text")
        .data(lineNamesn);
    textGroup.exit().remove();
    legendn.selectAll("text")
        .data(lineNamesn)
        .enter()
        .append("text")
        .text(function(d){return d;})
        .attr("class","legend")
        .attr("x", function(d,i) {return i*100;})
        .attr("y",0)
        .attr("fill",function(d,i){ return lineColorn[i];});
    var rectGroup=legendn.selectAll("rect")
        .data(lineNamesn);
    rectGroup.exit().remove();
    legendn.selectAll("rect")
        .data(lineNamesn)
        .enter()
        .append("rect")
        .attr("x", function(d,i) {return i*100-20;})
        .attr("y",-10)
        .attr("width",12)
        .attr("height",12)
        .attr("fill",function(d,i){ return lineColorn[i];});
    legendn.attr("transform","translate("+((w-lineNamesn.length*100)/2)+","+(h-10)+")");
}


//add lines


var lineFunctionn = d3.svg.line()
    .interpolate("linear")
    .x(function(d,i){
        return xScalen(i);
    })
    .y(function(d){
        return yScalen(d);
    });

//add polyline


var pathn = svg_n.append("path")
    .attr("d",lineFunctionn(datasetn)+" L "+(w-padding)+","+(h-foot_height)+" L "+padding+","+(h-foot_height))
    .attr("class","thepath")
    .style("fill","url(#grad2)")
    .style("fill-opacity",0.6)
    .style("stroke-width",1)
    .style("stroke",lineColorn[0])
    .style("stroke-opacity",0.6);

//-----------------------------for network chart end-----------------


//-----------------------------for network rx chart------------------------
//create svg

var svg_rx = d3.select("#chart_net_rx")
    .attr("width",w)
    .attr("height",h);

//add background
svg_rx.append("g")
    .append("rect")
    .attr("x",0)
    .attr("y",0)
    .attr("width",w)
    .attr("height",h)
    .style("fill","rgb(47,50,58)")
    .style("stroke-width",2)
    .style("stroke","rgb(47,50,58)");

//add titles

if(chartrx_title != ""){
    svg_rx.append("g")
        .append("text")
        .text(chartrx_title)
        .attr("class","chart1_title")
        .attr("x",w/2)
        .attr("y",head_height);

}

var chartsubrx;
if(chartrx_subtitle != ""){
    chartsubrx = svg_rx.append("g")
        .append("text")
        .text(chartrx_subtitle)
        .attr("class","chart1_subtitle")
        .attr("x",20)
        .attr("y",20);

}


//add scaleor

var xScalerx = d3.scale.linear()
    .domain([0,datasetrx.length-1])
    .range([padding,w-padding]);

var yScalerx = d3.scale.linear()
    .domain([0,100])
    .range([h-foot_height,padding]);

//define inner line

var xInnerrx = d3.svg.axis()
    .scale(xScalerx)
    .tickSize(-(h-padding-foot_height),0,0)
    .orient("bottom")
    .ticks(datasetrx.length);


svg_rx.append("g")
    .attr("class","chart1_inner_line")
    .attr("transform","translate(0,"+(h-foot_height)+")")
    .call(xInnerrx)
    .selectAll("text")
    .text("");

var yInnerrx = d3.svg.axis()
    .scale(yScalerx)
    .tickSize(-(w-padding*2),0,0)
    .tickFormat("")
    .orient("left")
    .ticks(10);

svg_rx.append("g")
    .attr("class","chart1_inner_line")
    .attr("transform","translate("+padding+",0)")
    .call(yInnerrx);


//define axis

var xAxisrx = d3.svg.axis()
    .scale(xScalerx)
    .orient("bottom")
    .ticks(datasetrx.length);

//define axis bar

var xBarrx = svg_rx.append("g")
    .attr("class","axis")
    .attr("transform","translate(0,"+(h-foot_height)+")")
    .call(xAxisrx)
    .selectAll("text")
    .text(function(d){
        return xMarksrx[d];
    });


//define y axis
var yAxisrx = d3.svg.axis()
    .scale(yScalerx)
    .orient("left")
    .ticks(10);

//define axis bar

var yBarrx = svg_rx.append("g")
    .attr("class","axis")
    .attr("transform","translate("+padding+",0)")
    .call(yAxisrx);


var legendrx=svg_rx.append("g");
addLegendrx();


//添加图例
function addLegendrx()
{
    var textGroup=legendrx.selectAll("text")
        .data(lineNamesrx);
    textGroup.exit().remove();
    legendrx.selectAll("text")
        .data(lineNamesrx)
        .enter()
        .append("text")
        .text(function(d){return d;})
        .attr("class","legend")
        .attr("x", function(d,i) {return i*100;})
        .attr("y",0)
        .attr("fill",function(d,i){ return lineColorrx[i];});
    var rectGroup=legendrx.selectAll("rect")
        .data(lineNamesrx);
    rectGroup.exit().remove();
    legendrx.selectAll("rect")
        .data(lineNamesrx)
        .enter()
        .append("rect")
        .attr("x", function(d,i) {return i*100-20;})
        .attr("y",-10)
        .attr("width",12)
        .attr("height",12)
        .attr("fill",function(d,i){ return lineColorrx[i];});
    legendrx.attr("transform","translate("+((w-lineNamesrx.length*100)/2)+","+(h-10)+")");
}


//add lines


var lineFunctionrx = d3.svg.line()
    .interpolate("linear")
    .x(function(d,i){
        return xScalerx(i);
    })
    .y(function(d){
        return yScalerx(d);
    });

//add polyline


var pathrx = svg_rx.append("path")
    .attr("d",lineFunctionrx(datasetrx)+" L "+(w-padding)+","+(h-foot_height)+" L "+padding+","+(h-foot_height))
    .attr("class","thepath")
    .style("fill","url(#grad3)")
    .style("fill-opacity",0.6)
    .style("stroke-width",1)
    .style("stroke",lineColorrx[0])
    .style("stroke-opacity",0.6);

//-----------------------------for network rx chart end-----------------



//add point
/*
svg.selectAll("circle")
    .data(dataset)
    .enter()
    .append("circle")
    .attr("cx",function(d,i){
        return xScale(i);
    })
    .attr("cy",function(d){
        return yScale(d);
    })
    .attr("r",5)
    .attr("fill","green");
*/


var timeNum;

function getData(){
    var dataNum = 40;
    dataset = [];
    dataset1 = [];
    dataset2 = [];
    dataset3 = [];
    xMarks = [];
    datasetm = [];
    xMarksm = [];
    datasetn = [];
    xMarksn = [];
    datasetrx = [];
    xMarksrx = [];

    for(var i = 1;i<dataNum;i++){
        //dataset.push(Math.round(Math.random()*h));
        dataset.push(0);
        dataset1.push(0);
        dataset2.push(0);
        dataset3.push(0);
        xMarks.push("");
        datasetm.push(0);
        xMarksm.push("");
        datasetn.push(0);
        xMarksn.push("");
        datasetrx.push(0);
        xMarksrx.push("");
        timeNum = 0;
    }

}

function changeData(){


    for(var i = 0;i<receAmount;i++){
        dataset.shift();
        dataset1.shift();
        dataset2.shift();
        dataset3.shift();
        datasetm.shift();
        datasetn.shift();
        datasetrx.shift();
        //dataset.push(Math.round(Math.random()*h));
        dataset.push(parseFloat(receCpu0[i].cpu0));
        dataset1.push(parseFloat(receCpu1[i].cpu1));
        dataset2.push(parseFloat(receCpu2[i].cpu2));
        dataset3.push(parseFloat(receCpu3[i].cpu3));
        datasetm.push(parseFloat(receMem1[i].mem));
        datasetn.push(parseFloat(receNetwork1[i].network));
        datasetrx.push(parseFloat(receNetworkrx[i].network_rx));
        finalTime = receTime1[i].timestamp;

        //alert(finalTime);
        xMarks.shift();
        xMarksm.shift();
        xMarksn.shift();
        xMarksrx.shift();
        if(receID1[i].ID % 5 == 0){
            var newDate = new Date();
            newDate.setTime(receTime1[i].timestamp);
            xMarks.push(newDate.getHours()+":"+newDate.getMinutes()+":"+newDate.getSeconds());
            xMarksm.push(newDate.getHours()+":"+newDate.getMinutes()+":"+newDate.getSeconds());
            xMarksn.push(newDate.getHours()+":"+newDate.getMinutes()+":"+newDate.getSeconds());
            xMarksrx.push(newDate.getHours()+":"+newDate.getMinutes()+":"+newDate.getSeconds());

        }else{
            xMarks.push("");
            xMarksm.push("");
            xMarksn.push("");
            xMarksrx.push("");
        }
    }


}

function drawChart() {


    changeData();


    //yScale = d3.scale.linear()
    //		.domain([0, d3.max(dataset)])
    //		.range([h - padding, padding]);


    //----------------------------for cpu chart----------------------------
    if((Math.max.apply(Math,dataset) >=10)||
        (Math.max.apply(Math,dataset1) >=10)||
        (Math.max.apply(Math,dataset2) >=10)||
        (Math.max.apply(Math,dataset3) >=10)){

        yScale = d3.scale.linear()
            .domain([0,100])
            .range([h-foot_height,padding]);

    }else if((Math.max.apply(Math,dataset) >=1)||
        (Math.max.apply(Math,dataset1) >=1)||
        (Math.max.apply(Math,dataset2) >=1)||
        (Math.max.apply(Math,dataset3) >=1)){

        yScale = d3.scale.linear()
            .domain([0,10])
            .range([h-foot_height,padding]);
    }else{
        yScale = d3.scale.linear()
            .domain([0,1])
            .range([h-foot_height,padding]);
    }

    yAxis = d3.svg.axis()
        .scale(yScale)
        .orient("left")
        .ticks(10);

    xScale = d3.scale.linear()
        .domain([0,dataset.length-1])
        .range([padding,w-padding]);

    xAxis = d3.svg.axis()
        .scale(xScale)
        .orient("bottom")
        .ticks(dataset.length);

    xBar.transition()
        .duration(2000)
        .text(function(d){

                return xMarks[d];


        })
        .call(xAxis);

    yBar.transition()
        .duration(2000)
        .call(yAxis);

    path//.transition()
        //.duration(1000)
        .attr("d", lineFunction(dataset)+" L "+(w-padding)+","+(h-foot_height)+" L "+padding+","+(h-foot_height));
    path2//.transition()
        //.duration(1000)
        .attr("d", lineFunction(dataset1)+" L "+(w-padding)+","+(h-foot_height)+" L "+padding+","+(h-foot_height));
    path3//.transition()
        //.duration(1000)
        .attr("d", lineFunction(dataset2)+" L "+(w-padding)+","+(h-foot_height)+" L "+padding+","+(h-foot_height));
    path4//.transition()
        //.duration(1000)
        .attr("d", lineFunction(dataset3)+" L "+(w-padding)+","+(h-foot_height)+" L "+padding+","+(h-foot_height));



    //--------------------------------for cpu chart end--------------------------


    //----------------------------for mem chart----------------------------
    if(Math.max.apply(Math,datasetm) >=10){

        yScalem = d3.scale.linear()
            .domain([0,100])
            .range([h-foot_height,padding]);

    }else{

        yScalem = d3.scale.linear()
            .domain([0,10])
            .range([h-foot_height,padding]);
    }

    yAxism = d3.svg.axis()
        .scale(yScalem)
        .orient("left")
        .ticks(10);

    xScalem = d3.scale.linear()
        .domain([0,datasetm.length-1])
        .range([padding,w-padding]);

    xAxism = d3.svg.axis()
        .scale(xScalem)
        .orient("bottom")
        .ticks(datasetm.length);

    xBarm.transition()
        .duration(2000)
        .text(function(d){

            return xMarksm[d];


        })
        .call(xAxism);

    yBarm.transition()
        .duration(2000)
        .call(yAxism);

    pathm//.transition()
        //.duration(1000)
        .attr("d", lineFunctionm(datasetm)+" L "+(w-padding)+","+(h-foot_height)+" L "+padding+","+(h-foot_height));

    //--------------------------------for mem chart end--------------------------

    //----------------------------for network chart----------------------------
    if(Math.max.apply(Math,datasetn) >=100){
        if(Math.max.apply(Math,datasetn) >=10000){
            yScalen = d3.scale.linear()
                .domain([0,100])
                .range([h-foot_height,padding]);
        }else if(Math.max.apply(Math,datasetn) >=1000) {
            yScalen = d3.scale.linear()
                .domain([0, 10])
                .range([h - foot_height, padding]);
        }else{
            yScalen = d3.scale.linear()
                .domain([0,1])
                .range([h-foot_height,padding]);
        }



        yAxisn = d3.svg.axis()
            .scale(yScalen)
            .orient("left")
            .ticks(10);

        xScalen = d3.scale.linear()
            .domain([0,datasetn.length-1])
            .range([padding,w-padding]);

        xAxisn = d3.svg.axis()
            .scale(xScalen)
            .orient("bottom")
            .ticks(datasetn.length);

        xBarn.transition()
            .duration(2000)
            .text(function(d){

                return xMarksn[d];


            })
            .call(xAxisn);

        yBarn.transition()
            .duration(2000)
            .call(yAxisn);

        chartsubn.text("Mps");

        lineFunctionn = d3.svg.line()
            .interpolate("linear")
            .x(function(d,i){
                return xScalen(i);
            })
            .y(function(d){
                return yScalen(d/1000);
            });

        pathn//.transition()
            //.duration(1000)
            .attr("d", lineFunctionn(datasetn)+" L "+(w-padding)+","+(h-foot_height)+" L "+padding+","+(h-foot_height));


    }else{

        if(Math.max.apply(Math,datasetn) >=10){
            yScalen = d3.scale.linear()
                .domain([0,100])
                .range([h-foot_height,padding]);
        }else if(Math.max.apply(Math,datasetn) >=1){
            yScalen = d3.scale.linear()
                .domain([0,10])
                .range([h-foot_height,padding]);}
        else{
            yScalen = d3.scale.linear()
                .domain([0, 1])
                .range([h - foot_height, padding]);
        }

        yAxisn = d3.svg.axis()
            .scale(yScalen)
            .orient("left")
            .ticks(10);

        xScalen = d3.scale.linear()
            .domain([0,datasetn.length-1])
            .range([padding,w-padding]);

        xAxisn = d3.svg.axis()
            .scale(xScalen)
            .orient("bottom")
            .ticks(datasetn.length);

        xBarn.transition()
            .duration(2000)
            .text(function(d){

                return xMarksn[d];


            })
            .call(xAxisn);

        yBarn.transition()
            .duration(2000)
            .call(yAxisn);


        chartsubn.text("kps");


        pathn//.transition()
            //.duration(1000)
            .attr("d", lineFunctionn(datasetn)+" L "+(w-padding)+","+(h-foot_height)+" L "+padding+","+(h-foot_height));
    }


    //--------------------------------for network chart end--------------------------


    //----------------------------for network rx chart----------------------------

    if(Math.max.apply(Math,datasetrx) >=100){
        if(Math.max.apply(Math,datasetrx) >=10000){
            yScalerx = d3.scale.linear()
                .domain([0,100])
                .range([h-foot_height,padding]);
        }else if(Math.max.apply(Math,datasetrx) >=1000) {
            yScalerx = d3.scale.linear()
                .domain([0, 10])
                .range([h - foot_height, padding]);
        }else{
            yScalerx = d3.scale.linear()
                .domain([0,1])
                .range([h-foot_height,padding]);
        }



        yAxisrx = d3.svg.axis()
            .scale(yScalerx)
            .orient("left")
            .ticks(10);

        xScalerx = d3.scale.linear()
            .domain([0,datasetrx.length-1])
            .range([padding,w-padding]);

        xAxisrx = d3.svg.axis()
            .scale(xScalerx)
            .orient("bottom")
            .ticks(datasetrx.length);

        xBarrx.transition()
            .duration(2000)
            .text(function(d){

                return xMarksrx[d];


            })
            .call(xAxisrx);

        yBarrx.transition()
            .duration(2000)
            .call(yAxisrx);

        chartsubrx.text("Mps");

        lineFunctionrx = d3.svg.line()
            .interpolate("linear")
            .x(function(d,i){
                return xScalerx(i);
            })
            .y(function(d){
                return yScalerx(d/1000);
            });

        pathrx//.transition()
            //.duration(1000)
            .attr("d", lineFunctionrx(datasetrx)+" L "+(w-padding)+","+(h-foot_height)+" L "+padding+","+(h-foot_height));


    }else{

        if(Math.max.apply(Math,datasetrx) >=10){
            yScalerx = d3.scale.linear()
                .domain([0,100])
                .range([h-foot_height,padding]);
        }else if(Math.max.apply(Math,datasetrx) >=1){
            yScalerx = d3.scale.linear()
                .domain([0,10])
                .range([h-foot_height,padding]);}
        else{
            yScalerx = d3.scale.linear()
                .domain([0, 1])
                .range([h - foot_height, padding]);
        }

        yAxisrx = d3.svg.axis()
            .scale(yScalerx)
            .orient("left")
            .ticks(10);

        xScalerx = d3.scale.linear()
            .domain([0,datasetrx.length-1])
            .range([padding,w-padding]);

        xAxisrx = d3.svg.axis()
            .scale(xScalerx)
            .orient("bottom")
            .ticks(datasetrx.length);

        xBarrx.transition()
            .duration(2000)
            .text(function(d){

                return xMarksrx[d];


            })
            .call(xAxisrx);

        yBarrx.transition()
            .duration(2000)
            .call(yAxisrx);


        chartsubrx.text("kps");


        pathrx//.transition()
            //.duration(1000)
            .attr("d", lineFunctionrx(datasetrx)+" L "+(w-padding)+","+(h-foot_height)+" L "+padding+","+(h-foot_height));
    }


    //--------------------------------for network rx chart end--------------------------

/*
    svg.selectAll("circle")
        .data(dataset)
        //.transition()
        //.duration(1000)
        .attr("cy", function (d) {
            return yScale(d);
        });*/

}

                   //*********ajax********
function CreateXHR(){
    if (window.XMLHttpRequest)
    {
        //对浏览器 IE7+, Firefox, Chrome, Opera, Safari
        return new XMLHttpRequest();
    }
    else
    {
        //对浏览器 IE6, IE5
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}
/*
xmlhttp = CreateXHR();

xmlhttp.open("GET","/HelloServlet",true);
xmlhttp.send();

xmlhttp.onreadystatechange = function(){
    if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
        var getedJSON = xmlhttp.responseText;
        var obj = JSON.parse(getedJSON);
        receAmount = obj.jamount;

            receNetwork1 = obj.jnetwork1;
            receMem1 = obj.jmem1;
            receCpu1 = obj.jcpu1;
            receTime1 = obj.jtimestamp1;
            receID1 = obj.jID1;



    }

        drawChart();
    }

*/

str = "name=unhand" + "&timestamp=" + finalTime;

CreateXMLHttpRequest();
xmlhttp2.onreadystatechange = callhandle;
//xmlhttp.open("GET","Default.aspx?goback=yes&arg=" + arg,true);
xmlhttp2.open("POST","/HelloServlet",true);

xmlhttp2.setRequestHeader("Content-Length",str.length);
xmlhttp2.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");  //鐢≒OST鐨勬椂鍊欎竴瀹氳鏈夎繖鍙�

xmlhttp2.send(str);


setTimeout(function(){
/*
    xmlhttp = CreateXHR();

    xmlhttp.open("GET","/HelloServlet",true);
    xmlhttp.send();

    xmlhttp.onreadystatechange = function(){
        if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
            var getedJSON = xmlhttp.responseText;
            var obj = JSON.parse(getedJSON);
            receJSON = obj.value;
            drawChart();
        }
    }*/

    xmlhttp3 = CreateXHR();
    xmlhttp3.open("GET","/STATUSget",true);
    xmlhttp3.send();

    xmlhttp3.onreadystatechange = function(){
        if(xmlhttp3.readyState == 4 && xmlhttp3.status == 200){
            var getedJSON = xmlhttp3.responseText;
            var obj = JSON.parse(getedJSON);



            jVM1_name = obj.vm1_name;
            jVM1_status = obj.vm1_status;
            jVM2_name = obj.vm2_name;
            jVM2_status = obj.vm2_status;
            jPM1_name = obj.pm1_name;
            jPM1_status =  obj.pm1_status;
            jPM2_name =  obj.pm2_name;
            jPM2_status =  obj.pm2_status;
            jTime = obj.time_now;


            if((jPM1_status!=statusQueue[0])||
                (jPM2_status!=statusQueue[1])||
                (jVM1_status!=statusQueue[2])||
                (jVM2_status!=statusQueue[3])) {

                statusQueue = [];
                statusQueue.push(jPM1_status);
                statusQueue.push(jPM2_status);
                statusQueue.push(jVM1_status);
                statusQueue.push(jVM2_status);

                document.getElementById("navname_vm1").firstChild.nodeValue = jPM1_name + " ";
                document.getElementById("navname_vm2").firstChild.nodeValue = jPM2_name + " ";
                document.getElementById("navname_vm3").firstChild.nodeValue = jVM1_name + " ";
                document.getElementById("navname_vm4").firstChild.nodeValue = jVM2_name + " ";

                for(var i = 1;i<=4;i++){
                    if((statusQueue[i-1] == "halted")||(statusQueue[i-1] == "unknow")){

                        document.getElementById("status_vm"+i).src = "image/halted.png";

                    }else if(statusQueue[i-1] == "running"){

                        document.getElementById("status_vm"+i).src = "image/running.png";

                    }else{

                    }
                }

            }


        }
    }

    str = "name=unhand" + "&timestamp=" + finalTime;

    CreateXMLHttpRequest();
    xmlhttp2.onreadystatechange = callhandle;
    //xmlhttp.open("GET","Default.aspx?goback=yes&arg=" + arg,true);
    xmlhttp2.open("POST","/HelloServlet",true);

    xmlhttp2.setRequestHeader("Content-Length",str.length);
    xmlhttp2.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");  //鐢≒OST鐨勬椂鍊欎竴瀹氳鏈夎繖鍙�

    xmlhttp2.send(str);



    setTimeout(arguments.callee,5000);
},5000);

function CMD(value){

    alert("cmd");
    var command = value;
    str = "command=" + command;

    CreateXMLHttpRequest();
    xmlhttp2.onreadystatechange = callhandle;
    //xmlhttp.open("GET","Default.aspx?goback=yes&arg=" + arg,true);
    xmlhttp2.open("POST","/CMDinset",true);

    xmlhttp2.setRequestHeader("Content-Length",str.length);
    xmlhttp2.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");  //鐢≒OST鐨勬椂鍊欎竴瀹氳鏈夎繖鍙�

    xmlhttp2.send(str);
}

function CreateXMLHttpRequest()
{
    if (window.ActiveXObject)
    {
        xmlhttp2 = new ActiveXObject("Microsoft.XMLHTTP");
    }
    else if (window.XMLHttpRequest)
    {
        xmlhttp2 = new XMLHttpRequest();
    }
}
function callhandle()
{


    if(xmlhttp2.readyState == 4 && (xmlhttp2.status == 200|| xmlhttp2.status == 0)){
        var getedJSON = xmlhttp2.responseText;
        var obj = JSON.parse(getedJSON);
        receAmount = obj.jamount;

        receNetwork1 = obj.jnetwork1;
        receNetworkrx = obj.jnetwork_rx;
        receMem1 = obj.jmem1;
        receCpu0 = obj.jcpu0;
        receCpu1 = obj.jcpu1;
        receCpu2 = obj.jcpu2;
        receCpu3 = obj.jcpu3;
        receTime1 = obj.jtimestamp1;
        receID1 = obj.jID1;


        drawChart();
    }



}

//---------------------/chart cpu----------------------------------------------------
</script>

</body>
</html>
