module PagesHelper
  def preview (string, count = 300)
    # String::shorten (naiv)
  # Autor: Martin Labuschin
  # Erstellt am 29.Juli 2007
  # String wird auf die durch count (optional, standard 30) bestimmte Anzahl von Zeichen gekürzt. Es werden dann ganze Wörter (erkannt durch Leerräume) zurückgegeben. Falls wirklich eine Kürzung duchgeführt wurde, wird ' ...' angehangen.
  # BEMERKUNG: Es wird nur Plaintext erwartet
    if string.length >= count 
      shortened = string[0, count]
      splitted = shortened.split(/ /)
      words = splitted.length
      splitted[0, words-1].join(" ") + ' ...'
    else 
      string
    end
  end

end
