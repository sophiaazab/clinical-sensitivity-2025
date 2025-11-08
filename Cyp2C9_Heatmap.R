library(ComplexHeatmap)
library(circlize)
library(readxl)
###Creating Cyp2C9 data with appropriate genetic test terminology
setwd("~/Downloads/CPGx_test_evaluation-master/Clinical_Sensitivity/CYP2C9")

library(readxl)
Cyp2C9_Sensitivity_Tests <- read_excel("Cyp2C9_newdata.xlsx")


#Cyp2C9_Sensitivity_Tests

Heat_Cyp2C9<- as.matrix(Cyp2C9_Sensitivity_Tests[,c(3:11)])
colnames(Heat_Cyp2C9)<- c("AAAC", "Amer", "CSA", "EA", "Euro", "Lat", "NE", "Oc", "SSA")

Heat_Cyp2C9 <- Heat_Cyp2C9[, c("CSA", "Euro", "NE", "Oc", "Lat", "Amer", "AAAC", "SSA", "EA")]

Cyp2C9_Coverage<- as.matrix(Cyp2C9_Sensitivity_Tests$Percent)
#rownames(Cyp2C9_Coverage)<- rownames(Cyp2C9_Sensitivity_Tests)
rownames(Heat_Cyp2C9)<- c("PharmacoScan","Tier Two", "Tier One", "Whole PGx Scan", "Admera Health PGxOne+", "GeneSight Psychotropic", "Mental Health DNA Insight", "Warfarin Sensitivity TrueHealth", "Warfarin Sensitivity, CYP2C9 and VKORC1, 3 mutations", "Medication Response Genetic Test", "OneOme", "YouScript Cardio", "YouScript Psychotropic", "YouScript Analgesic", "MedMPact")
Ha2<- rowAnnotation('Coverage %'= anno_barplot(Cyp2C9_Coverage, width = unit(4, "cm"), ylim = range(100), axis_param = list(at= c(10,20,30,40,50,60,70,80,90,100))))

#To reorder columns to default, remove "cluster_rows = FALSE, cluster_columns = FALSE" from the line below
HEATC2C9<- Heatmap(Heat_Cyp2C9, cluster_rows = FALSE, cluster_columns = FALSE, show_row_dend = FALSE, show_column_dend = FALSE, right_annotation = Ha2, row_names_side= "left", show_heatmap_legend = FALSE, rect_gp = gpar(col= "gray44"), col= ColorMapping(col_fun= colorRamp2(c(0,50,100),c("blue","white","red"))))

HEATC2C9

