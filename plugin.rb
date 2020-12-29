# name: scc-hide-admins
# about: Hides SCC affiliated admins from hosted forums
# version: 0.0.1
# authors: Sebastian Erik Bauer

module HideAdminNames
  NAMES_TO_HIDE = %w(simplydata).freeze
end

after_initialize do
  add_to_serializer(:about, :admins) do
    object.admins.reject { |u| u.email =~ /@simplydata\.dev/i }
  end
end
