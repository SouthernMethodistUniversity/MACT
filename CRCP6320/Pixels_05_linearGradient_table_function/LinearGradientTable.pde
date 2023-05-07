// table data stuff
//float tableX = 20;
//float tableY = 50;
//float tableW = 500;
//float tableH = 500;
//int tableCols = 10;
//int tableRows = 10;

void linearTableGradient(float tableX, float tableY, float tableW, float tableH, int tableCols, int tableRows){
  float colStep = tableW/tableCols;
  float rowStep = tableH/tableRows;
  for (int i=0; i<tableCols; i++) {
    for (int j=0; j<tableRows; j++) {
      color col1 = color(random(255), random(255), random(255));
      color col2 = color(random(255), random(255), random(255));
      float x = colStep*i;
      float y = rowStep*j;
      int w = int(colStep);
      int h = int(rowStep);
      linearGradient(col1, col2, tableX+x, tableY+ y, w, h);
    }
  }
}
