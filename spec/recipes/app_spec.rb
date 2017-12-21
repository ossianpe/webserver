require 'spec_helper.rb'

describe 'webserver::app' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'creates a KroolCountry.png with the default action' do
    expect(chef_run).to create_cookbook_file('/usr/share/nginx/html/KroolCountry.png')
    expect(chef_run).to_not create_cookbook_file('/usr/share/nginx/html/notKroolCountry.png')
  end

  it 'creates index.html with the default action' do
    expect(chef_run).to create_template('/usr/share/nginx/html/index.html')
    expect(chef_run).to_not create_template('/usr/share/nginx/html/not_index.html')
  end
end
