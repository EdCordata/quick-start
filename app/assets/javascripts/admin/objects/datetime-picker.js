init.dateTimePicker = function () {

  var params = {
    cancelText:    gon.locales.translations.datetime_picker.cancel_text,
    clearText:     gon.locales.translations.datetime_picker.clear_text,
    nowText:       gon.locales.translations.datetime_picker.now_text,
    okText:        gon.locales.translations.datetime_picker.ok_text,
    lang:          gon.locales.current,
    weekStart:     1,
    nowButton:     true,
    switchOnClick: true
  };

  $('.js-datetime-picker').bootstrapMaterialDatePicker(
    $.extend(params, {
      format: gon.datetime.formats.datetime
    })
  );

  $('.js-date-picker').bootstrapMaterialDatePicker(
    $.extend(params, {
      format: gon.datetime.formats.date, time: false
    })
  );

  $('.js-time-picker').bootstrapMaterialDatePicker(
    $.extend(params, {
      format: gon.datetime.formats.time,
      date:   false
    })
  );

};
