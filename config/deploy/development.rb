set :stage, :development

role :app, %w{hiroyuki@160.16.209.75}
role :web, %w{hiroyuki@160.16.209.75}
role :db,  %w{hiroyuki@160.16.209.75}

server '160.16.209.75', port: 12411, user: 'hiroyuki', roles: %w{web app db}, ssh_options: {
  keys: %w(~/.ssh/id_rsa_sakura),
  forward_agent: true,
  auth_methods: %w(publickey)
}