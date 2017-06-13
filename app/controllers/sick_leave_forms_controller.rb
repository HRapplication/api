class SickLeaveFormsController < FormsController
  def initialize
    @base_class = SickLeaveForm
    @base_method = "sick_leave_forms"
  end

  def pdf_template
    id = params.permit(:sick_leave_form_id)["sick_leave_form_id"]
    @form_data = SickLeaveForm.find(id)
    respond_to do |format|
      format.html
      format.pdf do
        render  :pdf => "sick_leave_form.pdf",
                :template => 'sick_leave_forms/pdf_template.html.slim'
      end
    end
  end

  private

  def form_params
    params.permit(
      :care_type,
      :end_date,
      :start_date,
      :status
    )
  end

  swagger_controller :sick_leave, "Sick Leave Form Management"

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
    notes "cate_types: 'self', 'child'"
    param :form, :care_type, :string, :required, "Nie mam pojęcia"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
    param :form, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :update do
    summary "nadpisuje dany formularz"
    notes "cate_types: 'self', 'child'"
    param :path, :id, :integer, :required, "Id formularza"
    param :form, :care_type, :string, :required, "Nie mam pojęcia"
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
    param :path, :sick_leave_form_id, :integer, :required, "Id formularza"
  end
end
