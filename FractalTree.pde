private double fractionLength = .8; 
private int smallestBranch = 5; 
private double branchAngle = .5;  
private boolean yes = true;
public void setup() 
{   
	size(640,480);    
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,240);   
	drawBranches(320,240,100,3*Math.PI/2);  
} 
public void keyPressed() {
	if( key == 'w' && yes == true)
	{
		branchAngle-=.1;
		if(branchAngle == -7.450580596923828E-9)
		{
			branchAngle = branchAngle;
			yes = false;
		}
	}
	if(key == 's' && yes == false)
	{
		branchAngle+=.1;
		println(branchAngle);
		if(branchAngle >= 3.0001)
		{
			branchAngle = branchAngle;
			yes = true;

		}
	}
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength *= fractionLength;
	int endx1 = (int)(branchLength*Math.cos(angle1) + x);
	int endx2 = (int)(branchLength*Math.cos(angle2) + x);
	int endy1 = (int)(branchLength*Math.sin(angle1) + y);
	int endy2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x,y,endx1,endy1);
	line(x,y,endx2,endy2);
	if(branchLength>smallestBranch)
	{
		drawBranches(endx1 ,endy1 ,branchLength-5 ,angle1+branchAngle);
		drawBranches(endx2 ,endy2 ,branchLength-5 ,angle2-branchAngle);
	}
} 
