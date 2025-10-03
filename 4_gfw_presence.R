# entre janeiro e marco de 2023.
sen_presence <- gfw_ais_presence(spatial_resolution = 'LOW',
                                     temporal_resolution = 'MONTHLY',
                                     start_date = '2023-01-01',
                                     end_date = '2023-04-01',
                                     region = 8371,
                                     region_source = 'EEZ',
                                     key = gfw_auth())
