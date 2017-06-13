class HolidayFormsController < FormsController

  def initialize
    @base_class = HolidayForm
    @base_method = "holiday_forms"
  end

  def pdf_template
    id = params.permit(:holiday_form_id)["holiday_form_id"]
    @form_data = HolidayForm.find(id)
    respond_to do |format|
      format.html
      format.pdf do
        render  :pdf => "holiday_form.pdf",
                :template => 'holiday_forms/pdf_template.html.slim'
      end
    end
  end


  private

  def form_params
    params.permit(
      :comment,
      :end_date,
      :start_date,
      :holiday_type,
      :status
    )
  end

  swagger_controller :holiday, "Holiday Form Management"

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
    notes "holiday_types: 'compensation_for_overtime', 'justified_paid_not', 'military', 'parental',
'blood_donation', 'training'"
    param :form, :comment, :string, :required, "Komentarz"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
    param :form, :holiday_type, :integer, :required, "Rodzaj wakacji?"
    param :form, :status, :string, :required, "status formularza (waiting, rejected, accepted)"
  end

  swagger_api :update do
    summary "nadpisuje dany formularz"
    notes "holiday_types: 'compensation_for_overtime', 'justified_paid_not', 'military', 'parental',
'blood_donation', 'training'"
    param :path, :id, :integer, :required, "Id formularza"
    param :form, :comment, :string, :required, "Komentarz"
    param :form, :end_date, :date, :required, "Czas zakończenia"
    param :form, :start_date, :date, :required, "Czas rozpoczęcia"
    param :form, :holiday_type, :integer, :required, "Rodzaj wakacji?"
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
    param :path, :holiday_form_id, :integer, :required, "Id formularza"
  end
end
