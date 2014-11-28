class Complaint < ActiveRecord::Base
  belongs_to :business
  before_create :find_business_id
  validates :state, format: { with: /\A[CO]+\z/ }



  searchable do
    text  :product, :sub_product, :issue, :sub_issue, :company
  end

  def self.test_five
    all.limit(5).group_by do |complaint|
      complaint.company
    end
  end

  def self.grouped_by_name
    all.group_by do |complaint|
      complaint.company
    end
  end

  def find_business_id
    result = Business.find_by(name: self.company)
    if result
      self.business_id = result.id
    else
      nil
    end
  end
end

