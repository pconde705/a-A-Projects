
export const postNewUser = (user) => (
  $.ajax({
    url: '/api/users',
    method: 'POST',
    data: { user }
  })
)

export const postNewSession = (session) => (
  $.ajax({
    url: '/api/session',
    method: 'POST',
    data: {session}
  })
)

export const deleteSession = () => (
  $.ajax({
    method: 'DELETE',
    url: 'api/session',
  })
)
