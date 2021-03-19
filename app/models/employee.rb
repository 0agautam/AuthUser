class Employee < ApplicationRecord 
  belongs_to :department
  searchkick word_start: [:department_name,:name]
  #scope :search_import, -> { includes(:department) }

  def search_data
    {
      name: name,
      department_name: department.name
    }
  end
end
