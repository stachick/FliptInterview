require 'spec_helper'

describe ClientList do
	it { should have_many(:prospects) }	
end
