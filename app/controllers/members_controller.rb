class MembersController < ApplicationController
  def create
    rota = Rota.find(params[:rota_id])
    member = Member.new(name: params[:member][:name], priority: rota.lowest_priority + 1)
    rota.members << member

    redirect_to rota
  end
end
