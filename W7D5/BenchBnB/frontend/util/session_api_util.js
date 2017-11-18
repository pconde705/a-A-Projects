
const postNewUser = (formUser) => (
  $.ajax ({
    url: '/api/users',
    method: 'POST',
    data: { formUser }
  })
)
