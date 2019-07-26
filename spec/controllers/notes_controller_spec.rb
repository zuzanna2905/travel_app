require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  let(:user) { create :user }
  let(:note) { create :note, user: user }
  let(:note2) { create :note, user: user }
  let(:valid_attributes) {{city: "Berlin", note: "Goood"}}
  let(:invalid_attributes) {{city: 'x', note: 'x'}}

  before(:each) do
    sign_in user
  end

  describe "GET #index" do
    it "responds successfuly HTTP 200 status code" do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template('notes/index')
    end

    it "loads all of the user notes" do
      get :index 
      expect(assigns(:notes)).to eq([note, note2])
    end
  end

  describe "GET #new" do
    it "responds successfuly HTTP 200 status code" do
      get :new
      expect(response.status).to eq(200)
      expect(response).to render_template('notes/new')
    end
  end

  describe "DELETE #destroy" do
    it "responds successfuly HTTP 302 status code" do
      delete :destroy, params: { id: note }
      expect(response.status).to eq(302)
      expect(response).to redirect_to('/notes')
    end

    it "deletes given element" do
      get :index
      expect(assigns(:notes)).to eq([note, note2])
      delete :destroy, params: { id: note }
      get :index
      expect(assigns(:notes)).to eq([note2])
    end
  end

  describe "GET #edit" do
    it "responds successfuly HTTP 200 status code" do
      get :edit, params: { id: note2 }
      expect(response.status).to eq(200)
      expect(response).to render_template('notes/edit')
    end
  end

  describe "GET #show" do
    it "responds successfuly HTTP 200 status code" do
      get :show, params: { id: note2 }
      expect(response.status).to eq(200)
      expect(response).to render_template('show')
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Note" do
        expect {
          post :create, params: {note: valid_attributes}
        }.to change(Note, :count).by(1)
      end

      it "assigns a newly created note as @note" do
        post :create, params: {note: valid_attributes}
        expect(assigns(:note)).to be_a(Note)
        expect(assigns(:note)).to be_persisted
      end
    end
    context "with invalid params" do
      it "re-renders the 'new' template" do
        post :create, params: {note: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end
end