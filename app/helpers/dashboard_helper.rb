module DashboardHelper
  def process_information(destination)
    destination.each do |key, information|
      # binding.pry

      if information.is_a?(Hash)
        @html += "<h#{@indent}> #{key.titleize} </h#{@indent}>"
        @indent += 1 if @indent < 5
        process_information(information)
      else
        @html += "<h#{@indent}> #{key.titleize} </h#{@indent}> <p> #{information.is_a?(Array) ?  information[0]: information} </p>"
        @indent = 3
      end
    end

  end

  def information_to_display(destination)
    @indent = 3
    @html = ""
    destination.delete("atlas_id")
    destination.delete("asset_id")
    destination.delete("title")
    destination.delete("title_ascii")
    process_information(destination)
    @html
  end
end