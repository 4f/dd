Dd::Application.routes.draw do


scope "(:locale)", locale: /ru|en/ do


  match '/ad', to: 'users#signin', via: :get

  resources :users do
    collection do
      get :signin
      post :signin, action: 'check'
      get :signout
    end
  end

  match '/news', to: 'news/feeds#list', via: :get #admin list of news
  
  namespace 'news' do
    resources :feeds do
      collection {get :tags}
      collection {post :tags_update}
      collection {post :insert_media}
    end
  end
 

  root to: 'pages#home'

  match '/help', to: 'pages#help', via: :get  #site
  match '/translation', to: 'pages#translation', via: :get  #admin
  match '/update_translation', to: 'pages#update_translation', via: :post  #admin

  match '/browser_detect', to: 'pages#browser_detect', via: :get #site
  match '/help_edit', to: 'pages#help_edit', via: :get  #admin
  match '/help_update', to: 'pages#help_update', via: [:put, :post] #admin
  match '/home_update', to: 'pages#home_update', via: [:post, :put] #admin
  match '/home_edit', to: 'pages#home_edit', via: :get  #admin


  match '/albom_c', to: 'alboms#gallery', via: :get #site
  match '/member_c', to: 'members_page#show', via: :get #site
  match '/concert_c', to: 'concerts#show', via: :get #site

  match '/concerts/alboms', to: 'concerts#alboms', via: :get #admin
  match '/concerts/members', to: 'concerts#members', via: :get #admin
  match '/concerts/partners', to: 'concerts#partners', via: :get #admin
  
  match '/update', to: 'alboms#update' #adim

  match 'home/:id', to: 'pages#home', as: :ura  #site, cycle by year in home page


resources :mailics do
  collection {post :captcha}
  collection {post :volunteer}
  collection {post :callback}
end


resources :flags, only: [:index, :create]

  # match 'contacts' =>       'contacts#index'
  # match 'contacts/edit' =>  'contacts#edit'
  # match 'contacts/creat' => 'contacts#creat', via: post
  # match 'contacts/text' =>  'contacts#tetx', via: post

  resources :contacts, only: [:index, :create, :edit] do
    collection {post :text}
    collection {get :edit}
  end

  resources :teams  #team of project

  resources :concerts do
    member {post :m_update}
    resources :members_page, only: [:show, :edit, :update] do #because has_one
      collection {get :page}
    end
    
    resources :carousels
    resources :members  #members each concert

    resources :partners do
      collection {post :global} # update who is for home page
    end

    resources :alboms do
      collection {get :gallery}
    end
    resources :videos
  end

  resources :fotos

end
end
