# RailsAdmin config file. Generated on July 14, 2013 16:07
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  config.authorize_with :cancan
  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['mkdir', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Admin']

  # Include specific models (exclude the others):
  # config.included_models = ['Student', 'User']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:

  ###  User  ###

  config.model User do
    configure :student, :has_one_association
    edit do
      field :first_name
      field :last_name
      field :email
      field :password
      field :password_confirmation
      field :roles
      field :student
    end
    show do
      field :name
      field :email
      field :roles
      field :student
      field :current_sign_in_at
      field :last_sign_in_at
      field :current_sign_in_ip
      field :last_sign_in_ip
    end
    list do
      field :name
      field :email
      field :roles
      field :student
    end
  end

  # config.model 'User' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your user.rb model definition

  #   # Found associations:

  #     configure :student, :has_one_association

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :name, :string 
  #     configure :status, :string 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end

  ###  Student  ###

  config.model Student do
    edit do
      field :user
      field :cohort
      field :address_1
      field :address_2
      field :city
      field :state_province do
        label "State/Province/Territory"
      end
      field :postal_code
      field :country
      # field :address do
      #   read_only true
      # end
      # field :latitude do
      #   read_only true
      # end
      # field :longitude do
      #   read_only true
      # end
      field :phone_number
      field :linkedin
      field :github
      field :twitter_handle
      field :blog
      field :personal_website
      field :developer_type do
        partial "developer_type_selector"
      end
      field :mentor do
        partial "mentor_selector"
      end
      field :job_status do
        partial "job_status_selector"
      end
      field :entrepreneur do
        partial "entrepreneur_selector"
      end
    end

    show do
      field :user
      field :cohort
      field :address_1
      field :address_2
      field :city
      field :state_province
      field :postal_code
      field :country
      # field :address
      # field :latitude
      # field :longitude
      field :phone_number
      field :linkedin
      field :github
      field :twitter_handle
      field :blog
      field :personal_website
      field :developer_type
      field :mentor
      field :job_status
      field :entrepreneur
    end

    list do
      field :user
      field :cohort
      field :address_1
      field :address_2
      field :city
      field :state_province
      field :postal_code
      field :country
      # field :address
      # field :latitude
      # field :longitude
      field :phone_number
      field :linkedin
      field :github
      field :twitter_handle
      field :blog
      field :personal_website
      field :developer_type
      field :mentor
      field :job_status
      field :entrepreneur
    end
  end

  # config.model 'Student' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your student.rb model definition

  #   # Found associations:

  #     configure :user, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :first_name, :string 
  #     configure :last_name, :string 
  #     configure :cohort, :string 
  #     configure :address_1, :string 
  #     configure :address_2, :string 
  #     configure :city, :string 
  #     configure :state_province, :string 
  #     configure :postal_code, :string 
  #     configure :country, :string 
  #     configure :phone_number, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :linkedin, :string 
  #     configure :github, :string 
  #     configure :twitter_handle, :string 
  #     configure :blog, :string 
  #     configure :personal_website, :string 
  #     configure :mentor, :string 
  #     configure :job_status, :string 
  #     configure :entrepreneur, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


end
