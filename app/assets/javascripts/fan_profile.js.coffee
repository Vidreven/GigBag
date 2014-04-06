$ ->
  fetchUserData = undefined
  lastfm = undefined
  lastfmCache = undefined
  $("#select2-drop").change (event) ->
    fetchUserData event.val if event.val
    return

  $("#fetchUser").click (event) ->
  	fetchUserData $("#fan_profile_lastfm_username").val()

  $("#fan_profile_lastfm_username").keydown (event) ->
  	if event.which == 13
  		event.preventDefault() 
  		fetchUserData $("#fan_profile_lastfm_username").val()

  fetchUserData = (username) ->
    opts = undefined
    spinner = undefined
    target = undefined
    opts =
      lines: 13
      length: 20
      width: 10
      radius: 30
      corners: 1
      rotate: 0
      direction: 1
      color: "#000"
      speed: 1
      trail: 60
      shadow: false
      hwaccel: false
      className: "spinner"
      zIndex: 2e9
      top: "auto"
      left: "auto"

    target = document.getElementById("spinner")
    spinner = new Spinner(opts).spin(target)
    lastfm.user.getTopArtists
      user: username
      limit: "50"
    ,
      success: (data) ->
        fetchedArtists = undefined
        newData = undefined
        previousData = undefined
        spinner.stop()
        fetchedArtists = Enumerable.From(data.topartists.artist).Select((x) ->
          x.name
        )
        previousData = Enumerable.From($("input.band_selection_field").data("bands"))
        newData = fetchedArtists.Union(previousData).ToArray()
        $("input.band_selection_field").data "bands", newData
        $("input.band_selection_field").select2 tags: newData
        $("input.band_selection_field").val(newData).trigger "change"
        return

      error: (code, message) ->
        spinner.stop()
        console.log message
        return

    return

  lastfm = undefined
  lastfmCache = undefined
  $("input.band_selection_field").select2 tags: $("input.band_selection_field").data("bands")
  $("#sources").select2()
  lastfmCache = new LastFMCache()
  lastfm = new LastFM(
    apiKey: "300e96d1eeb49e5a0c0ecba01970b8e4"
    apiSecret: "3de5f59a9b755bb824af45b28f2efdba"
    cache: lastfmCache
  )
  
  return
