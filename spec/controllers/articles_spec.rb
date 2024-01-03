require "rails_helper"
require "factory_bot"

RSpec.describe ArticleController do

    let(:article) {FactoryBot.create(:article)}

    describe "check" do

        it "Get #index" do
        get :index
        expect(response).to be_successful
        end

        it "Get #new" do
        get :new
        expect(response).to be_successful
        end

        it "Get #show" do
        get :show , params: {id: article.id}
        expect(response).to be_successful
        end

        it "Get #edit" do
        get :edit , params: {id: article.id}
        expect(response).to be_successful
        end

        it "Post #create" do
        valid_attributes = attributes_for(:article)
        post :create , params: {article: valid_attributes}
        expect(response).to have_http_status(:ok)
        end

        it "Patch #update" do
        valid_attributes = attributes_for(:article , title: "Mohit")
        put :update, params: { id: article.id, article: valid_attributes }
        article.reload
        expect(article.title).to eq('Mohit')
        end

        it "Delete #destroy" do
        delete :destroy , params: {id: article.id}
        expect(response).to have_http_status(:no_content)
        end

    end
end
