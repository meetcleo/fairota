class MembersController < ApplicationController
  before_action :set_rota

  def create
    member = Member.new(name: params[:member][:name], priority: @rota.lowest_priority + 1)
    @rota.members << member

    redirect_to @rota
  end

  def move_top
    member = @rota.members.find(params[:id])
    member.update!(priority: @rota.highest_priority - 1)

    redirect_to @rota
  end

  def move_bottom
    member = @rota.members.find(params[:id])
    member.update!(priority: @rota.lowest_priority + 1)

    redirect_to @rota
  end

  def move_up
    swap_up

    redirect_to @rota
  end

  def move_down
    swap_down

    redirect_to @rota
  end

  def destroy
    member = @rota.members.find(params[:id])
    member.destroy!

    redirect_to controller: :rotas, action: :show, method: :get, id: @rota.id
  end

  private

  def set_rota
    @rota = Rota.find(params[:rota_id])
  end

  def swap_up
    member = @rota.members.find(params[:id])
    member_to_swap = @rota.prioritised_members.where('priority < ?', member.priority).last
    return unless member_to_swap.present?

    member.priority, member_to_swap.priority = member_to_swap.priority, member.priority
    member.save!
    member_to_swap.save!
  end

  def swap_down
    member = @rota.members.find(params[:id])
    member_to_swap = @rota.prioritised_members.where('priority > ?', member.priority).first
    return unless member_to_swap.present?

    member.priority, member_to_swap.priority = member_to_swap.priority, member.priority
    member.save!
    member_to_swap.save!
  end
end
