library(ComplexHeatmap)
library(circlize)
library(readxl)
setwd("~/Downloads/CPGx_test_evaluation-master/Clinical_Sensitivity/CYP3A5")

library(readxl)
Cyp3A5_Sensitivity_Tests <- read_excel("Cyp3A5_newdata.xlsx")


Heat_Cyp3A5<- as.matrix(Cyp3A5_Sensitivity_Tests[,c(3:9)])
colnames(Heat_Cyp3A5)<- c("AAAC", "CSA", "EA", "Euro", "Lat", "NE", "SSA")

Cyp3A5_Coverage<- as.matrix(Cyp3A5_Sensitivity_Tests$Percent)
#rownames(Cyp3A5_Coverage)<- rownames(Cyp3A5_Sensitivity_Tests)
rownames(Heat_Cyp3A5)<- c("PharmacoScan", "Whole PGx Scan", "Admera", "OneOme", "Medication Response Genetic Test", "MedMPact", "YouScript Analgesic", "YouScript Psychotropic", "YouScript Cardio", "Mental Health DNA Insight")
Ha2<- rowAnnotation('Coverage %'= anno_barplot(Cyp3A5_Coverage, width = unit(5, "cm"), ylim = range(100), axis_param = list(at= c(10,20,30,40,50,60,70,80,90,100))))

HEATC3A5<- Heatmap(Heat_Cyp3A5, show_row_dend = FALSE, show_column_dend = FALSE, right_annotation = Ha2, row_names_side= "left", show_heatmap_legend = FALSE, rect_gp = gpar(col= "gray44"), col= ColorMapping(col_fun= colorRamp2(c(0,50,100),c("blue","white","red"))))

HEATC3A5