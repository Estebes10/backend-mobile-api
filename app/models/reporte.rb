class Reporte < ApplicationRecord
   #serialize(:attachments)

   validates :folio,
     presence:   true,
     uniqueness: true

  validates :date,
    presence: true

  validates :hour,
    presence: true
  validates :active,
    inclusion: { in: [true, false] }

  validates :situation_id,
    presence: true

  validates :description,
    presence: true

  validates :place,
    presence: true

  def find_situation
    @situation = Situation.find(self.situation_id)
    @situation
  end

  def find_event
    @event = Event.find(self.find_situation.event_id)
    @event
  end

  def find_request
    @request = Request.find(self.find_event.request_id)
    @request
  end

  def find_user
    if self.user_id
      User.find(self.user_id)
    else
      'Usuario no asociado'
    end
  end

end
