class MembersController < ApplicationController
  before_action :set_rota

  def create
    member = Member.new(name: params[:member][:name], priority: @rota.lowest_priority + 1)
    @rota.members << member

    redirect_to @rota
  end

  def relieve
    member = @rota.members.find(params[:id])
    member.update!(priority: @rota.lowest_priority + 1)

    redirect_to @rota
  end

  private

  def set_rota
    @rota = Rota.find(params[:rota_id])
  end
end
