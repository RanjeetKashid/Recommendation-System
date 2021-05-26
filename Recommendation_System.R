library("recommenderlab")

library(caTools)

book <- read.csv(file.choose())
names(book)[3] <- paste("Title")
names(book)[4] <- paste("Rating")
str(book)

sapply(book,function(x) length(unique(x)))

#table(book$Title)
table_UID <- table(book$User.ID)
table(book$Rating)
hist(book$Rating)

book1 <- book[-(1)]

book_matrix <- as(book1, 'realRatingMatrix')
book2 <- arrange(book1,book1$User.ID)
book2 <- book2[1:2000,]
book2 <- book2[,-1]
book_matrix1 <- as(book2,'realRatingMatrix' )

### POPULAR ###

book_recommend_model1 <- Recommender(book_matrix, method = "POPULAR")

recommended_items1 <- predict(book_recommend_model1, book_matrix[8:10], n=5)
as(recommended_items1, "list")

### IBCF ###

book_recommend_model2 <- Recommender(book_matrix1, method = "IBCF")

recommended_items2 <- predict(book_recommend_model2, book_matrix1[8:10], n=2)
as(recommended_items2, "list")

### UBCF ###

book_recommend_model3 <- Recommender(book_matrix, method = "UBCF")
recommended_items3 <- predict(book_recommend_model3, book_matrix[145:150], n=5)
as(recommended_items3, "list")
