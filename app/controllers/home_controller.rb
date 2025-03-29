class HomeController < ApplicationController
  def index
  end

  def vote
    name = params[:name]
    case name
    when "vim"
      vote = Vote.find_by(name: "Vim")
      vote.update!(count: vote.count + 1)
    when "emacs"
      vote = Vote.find_by(name: "Emacs")
      vote.update!(count: vote.count + 1)
    when "visual studio code"
      vote = Vote.find_by(name: "Visual Studio Code")
      vote.update!(count: vote.count + 1)
    end

    render :index
  end
end
