library("recommenderlab")

library(caTools)

book <- read.csv(file.choose())
names(book)[3] <- paste("Title")
names(book)[4] <- paste("Rating")
str(book)

#table(book$Title)
table(book$User.ID)
table(book$Rating)
hist(book$Rating)

#book1 <- book[-(1)]

book_matrix <- as(book, 'realRatingMatrix')

book_recommend_model1 <- Recommender(book_matrix, method = "POPULAR")

recommended_items1 <- predict(book_recommend_model1, book_matrix[9895:9896], n=5)
as(recommended_items1, "list")

book_recommend_model2 <- Recommender(book_matrix, method = "IBCF")

recommended_items2 <- predict(book_recommend_model2, book_matrix[9993:9998], n=2)
as(recommended_items2, "list")

book_recommend_model3 <- Recommender(book_matrix, method = "UBCF")
recommended_items3 <- predict(book_recommend_model3, book_matrix[100:102], n=2)
as(recommended_items3, "list")
