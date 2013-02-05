$ ->

  # Insert Table-of-Contents
  $('section:first').after '''
    <section class="slide">
      <ol id="toc"/>
    </section>
  '''
  $toc = $('#toc')

  $(':header').each ->
    $this = $(@)
    tag = $this[0].tagName
    if tag == 'H2'
      $toc.append "<li>#{ $this.text() }</li>"
    else if tag == 'H3'
      $toc.find(':last-child').append " &mdash;#{ $this.text() }"
  $toc.before '<h2>Contents</h2>'
