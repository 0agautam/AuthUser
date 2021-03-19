class Employee < ApplicationRecord
  searchkick 
  belongs_to :department
end
