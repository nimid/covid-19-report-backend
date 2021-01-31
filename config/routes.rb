Rails.application.routes.draw do
  get '/', action: :index, controller: 'reports'
end
