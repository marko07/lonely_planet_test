module ReadFiles
  def read_files
    if Taxonomy.all.any? && File.exist?(Taxonomy.current_path)
      @taxonomy_xml = File.read(Taxonomy.current_path)
      @taxonomy = Hash.from_xml(@taxonomy_xml)

      if Destination.all.any? && File.exist?(Destination.current_path)
        read_destinations
      else
        log_error("Destinations", @destinations)
      end
    else
      log_error("Taxonomy", @taxonomy)
    end
  end

  def read_destinations
    @destinations_xml = File.read(Destination.current_path)
    @destinations = Hash.from_xml(@destinations_xml)
  end

  def log_error(file, resource)
    Rails.logger.error "There was an error loading #{file} file"
    resource = nil
  end
end
