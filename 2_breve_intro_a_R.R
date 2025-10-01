# R vs RStudio. langage vs logiciel qui communique avec R. Il y a d'autres modes
# d'interaction avec R (utiliser R directement aussi)

# Quatre panneaux

# 1. scripts, fichiers avec l'extension .R
  # control + enter pour envoyer au console.

# 2. console. où R roule
# > console prêt a recevoir une commande.
# + à l'attente. Erreur commune par ex. une parenthèse n'est pas fermée correctement

# control + enter pour envoyer au console. commandes simples:
2 + 2


# Panneaux 3. et 4. avec des tabs que l'on peut réorganizer.
# (Tools > )Global Options > Pane Layout

# Environment: Objets sauvés dans la mémoire RAM de l'ordinateur.
# Crées pendant la session.
#
# Pour sauver: commande <- (préférée) ou =
# ex.

trois <- 3

# un objet trois doit apparaitre dans l'environment


# Histoire des commandes
# Packages: packages installés (CRAN install packages("xxx"))

# Files: permet de naviguer la structure des fichers de l'ordinateur

# Plots: où les plots vont apparaître

# Help: menus d'aide
# pour actionner le help: ? ou help()

## COMMANDES BASIQUES
# Charger un package
library(gfwr)

# chercher le menu d'aide
help("gfwr")
# Index

help("gfw_vessel_info")


# Toujours la même structure
# Description
# Usage (arguments, leur ordre, les valeur par défaut
# Arguments: une explication de chaque un, quelques informations par ex. "numeric"
# pour indiquer qu'il faut utiliser une valuer numérique
# Details: informations utiles
# Examples
# on peut copier coller, ou selectionner et exécuter


# Types d'objets sur R

# Classes
# numeric character, logical,
3
"a"
TRUE

class(3)
class("a")
class("3")
class(TRUE)

# Il y a d'autres come integer: nombres entiers.
3L
class(3L)



# Vecteurs: Crées avec la fonction c() -> "concatenate"
3

c(3, 2, 1) #ne crée pas d'objet
objet <- c(3, 2, 1)
class(objet)
is(objet)

# Si on mélange des caractères, numériques et logiques,
# character aura dominance sur numeric et sur logical
mix <- c(3, "a")
class(mix)

mix <- c(3, "a", TRUE)
mix
class(mix)

# numeric remporte sur logique: TRUE = 1 FALSE = 0
mix <- c(TRUE, 1)
mix
class(mix)


mix <- c(FALSE, 1)
mix
class(mix)

# Important parce que les fonctions diront le type de donnée d'entrée.
# logical: TRUE ou FALSE
# numeric: 3, pas "3"


# Dataframes (tables) de plusieurs manières.
# La plus commune: lisez un fichier
# excel
# csv ou txt

dataframe1 <- data.frame(var1 = "a",
                         var2 = "b",
                         var3 = "c")
dataframe1
View(dataframe1)

dataframe2 <- data.frame(var1 = c(1, 3, 4),
                        var2 = c("b", "oi", 4),
                        var3 = c(TRUE, TRUE, FALSE))
dataframe2
# chaque colonne est un vecteur: éléments du même type
# MAIS les colonnes n'ont pas besoin d'être du même type
# Character: nom, Numeric: nombre d'heures, Logical: est-ce un navire de pêche: TRUE FALSE)

# Au cours de cette semaine on verra des fonctions et suites de commandes pour selectionner des données.
