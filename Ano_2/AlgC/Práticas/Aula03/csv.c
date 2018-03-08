#include<stdio.h>
#include<string.h>

void create_marks_csv(char* filename,int [][100] a,int n,int m){
  printf("\n Creating %s.csv file",filename);
  FILE *fp;
  int i,j;
  filename=strcat(filename,".csv");
  fp=fopen(filename,"w+");
  for(i=0;i<m;i++){
    fprintf(fp,"\n%d",i+1);
    for(j=0;j<n;j++)
      fprintf(fp,",%d ",a[i][j]);
  }
  fclose(fp);
  printf("\n %sfile created",filename);
}
