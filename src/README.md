Steps taken so far
rails new 'appname'
rails db:setup (added the DB outline)
updated the YML

<< Adding user logins >>
bundle add devise

rails generate devise:install    << followed instructions under devise to add info to the config/environments/development.rb >>

rails g controller store index (devise requires a route & method)
rails g devise:views
rails g devise User (Adding a model and configures it with the default Devise modules. Also adds a route)
rails db:migrate (sent information to the DB)

created (class RegistrationsController < Devise::RegistrationsController)
added the following to the devise routes so it refers to the controller
<<
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
>>

<<
added strong params to the controller:
    private
    def sign_up_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    def account_update_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end
>>
rails g migration add_name_to_users name:string
rails db:migrate

<< Adding TDD with RSPEC >>
bundle add rspec