class ReportSerializer < ActiveModel::Serializer
  attributes :new_cases,
             :new_recovered,
             :new_deaths,
             :total_cases,
             :total_recovered,
             :total_deaths,
             :updated_date
end
