require 'serverspec'


describe file('/var/lib/geonode/rogue_geonode') do
  it { should be_directory }
  it { should be_owned_by 'www-data' }
  it { should be_grouped_into 'rogue' }
  it { should be_readable.by_user('rogue') }
  it { should be_writable.by_user('rogue') }
  it { should be_readable.by_user('www-data') }
end

describe file('/var/lib/geonode/rogue_geonode/manage.py') do
  it { should be_file }
  it { should be_executable.by_user('rogue') }
  it { should be_executable.by('group') }
end

describe file('/var/www/rogue') do
  it { should be_directory }
  it { should be_owned_by 'www-data' }
  it { should be_grouped_into 'rogue' }
  it { should be_readable.by_user('rogue') }
  it { should be_readable.by_user('www-data') }
end

describe file('/var/www/rogue/media') do
  it { should be_directory }
  it { should be_owned_by 'www-data' }
  it { should be_grouped_into 'rogue' }
  it { should be_readable.by_user('rogue') }
  it { should be_readable.by_user('www-data') }
end

describe file('/var/lib/geonode/rogue_geonode/docs/build/html/index.html') do
  it { should be_file }
  it { should be_readable.by_user('www-data') }
end

describe file('/var/run/geonode.sock') do
  it { should be_socket }
  it { should be_owned_by 'www-data' }
end

describe file('/var/lib/geoserver_data/geogit') do
  it { should be_directory }
  it { should be_executable.by_user('rogue') }
  it { should be_readable.by_user('rogue') }
end
