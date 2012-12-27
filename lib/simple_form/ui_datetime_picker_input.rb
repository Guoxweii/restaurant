require File.expand_path("../ui_date_picker_input", __FILE__)


module SimpleForm
  class UiDatetimePickerInput < UiDatePickerInput
    def css_class
      "ui-datetime-picker"
    end
    
    def localized(value)
      value.respond_to?(:strftime) ? value.strftime("%Y-%m-%d %H:%M") : nil
    end 
  end
end

::SimpleForm::FormBuilder.map_type :"ui_datetime_picker", :to => SimpleForm::UiDatetimePickerInput