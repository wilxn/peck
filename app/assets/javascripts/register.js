function validname(element){
  	var reg = /^[a-zA-Z0-9]*?$/;
  	if (reg.test(element.value))
	{
		document.getElementById("name-tip").className = "hide-tips";
		return true;
	}
	else
	{
		document.getElementById("name-tip").className = "display-tips";
		return false;
	}
}

function validpassword(element){
  	if (element.value.length>=6)
	{
		document.getElementById("pass").className = "hide-tips";
		return true;
	}
	else
	{
		document.getElementById("pass").className = "display-tips";
		element.value = "";
		return false;
	}
}

function validpasswordCon(element){
	var pass = document.getElementById("password");
  	if (element.value == pass.value)
	{
		document.getElementById("passcon").className = "hide-tips";
		return true;
	}

	else
	{
		document.getElementById("passcon").className = "display-tips";
		document.getElementById("password").focus();
		document.getElementById("password").value = "";
		element.value = "";
		return false;
	}
}

function validaddr(element){
  	var reg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
  	if (reg.test(element.value))
	{
		document.getElementById("mail-tip").className = "hide-tips";
		return true;
	}
	else
	{
		document.getElementById("mail-tip").className = "display-tips";
		return false;
	}
}

function validate(form)
{
	var formElements = form.elements;
	for(var i=0; i<formElements.length; i++)
	{
		currentElement = formElements[i];
		if(currentElement.className == "required" && currentElement.value =="")
		{
			alert("还有未填信息");
			currentElement.focus();
			return false;
			break;
		}
		switch(currentElement.id)
		{
			case "name": 
				if(!validname(currentElement))
				{
					currentElement.focus();
					alert("用户名含有非法字符");
					return false;
				}
				break;
			case "password":
				if(!validpassword(currentElement))
				{
					alert("密码必须不小于六位");
					form.password.value = "";
					currentElement.focus();
					form.passwordCon.value = "";
					return false;
				}
				break;
			case "passwordCon":
				if(!validpasswordCon(currentElement))
				{
					alert("两次输入的密码不相同");
					form.password.value = "";
					form.passwordCon.value = "";
					form.password.focus();
					return false;
				}
				break;
			case "mailaddr":
				if(!validaddr(currentElement))
				{
					alert("请输入正确的邮箱地址");
					form.addr.focus();
					return false;
				}
				break;
		}
		
	}
	return true;	
}