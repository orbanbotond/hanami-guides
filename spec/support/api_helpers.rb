# frozen_string_literal: true

module APIHelpers

  def expect_success
    expect(response_status).to be_success
  end

  def expect_created
    expect(response_status).to eq(201)
  end

  def expect_no_content
    expect(response_status).to eq(204)
  end

  def expect_bad_request
    expect(response_status).to eq(400)
  end

  def expect_unauthorized
    expect(response_status).to eq(401)
  end

  def expect_payment_required
    expect(response_status).to eq(402)
  end

  def expect_forbidden
    expect(response_status).to eq(403)
  end

  def expect_not_found
    expect(response_status).to eq(404)
  end

  def request_response
    @response ||= subject
  end

  def response_status
    request_response[0]
  end

  def request_body
    request_response[2][0]
  end

  def response_json
    json = JSON.parse(request_body)
  end

  def expect_json
    expect { response_json }.to_not raise_error
  end

  def self.included(base)
    base.class_eval do
      after(:each) do
        @response = nil
        @json = nil
      end
    end
  end
end
