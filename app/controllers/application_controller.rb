class ApplicationController < ActionController::API
  rescue_from ActiveRecord::StatementInvalid, ActiveRecord::ConnectionNotEstablished do
    render json: { error: "database_unavailable" }, status: :service_unavailable
  end
  rescue_from ActiveRecord::RecordNotUnique do
    render json: { error: "duplicate_reference" }, status: :conflict
  end
  rescue_from ActiveRecord::RecordNotFound do
    render json: { error: "accession_not_found" }, status: :not_found
  end
end
