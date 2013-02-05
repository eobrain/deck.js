$ ->

  # Display background images behind slides
  $bg = $('[data-bg]')
  if $bg.find('*').size() > 0
    $bg.wrapInner '<div class="over-background slide"/>'
  $bg.each ->
    $div = $(@)
    $div.css
      'background-repeat': 'no-repeat'
      'background-size': 'cover'
      'background-position': 'center center'
      'background-image': "url('img/#{ $div.attr 'data-bg' }')"
  #$bg.append '<div class="slide"/>'
  $contain = $('[data-contain]')
  #if $contain.children().size() > 0
  #  $contain.wrapInner '<div class="over-background slide"/>'
  $contain.each ->
    $div = $(@)
    $div.css
      'background-repeat': 'no-repeat'
      'background-size': 'contain'
      'background-position': 'center center'
      'background-image': "url('img/#{ $div.attr 'data-contain' }')"
  #$contain.append '<div class="slide"/>'
