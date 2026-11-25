class AccessionsController < ApplicationController
  def create
    fields = Accession::PUBLIC_FIELDS.to_h { |field| [field, params[field]] }
    unless AccessionInput.valid?(**fields)
      return render json: { error: "invalid_accession" }, status: :bad_request
    end
    accession = Accession.create!(**fields, title: fields.fetch(:title).strip)
    render json: accession.public_data, status: :created
  end

  def show
    unless AccessionInput.valid_reference?(params[:reference])
      return render json: { error: "invalid_reference" }, status: :bad_request
    end
    render json: Accession.find_by!(reference: params[:reference]).public_data
  end

  def index
    bounds = AccessionInput.year_bounds(params[:from_year], params[:to_year])
    medium = params[:medium]
    unless bounds && (medium.nil? || AccessionInput::MEDIA.include?(medium))
      return render json: { error: "invalid_filter" }, status: :bad_request
    end
    rows = Accession.where(collection_year: bounds)
    rows = rows.where(medium: medium) if medium
    render json: { accessions: rows.order(:id).limit(100).map(&:public_data) }
  end
end
