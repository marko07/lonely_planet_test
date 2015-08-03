class DashboardController < ApplicationController
  include XmlToHtml
  include ReadFiles

  def index
    if params[:destination_selected].nil?
      read_files
      return @error = error_message if @destinations.nil? || @taxonomy.nil?
      @taxonomy_html =
        "<ul class='nav nav-list'>" \
        "<li><label class='tree-toggler nav-header'>World</label>"
      hash_to_html(@taxonomy["taxonomies"]["taxonomy"]["node"])
      @taxonomy_html.html_safe
    end

    info_to_display
  end

  private
  def error_message
    'There is not any information to display, sorry about that!'
  end

  def info_to_display
    read_destinations if @destinations.nil?
    if params[:destination_selected]
      @destinations["destinations"]["destination"].each do |section|
        if section["atlas_id"] == params[:destination_selected]
          @destination_selected = section
          return
        end
      end
    else
      @destination_selected = @destinations["destinations"]["destination"].first
    end
  end
end
