var Punchy = Punchy || {};

Punchy.Utilities = (function($, _){

  // Constants
  var DATETIME_PICKER_CLASS = '.datetime-picker';
  var VALIDATION_CLASS = '.validated-form';

  // Public Functions
  var setupValidation = function(element, options) {
    var _element = element || VALIDATION_CLASS;
    $(_element).validate(options);
  };

  var setupDateTimePicker = function(element, options) {
    var _element = element || DATETIME_PICKER_CLASS;

    $(_element).datetimepicker();;
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
  }

})(jQuery, _);

$(function(){
  Punchy.Utilities.init();
});