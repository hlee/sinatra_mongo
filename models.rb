require 'mongoid'

class User
  include Mongoid::Document
  field :name
  field :username
  field :password
  field :phone
  field :qq
  field :email

  belongs_to :leadOf, :class_name => 'Team', :inverse_of => 'lead'
  belongs_to :team, class_name: 'Team', :inverse_of => 'members'

  def self.authenticate(username,password)
      u = User.where(:username => username).first
      return nil if u.nil?
      return u if Digest::MD5.hexdigest(password) == u.password
  end
end

class Team
  include Mongoid::Document
  field :name
  
  has_one :lead, :class_name =>'User',:inverse_of => 'leadOf'
  has_many :members, :class_name => 'User', :inverse_of => 'team'
end