@TaskForm =
  show: ->
    $('#task-form').removeClass('hidden')
    $('#task-form-trigger').addClass('hidden')

  hide: ->
    $('#task-form').addClass('hidden')
    $('#task-form-trigger').removeClass('hidden')

@TaskSorter =
  serializeTasks: ->
    taskIds = []
    $('#tasks .task').toArray().forEach (ele) ->
      taskIds.push(parseInt(ele.id.split("-")[1]))
    taskIds
  submitTasksPositions: ->
    $.ajax
      url: "/tasks/sort"
      type: "PUT"
      data:
        ids: TaskSorter.serializeTasks()

$ ->
  $('#task-form-trigger').click (ev) ->
    ev.preventDefault()
    TaskForm.show()

  $('#task-form-closer').click (ev) ->
    ev.preventDefault()
    TaskForm.hide()

  $('#tasks').sortable
    items: "> div.task"
    containment: "#tasks-container"
    placeholder: "sortable-placeholder"
    handle: ".drag-handle"
    stop: ->
      TaskSorter.submitTasksPositions()

  $('#tasks .task h4, #tasks .task p').click ->
    $(@).siblings('a.details').click()

  $($('#tasks .task a.details')[0]).click()