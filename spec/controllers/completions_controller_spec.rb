require 'rails_helper'

describe CompletionsController  do
  include Devise::TestHelpers

  describe '#index' do
    it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
    end
  end
  describe '#new' do
  it 'renders the home template' do
        get :new
        expect(response).to render_template('new')
    end
  end
  describe '#show' do
  it 'renders the home template' do
        get :show
        expect(response).to render_template('show')
    end
  end
  describe '#edit' do
  it 'renders the home template' do
        get :edit
        expect(response).to render_template('edit')
    end
  end
  describe '#create' do
  it 'renders the home template' do
        get :create
        expect(response).to render_template('create')
    end
  end
end