student_mat = read.table("StudentAlcohol/student-mat.csv", sep = ";", header = TRUE)
head(student_mat)
names(student_mat)

library(ggplot2)

student_mat$school <- factor(student_mat$school)
student_mat$sex <- factor(student_mat$sex)
student_mat$address <- factor(student_mat$address)
student_mat$famsize <- factor(student_mat$famsize)
student_mat$Pstatus <- factor(student_mat$Pstatus)
student_mat$Medu <- factor(student_mat$Medu)
student_mat$Fedu <- factor(student_mat$Fedu)
student_mat$Mjob <- factor(student_mat$Mjob)
student_mat$Fjob <- factor(student_mat$Fjob)
student_mat$reason <- factor(student_mat$reason)
student_mat$guardian <- factor(student_mat$guardian)
student_mat$traveltime <- factor(student_mat$traveltime)
student_mat$studytime <- factor(student_mat$studytime)
student_mat$failures <- factor(student_mat$failures)
student_mat$schoolsup <- factor(student_mat$schoolsup)
student_mat$famsup <- factor(student_mat$famsup)
student_mat$paid <- factor(student_mat$paid)
student_mat$activities <- factor(student_mat$activities)
student_mat$nursery <- factor(student_mat$nursery)
student_mat$higher <- factor(student_mat$higher)
student_mat$internet <- factor(student_mat$internet)
student_mat$romantic <- factor(student_mat$romantic)
student_mat$famrel <- factor(student_mat$famrel)

summary(student_mat)

# "school"     "sex"        "age"        "address"    "famsize"
# "Pstatus"    "Medu"       "Fedu"       "Mjob"       "Fjob"
# "reason"     "guardian"   "traveltime" "studytime"  "failures"  
# "schoolsup"  "famsup"     "paid"       "activities" "nursery"
# "higher"     "internet"   "romantic"   "famrel"     "freetime"
# "goout"      "Dalc"       "Walc"       "health"     "absences"
# "G1"         "G2"         "G3"        

#school : less give-up G3

ggplot(student_mat, aes(x = failures, y = G3)) + 
    geom_jitter(aes(color = school))# + facet_wrap(~Medu)
