class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]



  def home
    # Scope your query to the dates being shown:

    start_date = params.fetch(:start_date, Date.today).to_date
    @data_inicio = start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week
    #binding.pry
    # For a monthly view:
    @meetings = Meeting.where( start_time: @data_inicio )
    #@meetings = Meeting.where(  Date.today)

    # Or, for a weekly view:
    #@meetings = Meeting.where(starts_at: start_date.beginning_of_week..start_date.end_of_week)
    @teste = start_date.beginning_of_month.beginning_of_week
    @mes = t('date.month_names')[start_date.month]
    # traduz_mes
    calcula_plantao
  end



  private

  def  calcula_plantao
    dia_inicio_calendario = @teste
    dia_plantao_sabido = Date.new(2022, 2, 20)

    diferenca = dia_inicio_calendario - dia_plantao_sabido
    if diferenca.negative?
      @teste = 4 - diferenca.abs.modulo(4)
    end
    @teste = diferenca.modulo(4)


  end

  def traduz_mes
    a = @mes
    case a
      when "January"
        @mes = "Janeiro"
      when "February"
        @mes = "Fevereiro"
      when "March"
        @mes = "Março"
      when "April"
        @mes = "Abril"
      when "May"
        @mes = "Maio"
      when "June"
        @mes = "Junho"
      when "July"
        @mes = "Julho"
      when "August"
        @mes = "Agosto"
      when "September"
        @mes = "Setembro"
      when "October"
        @mes = "Outubro"
      when "November"
        @mes = "Novembro"
      when "December"
        @mes = "Dezembro"
      else
        @mes = "Error: capacity has an invalid value "
      end

  end



end
