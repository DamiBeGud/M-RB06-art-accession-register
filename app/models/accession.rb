class Accession < ApplicationRecord
  PUBLIC_FIELDS = %i[reference title collection_year medium].freeze

  def public_data
    slice(*PUBLIC_FIELDS)
  end
end
