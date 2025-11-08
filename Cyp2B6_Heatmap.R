library(ComplexHeatmap)
library(circlize)

library(readxl)
setwd("~/Downloads/CPGx_test_evaluation-master/Clinical_Sensitivity/CYP2B6")

#Dataset used comes from sensitivity calculation 
#Cyp2B6_Sensitivity_Tests
library(readxl)
Cyp2B6_Sensitivity_Tests <- read_excel("Cyp2B6_newdata.xlsx")


Heat_Cyp2B6<- as.matrix(Cyp2B6_Sensitivity_Tests[,c(3:10)])
colnames(Heat_Cyp2B6)<- c("AAAC", "CSA", "EA", "Euro", "Lat", "NE", "Oc", "SSA")

Heat_Cyp2B6 <- Heat_Cyp2B6[, c("Oc", "EA", "CSA", "Lat", "NE", "AAAC", "Euro", "SSA")]

Cyp2B6_Coverage<- as.matrix(Cyp2B6_Sensitivity_Tests$Percent)
#rownames(Cyp2B6_Coverage) <- rownames(Cyp2B6_Sensitivity_Tests)
rownames(Heat_Cyp2B6)<- c("GeneSight Psychotropic", "OneOme", "YouScript Analgesic", "MedMPact", "RPRD Whole PGx Scan")
Ha2<- rowAnnotation('Coverage %'= anno_barplot(Cyp2B6_Coverage, width = unit(4, "cm"), ylim = range(100), axis_param = list(at= c(10,20,30,40,50,60,70,80,90,100))))


#To reorder columns to default, remove "cluster_rows = FALSE, cluster_columns = FALSE" from the line below
HEATC2B6<- Heatmap(Heat_Cyp2B6, cluster_rows = FALSE, cluster_columns = FALSE, show_row_dend = FALSE, show_column_dend = FALSE, right_annotation = Ha2, row_names_side= "left", show_heatmap_legend = FALSE, rect_gp = gpar(col= "gray44"), col= ColorMapping(col_fun= colorRamp2(c(0,50,100),c("blue","white","red"))))

HEATC2B6

colnames(Heat_Cyp2B6)
