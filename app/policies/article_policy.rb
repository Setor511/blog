class ArticlePolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def create?
    new?
  end

  def show?
    true
  end

  def edit?
    user.present? && user_owns_article?
  end

  def update?
    user.present? && user_owns_article?
  end

  def destroy?
    user.present? && user_owns_article?
  end

  def user_owns_article?
    record.user_id == user.id
  end

  def publish?
    user.present? && user_owns_article?
  end

  def unpublish?
    user.present? && user_owns_article?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.present?
        # Mostrar artículos que el usuario creó o que están publicados
        scope.where(user_id: user.id).or(scope.where(publication_state: "published"))
      else
        # Mostrar solo los artículos publicados para usuarios no autenticados
        scope.where(publication_state: "published")
      end
    end
  end
end