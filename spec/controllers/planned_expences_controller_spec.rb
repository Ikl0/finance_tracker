# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlannedExpencesController, type: :controller do
  render_views
  let(:user) { FactoryBot.create :user }
  let(:expence) { FactoryBot.create(:expence, user_id: user.id) }
  let(:planned_expence) { FactoryBot.create(:planned_expence, user_id: user.id, amount: 10, expence_id: expence.id) }
  let(:user2) { FactoryBot.create(:user, id: 2, name: 'Dmitry', surname: 'Usik', email: 'test@example.com') }
  let(:planned_expence2) { FactoryBot.create(:planned_expence2, user_id: user2.id, id: 2, amount: 20, expence_id: expence.id) }

  describe '#index' do
    it 'returns status 200 OK' do
      get :index
      expect(response).to have_http_status(:ok)
    end
    it 'renders the index template' do
      get :index
      expect(response).to render_template('welcome/index')
    end
    it 'returns only current user planned expences' do
      login_user user
      expect(planned_expence.amount).to eq(10)
    end
    it 'returns only current user planned expences' do
      login_user user
      expect(planned_expence.user_id).to eq(user.id)
    end
  end

  describe '#show' do
    # it 'has a related heading when not signed in' do
    #   get :index
    #   expect(response.body).to match(/<h3> please login/im)
    #   assert_template('welcome/index')
    # end
  end

  describe '#create' do
    it 'shoud create a new planned expence' do
      login_user user
      visit new_planned_expence_path
      expect(page).to have_content('New Planned Expence')
    end
    it 'creates an class instance' do
      expect { planned_expence }.to change { PlannedExpence.count }.by(1)
    end
    it 'registered user can add new planned expence' do
      expence3 = FactoryBot.create(:expence, user_id: user.id, predefined: true, name: 'test', id: 30)
      login_user user
      visit new_planned_expence_path
      select expence3.name, from: 'planned_expence[expence_id]'
      fill_in 'Description', with: 'test description'
      fill_in 'planned_expence[amount]', with: 20
      click_on 'commit'
      expect(response).to have_http_status(:ok)
      expect(planned_expence.user_id).to eq(user.id)
      expect(planned_expence.sent).to eq(false)
    end
  end

  describe '#destroy' do
    # it 'deletes item' do
    #   user = FactoryBot.create(:user)
    #   expence = FactoryBot.create(:expence, user_id: user.id)
    #   planned_expence = FactoryBot.create(:planned_expence, expence_id: expence.id, user_id: user.id)
    #   expect do
    #     planned_expence.destroy
    #   end.to change(PlannedExpence, :count).by(-1)
    #   expect(response).to be_redirect_to(planned_expences_path)
    # end
  end

  describe '#update' do
    context 'with good data' do
      # it 'updates planned_expence and redirects' do
      #   patch :update, :params => {:id => planned_expence.id, description: 'test_description_updated', amount: 100 }
      #   expect(response).to be_redirect_to(planned_expence_path(planned_expence))
      # end
    end
    context 'with bad data' do
      it 'does not change planned_expence, and re-renders the form' do
        patch :update, :params => {:id => planned_expence.id, description: 'test_description_updated', amount: 'bad_value' }
        expect(response).not_to be_redirect
      end
    end
  end
end