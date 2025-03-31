class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]

  # GET /reservations
  def index
    @reservations = Reservation.all.reverse.take(5)
    Reservation.where.not(id: @reservations.pluck(:id)).destroy_all
  end

  # GET /reservations/1
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to @reservation, notice: "Reservation was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation, notice: "Reservation was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy!
    redirect_to reservations_path, notice: "Reservation was successfully destroyed.", status: :see_other
  end

  def refresh
    @reservation = Reservation.new(reservation_params(scope: :ghost_reservation))
    render :new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def reservation_params(scope: :reservation)
      params.expect(scope => [ :date, :course_category_id, :course_sub_category_id ])
    end
end
