// the instructions will say to name this 'fetchAllPokemon',
// but to avoid name collisions, change the verb in the function to match
// the ajax method
export const getAllPokemon = () => (
  $.ajax({
    method: 'GET',
    url: 'api/pokemon'
  })
);

// this got us into trouble with our importing in pokemon_actions;
// because we're importing *, we need to just export regularly, or in
// the function declaration
// export default fetchAllPokemon;
