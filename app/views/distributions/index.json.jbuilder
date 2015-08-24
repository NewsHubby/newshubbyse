json.array!(@distributions) do |distribution|
  json.extract! distribution, :id, :no_publications, :preferred1, :distribution_date, :misc_information
  json.url distribution_url(distribution, format: :json)
end
