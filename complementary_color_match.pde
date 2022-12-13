void setup() { 
  size(512, 512);  
  //pixelDensity(2);
  noStroke();
  colorMode(HSB,512,256,256); 
  //fill(0,0,0);
  //text("Click to save.",100,100);
}

void draw() {
  
  color bgC=color(512-mouseX,mouseY,256);
  color mainC=get(mouseX, mouseY);
  color assC=get(512-mouseX, 512-mouseY-10);
  color intersC=get(512-mouseX, 512-mouseY+10);
  
  float R_b=red(bgC)*255/512;
  float G_b=green(bgC)*255/256;
  float B_b=blue(bgC)*255/256;
  float R_m=red(mainC)*255/512;
  float G_m=green(mainC)*255/256;
  float B_m=blue(mainC)*255/256;
  float R_a=red(assC)*255/512;
  float G_a=green(assC)*255/256;
  float B_a=blue(assC)*255/256; 
  float R_i=red(intersC)*255/512;
  float G_i=green(intersC)*255/256;
  float B_i=blue(intersC)*255/256;
  
  
  
  if(mouseX<=256 && mouseY<=256){                                 //circle up

    background(256+mouseX,mouseY,256);
  
    fill(mouseX,mouseY,256);
    ellipse(mouseX, mouseY, 256, 256); 
    
    fill(256+mouseX,256-mouseY,256);
    triangle(512-mouseX-20, 512-mouseY, 512-mouseX, 512-mouseY-20, 512-mouseX+20, 512-mouseY);
    
    fill(mouseX,256-mouseY,256);
    triangle(512-mouseX-20, 512-mouseY, 512-mouseX, 512-mouseY+20, 512-mouseX+20, 512-mouseY);
    
  }else if(mouseX>256 && mouseY<=256){
    background(mouseX-256,mouseY,256);
  
    fill(mouseX,mouseY,256);
    ellipse(mouseX, mouseY, 256, 256); 
    
    fill(mouseX-256,256-mouseY,256);
    triangle(512-mouseX-20, 512-mouseY, 512-mouseX, 512-mouseY-20, 512-mouseX+20, 512-mouseY);
    
    fill(mouseX,256-mouseY,256);
    triangle(512-mouseX-20, 512-mouseY, 512-mouseX, 512-mouseY+20, 512-mouseX+20, 512-mouseY);
  
  }else if(mouseX<=256 && mouseY>256){
    background(256+mouseX,256,512-mouseY);

    fill(mouseX,512-mouseY,256);
    ellipse(mouseX, mouseY, 256, 256); 
    
    fill(256+mouseX,mouseY-256,256);
    triangle(512-mouseX-20, 512-mouseY, 512-mouseX, 512-mouseY-20, 512-mouseX+20, 512-mouseY);
    
    fill(mouseX,mouseY-256,256);
    triangle(512-mouseX-20, 512-mouseY, 512-mouseX, 512-mouseY+20, 512-mouseX+20, 512-mouseY);
  }
  
  else{                                           //circle down

    background(mouseX-256,256,512-mouseY);

    fill(mouseX,512-mouseY,256);
    ellipse(mouseX, mouseY, 256, 256); 
    
    fill(mouseX-256,mouseY-256,256);
    triangle(512-mouseX-20, 512-mouseY, 512-mouseX, 512-mouseY-20, 512-mouseX+20, 512-mouseY);
    
    fill(mouseX,mouseY-256,256);
    triangle(512-mouseX-20, 512-mouseY, 512-mouseX, 512-mouseY+20, 512-mouseX+20, 512-mouseY);
    
  }
  
  
  if(mouseY<=256){ 
    fill(0,0,0,50);
  }else{
    fill(0,0,256,50);
  }
  square(50,490,11);
  DrawText(int(R_b),int(G_b),int(B_b),65,500); 
  
  if(mouseY<=256){ 
    fill(0,0,0,50);
  }else{
    fill(0,0,256,50);
  }
  ellipse(173, 496, 12, 12); 
  DrawText(int(R_m),int(G_m),int(B_m),183,500);
  
  
  if(mouseY<=256){ 
    fill(0,0,0,50);
  }else{
    fill(0,0,256,50);
  }
  triangle(287-6, 501, 287, 501-11, 287+6, 501);
  DrawText(int(R_a),int(G_a),int(B_a),296,500);
  
  if(mouseY<=256){ 
    fill(0,0,0,50);
  }else{
    fill(0,0,256,50);
  }
  triangle(401-6, 491, 401, 491+11, 401+6, 491);
  DrawText(int(R_i),int(G_i),int(B_i),409,500);
  
}



void DrawText(int n,int m,int o,int x,int y) //output color number
{
  int i;
  char h[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
  int r[]={0,0};
  int g[]={0,0};
  int b[]={0,0};
 
  
 for(i=0 ; n >= 16 ; ++i)
 {
    r[i]=n%16;
    n /= 16;
 }
  r[i++]=n; 
  
   for(i=0 ; m >= 16 ; ++i)
 {
    g[i]=m%16;
    m /= 16;
 }
  g[i++]=m; 
  
   for(i=0 ; o >= 16 ; ++i)
 {
    b[i]=o%16;
    o /= 16;
 }
  b[i++]=o; 
  
  
  String str = "#"+h[r[1]]+h[r[0]]+h[g[1]]+h[g[0]]+h[b[1]]+h[b[0]];

  if(mouseY<=256){ //change text color
    fill(0,0,0);
  }else{
    fill(0,0,256);
  }
  
  PFont mono;
  // The font "andalemo.ttf" be located in the current sketch's "data" 
  mono = createFont("Courier.ttf",32);
  textFont(mono);
  textSize(14);
  text(str,x,y);
}

void mousePressed() {
 //fill(0,0,0);
 //text("Click to save.",100,100);
 saveFrame("####.png");
}
