<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<!-------------------head part---------------->
<head lang="en">
	<meta charset="UTF-8">
	<title>VIMMS dashboard</title>
    <script type="text/javascript" src="d3/d3.js" charset="UTF-8"></script>
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
            <div id="DashBoard" class="resources_row" style="background-color: rgb(47,50,58)"
                 onclick="toDbLocation();">
                <div class="resources_cell cell_img"><img src="image/nav_home.png" class="nav_img" height="24"></div>
                <div class="resources_cell cell_word"style="color: rgb(28,168,221)">Dashboard
                </div>
                <div class="resources_cell cell_res"><</div>
            </div>
            <div id="VM1" class="resources_row">
                <div class="resources_cell cell_img"><img src="image/nav_data_pm.png"  class="nav_img" height="24"></div>
                <div id="navname_vm1" class="resources_cell cell_word"
                     onclick="toVmLocation('1');">PM1 <img id="status_vm1" src="image/halted.png" height="12"></div>
                <div class="resources_cell cell_res"><</div>
            </div>
            <div id="VM2" class="resources_row">
                <div class="resources_cell cell_img"><img src="image/nav_data_pm.png"  class="nav_img" height="24"></div>
                <div id="navname_vm2" class="resources_cell cell_word"
                     onclick="toVmLocation('2');">PM2 <img id="status_vm2" src="image/halted.png" height="12"></div>
                <div class="resources_cell cell_res"><</div>
            </div>
            <div id="VM3" class="resources_row">
                <div class="resources_cell cell_img"><img src="image/nav_data_vm.png"  class="nav_img" height="24"></div>
                <div id="navname_vm3" class="resources_cell cell_word"
                     onclick="toVmLocation('3');">VM1 <img id="status_vm3" src="image/halted.png" height="12"></div>
                <div class="resources_cell cell_res"><</div>
            </div>
            <div id="VM4" class="resources_row">
                <div class="resources_cell cell_img"><img src="image/nav_data_vm.png"  class="nav_img" height="24"></div>
                <div id="navname_vm4" class="resources_cell cell_word"
                     onclick="toVmLocation('4');">VM2 <img id="status_vm4" src="image/halted.png" height="12"></div>
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
            <span id="PANEL_header_word">DASHBOARD</span>
            <span id="PANEL_header_word2">statistics and more</span>
            <img src="image/panel_config.png" id="PANEL_header_img">
        </header>
        <!-- ------------------------navigator------------------------->
        <div id="PANEL_navigator">
            <span id="PANEL_nav_path">
                <img src="image/panel_home.png" id="PANEL_path_img" height="16">
                <span id="PANEL_path_word">Home  >  Dashboard</span>
            </span>
            <span id="PANEL_calendar">
                <img src="image/panel_calendar.png" id="PANEL_cal_img" height="16">
                <span id="PANEL_cal_word">Dates</span>
                <img src="image/panel_cal_down.png" id="PANEL_cal_img2" height="16">
            </span>

        </div>
        <!------------------------ data table------------------------------>
        <div id="PANEL_data">

            <!-- VM3-->
            <div id="PANEL_VM3" class="firstrow_cell">
                <div id="PANEL_VM3_up" class="panel_up">
                    <img src="image/panel_data_vm.png" id="data_vm3_img" class="data_vm_img"
                         onclick="toVmLocation('3');">
                        <span id="panel_vm3_word" class="panel_word">
                            <span id="panel_vm3_bigword" class="panel_bigword">STATUS</span><br>
                            <span id="panel_vm3_smallword" class="panel_smallword">Reading...</span>
                        </span>
                        <span id="panel_vm3_name" class="panel_name"
                              onclick="toVmLocation('3');">VM1</span>
                </div>
                <div id="PANEL_VM3_down" class="panel_down">
                    <nav class="nav">
                        <ul class="nav_menu">
                            <li   id="nav_menu_3" class="nav_menu-item"><a  target="_blank">Control<img src="image/data_right.png" class="data_right_img"></a>
                                <ul id="nav_submenu_3" class="nav_submenu">
                                    <li class="nav_submenu-item"> <a onclick="CMD('pause','VM1');" target="_blank">Pause</a></li>
                                    <li class="nav_submenu-item"> <a  onclick="CMD('resume','VM1');" target="_blank">Resume</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- VM4-->
            <div id="PANEL_VM4" class="firstrow_cell">
                <div id="PANEL_VM4_up" class="panel_up">
                    <img src="image/panel_data_vm.png" id="data_vm4_img" class="data_vm_img"
                         onclick="toVmLocation('4');">
                        <span id="panel_vm4_word" class="panel_word">
                            <span id="panel_vm4_bigword" class="panel_bigword">STATUS</span><br>
                            <span id="panel_vm4_smallword" class="panel_smallword">Reading...</span>
                        </span>
                        <span id="panel_vm4_name" class="panel_name"
                              onclick="toVmLocation('4');">VM2</span>
                </div>
                <div id="PANEL_VM4_down" class="panel_down">
                    <nav class="nav">
                        <ul class="nav_menu">
                            <li  id="nav_menu_4" class="nav_menu-item"><a  target="_blank">Control<img src="image/data_right.png" class="data_right_img"></a>
                                <ul id="nav_submenu_4" class="nav_submenu">
                                    <li class="nav_submenu-item"> <a onclick="CMD('pause','VM2');" target="_blank">Pause</a></li>
                                    <li class="nav_submenu-item"> <a  onclick="CMD('resume','VM2');" target="_blank">Resume</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
                <!-- VM1-->
                <div id="PANEL_VM1" class="firstrow_cell">
                    <div id="PANEL_VM1_up" class="panel_up">
                        <img src="image/panel_data_pm.png" id="data_vm1_img" class="data_vm_img"
                             onclick="toVmLocation('1');">
                        <span id="panel_vm1_word" class="panel_word">
                            <span id="panel_vm1_bigword" class="panel_bigword">STATUS</span><br>
                            <span id="panel_vm1_smallword" class="panel_smallword">Reading...</span>
                        </span>
                        <span id="panel_vm1_name" class="panel_name"
                              onclick="toVmLocation('1');">PM1</span>
                    </div>
                    <div id="PANEL_VM1_down" class="panel_down">
                        <!--<span id="panel_vm1_downword" class="panel_downword">View more</span>-->
                        <nav class="nav">
                            <ul class="nav_menu">
                                <li class="nav_menu-item"><a  target="_blank">Control<img src="image/data_right.png" class="data_right_img"></a>

                                </li>
                                </ul>
                        </nav>
                        <!--<img src="image/data_right.png" class="data_right_img">-->
                    </div>
                </div>
                <!-- VM2-->
                <div id="PANEL_VM2" class="firstrow_cell">
                    <div id="PANEL_VM2_up" class="panel_up">
                        <img src="image/panel_data_pm.png" id="data_vm2_img" class="data_vm_img"
                            onclick="toVmLocation('2');">
                        <span id="panel_vm2_word" class="panel_word">
                            <span id="panel_vm2_bigword" class="panel_bigword">STATUS</span><br>
                            <span id="panel_vm2_smallword" class="panel_smallword">Reading...</span>
                        </span>
                        <span id="panel_vm2_name" class="panel_name"
                              onclick="toVmLocation('2');">PM2</span>
                    </div>
                    <div id="PANEL_VM2_down" class="panel_down">
                        <nav class="nav">
                            <ul class="nav_menu">
                                <li class="nav_menu-item"><a  target="_blank">Control<img src="image/data_right.png" class="data_right_img"></a>

                                </li>
                            </ul>
                        </nav>
                    </div>
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


document.getElementById("nav_menu_4").onmouseover = function(){
    document.getElementById("nav_submenu_4").style.display = "block";
}
document.getElementById("nav_menu_4").onmouseout = function(){
    document.getElementById("nav_submenu_4").style.display = "none";
}

document.getElementById("nav_menu_3").onmouseover = function(){
    document.getElementById("nav_submenu_3").style.display = "block";
}
document.getElementById("nav_menu_3").onmouseout = function(){
    document.getElementById("nav_submenu_3").style.display = "none";
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

        document.getElementById("panel_vm1_smallword").innerText = jPM1_name + "\n" + jPM1_status.toUpperCase();
        document.getElementById("panel_vm2_smallword").innerText = jPM2_name +  "\n" + jPM2_status.toUpperCase();
        document.getElementById("panel_vm3_smallword").innerText = jVM1_name +  "\n"  + jVM1_status.toUpperCase();
        document.getElementById("panel_vm4_smallword").innerText = jVM2_name +  "\n"  + jVM2_status.toUpperCase();
        document.getElementById("navname_vm1").firstChild.nodeValue = jPM1_name+" ";
        document.getElementById("navname_vm2").firstChild.nodeValue = jPM2_name+" ";
        document.getElementById("navname_vm3").firstChild.nodeValue = jVM1_name+" ";
        document.getElementById("navname_vm4").firstChild.nodeValue = jVM2_name+" ";

        document.getElementById("PANEL_cal_word").innerText = jTime;

        for(var i = 1;i<=4;i++){
            if((document.getElementById("panel_vm"+i+"_smallword").innerText.indexOf("HALTED")>-1)||
                (document.getElementById("panel_vm"+i+"_smallword").innerText.indexOf("UNKNOW")>-1)){
                document.getElementById("PANEL_VM"+i).style.color = "#333333";
                document.getElementById("status_vm"+i).src = "image/halted.png";
                if(i<3){
                    document.getElementById("data_vm"+i+"_img").src = "image/panel_data_pm2.png";
                }else{
                    document.getElementById("data_vm"+i+"_img").src = "image/panel_data_vm2.png";
                }

            }else if(document.getElementById("panel_vm"+i+"_smallword").innerText.indexOf("RUNNING")>-1){
                document.getElementById("PANEL_VM"+i).style.color = "white";
                document.getElementById("status_vm"+i).src = "image/running.png";
                if(i<3){
                    document.getElementById("data_vm"+i+"_img").src = "image/panel_data_pm.png";
                }else{
                    document.getElementById("data_vm"+i+"_img").src = "image/panel_data_vm.png";
                }

            }else{

            }
        }


    }
}
var vmflag1 = "false";
var vmflag2 = "false";
var vmflag3 = "false";
var vmflag4 = "false";

var xmlhttp4;


setTimeout(function(){

    if((vmflag1!="false")||
        (vmflag2!="false")||
        (vmflag3!="false")||
        (vmflag4!="false")){

        CreateXMLHttpRequest2();
        xmlhttp4.onreadystatechange = function(){
            if(xmlhttp4.readyState == 4 && xmlhttp4.status == 200){
                var jsonstr = xmlhttp4.responseText;
                var obj = JSON.parse(jsonstr);

                if(obj.vm3 == "finished"){

                    document.getElementById("nav_menu_3").onmouseover = function(){

                        document.getElementById("nav_submenu_3").style.display = "block";
                    }
                    vmflag3 = "false";
                    alert("VM1 flask's control finished");
                }else if(obj.vm3 == "not_yet"){
                    document.getElementById("nav_menu_3").onmouseover = function(){
                        document.getElementById("nav_submenu_3").style.display = "none";
                    }
                }else{

                }

                if(obj.vm4 == "finished"){
                    document.getElementById("nav_menu_4").onmouseover = function(){

                        document.getElementById("nav_submenu_4").style.display = "block";
                    }
                    vmflag4 = "false";
                    alert("VM2 flake's control finished");
                }else if(obj.vmt == "not_yet"){
                    document.getElementById("nav_menu_4").onmouseover = function(){
                        document.getElementById("nav_submenu_4").style.display = "none";
                    }
                }else{

                }
            }
        };
        str = "vm1=" + vmflag1 + "&vm2=" + vmflag2 + "&vm3=" + vmflag3 + "&vm4=" + vmflag4;

        //xmlhttp.open("GET","Default.aspx?goback=yes&arg=" + arg,true);
        xmlhttp4.open("POST","/CMDflag",true);

        xmlhttp4.setRequestHeader("Content-Length",str.length);
        xmlhttp4.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");  //鐢≒OST鐨勬椂鍊欎竴瀹氳鏈夎繖鍙�


        xmlhttp4.send(str);

    }





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
                (jVM2_status!=statusQueue[3])){


                statusQueue = [];
                statusQueue.push(jPM1_status);
                statusQueue.push(jPM2_status);
                statusQueue.push(jVM1_status);
                statusQueue.push(jVM2_status);

                document.getElementById("panel_vm1_smallword").innerText = jPM1_name + "\n" + jPM1_status.toUpperCase();
                document.getElementById("panel_vm2_smallword").innerText = jPM2_name +  "\n" + jPM2_status.toUpperCase();
                document.getElementById("panel_vm3_smallword").innerText = jVM1_name +  "\n"  + jVM1_status.toUpperCase();
                document.getElementById("panel_vm4_smallword").innerText = jVM2_name +  "\n"  + jVM2_status.toUpperCase();
                document.getElementById("navname_vm1").firstChild.nodeValue = jPM1_name+" ";
                document.getElementById("navname_vm2").firstChild.nodeValue = jPM2_name+" ";
                document.getElementById("navname_vm3").firstChild.nodeValue = jVM1_name+" ";
                document.getElementById("navname_vm4").firstChild.nodeValue = jVM2_name+" ";

                document.getElementById("PANEL_cal_word").innerText = jTime;

                for(var i = 1;i<=4;i++){
                    if((document.getElementById("panel_vm"+i+"_smallword").innerText.indexOf("HALTED")>-1)||(document.getElementById("panel_vm"+i+"_smallword").innerText.indexOf("UNKNOW")>-1)){
                        document.getElementById("PANEL_VM"+i).style.color = "#333333";

                        document.getElementById("status_vm"+i).src = "image/halted.png";
                        if(i<3){
                            document.getElementById("data_vm"+i+"_img").src = "image/panel_data_pm2.png";
                        }else{
                            document.getElementById("data_vm"+i+"_img").src = "image/panel_data_vm2.png";
                        }

                    }else if(document.getElementById("panel_vm"+i+"_smallword").innerText.indexOf("RUNNING")>-1){
                        document.getElementById("PANEL_VM"+i).style.color = "white";

                        document.getElementById("status_vm"+i).src = "image/running.png";
                        if(i<3){
                            document.getElementById("data_vm"+i+"_img").src = "image/panel_data_pm.png";
                        }else{
                            document.getElementById("data_vm"+i+"_img").src = "image/panel_data_vm.png";
                        }

                    }else{

                    }
                }


            }else{

            }

        }

    }


    setTimeout(arguments.callee,5000);
},5000);

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

    if((document.getElementById("panel_vm"+locationNumber+"_smallword").innerText.indexOf("HALTED")>-1)||(document.getElementById("panel_vm"+locationNumber+"_smallword").innerText.indexOf("UNKNOW")>-1)){
        alert("Sorry, the panel is Not Running");
        
    	
    }else if(document.getElementById("panel_vm"+locationNumber+"_smallword").innerText.indexOf("RUNNING")>-1) {
        //window.location.href = "VM" + locationNumber + ".do";
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

    }
}


var ajaxReq = new AjaxRequest();
var xmlhttp2;
//---------ajax for the command task

function CMD(value,name){
    var command = value;
    var truename = "";

    switch (name){
        case "PM1": truename = jPM1_name;
            vmflag1 = "true";
            document.getElementById("nav_menu_1").onmouseover = function(){
                document.getElementById("nav_submenu_1").style.display = "none";
            }


            break;
        case "PM2": truename = jPM2_name;
            vmflag2 = "true";
            document.getElementById("nav_menu_2").onmouseover = function(){
                document.getElementById("nav_submenu_2").style.display = "none";
            }

            break;
        case "VM1": truename = jVM1_name;
            vmflag3 = "true";
            document.getElementById("nav_menu_3").onmouseover = function(){
                document.getElementById("nav_submenu_3").style.display = "none";
            }

            break;
        case "VM2": truename = jVM2_name;
            vmflag4 = "true";

            document.getElementById("nav_menu_4").onmouseover = function(){
                document.getElementById("nav_submenu_4").style.display = "none";
            }

            break;
        default :alert("error");
            break;
    }
    str = "command=" + command + "&name=" + truename;


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

function CreateXMLHttpRequest2()
{
    if (window.ActiveXObject)
    {
        xmlhttp4 = new ActiveXObject("Microsoft.XMLHTTP");
    }
    else if (window.XMLHttpRequest)
    {
        xmlhttp4 = new XMLHttpRequest();
    }
}

function callhandle()
{

    if (xmlhttp2.readyState == 4)
    {
        if(xmlhttp2.status == 200)
        {
            var jsonstr = xmlhttp2.responseText;
            var obj = JSON.parse(jsonstr);

            if(obj.value != "error"){

                alert(obj.value);
            }else{
                alert("Failure");
            }
        }
    }
}


//---------------------/chart cpu----------------------------------------------------
</script>

</body>
</html>
