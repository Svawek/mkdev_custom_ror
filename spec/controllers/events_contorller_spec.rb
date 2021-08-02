require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:event) { create(:event) }

  describe 'GET #index' do
    it 'check an array of all events' do
      events = FactoryBot.create_list(:event, 3)

      get :index

      expect(assigns(:events)).to match_array(events)
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Event to @event' do
      expect(assigns(:event)).to be_a_new(Event)
    end

    it 'render new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: event } }

    it 'assigns the requested event to @event' do
      expect(assigns(:event)).to eq event
    end

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves a new event in the database' do
        expect { post :create, params: { event: attributes_for(:event) } }.to change(Event, :count).by(1)
      end
      it 'redirects to index view' do
        post :create, params: { event: attributes_for(:event) }
        expect(response).to redirect_to assigns(:events)
      end
    end

    context 'with invalid attributes' do
      it 'does not save event' do
        expect { post :create, params: { event: attributes_for(:event, :invalid) } }.to_not change(Event, :count)
      end

      it 're-renders new view' do
        post :create, params: { event: attributes_for(:event, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'assign the request event to @event' do
        patch :update, params: { id: event, event: attributes_for(:event) }
        expect(assigns(:event)).to eq event
      end

      it 'change event attributes' do
        patch :update, params: { id: event, event: { location: 'skype', organizertelegram: '@private_event' } }
        event.reload

        expect(event.location).to eq 'skype'
        expect(event.organizertelegram).to eq '@private_event'
      end

      it 'redirects to index view' do
        patch :update, params: { id: event, event: attributes_for(:event) }
        expect(response).to redirect_to events_path
      end
    end

    context 'with invalid attributes' do
      it 'does not change event' do
        patch :update, params: { id: event, event: attributes_for(:event, :invalid) }
        event.reload

        expect(event.location).to eq 'Zoom'
      end

      it 're-renders edit view' do
        patch :update, params: { id: event, event: attributes_for(:event, :invalid) }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:event) { create(:event) }

    it 'deletes the event' do
      expect { delete :destroy, params: { id: event } }.to change(Event, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: event }
      expect(response).to redirect_to events_path
    end
  end
end
