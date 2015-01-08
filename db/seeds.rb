phrases = Phrase.create([{ text: 'ToDo list' }, { text: 'ToDo App' }])

tasks = Task.create([
  { phrase: phrases.first, twitter_id: '551308528162328576',
    name: 'you\'re on my todo list' },
  { phrase: phrases.last, twitter_id: '553213482611380224',
    name: 'The TODO list for GDC is giving me butterflies' }
])

Managers::Redbooth.create([
  { task: tasks.first, status: :success },
  { task: tasks.last, status: :success }
])