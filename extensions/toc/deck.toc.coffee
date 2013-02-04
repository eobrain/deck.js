$ ->

  # Insert Table-of-Contents
  $('section:first').after '''
    <section class="slide">
      <ol id="toc"/>
    </section>
  '''
  $toc = $('#toc')

  $('h2').each ->
    $toc.append "<li>#{ $(@).text() }</li>"
  $toc.before '<h2>Contents</h2>'
