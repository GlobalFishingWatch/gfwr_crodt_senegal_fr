# Rappel : R vs RStudio. langage vs logiciel qui communique avec R.
# Il y a d'autres modes d'interaction avec R (utiliser R directement aussi)

############################### RStudio ######################################
# Quatre panneaux

# 1. Panneau source. Scripts, principalement des fichiers avec l'extension .R
# control + enter pour envoyer au console. commandes simples:
2 + 2

# 2. Panneau console, terminal et travaux en arrière plan. Où R est tourné.
# > console prêt a recevoir une commande.
# + à l'attente. Erreur commune par ex. une parenthèse n'est pas fermée correctement

# 3. et 4. Panneaux avec des onglets que l'on peut réorganiser.
# Par défaut, en haut à droite : Environnement, Historique, Connexions, Git
# (si en control de versions), et Didacticiel
# et en bas à droite : Fichiers, Graphiques, Packages, Aide, Tracés et Présentations
# (Tools > ) Global Options > Pane Layout

# Onglet environnement : Objets sauvés de manière temporaire dans la mémoire RAM
# de l'ordinateur. Crées pendant la session.
#
# Pour sauver dans l'environnement de travail : commande <- (préféré) ou =
# ex.

trois <- 3
# un objet trois doit apparaitre dans l'environment


# Onglet history. Historique des commandes.

# Onglet files : permet de naviguer la structure des fichiers de l'ordinateur

# Onglet plots: où les graphiques vont apparaître

# Onglet packages : packages installés (CRAN install packages("xxx"))

# Ongle help: menus d'aide
# pour actionner le help: ? ou help()

## Commandes de base
# Charger un package
library(gfwr)

# Chercher le menu d'aide
help("gfwr")

help("gfw_vessel_info")
# Toujours la même structure :
# Description
# Usage (arguments, leur ordre, les valeurs par défaut
# Arguments: une explication de chaque un, quelques informations
# par ex. "numeric" pour indiquer qu'il faut utiliser une valuer numérique
# Details: informations utiles
# Examples
# on peut copier coller, ou selectionner et exécuter


##################### Types d'objets sur R ####################################

# Classes
# numérique, caractère, logique,
3
"a"
TRUE

class(3)
class("a")
class("3")
class(TRUE)

# Il y a d'autres come integer: un nombre entier.
3L
class(3L)

# Vecteurs: avec la fonction c() -> "concatenate"
c(3, 2, 1) # ne crée pas d'objet
objet <- c(3, 2, 1)
class(objet)
is(objet)

# Si on mélange des caractères, numériques et logiques,
# caractère prévaudra sur numerique et sur logique
mix <- c(3, "a")
class(mix)

mix <- c(3, "a", TRUE)
mix
class(mix)

# numeric prévaut sur logique: TRUE = 1 FALSE = 0
mix <- c(TRUE, 1)
mix
class(mix)


mix <- c(FALSE, 1)
mix
class(mix)

# Les classes et les rapports entre elles sont importantes parce que les
# fonctions sont créées pour opérer sur des types de données spécifiques
# ex. logical: TRUE ou FALSE
# ex. numeric: 3, pas "3"


## Dataframes (tables)
# C'est le format le plus commun lorsqu'on lit un fichier (excel, csv, txt) sur R

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
# Exemple : Un data frame de trois colonnes
# Une colonne caractère : nom du navire,
# Une colonne numérique : nombre d'heures,
# Une colonne logique : est-il un navire de pêche ? TRUE FALSE

# Au cours de cette semaine on verra des fonctions et suites de commandes pour selectionner des données.


## Listes

# Une liste est un objet avec une structure beaucoup moin rigide.
# Ses éléments peuvent être de n'importe quel nature (y compris d'autres listes).

objet1 <- c(1, 3, 4)
objet2 <- c("b", "oi", 4)
objet3 <- c(TRUE, TRUE, FALSE)

liste <- list(objet1, objet2, objet3)

# On peut créer une liste dont les éléments sont nommés :
liste_nomee <- list(numeriques = objet1,
                    caracteres = objet2,
                    logiques = objet3)

# On peut aussi donner des noms a une liste déjà créée :
names(liste) <- c("numeriques", "caracteres", "logiques")

str(liste)

# Il y a des façons différentes d'accéder directement à des éléments particuliers
# d'une liste
liste[[1]]
liste$numeriques

liste[[1]][2:3]
liste$numeriques[2:3]

