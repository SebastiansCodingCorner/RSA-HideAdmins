# name: scc-hide-admins
# about: Hides SCC affiliated admins from hosted forums
# version: 0.0.1
# authors: Sebastian Erik Bauer

module HideAdminNames
  NAMES_TO_HIDE = %w(simplydata).freeze
end

after_initialize do
  class About
    def admins
      @admins ||= User.where(admin: true)
                      .where.not(id: Discourse::SYSTEM_USER_ID)
                      .where.not(username_lower: HideAdminNames::NAMES_TO_HIDE)
                      .order(:username_lower)
    end
  end
end
