
# SEEDLY

## API -- uses Farmsense

  http://www.farmsense.net/


---

# notes for myself DELETE/EDIT when submitting

- HTTParty.get('http://farmsense-prod.apigee.net/v1/frostdates/stations/?lat=43.42332138&lon=-112.01243728') returns a string with an array of hashes of stations

- HTTParty.get('http://farmsense-prod.apigee.net/v1/frostdates/probabilities/?station=104455&season=1') returns hash of probabilities for the station

  - JSON.parse(probabilities)

         [0] {
                    "season_id" => "1",
        "temperature_threshold" => "36",
                      "prob_90" => "0525",
                      "prob_80" => "0531",
                      "prob_70" => "0604",
                      "prob_60" => "0607",
                      "prob_50" => "0611",
                      "prob_40" => "0614",
                      "prob_30" => "0618",
                      "prob_20" => "0622",
                      "prob_10" => "0628"
    },
          [1] {
                    "season_id" => "1",
        "temperature_threshold" => "32",
                      "prob_90" => "0507",
                      "prob_80" => "0514",
                      "prob_70" => "0519",
                      "prob_60" => "0523",
                      "prob_50" => "0527",
                      "prob_40" => "0531",
                      "prob_30" => "0604",
                      "prob_20" => "0609",
                      "prob_10" => "0616"
