var price = document.getElementsByName("pr");
var quantity = document.getElementsByName("qy");
var sum = document.getElementsByClassName("sum");
var hsum = 0;

for (var j = 0; j < price.length; j++) {
	hsum += price[j].value * quantity[j].value;

}
document.getElementById("sum").innerHTML = hsum;

function test(num) {
	var sum2 = 0;
	var snum = price[num].value * quantity[num].value;
	sum[num].innerHTML = snum;
	for (var i = 0; i < price.length; i++) {
		sum2 += Number(sum[i].innerText);
	}
	document.getElementById("sum").innerHTML = sum2;
}