$ ->

  # Display background images behind slides
  $('.background').wrapInner '<div class="over-background"/>'
  $('.background').each ->
    $div = $(@)
    $div.css
      'background-size': 'cover'
      'background-image': "url('img/#{ $div.attr 'data-src' }')"
