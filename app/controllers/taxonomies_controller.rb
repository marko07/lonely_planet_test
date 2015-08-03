class TaxonomiesController < ApplicationController
  def create
    Taxonomy.create(taxonomy_params)
  end

  private

  def taxonomy_params
    params.require(:taxonomy).permit(:path)
  end
end
