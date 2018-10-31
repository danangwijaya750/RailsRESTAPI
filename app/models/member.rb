class Member < ApplicationRecord
    validates:name, presence:true
    validates:phone, presence:true
    validates:address, presence:true
end
