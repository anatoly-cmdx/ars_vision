require 'rails_helper'

RSpec.describe Person, type: :model do
  it { should belong_to :company }

  it { should validate_presence_of :company }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
end
