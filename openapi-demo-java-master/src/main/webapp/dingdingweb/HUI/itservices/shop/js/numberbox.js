function numberbox(){
	var numberBoxes =  document.getElementsByClassName('hui-number-box');
	if(!numberBoxes){return;}
	for(var i = 0; i < numberBoxes.length; i++){
		var numberBox = numberBoxes[i], numberBoxL = numberBox.getElementsByClassName('reduce')[0];
		var numberBoxR = numberBox.getElementsByClassName('add')[0];
		numberBoxL.onclick = function(){
			var min = Number(this.parentNode.getAttribute('min'));
			var max = Number(this.parentNode.getAttribute('max'));
			var numberIn  = this.parentNode.getElementsByTagName('input')[0];
			var cNum = Number(numberIn.value);
			if(!cNum || cNum == NaN){cNum = min;} cNum -= 1;
			if(cNum < min){cNum = min;} numberIn.value = cNum;
			hui(numberIn).trigger('change');
			G('consum-tprice').value=G('consumable-num').value*G('consum-uprice').value;
		}
		numberBoxR.onclick = function(){
			var min = Number(this.parentNode.getAttribute('min'));
			var max = Number(this.parentNode.getAttribute('max'));
			var numberIn  = this.parentNode.getElementsByTagName('input')[0];
			var cNum = Number(numberIn.value);
			if(!cNum || cNum == NaN){cNum = min;}
			var cNum = Number(numberIn.value);
			if(!cNum || cNum == NaN){cNum = min;} cNum += 1;
			if(cNum > max){cNum = max;} numberIn.value = cNum;
			hui(numberIn).trigger('change');
			G('consum-tprice').value=G('consumable-num').value*G('consum-uprice').value;
		}
	}
}