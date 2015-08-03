require 'spec_helper'

describe "Destination setup", js: true do
  it 'create a destination row with the current path for the file' do
    visit root_path

    expect(page).to have_content "Please, tell me which is the path for Destinations file"

    within ".destinations_div" do
      fill_in "destination_path", with: "lib/files/destinations.xml"
      click_button "Set it!!"
    end

    expect(Destination.all.size).to eq 1
    expect(page).to have_content "Thanks, we have now a Destination path."
  end
end
