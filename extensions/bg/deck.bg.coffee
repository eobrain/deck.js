$ ->

  # Display background images behind slides
  $background = $('[data-bg]')
  $background.wrapInner '<div class="over-background slide"/>'
  $background.each ->
    $div = $(@)
    $div.css
      'background-repeat': 'no-repeat'
      'background-size': '100% auto'
      'background-image': "url('img/#{ $div.attr 'data-bg' }')"
  #$background.append '<div class="slide"/>'
