var Punchy = Punchy || {};

Punchy.Utilities = (function($, _){

  // Constants
  var DATE_TIME_PICKER_CLASS = '.date-range-picker';
  var VALIDATION_CLASS = '.validated-form';

  // Public Functions
  var setupValidation = function(element, options) {
    var _element = element || VALIDATION_CLASS;
    $(_element).validate(options);
  };

  var setupDateTimePicker = function(element, options) {
    var _element = element || DATE_TIME_PICKER_CLASS;

    var updateOptions = $.extend( {}, options, {
      timePicker: true,
      timePicker24Hour: true,
      singleDatePicker: true,
      maxDate: moment(),
      opens: 'right',
      locale: {
        format: 'll hh:mm A'
      }
    });

    $(_element).daterangepicker(updateOptions);
  };

  var setupPopovers = function() {
    $('[data-toggle="popover"]').popover();
  };

  var init = function(){
    setupValidation();
    setupDateTimePicker();
    setupPopovers();
  };

  return {
    init: init,
    setupValidation: setupValidation,
    setupDateTimePicker: setupDateTimePicker
  }

})(jQuery, _);

$(function(){
  Punchy.Utilities.init();
});