class DashboardController < ApplicationController
  def index
    read_files
    return @error = error_message if @destination.nil? || @taxonomy.nil?
  end

  private
  def error_message
    'There is not any information to display, sorry about that!'
  end

  def read_files
    if File.exist?("#{Rails.root}/lib/files/taxonomy.xml")
      @taxonomy = File.read("#{Rails.root}/lib/files/taxonomy.xml")

      if File.exist?("#{Rails.root}/lib/files/destionations.xml")
        @destination = File.read("#{Rails.root}/lib/files/destionations.xml")
      else
        Rails.logger.error 'There was an error loading destinations.xml file'
        @destination = nil
      end

    else
      Rails.logger.error 'There was an error loading @taxonomy.xml file'
      @taxonomy = nil
    end
  end
end
