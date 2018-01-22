# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  update_preview = (text) ->
    _textarea = $('#article_content').val()
    if _textarea?
      #この位置が trueの場合の処理位置
      # alert("koko")
      $.ajax
        url: '/api_markdown'
        type: 'POST'
        data: {text: _textarea}
        success: (data) ->
          $('#preview').html(data)
          return
        error: (xhr, status, err) ->
          $('#preview').html 'エラー発生 ' + err
          return

  $('#article_content_preview').on 'click', ->
    update_preview()
    return
