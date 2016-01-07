require 'spec_helper'

describe Prospect do
	it { should belong_to(:client_list) }	
end
