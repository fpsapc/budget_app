class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show update destroy]

  # GET /items
  def index
    @group = Group.find(params[:group_id])
    @entities = Entity.where(group_id: @group.id).order(id: :desc)
    @total_amount = @entities.sum(:amount)
  end

  def new
    @group = Group.find(params[:group_id])
    @entity = Entity.new
  end

  # POST /items
  def create
    @group = Group.find(params[:group_id])
    @entity = @group.entities.build(entity_params) # Build a new entity associated with the group

    @entity.user_id = current_user.id # Set the user association
    @entity.author_id = current_user.id # Set the author association (if applicable)

    if @entity.save
      redirect_to group_entities_path(@group), notice: 'Transaction added successfully'
    else
      render :new, alert: 'Failed to add transaction'
    end
  end

  # DELETE /items/1
  def destroy
    @entity = Entity.find(params[:id])

    if @entity.destroy
      redirect_to group_entities_path, notice: 'Transaction removed successfully'
    else
      render :index, alert: 'Failed to remove Transaction'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @item = Entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end
