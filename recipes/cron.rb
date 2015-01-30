package 'anacron'

service 'crond' do
  action [:start, :enable]
end
