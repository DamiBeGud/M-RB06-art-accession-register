module AccessionInput
  MIN_YEAR = 1500
  MAX_YEAR = 2100
  REFERENCE = /\A[A-Za-z0-9][A-Za-z0-9-]{0,47}\z/
  MEDIA = %w[ceramic paper textile wood].freeze

  def self.valid?(reference:, title:, collection_year:, medium:)
    valid_reference?(reference) &&
      title.is_a?(String) && title.strip.length.between?(1, 100) &&
      collection_year.is_a?(Integer) && collection_year.between?(MIN_YEAR, MAX_YEAR) &&
      MEDIA.include?(medium)
  end

  def self.valid_reference?(reference)
    reference.is_a?(String) && REFERENCE.match?(reference)
  end

  def self.year_bounds(minimum, maximum)
    values = [minimum || MIN_YEAR.to_s, maximum || MAX_YEAR.to_s]
    return nil unless values.all? { |value| value.is_a?(String) && /\A\d{4}\z/.match?(value) }

    first, last = values.map(&:to_i)
    return nil unless MIN_YEAR <= first && first <= last && last <= MAX_YEAR

    first..last
  end
end
