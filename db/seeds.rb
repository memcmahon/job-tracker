Company.destroy_all
Job.destroy_all
Category.destroy_all

category_1 = Category.create!(title: "Web Development")
category_2 = Category.create!(title: "Finance")
category_3 = Category.create!(title: "Entertainment")
category_4 = Category.create!(title: "Education")

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
CATEGORIES = [category_1, category_2, category_3, category_4]

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample, category: CATEGORIES.sample)
    puts "  Created #{company.jobs[num].title}"
  end
end
