library(ComplexHeatmap)
library(circlize)
library(readxl)
setwd("~/Downloads/CPGx_test_evaluation-master/Clinical_Sensitivity/CYP2C19")


#Results of Clinical Sensitivity and Gene Coverage Data
#Cyp2C19_Sensitivity_Tests
library(readxl)
Cyp2C19_Sensitivity_Tests <- read_excel("Cyp2C19_newdata.xlsx")

Heat_Cyp2C19<- as.matrix(Cyp2C19_Sensitivity_Tests[,c(3:11)])
colnames(Heat_Cyp2C19)<- c("AAAC", "Amer", "CSA", "EA", "Euro", "Lat", "NE", "Oc", "SSA")


Heat_Cyp2C19 <- Heat_Cyp2C19[, c("Oc", "Amer", "CSA", "EA", "NE", "Euro", "Lat", "AAAC", "SSA")]


Cyp2C19_Coverage<- as.matrix(Cyp2C19_Sensitivity_Tests$Percent)
#rownames(Cyp2C19_Coverage)<- rownames(Cyp2C19_Sensitivity_Tests)
rownames(Heat_Cyp2C19)<- c("RPRD Whole PGx Scan","Tier Two", "Tier One", "PharmacoScan", "Admera Health PGxOne+", "GeneSight Psychotropic", "Mental Health DNA Insight")
Ha2<- rowAnnotation('Coverage %'= anno_barplot(Cyp2C19_Coverage, width = unit(4, "cm"), ylim = range(100), axis_param = list(at= c(10,20,30,40,50,60,70,80,90,100))))

#To reorder columns to default, remove "cluster_rows = FALSE, cluster_columns = FALSE" from the line below
HEATC2C19<- Heatmap(Heat_Cyp2C19, cluster_rows = FALSE, cluster_columns = FALSE, show_row_dend = FALSE, show_column_dend = FALSE, right_annotation = Ha2, row_names_side= "left", show_heatmap_legend = FALSE, rect_gp = gpar(col= "gray44"), col= ColorMapping(col_fun= colorRamp2(c(0,50,100),c("blue","white","red"))))

HEATC2C19

load("/Users/sophiaazab/Downloads/CPGx_test_evaluation-master/Clinical_Sensitivity/CYP2C19/Cyp2C19_Sensitivity_Tests.RData")
