class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(sender_id: user.id).or(scope.where(recipient_id: user.id))

    end
  end

  def create?
    user
  end

  def show?

    record.sender_id == user.id || record.recipient_id == user.id
  end
end
