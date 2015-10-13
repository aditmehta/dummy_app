@TaskForm =
  show: ->
    $('#task-form').removeClass('hidden')
    $('#task-form-trigger').addClass('hidden')

  hide: ->
    $('#task-form').addClass('hidden')
    $('#task-form-trigger').removeClass('hidden')

$ ->
  $('#task-form-trigger').click (ev) ->
    ev.preventDefault()
    TaskForm.show()

  $('#task-form-closer').click (ev) ->
    ev.preventDefault()
    TaskForm.hide()