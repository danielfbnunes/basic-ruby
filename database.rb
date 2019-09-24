module Database
  extend self

  @contacts = Hash.new

  def all
    #TODO: fazer subarray consoante a pagina e aplicar o map
    @contacts.keys.map{ |id| get_mapped_contact(id) }
  end

  def find(input_id)
    id = @contacts.keys.find{ |id| input_id == id}
    get_mapped_contact(id)
  end

  def store(contact)
    @contacts[contact.id] = contact
    get_mapped_contact(contact.id)
  end

  def update(params, id)
    return unless @contacts.key?(id)
    params["name"] = params.fetch("name", @contacts[id].name)
    emails = params.fetch("emails", @contacts[id].emails)
    params["emails"] = (@contacts[id].emails.concat(emails)).to_set.to_a
    phones = params.fetch("phones", @contacts[id].phones)
    params["phones"] = (@contacts[id].phones.concat(phones)).to_set.to_a
    params["company"] = params.fetch("company", @contacts[id].company)
    params["id"] = id
    @contacts[id] = Contact.new(params)
    params
  end

  def replace(params, id)
    return unless @contacts.key?(id)
    params["name"] = params.fetch("name")
    params["emails"] = params.fetch("emails", [])
    params["phones"] = params.fetch("phones", [])
    params["company"] = params.fetch("company", nil)
    params["id"] = id
    @contacts[id] = Contact.new(params)
    params
  end

  def delete(id)
    mapped_contact = get_mapped_contact(id)
    @contacts.delete(id)
    mapped_contact
  end

  def get_mapped_contact(id)
    {id: id, name: @contacts[id].name, emails: @contacts[id].emails, phones: @contacts[id].phones, company: @contacts[id].company}
  end
end
