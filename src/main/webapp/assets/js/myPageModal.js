const blur = document.getElementById("m-blur");
const modal = document.getElementById("modal");


const btnModal = document.getElementById("btn-modal");
	btnModal.addEventListener("click", e => {
	modal.style.display = "flex";
	blur.style.display = "block";
    window.scrollTo(0,0);
    });
    
    
   const closeBtn = document.getElementById("close")
	closeBtn.addEventListener("click", e =>{
	modal.style.display= "none";
	blur.style.display = "none";
});


const closeBtn2 = document.getElementById("close2")
	closeBtn2.addEventListener("click", e =>{
	modal.style.display= "none";
	blur.style.display = "none";
});