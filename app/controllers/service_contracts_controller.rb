class ServiceContractsController < ApplicationController
  # GET /service_contracts
  # GET /service_contracts.json
  def index
    @service_contracts = ServiceObject.where('service_contract_end IS NOT NULL or service_contract_begin IS NOT NULL or service_contract_auto_resume_interval IS NOT NULL')

    end
end
