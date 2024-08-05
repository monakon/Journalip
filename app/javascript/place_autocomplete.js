// Place Autocomplete
document.addEventListener('DOMContentLoaded', function () {
    const inputPlace = document.getElementById('Place');
  
    // オートコンプリートのオプション
    const options = {
      types: ['geocode'],
      componentRestrictions: { country: 'JP' },
    };
  
    // オートコンプリート適用
    const autocompletePlace = new google.maps.places.Autocomplete(inputPlace, options);
  
    // タイトルのオートコンプリートが選択されたとき
    autocompletePlace.addListener('place_changed', function() {
      const place = autocompletePlace.getPlace();
      inputPlace.value = place.formatted_address;
    });
  });
  