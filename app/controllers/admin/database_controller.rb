class Admin::DatabaseController < Admin::BaseController
  def update_data
    reader = CsvReader.new("csv/Consumer_Complaints.csv")
    reader.parse
    redirect_to root_path
  end
end