template '/etc/profile' do
  user 'root'
  group 'root'
  mode '00644'
end

template '/etc/sysconfig/init' do
  user 'root'
  group 'root'
  mode '00644'
end

template '/etc/pam.d/passwd' do
  user 'root'
  group 'root'
  mode '00640'
end

%w(system-auth-ac password-auth-ac).each do |auth|
  template "/etc/pam.d/#{auth}" do
    source 'system-auth-ac.erb'
    user 'root'
    group 'root'
    mode '00640'
  end
end

file '/etc/cron.allow' do
  content 'root'
  user 'root'
  group 'root'
  mode '00400'
end

file '/etc/at.allow' do
  user 'root'
  group 'root'
  mode '00400'
end

template '/etc/login.defs' do
  user 'root'
  group 'root'
  mode '00644'
end

template '/etc/bashrc' do
  user 'root'
  group 'root'
  mode '00644'
end
