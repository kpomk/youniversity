# # class PagedownInput < SimpleForm::Inputs::TextInput
#   def input(wrapper_options)
#     out = "\n"
#     html_options = input_html_options.merge(class: 'wmd-input', id: "wmd-input-#{attribute_name}")
#     out << "#{@builder.text_area(attribute_name, merge_options(html_options, wrapper_options)) }"
#     if input_html_options[:preview]
#       out << ""
#     end
#     out.html_safe
#   end

#   private

#   def merge_options(html_opts, wrapper_opts)
#     html_opts.merge(wrapper_opts) { |_key, first, second| first + ' ' + second }
#   end
# end