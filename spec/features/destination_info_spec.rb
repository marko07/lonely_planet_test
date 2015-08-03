require 'spec_helper'

describe 'Destination information in home' do
  before  do
    Taxonomy.create!(
      path: "lib/files/taxonomy/taxonomy.xml"
    )

    Destination.create!(
      path: "lib/files/destination/destinations.xml"
    )
  end

  it 'show Africa 3 Hierarchy information' do
    visit root_path

    within(:id, "main") do
      expect(page).to have_selector('h3', text: 'History')
      expect(page).to have_selector('h4', text: 'History')
      expect(page).to have_selector('h5', text: 'History')
      expect(page).to have_content "You’ve probably heard the claim that Africa is ‘the birthplace of humanity’"
    end
  end
end
