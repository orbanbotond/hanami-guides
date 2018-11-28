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

  def response_status
    subject
    last_response.status
  end

  def request_body
    subject
    last_response.body
  end

  def response_json
    json = JSON.parse(request_body)
  end

  def expect_json
    expect { response_json }.to_not raise_error
  end

  def expect_contains_field(field)
    expect(response_json.keys).to include(field)
  end
end
