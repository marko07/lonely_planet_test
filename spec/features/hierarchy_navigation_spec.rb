require 'spec_helper'

describe 'Hierarchy navigation' do
  before  do
    Taxonomy.create!(
      path: "lib/files/taxonomy/taxonomy.xml"
    )

    Destination.create!(
      path: "lib/files/destination/destinations.xml"
    )
  end

  it 'show display a hierarchy tree' do
    visit root_path

    within(:id, 'sidebar') do
      expect(page).to have_content 'Navigation'
      expect(page).to have_content "Africa"
    end
  end

  it 'hide hierarchy children after clicked a parent', js: true  do
    visit root_path

    expect(page).to have_content "Lonely Planet:"
    within(:id, 'sidebar') do
      expect(page).to have_content "SOUTH AFRICA"
      expect(page).to have_content "CAPE TOWN"
      find('label', :text => 'SOUTH AFRICA').click
      expect(page).not_to have_content "CAPE TOWN"
    end
  end

  it 'change information if destination clicked', js: true do
    visit root_path
    expect(page).to have_content "Lonely Planet: Africa"

    within(:id, 'sidebar') do
      find('label', :text => 'CAPE TOWN').click
    end

    expect(page).to have_content "Lonely Planet: Cape Town"
  end
end
