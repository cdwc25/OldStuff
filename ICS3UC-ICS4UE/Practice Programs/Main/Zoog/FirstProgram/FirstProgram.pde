// Setup
size (200,200);
background (23,112,232);
smooth();

// Set Rectangle Mode Center
ellipseMode (CENTER);
rectMode (CENTER);

// Zoog's Body
stroke (0);
fill (0);
rect (100,100,20,100);

// Zoog's Head
fill (255);
ellipse (100,70,60,60);

// Zoog's Eyes
fill (0);
ellipse (81,70,16,32);
ellipse (119,70,16,32);

// Zoog's Pupils
fill (88,209,255);
ellipse (81,70,5,5);
ellipse (119,70,5,5);

// Zoog's Legs
stroke (0);
line (90,150,80,160);
line (110,150,120,160);