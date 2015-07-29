require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it { should belong_to :favoritable }

  it_behaves_like "authorable"
end
