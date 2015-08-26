$ ->
  $container = $('.masonry-container')
  $container.imagesLoaded ->
    $container.masonry
      columnWidth: '.brick'
      itemSelector: '.brick'
    return
  $container.infinitescroll {
    navSelector: '.pagination'
    nextSelector: '.pagination .next_page'
    itemSelector: '.brick'
    loading:
      finishedMsg: 'No more press releases to load.'
      img: 'data:image/gif;base64,R0lGODlhAQABAHAAACH5BAUAAAAALAAAAAABAAEAAAICRAEAOw=='
      msgText: '<i class="fa fa-refresh fa-spin fa-2x"></i>'
  }, (newElements) ->
    $newElems = undefined
    $newElems = $(newElements).css(opacity: 0)
    $newElems.imagesLoaded ->
      $newElems.animate opacity: 1
      $container.masonry 'appended', $newElems, true
      return
    return
  return