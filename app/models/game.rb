class Game < ActiveRecord::Base

  belongs_to :home_team, class_name: "Team", foreign_key: :home_team_id
  belongs_to :away_team, class_name: "Team", foreign_key: :away_team_id
  belongs_to :winner_team, class_name: "Team", foreign_key: :winner_team_id
  has_many :invitations

  def participants
    accepted_invitations = self.invitations.where(accepted: true)
    return accepted_invitations.map do |invitation|
      invitation.user
    end
  end
  def date
    time = self.start_time
    time.strftime("%m-%d-%Y")
  end
  def time
    time = self.start_time
    time.strftime("%H:%M")
  end

  def captains
    captains = []
    captains << self.home_team.captain
    captains << self.away_team.captain
  end

  def game_over?
    if self.start_time > Time.now
      return true
    else
      false
    end
  end


end
