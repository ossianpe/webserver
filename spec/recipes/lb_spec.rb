require 'spec_helper.rb'

describe 'webserver::lb' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'deletes /etc/nginx/conf.d/default.conf' do
    expect(chef_run).to delete_file('/etc/nginx/conf.d/default.conf')
    expect(chef_run).to_not delete_file('/etc/nginx/conf.d/not_default.conf')
  end

  it 'deletes /etc/nginx/sites-enabled/000-default' do
    expect(chef_run).to delete_file('/etc/nginx/sites-enabled/000-default')
    expect(chef_run).to_not delete_file('/etc/nginx/sites-enabled/not_000-default')
  end

  it 'creates load-balancer.conf' do
    expect(chef_run).to create_template('etc/nginx/conf.d/load-balancer.conf')
    expect(chef_run).to_not create_template('etc/nginx/conf.d/not_load-balancer.conf')
  end
end
