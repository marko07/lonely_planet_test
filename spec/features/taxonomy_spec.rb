require 'spec_helper'

describe "Taxonomy setup", js: true do
  it 'create a taxonomy row with the current path for the file' do
    visit root_path

    expect(page).to have_content "Please, tell me which is the path for Taxonomy file"

    within ".taxonomy_div" do
      fill_in "taxonomy_path", with: "lib/files/taxonomy.xml"
      click_button "Set it!!"
    end

    expect(Taxonomy.all.size).to eq 1
    expect(page).to have_content "Thanks, we have now a Taxonomy path."
  end
end
