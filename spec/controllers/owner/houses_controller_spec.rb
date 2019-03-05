require 'rails_helper'
RSpec.describe Owner::HousesController, type: :controller do
  let(:owner){create(:owner)}
  let(:owner2){create(:owner)}
  
  before do
    login_owner owner
  end

  describe 'get #index' do
    render_views
    it "正常に一覧表示" do
      create_list(:house, 5, owner_id: owner.id)
      get 'index'
      expect(assigns(:houses).size).to eq(5)
    end
    
    it "所有物件以外は表示されない" do
      create_list(:house, 5, owner_id: owner.id)
      create_list(:house, 5, owner_id: owner2.id)
      get 'index'
      expect(assigns(:houses).size).to eq(5)
    end
    
    it "1件も登録されていない場合" do
      get 'index'
    end
  end

  describe 'get #show' do
    render_views
    it "物件詳細を正常に表示" do
      house = create(:house, owner_id: owner.id)
      get :show, params: { id: house.id }
      expect(assigns(:house)).to eq house
    end
    
    it "所有物件以外を指定" do
      house = create(:house, owner_id: owner2.id)
      get :show, params: { id: house.id }
      expect(response.status).to eq(404)
    end
    
    it "存在しない物件を指定" do
      get :show, params: { id: 0 }
      expect(response.status).to eq(404)
    end
  end
  
  describe 'get #new' do
    render_views
    context "render new" do
      before do
        get :new
      end
      it "assign new house" do
        expect(assigns(:house).new_record?).to be_truthy
      end
      
      it "render success" do
        expect(response.status).to eq(200)
      end
    end
  end
  
  describe 'post #create' do
    render_views
    it "物件作成正常系" do
      post :create, params: {house: {
        name: "test",
        address: "test adderss",
        postal_code: "1750082"
      }}
      expect(House.count).to eq 1
    end
    
    it "物件作成時に料金カラムは変更できない" do
      post :create, params: {house: {
        name: "test",
        address: "test adderss",
        postal_code: "1750082",
        price: "100"
      }}
      expect(House.take.price).to eq 300
    end
    
    it "物件登録異常系" do
      post :create, params: {house: {
        name: "",
        address: "test adderss",
        postal_code: "1750082"
      }}
      expect(assigns(:house).name).to eq ""
      expect(assigns(:house).address).to eq "test adderss"
    end
  end
end