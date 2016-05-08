class Achievement < ActiveRecord::Base
    enum privacy: [:public_access, :private_access, :friend_access]
end
