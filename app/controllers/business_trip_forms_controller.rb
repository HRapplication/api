class BusinessTripFormsController < FormsController

  def initialize
    @base_class = BusinessTripForm
    @base_method = "business_trip_forms"
  end

  def pdf_template
    id = params.permit(:business_trip_form_id)["business_trip_form_id"]
    @form_data = BusinessTripForm.find(id)
    respond_to do |format|
      format.html
      format.pdf do
        render  :pdf => "business_trip_form.pdf",
                :template => 'business_trip_forms/pdf_template.html.slim'
      end
    end
  end

  private

  def form_params
    params.permit(
      :company,
      :end_date,
      :start_date,
      :transport,
      :status
    )
  end

  swagger_controller :business_trip, "Business Trip Form Management"

  swagger_api :index do
    summary "Zwraca wszystkie formularze"
    param :query, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :all do
    summary "Zwraca wszystkie formularze danego usera"
    param :query, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :create do
    summary "Dodaje formularz"
    param :form, :company, :string, :required, "Firma?"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
    param :form, :transport, :string, :required, "Transport"
    param :form, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :update do
    summary "nadpisuje dany formularz"
    param :path, :id, :integer, :required, "Id formularza"
    param :form, :company, :string, :required, "Firma?"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
    param :form, :transport, :string, :required, "Transport"
    param :form, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :destroy do
    summary "Usuwa formularz"
    param :path, :id, :integer, :required, "Id formularza"
  end

  swagger_api :pdf_template do
    summary "pobiera formularz w formacie pdf"
    notes "Trzeba dopisać .pdf co ścieżki"
    param :path, :business_trip_form_id, :integer, :required, "Id formularza"
  end
end
