require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'バリデーションチェック' do
    it '設定したすべてのバリデーションが機能しているか' do
      user = build(:user)
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    it 'nameがない場合にバリデーションが機能してinvalidになるか' do
      user_without_name = build(:user, name: "")
      expect(user_without_name).to be_invalid
      expect(user_without_name.errors[:name]).to eq ["を入力してください"]
    end

    it 'emailがない場合にバリデーションが機能してinvalidになるか' do
      user_without_email = build(:user, email: "")
      expect(user_without_email).to be_invalid
      expect(user_without_email.errors[:email]).to eq ["を入力してください"]
    end

    it 'passwordがない場合にバリデーションが機能してinvalidになるか' do
      user_without_password = build(:user, password: "")
      expect(user_without_password).to be_invalid
      expect(user_without_password.errors[:password]).to eq ["は3文字以上で入力してください"]
    end

    it '確認パスワードが一致しない場合バリデーションが機能してinvalidになるか' do
      user_without_password_confirmation = build(:user, password_confirmation: "")
      expect(user_without_password_confirmation).to be_invalid
      expect(user_without_password_confirmation.errors[:password_confirmation]).to eq ["とパスワードの入力が一致しません", "を入力してください"]
    end

    it 'emailが被った場合にバリデーションが機能してinvalidになるか' do
      user = create(:user)
      user_with_duplicated_email = build(:user, email: user.email)
      expect(user_with_duplicated_email).to be_invalid
      expect(user_with_duplicated_email.errors[:email]).to eq ["はすでに存在します"]
    end

    it 'emailが被らない場合にバリデーションエラーが発生しないか' do
      user = create(:user)
      user_with_another_email = build(:user, email: 'another_email')
      expect(user_with_another_email).to be_valid
      expect(user_with_another_email.errors[:email]).to be_empty
    end

    it 'nameが255文字以内の場合にバリデーションエラーが発生しないか' do
      user_within_lenght_of_name_255 = build(:user, name: "name1")
      expect(user_within_lenght_of_name_255).to be_valid
      expect(user_within_lenght_of_name_255.errors[:name]).to be_empty
    end

    it 'パスワードが3文字以上の場合バリデーションエラーが発生しないか' do
      user_with_more_3_character = build(:user, password: "password1", password_confirmation: "password1")
      expect(user_with_more_3_character).to be_valid
      expect(user_with_more_3_character.errors[:password]).to be_empty
    end

  end
end
