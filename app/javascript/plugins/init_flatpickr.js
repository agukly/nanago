const initFlatPicker = () => {
  const startDateInput = document.getElementById('booking_start_day');
  const endDateInput = document.getElementById('booking_end_day');

  // Check that the query selector id matches the one you put around your form.
  if (startDateInput) {
  const unavailableDates = JSON.parse(document.querySelector('#pram-booking-dates').dataset.unavailable)
  endDateInput.disabled = true

  flatpickr(startDateInput, {
    minDate: "today",
    disable: unavailableDates,
    dateFormat: "d-m-Y",
  });

  console.log('im in the file')

  startDateInput.addEventListener("change", (e) => {
    if (startDateInput != "") {
      endDateInput.disabled = false
    }
    flatpickr(endDateInput, {
      minDate: e.target.value,
      disable: unavailableDates,
      dateFormat: "d-m-Y"
      });
    })
  };
}

export { initFlatPicker };
