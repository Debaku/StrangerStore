class Sale < ActiveRecord::Base
    belongs_to :user
    has_many :salexcomms
    has_many :commodotys, through: :salexcomms
end
