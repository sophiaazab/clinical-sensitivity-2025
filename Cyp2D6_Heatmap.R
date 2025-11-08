library(ComplexHeatmap)
library(circlize)
library(readxl)
setwd("~/Downloads/CPGx_test_evaluation-master/Clinical_Sensitivity/CYP2D6")

#Dataset used comes from sensitivity calculation 
#Cyp2D6_Sensitivity_Tests
Cyp2D6_Sensitivity_Tests <- read_excel("Cyp2D6_newdata.xlsx")

Heat_Cyp2D6<- as.matrix(Cyp2D6_Sensitivity_Tests[,c(3:11)])
colnames(Heat_Cyp2D6)<- c("AAAC", "Amer", "CSA", "EA", "Euro", "Lat", "NE", "Oc", "SSA")

Heat_Cyp2D6 <- Heat_Cyp2D6[, c("Oc", "Euro", "NE", "CSA", "Lat", "Amer", "AAAC", "SSA", "EA")]


Cyp2D6_Coverage<- as.matrix(Cyp2D6_Sensitivity_Tests$Percent)
#rownames(Cyp2D6_Coverage)<- rownames(Cyp2D6_Sensitivity_Tests)
rownames(Heat_Cyp2D6)<- c("MedMPact", "PharmacoScan", "Whole PGx Scan", "OneOme", "Admera Health PGxOne+", "YouScript Analgesic", "YouScript Psychotropic", "YouScript Cardio", "YouScript ADHD", "Psychiatry PGx Expanded Panel", "Medication Response Genetic Test", "GeneSight Psychotropic", "Mental Health DNA Insight", "Antidepressants and Antipsychotics PGx")

#To reorder columns to default, remove "cluster_rows = FALSE, cluster_columns = FALSE" from the line below
Ha2<- rowAnnotation('Coverage %'= anno_barplot(Cyp2D6_Coverage, width = unit(4, "cm"), ylim = range(50), axis_param = list(at= c(10,20,30,40,50))))

HEATC2D6<- Heatmap(Heat_Cyp2D6, cluster_rows = FALSE, cluster_columns = FALSE, show_row_dend = FALSE, show_column_dend = FALSE, right_annotation = Ha2, row_names_side= "left", show_heatmap_legend = FALSE, rect_gp = gpar(col= "gray44"), col= ColorMapping(col_fun= colorRamp2(c(0,50,100),c("blue","white","red"))))

HEATC2D6
