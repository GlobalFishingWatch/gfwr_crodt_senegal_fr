# pour charger les packages
library(gfwr)
library(tidyr)
library(dplyr)

# Toujours commencer par le help de la fonction
# Uma busca simples
# primeiro parametro é query

info_vessel <- gfw_vessel_info(query = 431782000, #length 1: un seul
                               search_type = "search",
                               key = gfw_auth())

# search_type = "search" e key = gfw_auth() sont les defaults
# cette commande est équivalente a gfw_vessel_info(431782000)

# 2 vessels!


# explorant l'objet
# noms
names(info_vessel) # sept parties
# selectionner avec signe dolar $
info_vessel$dataset

# ou crochets []
info_vessel["registryInfoTotalRecords"]

# conseil: avec % autocomplete suggère

# 1. Info AIS $selfReportedInfo:

info_vessel$selfReportedInfo
names(info_vessel$selfReportedInfo)
View(info_vessel$selfReportedInfo)

# 2. registre $registryInfo
info_vessel$registryInfo

# info supplémentaire! IMO du deuxième par ex. callsign
# geartype, tonnage


# 3 Autorizations
info_vessel$registryPublicAuthorizations
info_vessel$registryPublicAuthorizations %>% unnest(sourceCode)
# quando vous trouvez des info ocultes utilisez la fonction unnest de tidyr

# 4 Propriétaires

info_vessel$registryOwners
info_vessel$registryOwners %>% unnest(sourceCode)

#
View(info_vessel$combinedSourcesInfo) #geartypes qui viennent du modèle? Ask Willa and Gisela!


# Da para inferir qualquer comportamento suspeito?
# mmsi pode ser reutilizado, essa é uma das desvantagens
# toda mudanca de bandeira precisa de mudanca no MMSI/ssvid!
# podemos explorar as datas que o mmsi foi utilizado em cada barco:
info_vessel$selfReportedInfo[c("transmissionDateFrom", "transmissionDateTo", "ssvid", "index", "flag")]
#vamos organizar por datas
info_vessel$selfReportedInfo[c("transmissionDateFrom", "transmissionDateTo", "ssvid", "index")] %>%
  arrange(transmissionDateFrom, transmissionDateTo)
# o mmsi que a gente buscou nao foi utilizado ao mesmo tempo! pode ser um caso simples de
# reuso / reciclagem de mmsi



## REQUEST PAR ID

info_vessel$selfReportedInfo$vesselId[4]


id <- info_vessel$selfReportedInfo$vesselId[4]
id


id_search <- gfw_vessel_info(search_type = "id", ids = id) #aí só volta a unica id associada

id_test2 <- info_vessel$selfReportedInfo$vesselId[1] #seleciona o quarto elemento da
id_test2
gfw_vessel_info(search_type = "id", ids = id_test2) #aí só volta a unica id associada mas Ai combined sources info vai mostrar as demais vesselId associadas.

#######################
#
#
#
#
senegal_trawlers2 <- gfw_vessel_info(where = "flag = 'SEN' AND geartypes = 'TRAWLERS'",
  search_type = "search", print_request = TRUE
  )
names(senegal_trawlers)

senegal_trawlers$selfReportedInfo[, c("index", "vesselId")]

# On va utiliser des fonctions de R pour explorer cet objet

senegal_trawlers$selfReportedInfo[, c("index", "vesselId")] |> tail()
# 5818 navires

nrow(senegal_trawlers$selfReportedInfo)
tail(senegal_trawlers$selfReportedInfo)
# 5943 vessel id
unique(senegal_trawlers$selfReportedInfo[, c("vesselId")]) #5932 vesselid

which(duplicated(senegal_trawlers$selfReportedInfo$vesselId))

id_dinteret <- senegal_trawlers$selfReportedInfo[which(duplicated(senegal_trawlers$selfReportedInfo$vesselId)),]$vesselId

senegal_trawlers$selfReportedInfo |> filter(vesselId %in% id_dinteret) |> View()


View(senegal_trawlers$registryInfo) #most vessels have no registry
any(senegal_trawlers$registryInfo$vesselInfoReference %in% id_dinteret)
any(senegal_trawlers$registryInfo$vesselInfoReference %in% senegal_trawlers$selfReportedInfo$vesselId)

####NOTA AQUI, INVESTIGAR LOS DUPLICADOS EN LA FUNCION Y PREGUNTAR SOBRE LOS QUE VUELVEN SIN
