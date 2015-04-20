module Owneable
  extend ActiveSupport::Concern

  included do
    # Para el formulario
    attr_accessor :owneable_gid

    # Getter para obtener el <Global ID>
    def owneable_gid
      owneable.try :to_global_id
    end

    # Para setar el owneable desde los parametros
    def owneable_gid=(value)
      self.owneable = GlobalID::Locator.locate(value)
    end

    belongs_to :owneable, polymorphic: true
    belongs_to :user

    # Validar que una mascota tenga un user
    validate :belongs_to_user

    private
      # Validacion custom para que un evento siempre pertenezca al perfil del usuario logeado o una de sus empresa
      def belongs_to_user
        if user and owneable.present?
          errors.add :owneable_gid, I18n.t(:invalid, scope: [:errors, :messages]) unless [user.profile].flatten.include?(owneable)
        end
      end
  end
end
