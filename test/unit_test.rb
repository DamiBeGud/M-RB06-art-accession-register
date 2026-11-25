require "minitest/autorun"
require_relative "../app/domain/accession_input"

class AccessionInputTest < Minitest::Test
  def test_checks_reference_medium_title_and_year
    valid = { reference: "A-12", title: "Portrait", collection_year: 2007, medium: "paper" }
    assert AccessionInput.valid?(**valid)
    refute AccessionInput.valid?(**valid.merge(reference: "../ref"))
    refute AccessionInput.valid?(**valid.merge(medium: "stone"))
    refute AccessionInput.valid?(**valid.merge(title: "  "))
    refute AccessionInput.valid?(**valid.merge(collection_year: "2007"))
  end

  def test_filters_require_valid_years_in_order
    assert_equal(1500..2100, AccessionInput.year_bounds(nil, nil))
    assert_equal(1999..2001, AccessionInput.year_bounds("1999", "2001"))
    assert_nil AccessionInput.year_bounds("2001", "1999")
    assert_nil AccessionInput.year_bounds("2101", nil)
  end
end
