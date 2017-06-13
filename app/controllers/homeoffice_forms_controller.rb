class HomeofficeFormsController < FormsController

  def initialize
    @base_class = HomeofficeForm
    @base_method = "homeoffice_forms"
  end

  def pdf_template
    id = params.permit(:homeoffice_form_id)["homeoffice_form_id"]
    @form_data = HomeofficeForm.find(id)
    respond_to do |format|
      format.html
      format.pdf do
        render  :pdf => "homeoffice_form.pdf",
                :template => 'homeoffice_forms/pdf_template.html.slim'
      end
    end
  end

  private

  def form_params
    params.permit(
      :end_date,
      :start_date,
      :status
    )
  end

  swagger_controller :homeoffice, "Homeoffice Form Management"

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
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
    param :form, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :update do
    summary "nadpisuje dany formularz"
    param :path, :id, :integer, :required, "Id formularza"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
    param :form, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :update_status do
    summary "nadpisuje dany formularz"
    param :path, :id, :integer, :required, "Id formularza"
    param :form, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :destroy do
    summary "Usuwa formularz"
    param :path, :id, :integer, :required, "Id formularza"
  end

  swagger_api :pdf_template do
    summary "pobiera formularz w formacie pdf"
    notes "Trzeba dopisać .pdf co ścieżki"
    param :path, :homeoffice_form_id, :integer, :required, "Id formularza"
  end
end
