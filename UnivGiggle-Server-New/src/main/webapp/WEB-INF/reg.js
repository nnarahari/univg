// form validation function //
function validate(form) {
  var fname = form.fname.value;
  var lname = form.lname.value;
  var address = form.address.value;
  var email = form.email.value;
  var gender = form.gender.value;
  var state = form.state.value;
  var university = form.university.value;
  var program = form.program.value;
  var depatment = form.department.value;
  var graddate = form.graddate.value;
  var attachresume = form.attachresume.value;
  var address = form.address.value;
  var lnameRegex = /^[a-zA-Z]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z]*)*$/;
  var fnameRegex = /^[a-zA-Z]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z]*)*$/;
  var emailRegex = /^[a-zA-Z]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z]*)*$/;
  
  if(fname == "") {
    inlineMsg('fname','<strong>Error</strong><br />You must enter your First Name.',2);
    return false;
  }
  if(!fname.match(fnameRegex)) {
    inlineMsg('fname','<strong>Error</strong><br />You have entered an invalid First Name.',2);
    return false;
  }
   if(lname == "") {
    inlineMsg('lname','<strong>Error</strong><br />You must enter your Last Name.',2);
    return false;
  }
  if(!lname.match(lnameRegex)) {
    inlineMsg('lname','<strong>Error</strong><br />You have entered an invalid Last Name.',2);
    return false;
  }
  if(address == "") {
    inlineMsg('address','<strong>Error</strong><br />Please Enter Address.',2);
    return false;
  }
   if(email == "") {
    inlineMsg('email','<strong>Error</strong><br />Please Enter valid email address.',2);
    return false;
  }
  if(!email.match(emailRegex)) {
    inlineMsg('email','<strong>Error</strong><br />You have entered an invalid password.',2);
    return false;
  }
  if(gender == "") {
    inlineMsg('gender','<strong>Error</strong><br />You must select your gender.',2);
    return false;
  }
  if(state == "") {
    inlineMsg('state','<strong>Error</strong><br />You must select your State.',2);
    return false;
  }
  if(university == "") {
    inlineMsg('university','<strong>Error</strong><br />You must select your University.',2);
    return false;
  }
  if(program == "") {
    inlineMsg('program','<strong>Error</strong><br />You must select your Program.',2);
    return false;
  }
  if(department == "") {
    inlineMsg('department','<strong>Error</strong><br />You must select your Department.',2);
    return false;
  }
  if(graddate == "") {
    inlineMsg('graddate','<strong>Error</strong><br />You must select your Graduation Date.',2);
    return false;
  }
  if(attachresume == "") {
    inlineMsg('attachresume','<strong>Error</strong><br />You must attach copy of resume.',2);
    return false;
  }
  return true;
}

// START OF MESSAGE SCRIPT //

var MSGTIMER = 30;
var MSGSPEED = 5;
var MSGOFFSET = 3;
var MSGHIDE = 3;

// build out the divs, set attributes and call the fade function //
function inlineMsg(target,string,autohide) {
  var msg;
  var msgcontent;
  if(!document.getElementById('msg')) {
    msg = document.createElement('div');
    msg.id = 'msg';
    msgcontent = document.createElement('div');
    msgcontent.id = 'msgcontent';
    document.body.appendChild(msg);
    msg.appendChild(msgcontent);
    msg.style.filter = 'alpha(opacity=0)';
    msg.style.opacity = 0;
    msg.alpha = 0;
  } else {
    msg = document.getElementById('msg');
    msgcontent = document.getElementById('msgcontent');
  }
  msgcontent.innerHTML = string;
  msg.style.display = 'block';
  var msgheight = msg.offsetHeight;
  var targetdiv = document.getElementById(target);
  targetdiv.focus();
  var targetheight = targetdiv.offsetHeight;
  var targetwidth = targetdiv.offsetWidth;
  var topposition = topPosition(targetdiv) - ((msgheight - targetheight) / 2);
  var leftposition = leftPosition(targetdiv) + targetwidth + MSGOFFSET;
  msg.style.top = topposition + 'px';
  msg.style.left = leftposition + 'px';
  clearInterval(msg.timer);
  msg.timer = setInterval("fadeMsg(1)", MSGTIMER);
  if(!autohide) {
    autohide = MSGHIDE;  
  }
  window.setTimeout("hideMsg()", (autohide * 1000));
}

// hide the form alert //
function hideMsg(msg) {
  var msg = document.getElementById('msg');
  if(!msg.timer) {
    msg.timer = setInterval("fadeMsg(0)", MSGTIMER);
  }
}

// face the message box //
function fadeMsg(flag) {
  if(flag == null) {
    flag = 1;
  }
  var msg = document.getElementById('msg');
  var value;
  if(flag == 1) {
    value = msg.alpha + MSGSPEED;
  } else {
    value = msg.alpha - MSGSPEED;
  }
  msg.alpha = value;
  msg.style.opacity = (value / 100);
  msg.style.filter = 'alpha(opacity=' + value + ')';
  if(value >= 99) {
    clearInterval(msg.timer);
    msg.timer = null;
  } else if(value <= 1) {
    msg.style.display = "none";
    clearInterval(msg.timer);
  }
}

// calculate the position of the element in relation to the left of the browser //
function leftPosition(target) {
  var left = 0;
  if(target.offsetParent) {
    while(1) {
      left += target.offsetLeft;
      if(!target.offsetParent) {
        break;
      }
      target = target.offsetParent;
    }
  } else if(target.x) {
    left += target.x;
  }
  return left;
}

// calculate the position of the element in relation to the top of the browser window //
function topPosition(target) {
  var top = 0;
  if(target.offsetParent) {
    while(1) {
      top += target.offsetTop;
      if(!target.offsetParent) {
        break;
      }
      target = target.offsetParent;
    }
  } else if(target.y) {
    top += target.y;
  }
  return top;
}

// preload the arrow //
if(document.images) {
  arrow = new Image(7,80); 
  arrow.src = "images/msg_arrow.gif"; 
}