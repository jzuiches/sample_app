class TrainingsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]
  def create
    @training = current_user.trainings.create(training_params)
    if @training.save
      flash[:success] = "Training saved"
      redirect_to training_divisions_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @training.destroy
    flash[:success] = "Training deleted"

    redirect_to current_user || root_url
  end

  def update
      @training = current_user.trainings.find_by(id: params[:id])
    if @training.update_attributes(training_params)
      flash[:success] = "Training Updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def show
    @training = Training.find(params[:id])
    @training_division = TrainingDivision.find(@training.training_division_id)

  end

  def edit
    @training = Training.find(params[:id])
    if @training.training_division_id == 1
      @codes = ['5000 - Transceiver', 5000],['5001 - Transceiver-Single Burial', 5001],['5002 - Transceiver-Multiple Burial', 5002], ['5100 - RECCO', 5100], ['5101 - RECCO-Single Burial', 5101], ['5102 - RECCO-Multiple Burial', 5102], ['5103 - Personal Noise', 5103]
    elsif @training.training_division_id == 2
      @codes = ['3000 - Lift Evacuation', 3000], ['3002 - Level 2 - Basic Cable Sliding', 3002], ['3003 - Level 3 - Advanced Cable Sliding', 3003], ['3004 - Tower Climbing', 3004], ['3005 - Tyrolian Traverse', 3005], ['3006 - Toboggan Evac', 3006]
    elsif @training.training_division_id == 3
      @codes = ['8000 - Rope Rescue', 8000], ['8001 - Knots', 8001], ['8002 - Anchors', 8002], ['8003 - Belay Systems', 8003], ['8004 - Raising/Lowering Systems', 8004], ['8005 - Window Washer', 8005], ['8006 - Spider Harness', 8006]
    elsif @training.training_division_id  == 5
      @codes = ['Funitel Evacuation', 7000], ['Roll Cab', 7001], ['Cabin Operations', 7003], ['ID training', 7004], ['Gear Orientation', 7005]
    elsif @training.training_division_id == 6
      @codes = ['General Toboggan Training', 2000], ['Single Tail Rope', 2001], ['Double Tail Rope', 2002], ['Toboggan Belay', 2003], ['Chair Bracket Shirley Lake', 2004], ['Chair Bracket Solitude', 2005]
    elsif @training.training_division_id == 7
      @codes = ['Dog Training', 6000]
    else @training.training_division_id == 8
      @codes = ['First Aid', 6100], ['Helicopter Safety', 6004], ['Incident Investigation', 6201], ['Ski Clinic', 6001], ['Other', 6000]
    end
    @routes = ['Red Dog East', 11], ['Poulsen\'s East Gully', 13], ['Red Dog Lift Line', 15], ['Pouldsen\'s West Gully', 17], ['Old Red Dog', 19], ['Red Dog Ridge', 21], ['Downhill - East Face', 22], ['Downhill - GS Cliffs', 23], ['Nose', 25], ['West Face', 26], ['Rock Garden', 27], ['Saddle', 28], ['Cornice II', 31], ['Slot', 33], ['Headwall', 35], ['Palisades', 37], ['Gold Coast Ridge', 41], ['Emigrant Backside', 42], ['Roof / Funnel', 43], ['American River Traverse', 44], ['Ledges', 45], ['Granite Chief Peak', 46], ['Broken Arrow', 47], ['Tower 16', 48], ['Silverado Rim', 50], ['West Rim(Bailey\'s)', 51], ['Van Dyke\'s', 52], ['China Wall, Kima\'s', 53], ['East Rim(Tram)', 54], ['Hanging Garden', 55], ['Far Side', 57], ['Aztec / Medusa', 59]
  end


  private
    def training_params
      params.require(:training).permit(:location, :training_date, :trainer, :training_division_id, :comments, :training_time, :training_code)
    end

    def correct_user
      @training = current_user.trainings.find_by(id: params[:id])
      redirect_to root_url if @training.nil?
    end

end

