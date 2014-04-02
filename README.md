
# SEEDLY — v. 0.0.1

---

### Heroku


Seedly is available at the following heroku link. All currently available features are accessible and functioning. Any error is your own fault.

  http://blueberry-cake-1111.herokuapp.com/

### pivotal tracker


  https://www.pivotaltracker.com/s/projects/1047464#


### API -- uses Farmsense

  http://www.farmsense.net/

In the coming months farmsesnse will be adding an API key. The code will need to be updated to match this change.

---

## ABOUT

`Seedly` is an app for gardeners and planters with a focus on seed planting. The app provides the user with Autumn frost date averages by lattitute and longitude.

It also provides an easy way for users to store information about their seeds and where they are planted.

##### V. 0.0.2

`V. 0.0.2` will provide a form for users to calculate when they should plant any individual seed based on the frost date probabilities for their location. It will provide users with the ability to create and store `beds`, which will contain any seed info they upload into it. Finally, the next update will allow users to find their frost date averages by location or zipcode rather than by latitude and longitude.


### Notes for the developer.

Farmesense returns a probabiliity hash for spring and autumn that looks like the following. This app is only concerned with `"prob_90"` but includes `"prob_50"` and `"prob_10"` for autumn as supplemental information climate normals for the user.

```
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
```

This is an example of date/time using rails date magic. Implementation TBD.

```

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

```
