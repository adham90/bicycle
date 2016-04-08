module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params=nil)
      results = self.where(nil)
      if filtering_params.present?
        filtering_params.each do |key, value|
          results = results.public_send(key, value) if value.present?
        end
      end
      results
    end
  end
end
