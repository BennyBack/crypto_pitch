##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'AuthorizedConnectApp' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts("ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .authorized_connect_apps("CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AuthorizedConnectApps/CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "connect_app_company_name": "aaa",
          "connect_app_description": "alksjdfl;ajseifj;alsijfl;ajself;jasjfjas;lejflj",
          "connect_app_friendly_name": "aaa",
          "connect_app_homepage_url": "http://www.google.com",
          "connect_app_sid": "CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Tue, 31 Aug 2010 20:36:28 +0000",
          "date_updated": "Tue, 31 Aug 2010 20:36:44 +0000",
          "permissions": [
              "get-all"
          ],
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AuthorizedConnectApps/CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts("ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .authorized_connect_apps("CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts("ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .authorized_connect_apps.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AuthorizedConnectApps.json',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "authorized_connect_apps": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "connect_app_company_name": "YOUR OTHER MOM",
                  "connect_app_description": "alksjdfl;ajseifj;alsijfl;ajself;jasjfjas;lejflj",
                  "connect_app_friendly_name": "YOUR MOM",
                  "connect_app_homepage_url": "http://www.google.com",
                  "connect_app_sid": "CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "Tue, 31 Aug 2010 20:36:28 +0000",
                  "date_updated": "Tue, 31 Aug 2010 20:36:44 +0000",
                  "permissions": [
                      "get-all"
                  ],
                  "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AuthorizedConnectApps/CNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
              }
          ],
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AuthorizedConnectApps.json?Page=0&PageSize=50",
          "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AuthorizedConnectApps.json?Page=0&PageSize=50",
          "next_page_uri": null,
          "num_pages": 1,
          "page": 0,
          "page_size": 50,
          "previous_page_uri": null,
          "start": 0,
          "total": 1,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AuthorizedConnectApps.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts("ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .authorized_connect_apps.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "authorized_connect_apps": [],
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AuthorizedConnectApps.json?Page=0&PageSize=50",
          "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AuthorizedConnectApps.json?Page=0&PageSize=50",
          "next_page_uri": null,
          "num_pages": 1,
          "page": 0,
          "page_size": 50,
          "previous_page_uri": null,
          "start": 0,
          "total": 1,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/AuthorizedConnectApps.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts("ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .authorized_connect_apps.list()

    expect(actual).to_not eq(nil)
  end
end