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
    if Taxonomy.all.any? && File.exist?(Taxonomy.current_path)
      @taxonomy = File.read(Taxonomy.current_path)

      if Destination.all.any && File.exist?(Destination.current_path)
        @destination = File.read(Destination.current_path)
      else
        log_error("Destinations", @destination)
      end
    else
      log_error("Taxonomy", @taxonomy)
    end
  end

  def log_error(file, resource)
    Rails.logger.error "There was an error loading #{file} file"
    resource = nil
  end
end
