# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('.extend-company-list').click (e) ->
    e.preventDefault()
    companyForm = $('#company-form')
    openForm(companyForm, selectCompany)


openForm = (form, callback) ->
  form.show()




selectCompany = () ->
  alert('selecting a company')