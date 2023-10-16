require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    @order_form = FactoryBot.build(:order_form, user_id: user.id)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@order_form).to be_valid
    end
    it 'building_nameは空でも購入できること' do
      @order_form.building_name = ''
      expect(@order_form).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'post_codeが空だと購入できないこと' do
      @order_form.post_code = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
      @order_form.post_code = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it 'prefecture_idが未選択だと購入できないこと' do
      @order_form.prefecture_id = 0
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'municipalitiesが空だと購入できないこと' do
      @order_form.municipalities = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'street_addressが空だと購入できないこと' do
      @order_form.street_address = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Street address can't be blank")
    end
    it 'telephone_numberが空だと購入できないこと' do
      @order_form.telephone_number = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Telephone number can't be blank")
    end
    it 'telephone_numberが9桁以下だと購入できないこと' do
      @order_form.telephone_number = '090123456'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Telephone number is invalid. Include hyphen(-)")
    end
    it 'telephone_numberが12桁以上だと購入できない' do
      @order_form.telephone_number = '090123456789'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Telephone number is invalid. Include hyphen(-)")
    end
    it 'telephone_numberが半角数値でないと購入できないこと' do
      @order_form.telephone_number = '０9012341234'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Telephone number is invalid. Include hyphen(-)")
    end
    it 'userが紐付いていないと購入できないこと' do
      @order_form.user_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていないと購入できないこと' do
      @order_form.item_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Item can't be blank")
    end
  end
end