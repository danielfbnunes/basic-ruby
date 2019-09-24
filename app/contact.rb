class Contact

    attr_accessor :id, :name, :emails, :phones, :company

    def initialize(params = {})
        @id = params.fetch("id", SecureRandom.hex(10))
        @name = params.fetch("name")
        @emails = params.fetch("emails", [])
        @phones = params.fetch("phones", [])
        @company = params.fetch("company", nil)
        puts "Name: " + @name + " -> " + @id
    end
end