require 'spec_helper'

describe 'Missing files error' do

  let (:taxonomy) { "<?xml version='1.0' encoding='utf-8'?>
              <taxonomies>
                <taxonomy>
                  <taxonomy_name>World</taxonomy_name>
                    <node atlas_node_id = '355064' ethyl_content_object_id='82534' geo_id = '355064'>
                      <node_name>Africa</node_name>
                      </node>
                    </node>
                  </taxonomy>
                </taxonomy>
              </taxonomies>"
  }

  it 'returns a message when no taxonomy.xml file is found' do
    visit root_path
    error_file_message
  end

  it 'returns a message when no destinations.xml file is found' do
    Taxonomy.create!(
      path: '/lib/taxonomy/taxonomy.xml'
    )
    allow(File).to receive(:read).with(Taxonomy.current_path).and_return(taxonomy)

    visit root_path
    error_file_message
  end

  def error_file_message
    expect(page).to have_content 'There is not any information to display, ' \
      'sorry about that!'
  end
end
