google.load "visualization", "1", { packages: ["corechart"] }

$ ->
  guild_name = Dmtc.Globals.guilds.liked.getName()
  liked_count = Dmtc.Globals.guilds.liked.getLikedCount()
  maxLikes = Dmtc.Globals.guilds.liked.maxLikes()
  colors =  Dmtc.Globals.guilds.liked.statsColors()
  liked = _.zip(guild_name,liked_count,colors)
  sum = _.reduce(liked_count,(x, y) -> x + y)

  $('a[href="#guilds-tab"]').on 'shown.bs.tab', (e) ->
    drawLikedChart()

  drawLikedChart = ->
    return unless Dmtc.Globals.guilds.liked?
    return unless liked.length > 0
    return unless sum > 0
    container = document.getElementById('liked-columnchart')
    container.style.display = 'block'
    data = google.visualization.arrayToDataTable([['Guild', I18n.t('code.likes_number'), role:'style']].concat liked)
    chart = new google.visualization.ColumnChart(container);
    options =
      backgroundColor: "#EEDFC7"
      title: I18n.t('code.likes_number')
      titleTextStyle:
        fontSize: 18
      legend:
        position: 'none'
      vAxis:
        minValue: 0
        maxValue: Math.max(4, maxLikes)

    chart.draw data, options

  if sum > 0
    google.setOnLoadCallback drawLikedChart
