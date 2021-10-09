import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $("#select2category").select2({
  });

  $("#select2alocasia1").select2({
    dropdownParent: $('#newPlantToLocationModalAlocasia')
  });
  $("#select2alocasia2").select2({
    dropdownParent: $('#newPlantToLocationModalAlocasia')
  });

  $("#select2philodendron1").select2({
    dropdownParent: $('#newPlantToLocationModalPhilodendron')
  });
  $("#select2philodendron2").select2({
    dropdownParent: $('#newPlantToLocationModalPhilodendron')
  });

  $("#select2ficus1").select2({
    dropdownParent: $('#newPlantToLocationModalFicus')
  });
  $("#select2ficus2").select2({
    dropdownParent: $('#newPlantToLocationModalFicus')
  });

  const numbers = [...Array(99999).keys()];
  numbers.forEach((index) => {
    $(`#select2${index}1`).select2({
      dropdownParent: $(`#newPlantToLocationModal${index}`)
    });
    $(`#select2${index}2`).select2({
      dropdownParent: $(`#newPlantToLocationModal${index}`)
    });

    
    $(`#select2watering${index}`).select2({
    });
  })
};

export { initSelect2 };