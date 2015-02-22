require 'spec_helper'

describe GiantBombApi::Resource do

  class DummyResource
    extend GiantBombApi::Resource
  end

  class AnotherDummyResource
    extend GiantBombApi::Resource

    resource_name "some_dummy_resource"
  end

  describe 'inclusion' do
    it 'will also include from GiantBombApi::Resource' do
      expect(DummyCollection).to include(GiantBombApi::ResourceValueSetter)
    end
  end

  describe '#resource_name' do

    context "when in a class the resource_name has been defined" do
      it 'returns the resource_name of that class' do
        expect(AnotherDummyResource.resource_name).to eq "some_dummy_resource"
      end
    end

    context "when in a class the resource_name has NOT been defined" do
      it 'returns the underscored class_name' do
        expect(DummyResource.resource_name).to eq "dummy_resource"
      end
    end

  end

end
