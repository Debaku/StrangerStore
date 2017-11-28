class Commodoty < ActiveRecord::Base
    has_many :salexcomms
    has_many :sales, through: :salexcomms
end
