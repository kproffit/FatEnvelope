class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable
  rolify
  
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :stripetoken, :last4, :num_of_tokens, :name, :firstvisit, :school
	
  #attr_accessor :year_in_school, :program, :status, :school
  #attr_accessible :year_in_school, :program, :status, :school
  attr_accessible :first_name, :last_name, :date_of_birth, :current_school, :current_grade, :cellphone, :parent_first_name, :parent_last_name, :parent_phone, :parent_cell_phone, :parent_email, :parent_email_notifications, :parent_text_notifications, :address, :city, :state, :zip_code, :country, :country_code, :telephone
  
  attr_accessor :terms_of_service, :validation_scenario, :role
  attr_accessible :terms_of_service, :role
  
  validates :first_name, :last_name, :presence => true
  validates :date_of_birth, :current_school, :current_grade, :address, :city, :state, :zip_code, :country, :telephone, :cellphone, :parent_first_name, :parent_last_name, :parent_phone, :parent_cell_phone, :parent_email, :presence => true, :if => :required_by_scenario 
  validates :current_grade, :numericality => true, :allow_blank => true
  validates :parent_email, :format => {:with => EMAIL_REGEX}, :allow_blank => true
  validates :zip_code, :numericality => { :only_integer => true }, :allow_blank => true
  validates :date_of_birth, :format => { :with => /\d\d\d\d-\d\d-\d\d/, :message => "invalid format, must match: YYYY-MM-DD" }, :allow_blank => true
  validates :terms_of_service, :acceptance => true
  
  has_many :subscription
  has_many :appointments
  has_and_belongs_to_many :schools
  
  def stripe_description
    "#{name}: #{email}"
  end

  def update_stripe
    if stripe_id.nil?
      if !stripe_token.present?
        raise "We're doing something wrong -- this isn't supposed to happen"
      end

      customer = Stripe::Customer.create(
        :email => email,
        :description => stripe_description,
        :card => stripetoken
      )
      self.last4 = customer.active_card.last4
      response = customer.update_subscription({:plan => "premium"})
    else
      customer = Stripe::Customer.retrieve(stripe_id)

      if stripe_token.present?
        customer.card = stripetoken
      end

      # in case they've changed
      customer.email = email
      customer.description = stripe_description

      customer.save

      self.last4 = customer.active_card.last4
    end

    self.stripe_id = customer.id
    self.stripetoken = nil
  end
  
  def get_roles
    roles_text = ''
    self.roles.each do |role|
      roles_text = roles_text + (roles_text == '' ? '' : ', ') + role.name
    end
    return roles_text
  end
  
  def self.teachers
    role = Role.where(:name => 'teacher').first
    if role
      return role.users
    else
      return []
    end
  end
  
  def required_by_scenario
    return self.validation_scenario != 'admin_or_teacher'
  end
  
  def bootcamp_appointments(date)
    appointments = Appointment.where(:date => date, :user_id => self.id, :description => 'session')
  end
  
end

