module SimpleForm
  class UiDatePickerInput < ::SimpleForm::Inputs::Base
    def input
      @builder.text_field(attribute_name, input_html_options)
    end

    protected
    def input_html_options
      super.merge(date_picker_options(object.send(attribute_name)))
    end

    def date_picker_options(value = nil)
      {:value => localized(value), :class => css_class}
    end

    def css_class
      "ui-date-picker"
    end
    
    def localized(value)
      value.respond_to?(:to_date) ? value.to_date : nil
    end
  end
end


::SimpleForm::FormBuilder.map_type :"ui_date_picker", :to => SimpleForm::UiDatePickerInput