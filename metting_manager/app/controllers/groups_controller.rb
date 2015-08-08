class GroupsController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  # GET /groups
  # GET /groups.json
  def index
   if current_user
    @groups = current_user.groups
  end
    # @groups = Group.all
  end
  # GET /groups/1
  # GET /groups/1.json
  def show 
    @group = Group.find_by_id(params[:id])
    @listmembers = @group.memberlists if @group.memberlists
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find_by_id(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    respond_to do |format|
      if @group.save
        format.html { redirect_to user_groups_path(current_user), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find_by_id(params[:id])
    @group.destroy
    respond_to do |format|
      format.html { redirect_to user_groups_path(current_user), notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    #binding.pry
  end

  def introduce
    @group = Group.find_by_id(params[:group_id])
    @time_order = TimeOrder.where(:group_id => params[:group_id]).sort_by {|vn| vn.time_start}
    if !params[:time_orde_id].nil?
      @timenow = TimeOrder.find_by_id(params[:time_orde_id])
    else
      c = Array.new
      @time_order.each{|t|
        if t.time_start.to_date == Time.now.to_date
          c.push(t)
        end
      }
      @timenow = c.sort_by {|vn| vn.time_start}.first if c.present?
    end
    # @comment = Comment.where(:time_order_id => @timenow.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :user_id, :desc)
    end
  end