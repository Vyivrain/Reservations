# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $.validator.addMethod("timeValidator", (value, element) ->
    checker = true
    checker = false if value[0] == "2" && parseInt(value[1]) > 4
    this.optional(element) || ( /[0-2][0-9]:[0-5][0-9]/.test(value) && checker )
  , "Please enter valid time"
  )

  $('.open-modal').click ->
    table_number = $(this).data('id')
    $('.modal-title').text("Reserve table ##{table_number}")
    $('.proceed').attr('disabled', 'disabled')

    $('#starttimepicker').datetimepicker(
      datepicker: false
      format: 'H:i'
    )

    $('#endtimepicker').datetimepicker(
      datepicker: false
      format: 'H:i'
    )
    
    $('#datepicker').datetimepicker(
      timepicker:false
      format:'Y-m-d'
    )

    form = $("#mytime")
    form.validate(
      errorElement: 'div'
      rules:
        datepicker:
          required: true
          dateISO: true
        starttimepicker:
          required: true
          timeValidator: true
        endtimepicker:
          required: true
          timeValidator: true
    )

    $('#starttimepicker').on('change', ->
      if form.valid()
        $('.proceed').removeAttr('disabled')
      else
        $('.proceed').attr('disabled', 'disabled')
    )

    $('#endtimepicker').on('change', ->
      if form.valid()
        $('.proceed').removeAttr('disabled')
      else
        $('.proceed').attr('disabled', 'disabled')
    )

    $('#datepicker').on('change', ->
      if form.valid()
        $('.proceed').removeAttr('disabled')
      else
        $('.proceed').attr('disabled', 'disabled')
    )

    $('#myModal').on('hide.bs.modal', ->
      $('#datepicker').val('')
      $('#starttimepicker').val('')
      $('#endtimepicker').val('')
      $('.alert-danger').remove()
    )

    $('.proceed').unbind().click ->
      $.ajax
        url: '/reservations'
        type: 'POST'
        data:
          start_time: $('#starttimepicker').val()
          end_time: $('#endtimepicker').val()
          date: $('#datepicker').val()
          table_number: table_number
        success: (response) ->

          $('#myModal').modal('hide')

          $('#anotherModal').modal('show')
        error: (response) ->
          $('.alert-danger').remove()
          for k,v of response.responseJSON
            $('#mytime').before("<label class='alert alert-danger'>#{v}</label>")


