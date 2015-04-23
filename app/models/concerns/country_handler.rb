module CountryHandler
  extend ActiveSupport::Concern

  included do
    def country_name
      return if country.nil?
      country.translations[I18n.locale.to_s] || country.name
    end

    def country
      ISO3166::Country[country_code]
    end
  end
end
