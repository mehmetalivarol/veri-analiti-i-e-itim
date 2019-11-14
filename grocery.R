
# Linktera Veri Analitigi Egitim ------------------------------------------
# Market Basket Analysis --------------------------------------------------
# Groceries Data Exercise -------------------------------------------------

options(digits = 4)

# Install and Load Packages -----------------------------------------------
install.packages("arules")
install.packages("arulesviz")
install.packages("RColorBrewer")
library(arules)
library(arulesViz)
library(RColorBrewer)

data("Groceries")

summary(Groceries)

# create the rules with apriori -------------------------------------------

rules <-
  apriori(Groceries, parameter = list(support = 0.001, confidence = 0.5))

# inspect the rules -------------------------------------------------------

inspect(head(sort(rules, by = "support"), 10))
inspect(head(sort(rules, by = "confidence"), 10))
inspect(head(sort(rules, by = "lift"), 10))

# plot TOP 10 frequent items ----------------------------------------------

itemFrequencyPlot(
  Groceries,
  topN = 10,
  col = brewer.pal(3, "Blues"),
  main = 'Top 10 Products',
  type = "relative",
  ylab = "Item Frequency(Relative)",
  cex  = 1
)

# plot rules by Confidence, Support and Lift ------------------------------

plot(
  head(sort(rules, by = "support"), 50),
  method = "graph",
  control = list(verbose = TRUE),
  engine = "html"
)

plot(
  head(sort(rules, by = "lift"), 50),
  method = "graph",
  control = list(verbose = TRUE),
  engine = "html"
)
plot(
  head(sort(rules, by = "confidence"), 50),
  method = "graph",
  control = list(verbose = TRUE),
  engine = "html"
)

# plot rules as scatter plot ----------------------------------------------

plot(head(sort(rules, by = "support"), 100), jitter = 10, engine = "plotly")

# plot rules as paracoord -------------------------------------------------

plot(head(sort(rules, by = "lift"), 20),
     method = "paracoord",
     control = list(reorder = TRUE))

# plot rules as grouped ---------------------------------------------------

plot(head(sort(rules, by = "support"), n = 50), method  = "grouped")