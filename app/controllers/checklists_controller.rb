class ChecklistsController < ApplicationController
  before_action :set_myitems, only: %i[new edit]
  before_action :set_checklist, only: %i[edit update destroy]

  def new
    @checklist = current_user.checklists.new
  end

  def create
    checklist = current_user.checklists.new(checklist_params)
    item_ids = params[:item_id]
    Checklist.transaction do
      checklist.save
      item_ids.each do |id|
        checklist.checklist_items.create(item_id: id)
      end
    end
    redirect_to checklists_path, success: t('.success', name: checklist.name)
  rescue StandardError => e
    redirect_to new_checklist_path, danger: t('.fail')
  end

  def index
    @checklists = current_user.checklists.order(created_at: :asc)
  end

  def edit; end

  def update
    Checklist.transaction do
      @checklist.update!(checklist_params)
      @checklist.checklist_items.destroy_all
      item_ids = params[:item_id]
      item_ids.each do |id|
        @checklist.checklist_items.create(item_id: id)
      end
    end
    redirect_to checklists_path, success: t('.success')
  rescue StandardError => e
    redirect_to edit_checklist_path(@checklist), danger: t('.fail')
  end

  def destroy
    @checklist.destroy!
    redirect_to checklists_path, success: t('.success')
  end

  private

  def checklist_params
    params.require(:checklist).permit(:name)
  end

  def set_checklist
    @checklist = current_user.checklists.find(params[:id])
  end

  def set_myitems
    @myitems = current_user.myitem_items.with_attached_image
  end
end
