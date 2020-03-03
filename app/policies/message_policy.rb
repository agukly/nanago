class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.conversation.sender_id == user.id || record.conversation.recipient_id == user.id
  end

  def show?
    user
  end
end
