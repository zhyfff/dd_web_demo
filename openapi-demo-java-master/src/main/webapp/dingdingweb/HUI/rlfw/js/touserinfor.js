var name = ${userjson};
	alert(name);
	document.getElementById("newadd").href = "/Contract/tonewadd?info="+name;
	document.getElementById("select").href = "/Contract/tonewselect?info="+name;