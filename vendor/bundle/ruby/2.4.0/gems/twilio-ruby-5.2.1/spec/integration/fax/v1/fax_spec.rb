##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'Fax' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.fax.v1.faxes("FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://fax.twilio.com/v1/Faxes/FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "api_version": "v1",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "direction": "outbound",
          "from": "+14155551234",
          "media_url": "https://www.example.com/fax.pdf",
          "media_sid": "MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "num_pages": null,
          "price": null,
          "price_unit": null,
          "quality": null,
          "sid": "FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "queued",
          "to": "+14155554321",
          "duration": null,
          "links": {
              "media": "https://fax.twilio.com/v1/Faxes/FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media"
          },
          "url": "https://fax.twilio.com/v1/Faxes/FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.fax.v1.faxes("FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.fax.v1.faxes.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://fax.twilio.com/v1/Faxes',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "faxes": [],
          "meta": {
              "first_page_url": "https://fax.twilio.com/v1/Faxes?PageSize=50&Page=0",
              "key": "faxes",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://fax.twilio.com/v1/Faxes?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.fax.v1.faxes.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "faxes": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "api_version": "v1",
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "direction": "outbound",
                  "from": "+14155551234",
                  "media_url": "https://www.example.com/fax.pdf",
                  "media_sid": "MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "num_pages": null,
                  "price": null,
                  "price_unit": null,
                  "quality": null,
                  "sid": "FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "status": "queued",
                  "to": "+14155554321",
                  "duration": null,
                  "links": {
                      "media": "https://fax.twilio.com/v1/Faxes/FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media"
                  },
                  "url": "https://fax.twilio.com/v1/Faxes/FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ],
          "meta": {
              "first_page_url": "https://fax.twilio.com/v1/Faxes?PageSize=50&Page=0",
              "key": "faxes",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://fax.twilio.com/v1/Faxes?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.fax.v1.faxes.list()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.fax.v1.faxes.create(to: "to", media_url: "https://example.com")
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {
        'To' => "to",
        'MediaUrl' => "https://example.com",
    }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://fax.twilio.com/v1/Faxes',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "api_version": "v1",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "direction": "outbound",
          "from": "+14155551234",
          "media_url": null,
          "media_sid": null,
          "num_pages": null,
          "price": null,
          "price_unit": null,
          "quality": "superfine",
          "sid": "FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "queued",
          "to": "+14155554321",
          "duration": null,
          "links": {
              "media": "https://fax.twilio.com/v1/Faxes/FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media"
          },
          "url": "https://fax.twilio.com/v1/Faxes/FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.fax.v1.faxes.create(to: "to", media_url: "https://example.com")

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.fax.v1.faxes("FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://fax.twilio.com/v1/Faxes/FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "api_version": "v1",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "direction": "outbound",
          "from": "+14155551234",
          "media_url": null,
          "media_sid": null,
          "num_pages": null,
          "price": null,
          "price_unit": null,
          "quality": null,
          "sid": "FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "canceled",
          "to": "+14155554321",
          "duration": null,
          "links": {
              "media": "https://fax.twilio.com/v1/Faxes/FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media"
          },
          "url": "https://fax.twilio.com/v1/Faxes/FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.fax.v1.faxes("FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.fax.v1.faxes("FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://fax.twilio.com/v1/Faxes/FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.fax.v1.faxes("FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").delete()

    expect(actual).to eq(true)
  end
end