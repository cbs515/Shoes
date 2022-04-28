var bprice = document.getElementsByName("bpr");
var bquantity = document.getElementsByName("bqy");
var sum = document.getElementsByClassName("bsum");
var hbsum = 0;

for (var j = 0; j < bprice.length; j++) {
	hbsum += Number(bprice[j].value);

}
document.getElementById("bsum").innerHTML = hbsum;
console.log(hbsum);