# spec/factories/tasks.rb (oder test/factories/tasks.rb)
FactoryBot.define do
  factory :task do
    # `user_id` ist null: false und hat einen Foreign Key.
    # Factory Bot erstellt automatisch einen User und assoziiert ihn.
    user

    # Sinnvolle Standardwerte für die Task-Felder.
    # Auch wenn laut Schema `title`, `body` und `status` nullable sind,
    # ist es eine gute Praxis, sie in der Factory zu definieren,
    # um konsistente und valide Testdaten zu erhalten.
    sequence(:title) { |n| "Meine Aufgabe #{n}" }
    body { "Dies ist die detaillierte Beschreibung meiner Aufgabe." }
    # Angenommen, dein Task-Model hat ein Enum für den Status, z.B. enum status: { pending: 0, completed: 1, cancelled: 2 }
    # Wenn nicht, ist ein einfacher Integer-Wert auch in Ordnung.
    status { 0 } # Beispiel: Setzt den Status auf den Integer-Wert 0 (z.B. 'pending')
  end
end