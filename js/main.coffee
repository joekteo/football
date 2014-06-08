$ ->

# --------------------------------------
# LINKS & TEMPLATES

  upcomingGames = [
    {
      homeTeam: "Brazil"
      awayTeam: "Argentina"
      date: "06-11-14 20:00"
      overUnder: "2.5"
      handicap: "-1.5"
    }
    {
      homeTeam: "Switzerland"
      awayTeam: "France"
      date: "06-12-14 20:00"
      overUnder: "2.5"
      handicap: "+1.5"
    }
    {
      homeTeam: "Germany"
      awayTeam: "Spain"
      date: "06-13-14 20:00"
      overUnder: "2.5"
      handicap: "-1.5"
    }
    {
      homeTeam: "United States"
      awayTeam: "Hong Kong"
      date: "06-30-15 20:00"
      overUnder: "4.5"
      handicap: "+2.5"
    }
  ]

  pastGames = [
    {
      homeTeam: "South Korea"
      awayTeam: "Australia"
      homeScore: "1"
      awayScore: "2"
      date: "06-07-14 20:00"
      overUnder: "2.5"
      handicap: "-1.5"
    }
  ]

  unsetActive = () ->
    $('#header-navlinks').children().removeClass('active')
    $('#login-nav').children().children().removeClass('active')

  setActive = (lnk) ->
    lnk = $(lnk)
    unsetActive()
    # unsetActive(lnk)
    lnk.parent().addClass('active')

  upcomingTemplate = Handlebars.compile $("#upcoming-template").html()
  resultsTemplate = Handlebars.compile $("#results-template").html()
  leaderboardTemplate = Handlebars.compile $("#leaderboard-template").html()
  helpTemplate = Handlebars.compile $("#help-template").html()
  aboutTemplate = Handlebars.compile $("#about-template").html()
  contactTemplate = Handlebars.compile $("#contact-template").html()
  termsTemplate = Handlebars.compile $("#terms-template").html()
  privacyTemplate = Handlebars.compile $("#privacy-template").html()
  beforeLoginTemplate = Handlebars.compile $("#before-login-template").html()
  afterLoginTemplate = Handlebars.compile $("#after-login-template").html()
  profileTemplate = Handlebars.compile $("#profile-template").html()
  newEventTemplate = Handlebars.compile $("#new-event-template").html()

  loginNav = $('#login-nav')
  loginNav.html beforeLoginTemplate
  main = $('#main')
  main.html upcomingTemplate(
    upcomingGames: upcomingGames
    )

# ************************************************
  # main.html newEventTemplate
# ************************************************
  $('#header-navlinks').on 'click', '#upcoming-link', (e) ->
    e.preventDefault()
    setActive(@)
    main.html upcomingTemplate(
      upcomingGames: upcomingGames
      )

  $('#header-navlinks').on 'click', '#results-link', (e) ->
    e.preventDefault()
    setActive(@)
    main.html resultsTemplate(
      upcomingGames: pastGames
      )

  $('#header-navlinks').on 'click', '#leaderboard-link', (e) ->
    e.preventDefault()
    setActive(@)
    main.html leaderboardTemplate()

  $('#footer-navlinks').on 'click', '#help-link', (e) ->
    e.preventDefault()
    main.html helpTemplate()
    unsetActive()

  $('#footer-navlinks').on 'click', '#about-link', (e) ->
    e.preventDefault()
    main.html aboutTemplate()
    unsetActive()

  $('#footer-navlinks').on 'click', '#contact-link', (e) ->
    e.preventDefault()
    main.html contactTemplate()
    unsetActive()

  $('#footer-navlinks').on 'click', '#terms-link', (e) ->
    e.preventDefault()
    main.html termsTemplate()
    unsetActive()

  $('#footer-navlinks').on 'click', '#privacy-link', (e) ->
    e.preventDefault()
    main.html privacyTemplate()
    unsetActive()


  $('#login-nav').on 'click', 'button', (e) ->
    e.preventDefault()
    loginNav.html afterLoginTemplate()

  $('#login-nav').on 'click', '#before-login-link', (e) ->
    e.preventDefault()
    loginNav.html beforeLoginTemplate()
    main.html upcomingTemplate()

  $('#login-nav').on 'click', '#profile-link', (e) ->
    e.preventDefault()
    main.html profileTemplate()
    setActive(@)

  $('#login-nav').on 'click', '#new-event-link', (e) ->
    e.preventDefault()
    main.html newEventTemplate()
    setActive(@)

  $('#paid-event').on 'click', (e) ->
    $('#event-price-show').removeClass('hide')
  $('#free-event').on 'click', (e) ->
    $('#event-price-show').addClass('hide')

# --------------------------------------
# ########