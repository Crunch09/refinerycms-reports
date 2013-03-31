jQuery ->
  $('form#new_image').fileupload()

  $('div.gallery_image').hover ()->
    $(this).find('a.remove_image').show()

  $('div.gallery_image').mouseleave ()->
    $(this).find('a.remove_image').hide()

  $('a.remove_image').click ()->
    $(this).parent().remove()
