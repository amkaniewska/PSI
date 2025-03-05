text<-"And so even though we face the difficulties of today and tomorrow, I still have a dream."
install.packages("qdap")
library(qdap)

freq_terms(text)
frequent_terms <- freq_terms(text)
frequent_terms

install.packages("ggplot2")


library(ggplot2)

ggplot(frequent_terms, aes(x = WORD, y = FREQ)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(x = "S?owo", y = "Cz?sto??") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("Wykres cz?sto?ci s??w")

ggplot(frequent_terms, aes(y = WORD, x = FREQ)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(x = "S?owo", y = "Cz?sto??") +
  theme(axis.text.x = element_text(angle = 0, hjust = 1)) +
  ggtitle("Wykres cz?sto?ci s??w")

ggplot(frequent_terms, aes(x = FREQ, y = reorder(WORD, FREQ))) +
  geom_bar(stat = "identity", fill = "skyblue", color = "darkblue", alpha = 0.8) +
  labs(x = "Cz?sto??", y = "S?owo") +
  ggtitle("Wykres cz?sto?ci s??w") +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 10), # Dostosowanie rozmiaru czcionki etykiet na osi Y
        plot.title = element_text(hjust = 0.5, size = 16, face = "bold"), # Wy?rodkowanie i stylizacja tytu?u wykresu
        panel.grid.major.y = element_blank(), # Usuni?cie g??wnych linii siatki poziomej
        panel.grid.minor.y = element_blank(), # Usuni?cie mniejszych linii siatki poziomej
        axis.line = element_line(color = "black")) # Dostosowanie linii osi

# Stopwords (stop s?owa ? s?owa do usuni?cia)
# Najcz??ciej wyst?puj?ce 25, 100 i 200 s??w

Top25Words
Top100Words
Top200Words

# Usuni?cie stop s??w
frequent_terms2 <- freq_terms(text, stopwords = Top25Words)
frequent_terms3 <- freq_terms(text, stopwords = Top100Words)
frequent_terms4 <- freq_terms(text, stopwords = Top200Words)

plot(frequent_terms4)


#Zadanie 2

text <- "And so even though we face the difficulties of today and tomorrow, I still have a dream. It is a dream deeply rooted in the American dream."
text

frequent_terms <- freq_terms(text)
frequent_terms
frequent_terms <- freq_terms(text, stopwords = Top200Words)
plot(frequent_terms)


