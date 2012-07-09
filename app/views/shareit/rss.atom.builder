atom_feed :language => 'en-US' do |feed|
  feed.title 'Shareit!'

  @eintraege.each do |eintrag|
    next if eintrag.updated_at.blank?

    feed.entry( eintrag ) do |entry|
      entry.url linkPfad(eintrag)
      entry.title eintrag.titel
      entry.content eintrag.beschreibung, :type => 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(eintrag.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 
    end
  end
end