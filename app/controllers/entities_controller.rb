class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show update destroy]

  # GET /items
  def index
    @group = Group.find(params[:group_id])
    @entities = Entity.where(group_id: @group.id).order(id: :desc)
    @total_amount = @entities.sum(:amount)
  end

  # POST /items
  def create
    @entities = current_user.item.new(item_params)

    if @entities.save
      redirect_to group_entities_path, notice: 'Transaction added successfully'
    else
      render :new, alert: 'Failed to add transaction'
    end
  end

  # DELETE /items/1
  def destroy
    @entities = Item.find(params[:id])

    if @entity.destroy
      redirect_to group_entities_path, notice: 'Transaction removed successfully'
    else
      render :index, alert: 'Failed to remove Transaction'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.permit(:name, :amount, :group_id)
  end
end
