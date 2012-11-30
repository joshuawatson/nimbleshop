namespace :nimbleshop_simply do
  desc 'populate sample data'
  task populate_sample_data: :environment do
    NimbleshopSimply::SampleData.new.populate
  end
end
