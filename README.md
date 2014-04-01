
# SEEDLY

## API -- uses Farmsense

- http://www.farmsense.net/

## pivotal tracker

- https://www.pivotaltracker.com/s/projects/1047464#
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


[1] pry(main)> 2.days.ago
=> Sat, 29 Mar 2014 21:29:38 UTC +00:00
[2] pry(main)> 6.days.ago
=> Tue, 25 Mar 2014 21:29:42 UTC +00:00
[3] pry(main)> Date.today
=> Mon, 31 Mar 2014
[4] pry(main)> Date.parse("September 6th, 2014")
=> Sat, 06 Sep 2014
[5] pry(main)> Date.parse("September 6th, 2014") - 2.weeks
=> Sat, 23 Aug 2014
[6] pry(main)>
