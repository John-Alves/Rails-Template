module ApplicationHelper

  def page_header_helper(page_title, page_path = [], button = nil)
    html = ''
    html << " <div class='row page-titles'>"
    html << "   <div class='col-sm-5 align-self-center'>"
    html << "     <h4 class='text-themecolor'>#{page_title}</h4>"
    html << "   </div>"
    html << "   <div class='col-sm-7 align-self-center text-right'>"

    if page_path.length != 0
      html << "   <div class='d-flex justify-content-end align-items-center force-flexbox breadcrumb-navigator'>"
      html << "     <ol class='breadcrumb'>"

      page_path.each do |element|
        if element != page_path.last
          html << "   <li class='breadcrumb-item'>"
          html << "     <a href='#{element[:link]}'>#{element[:name]}</a>"
          html << "   </li>"
        else
          html << "   <li class='breadcrumb-item active'>#{element[:name]}</li>"
        end
      end

      html << "     </ol>"
    end

    unless button.nil?
      html << "     <a href='#{button[:link]}' class='#{button[:class]}'>"
      html << "       #{button[:content].html_safe}"
      html << "     </a>"
    end

    html << "     </div>"
    html << "   </div>"
    html << " </div>"
    html.html_safe
  end

  def configure_and_display_flash_messages
    html = ''
    unless flash[:notice].nil? && flash[:error].nil?
      html << mount_flash_message_html
    end
    html.html_safe
  end

  def mount_flash_message_html
    if flash[:notice]
      message = flash[:notice]
      type = 'alert-success'
    else
      message = flash[:error]
      type = 'alert-danger'
    end

    html = "<div class='alert #{type} alert-dismissible fade show' role='alert'>#{message}"
    html << ' <button type="button" class="close" data-dismiss="alert" aria-label="Close">'
    html << '   <span aria-hidden="true">&times;</span>'
    html << ' </button>'
    html << '</div>'
    html
  end

  def format_price(price)
    number_to_currency(price, delimiter: :'', separator: :',', precision: 2, unit: :'R$ ')
  end

end
