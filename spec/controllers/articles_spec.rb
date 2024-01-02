require "rails_helper"

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

    end
end
