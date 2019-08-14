import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('hacker_day_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
