require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  describe '商品購入するとき' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_buyer = FactoryBot.build(:order_buyer, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '配送先情報が正しい場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_buyer).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_buyer.building = ''
        expect(@order_buyer).to be_valid
      end
    end

    context '配送先情報に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_buyer.postal_code = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code can't be blank",
                                                             'Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_buyer.postal_code = '1234567'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_buyer.prefecture_id = 1
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_buyer.city = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_buyer.address = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @order_buyer.phone_number = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberに半角のハイフンが含まれていると保存できないこと' do
        @order_buyer.phone_number = '090-1234-56'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Phone number is invalid. input only number')
      end
      it 'phone_numberは9桁以下では保存できないこと' do
        @order_buyer.phone_number = '123456789'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include()
      end
      it 'phone_numberは12桁以上では保存できないこと' do
        @order_buyer.phone_number = '123456789012'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include()
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_buyer.user_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_buyer.item_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_buyer.token = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
