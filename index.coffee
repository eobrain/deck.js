$ ->

  $('section').addClass 'slide'

  adjustMainFigure = ->
    $('.main-figure').each ->
      $fig = $(@)
      bottom = $fig.offset().top + $fig.width()
      #if too tall, dy is positive
      dy = bottom - $(window).height()
      height = $fig.height()
      scale = height/(height+dy)
      $fig.height scale*height
      $fig.width  scale*$fig.width()

  ignore = ->
      $fig = $(@)
      bottom = $fig.offset().top + $fig.width()
      if bottom > $(window).height()
        $fig.addClass 'too-high'



  ignore = ->
      figW = $fig.width()
      figH = $fig.height()
      winW = $(window).width()
      winH = $(window).height() - $fig.offset().top
      if figW/figH > winW/winH
        #figure too wide for window
        $fig.css
          width: winW+'px'
          height: (winW*figH/figW)+'px';
      else
        $fig.css
          height: winH+'px';
          width: (winH*figW/figH)+'px'


  #Initialize
  $.deck '.slide'


  $(window).resize adjustMainFigure
  adjustMainFigure
