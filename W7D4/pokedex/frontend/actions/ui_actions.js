export const LOADING = 'LOADING';
export const FINISHED_LOADING = 'FINISHED_LOADING';

export const isLoading = () => ({
  type: LOADING
});

export const finishedLoading = () => ({
  type: FINISHED_LOADING
});
