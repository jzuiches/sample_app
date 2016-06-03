class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :activated,  :admin, :created_at, :updated_at

  has_many :trainings
end
