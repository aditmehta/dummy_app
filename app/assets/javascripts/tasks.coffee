$ ->
  $('#task-form-trigger').click (ev) ->
    ev.preventDefault();
    $('#task-form').removeClass('hidden')
    $('#task-form-trigger').addClass('hidden')

  $('#task-form-closer').click (ev) ->
    ev.preventDefault();
    $('#task-form').addClass('hidden')
    $('#task-form-trigger').removeClass('hidden')