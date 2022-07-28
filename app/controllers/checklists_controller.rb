class ChecklistsController < ApplicationController

  def new
    @checklist = current_user.checklists.new
    @myitems = current_user.myitem_items
  end

  def create
    checklist = current_user.checklists.new(checklist_params)
    if checklist.save
      item_ids = params[:checklist_item][:item_id]
      item_ids.each do |id|
        checklist.checklist_items.create(item_id: id)
      end
      redirect_to checklists_path, success: t('.success', name: checklist.name)
    else
      redirect_to new_checklist_path, danger: t('.fail')
    end
  end

  def index
    @checklists = current_user.checklists.all
  end

  def show
  end

  def edit
  end

  private

  def checklist_params
    params.require(:checklist).permit(:name)
  end
end
