var x = 0;
var y = 100;
var lines;
var index = 0;
var startmin = 0;

function getStartMin(){
	var myNow = new Date();
	var before10hours = Math.floor(myNow.getTime() / 1000 / 60) - (60 * 10);
	console.log(before10hours);
	return before10hours;
}

function preload(){
	lines = loadStrings('log/magome-mail-heartbeat.txt');	
}

function setup() {
  // put setup code here
	createCanvas(640, 360);
	stroke(0);
	startmin = getStartMin();
}

function draw() {
  // put drawing code here
	background(255);
	if(x > width){
		x = 0;
		index = 0;
	};
	while(lines[index] < startmin){
		index += 1;
	}
	if(x == (lines[index] - startmin)){
		y -=5;
		if ( y < 30 ){
			y = 100;
			x += 1;
			index += 1;
		}
	}else{
		x += 1;
	}
	ellipse(x,y,3,3);
}
