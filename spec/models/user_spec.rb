require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、real_last_nameとreal_first_name、main_last_nameとmain_first_name、date_of_birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが英数混合でないと登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must include at least one letter and one digit")
      end
      it 'real_first_nameが空では登録できない' do
        @user.real_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Real first name can't be blank", "Real first name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end
      it 'real_first_nameが半角では登録できない' do
        @user.real_first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Real first name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end
      it 'real_last_nameが空では登録できない' do
        @user.real_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Real last name can't be blank", "Real last name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end
      it 'real_last_nameが半角では登録できない' do
        @user.real_last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Real last name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end
      it 'main_first_nameが空では登録できない' do
        @user.main_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Main first name can't be blank", "Main first name 全角カタカナで入力して下さい")
      end
      it 'main_first_nameが半角では登録できない' do
        @user.main_first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Main first name 全角カタカナで入力して下さい")
      end
      it 'main_last_nameが空では登録できない' do
        @user.main_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Main last name can't be blank", "Main last name 全角カタカナで入力して下さい")
      end
      it 'main_last_nameが半角では登録できない' do
        @user.main_last_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Main last name 全角カタカナで入力して下さい")
      end
      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
    end
  end
end
