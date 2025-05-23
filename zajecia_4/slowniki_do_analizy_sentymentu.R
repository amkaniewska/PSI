# S�owniki sentymentu

library(tm)
library(tidyverse)
library(tidytext)
library(textdata)
library(ggplot2)
library(ggthemes)


# Pobierz s�owniki (leksykony sentymentu) 
# w uporz�dkowanym formacie, gdzie ka�demu s�owu odpowiada jeden wiersz,
# - jest to forma, kt�r� mo�na po��czy� z zestawem danych 
# zawieraj�cym jedno s�owo na wiersz.
# https://juliasilge.github.io/tidytext/reference/get_sentiments.html
#
get_sentiments(lexicon = c("bing", "afinn", "nrc", "loughran"))

textdata::lexicon_nrc(delete = TRUE)


# S�ownik Bing ----
# https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html
get_sentiments("bing")

# Podsumowujemy s�ownik Bing, licz�c wyst�pienia s��w
get_sentiments("bing") %>%
  count(sentiment)
# W s�owniku Bing znajduje si� ponad 4 tysi�ce negatywnych
# oraz ponad 2 tysi�ce pozytywnych termin�w



# S�ownik Afinn ----
# https://darenr.github.io/afinn/
get_sentiments("afinn")

# Podsumowujemy s�ownik Afinn, sprawdzaj�c minimaln� i maksymaln� warto��
get_sentiments("afinn") %>%
  summarize(
    min = min(value),
    max = max(value)
  )
# Warto�ci sentymentu mieszcz� si� w przedziale od -5 do 5



# S�ownik NRC ----
# https://saifmohammad.com/WebPages/NRC-Emotion-Lexicon.htm
get_sentiments("nrc")

# Zliczmy liczb� s��w powi�zanych z ka�dym sentymentem w s�owniku NRC
get_sentiments("nrc") %>% 
  count(sentiment) %>% 
  # Sortujemy liczebno�� sentyment�w w kolejno�ci malej�cej
  arrange(desc(n))

# Pobieramy s�ownik NRC, liczymy sentymenty i sortujemy je wed�ug liczebno�ci
sentiment_counts <- get_sentiments("nrc") %>% 
  count(sentiment) %>% 
  mutate(sentiment2 = fct_reorder(sentiment, n))

# Wizualizacja liczby wyst�pie� sentyment�w 
# u�ywaj�c nowej kolumny typu factor o nazwie sentiment2
ggplot(sentiment_counts, aes(x=sentiment2, y=n)) +
  geom_col(fill="goldenrod1") +
  coord_flip() +
  # Wstawiamy tytu�, nazw� osi X jako "Sentyment" i osi Y jako "Liczba"
  labs(x = "Sentyment", y = "Liczba") +
  theme_gdocs() + 
  ggtitle("Kategorie sentymentu w NRC")



# S�ownik Loughran ----
# dost�pny w pakiecie "lexicon"
# https://emilhvitfeldt.github.io/textdata/reference/lexicon_loughran.html
get_sentiments("loughran")

# Podsumowujemy s�ownik Loughran w nast�puj�cy spos�b:
sentiment_counts <- get_sentiments("loughran") %>%
  count(sentiment) %>%
  mutate(sentiment2 = fct_reorder(sentiment, n))

ggplot(sentiment_counts, aes(x=sentiment2, y=n)) + 
  geom_col(fill="darkorchid3") +
  coord_flip() +
  labs(x = "Sentyment", y = "Liczba") +
  theme_gdocs() + 
  ggtitle("Kategorie sentymentu w Loughran")
