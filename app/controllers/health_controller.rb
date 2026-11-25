class HealthController < ApplicationController
  def live
    render json: { status: "ok" }
  end

  def ready
    Accession.limit(1).pluck(:id)
    render json: { status: "ready" }
  end
end
