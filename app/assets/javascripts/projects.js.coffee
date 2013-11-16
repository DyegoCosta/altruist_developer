$ ->
  $("#new-project").click openCreateProjectModal
  $("#projectFormModal .save-project").click submitModalForm

openCreateProjectModal = ->
  $.get "/projects/new", (data) ->
    renderModal
      title:  "new project"
      body:   data

renderModal = (args) ->
  modal = $("#projectFormModal")

  $(".modal-title", modal).html args.title
  $(".modal-body", modal).html args.body

  modal.find("form").validate()
  modal.modal "show"

submitModalForm = (e) ->
  $(e.target).parents(".modal-content").find("form").submit()
