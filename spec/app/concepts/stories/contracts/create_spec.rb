# frozen_string_literal: true

require "spec_helper"

describe Stories::Contracts::Create do
  let(:form) { described_class.new Story.new }
  let(:params) { Fabricate.attributes_for(:story) }

  context "negative cases" do
    [:text, :user_id].each do |field|
      context "#{field} is missing" do
        let(:params) { super().reject{|k| k == field } }

        it "fails validation" do
          expect(form.validate params).to be_falsey
        end
      end

      context "#{field} is empty" do
        let(:params) { super().merge(field => "") }

        it "fails validation" do
          expect(form.validate params).to be_falsey
        end
      end
    end
  end

  context "positive cases" do
    it "passes validation" do
      expect(form.validate params).to be_truthy
    end
  end
end
