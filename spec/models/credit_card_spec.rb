require 'rails_helper'

describe CreditCard do
  describe '#create' do
    it "必須カラムが全て存在すれば登録できること" do
      card = build(:credit_card)
      card.valid?
      expect(card).to be_valid
    end

    it "card_idがない場合は登録できないこと" do
      card = build(:credit_card, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("が入力されていません。")
    end

    it "customer_idがない場合は登録できないこと" do
      card = build(:credit_card, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("が入力されていません。")
    end
  end
end