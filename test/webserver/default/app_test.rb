describe package('nginx') do
  it { should be_installed }
end

describe file('/usr/share/nginx/html/KroolCountry.png') do
 it { should exist }
 its('type') { should cmp 'file' }
 it { should be_file }
 it { should_not be_directory }
 its('size') { should be > 524288 }
 its('mode') { should cmp '00644' }
end

describe file('/usr/share/nginx/html/index.html') do
 it { should exist }
 its('type') { should cmp 'file' }
 it { should be_file }
 it { should_not be_directory }
 its('size') { should be > 256 }
 its('mode') { should cmp '00644' }
end
