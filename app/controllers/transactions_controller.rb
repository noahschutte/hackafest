require 'uri'
require 'net/http'
require 'json'

class TransactionsController < ApplicationController

  def index

    uri = URI.parse('https://gwapi.demo.securenet.com/api/transactions/Search')

    bodyContent = {
      startDate: '02/01/2017',
      endDate: '10/22/2017',
      developerApplication: {
        developerId: 12345678,
        version: '1.2'
      }
    }

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.request_uri)
    request.basic_auth('8011035', '69/qAXertXer')
    request["Content-Type"] = "application/json"
    request.body = bodyContent.to_json

    response = http.request(request)

    render :json => {
      response: response.body
    }
  end

end
