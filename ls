[1mdiff --git a/app/assets/javascripts/fan_profile.js.coffee b/app/assets/javascripts/fan_profile.js.coffee[m
[1mindex 5d791a9..5faddab 100644[m
[1m--- a/app/assets/javascripts/fan_profile.js.coffee[m
[1m+++ b/app/assets/javascripts/fan_profile.js.coffee[m
[36m@@ -58,6 +58,7 @@[m [m$ ->[m
         )[m
         previousData = Enumerable.From($("input.band_selection_field").data("bands"))[m
         newData = fetchedArtists.Union(previousData).ToArray()[m
[32m+[m
         $("input.band_selection_field").data "bands", newData[m
         $("input.band_selection_field").select2 tags: newData[m
         $("input.band_selection_field").val(newData).trigger "change"[m
