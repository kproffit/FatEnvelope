Rails3BootstrapDeviseCancan::Application.routes.draw do
  




  get "pages/essay-system", :to => "pages#essaysystem", :as => "essaysystem"
  get "pages/success-stories", :to => "pages#successstories", :as => "successstories"
  get "pages/program-costs", :to => "pages#programcosts", :as => "programcosts"
  get "pages/faq", :to => "pages#faq", :as => "faq"
  get "pages/about", :to => "pages#about", :as => "about"
  get "pages/advisors", :to => "pages#advisors", :as => "advisors"
  get "pages/tiger-moms", :to => "pages#tigermoms", :as => "tigermoms"
  get "pages/contact", :to => "pages#contact", :as => "contact"

  mount Ckeditor::Engine => '/ckeditor'

  get "program/index"

  match "program_overview/:id" => "program_overview#index"
  match "course/:schoolId/:id" => "program#index"
  
  mount Ckeditor::Engine => "/ckeditor"


  resources :program_manifests

  resources :step_types

  resources :steps

  resources :programs

  get "schedule/index"

  get "schedule/edit"

  get "getting_started", :to => "getting_started#index", :as => "getting_started"
  get "getting_started/index"

  post "pick_school/new"
  get "pick_school/index"

  resources :schools
  post "schools/delete_school_relation"

  get "marketing/index"

  get "marketing/about"

  resources :plans

  get "plans/index"

  get "plans/new"
  
  get "program/addCompletedStep"
  
  get "home", :to => "home#index", :as => "home"
  
  get "dashboard", :to => "dashboard#index", :as => "dashboard"
  get "dashboard/index"

  resources :subscriptions    

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "marketing#index"
  devise_for :users
  get "user/edit/:id" => "user#edit"
 
  resources :users, :only => [:show, :index]

	

end