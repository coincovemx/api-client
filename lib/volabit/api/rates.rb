
# API endpoints to get information about exchange rates on currencies.
module Rates
  # Gets the exchange price from certain currency amount to other currency.
  # @note BTC units are expected in satoshis. Other currencies units are
  #       expected in cents.
  def spot_prices(amount, from: 'BTC', to: 'MXN')
    same_currencies_error if from.eql? to

    resource :get, 'api/v1/spot-prices',
             currency_from: from,
             currency_to: to,
             amount: amount
  end

  # Gets the exchange price list for the supported currencies.
  def tickers
    resource :get, 'api/v1/tickers'
  end

private

  def same_currencies_error
    raise ArgumentError, 'Currencies must be different.'
  end
end

module Volabit
  module API
    include Rates
  end
end
