# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  country    :string
#  institute  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  interest   :string
#

class List < ActiveRecord::Base

  searchable do
    text :interest
  end
  
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      list = find_by_id(row["id"]) || new
      list.attributes = row.to_hash
      list.save!
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |p|
        csv << p.attributes.values_at(*column_names)
      end
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path,options={})
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def exclude_check list
    Check.all.rejec



  end
  
end
