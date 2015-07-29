require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should have_many(:people).dependent(:restrict_with_exception) }

  it { should validate_presence_of :country_code }
  it { should validate_presence_of :name }
end
