require "test_helper"

class Resolvers::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateUser.new.call(nil, args, {})
  end

  test "creating new user" do
    user = perform(
      name: "test user",
      authProvider: {
        email: {
          email: "email@example.com",
          password: "[omitted]"
        }
      }
    )

    assert user.persisted?
    assert_equal link.description, "description"
    assert_equal link.url, "http://example.com"
  end
end
