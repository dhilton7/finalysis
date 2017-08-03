require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  let(:property) { FactoryGirl.create :property }
  let(:params) { FactoryGirl.attributes_for :property }

  describe '#new' do
    it 'renders new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    it 'creates a property with valid params' do
      post :create, params: { property: params }
      expect(Property.count).to eq 1
    end
  end

  describe '#edit' do
    it 'renders edit template' do
      get :edit, params: { id: property.id }
      expect(response).to render_template :edit
    end
  end

  describe '#update' do
    it 'updates property' do
      put :update, params: { id: property.id, property: params }
      property.tap do |p|
        p.reload
        expect(p.address).to eq params[:address]
        expect(p.city).to eq params[:city]
        expect(p.state).to eq params[:state]
        expect(p.zip).to eq params[:zip]
      end
    end
  end

  describe '#show' do
    it 'renders show template' do
      get :show, params: { id: property.id }
      expect(response).to render_template :show
    end
  end

  describe '#destroy' do
    it 'deletes a property' do
      delete :destroy, params: { id: property.id }
      expect { Property.find(property.id) }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
