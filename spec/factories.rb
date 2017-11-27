FactoryGirl.define do
  factory(:product) do
    title('Squanch IPA')
    cost(23)
    country('Dwarf Terrace-9')
  end

  factory(:user) do |user|
    user.email("test@test.com")
    user.password("password")
    user.password_confirmation("password")
  end
end
