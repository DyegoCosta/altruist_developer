$ ->
  $("#new-project").click openCreateProjectModal
  $("#projectFormModal .save-project").click submitModalForm
  $("a[name='cancel-project']").on("click", openCancelationConfirmation)
  $("article.projects dt").on("click", toggleProjectDetails)

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

openCancelationConfirmation = (e) ->
  projectId = $(e.target).data("project")
  modal = $("#cancelProjectModal")
  $(".btn-cancel-project", modal).attr("href", "/projects/#{projectId}")
  modal.modal()

toggleProjectDetails = (e) ->
  $(e.currentTarget).next("dd").slideToggle()
