require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  let(:entry) { FactoryGirl.create :entry }
  let(:params) { FactoryGirl.attributes_for :entry }
  let(:invalid_params) { FactoryGirl.attributes_for :entry }

  describe 'GET #index' do
    it 'assigns all entries as @entries' do
      entry
      get :index
      expect(assigns(:entries)).to eq([entry])
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested entry as @entry' do
      get :show, params: {id: entry.id}
      expect(assigns(:entry)).to eq(entry)
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new entry as @entry' do
      get :new
      expect(assigns(:entry)).to be_a_new(Entry)
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested entry as @entry' do
      entry
      get :edit, params: {id: entry.id}
      expect(assigns(:entry)).to eq(entry)
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Entry' do
        expect {
          post :create, params: {entry: params}
        }.to change(Entry, :count).by(1)
      end

      it 'assigns a newly created entry as @entry' do
        post :create, params: {entry: params}
        expect(assigns(:entry)).to be_a(Entry)
        expect(assigns(:entry)).to be_persisted
      end

      it 'redirects to the created entry' do
        post :create, params: {entry: params}
        expect(response).to redirect_to(Entry.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved entry as @entry' do
        post :create, params: {entry: invalid_params}
        skip('Add assertions for invalid create')
        # expect(assigns(:entry)).to be_a_new(Entry)
        # expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested entry' do
        put :update, params: {id: entry.id, entry: params}
        entry.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested entry as @entry' do
        put :update, params: {id: entry.id, entry: params}
        expect(assigns(:entry)).to eq(entry)
      end
    end

    context 'with invalid params' do
      it 'assigns the entry as @entry' do
        put :update, params: {id: entry.to_param, entry: invalid_params}
        skip('Add assertion for invalid params')
        # expect(assigns(:entry)).to eq(entry)
      end

      it 're-renders the edit template' do
        put :update, params: {id: entry.to_param, entry: invalid_params}
        skip('Add assertion for invalid params')
        # expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested entry' do
      delete :destroy, params: { id: entry.id }
      expect { Entry.find entry.id }.to raise_error { ActiveRecord::RecordNotFound }
    end
  end
end
