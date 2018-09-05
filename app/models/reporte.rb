class Reporte < ApplicationRecord
   #serialize(:attachments)
   has_many_attached :images

   after_create :save_folio

   validates :folio,
     uniqueness: true

  validates :date,
    presence: true

  validates :hour,
    presence: true

  validates :active,
    inclusion: { in: [true, false] }

  validates :situation_id,
    presence: true

  validates :street,
    presence: true

  validates :colony,
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

  before_validation(on: :create) do
    self.folio = Date.today.to_s + Time.zone.now.to_s
  end

  private

  def save_folio
    self.folio = self.id.to_s
    self.save
  end

end
