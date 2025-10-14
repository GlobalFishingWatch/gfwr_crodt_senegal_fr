# port visits


id_test <- "098ac6ed6-65a9-260b-fb84-8c932eb977ae"

"2ca1c3012-2271-15cd-ea08-2e536333f615"

visites_port <- gfw_event(event_type = "PORT_VISIT",
          vessels = "098ac6ed6-65a9-260b-fb84-8c932eb977ae",
          start_date = "2017-01-26",
          end_date = "2022-12-31",
          key = gfw_auth())
names(visites_port)

View(visites_port)
visites_port %>% tidyr::unnest_wider(event_info) %>% View()

gfw_event(event_type = "PORT_VISIT",
          vessels = id_test,
          start_date = "2017-01-26",
          end_date = "2022-12-31",
          confidence = c(3), # only for port visits
          key = gfw_auth())


# GAPS - interrupcoes na transmissao

gaps <- gfw_event(event_type = "GAP",
          vessels = id_test,
          start_date = "2017-01-26",
          end_date = "2023-02-04",
          key = gfw_auth())
View(gaps)
gaps %>% unnest_wider(event_info) %>% View() #para ver a informacao de cada evento

# da para filtrar por gaps intencionais
gfw_event(event_type = "GAP",
          vessels = id_test,
          start_date = "2017-01-26",
          end_date = "2023-02-04",
          gap_intentional_disabling = TRUE,
          key = gfw_auth()) %>%
  unnest_wider(event_info)


