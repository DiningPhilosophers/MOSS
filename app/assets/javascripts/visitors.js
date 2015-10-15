$(document).ready(function() {
	VisitorInit();
});

var currentFrame = 1;

function VisitorInit(){
	//hook up button handlers
	$(".next-button").click(onClickNext);
}

//TODO Add functions to make frames work
function onClickNext()
{
	currentFrame = currentFrame + 1;
	$(".frame").hide();
	var selector = "#frame";
	selector = selector.concat(currentFrame);
	$(selector).show();
}
