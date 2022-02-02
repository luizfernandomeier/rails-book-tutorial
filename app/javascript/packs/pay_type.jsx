import React from 'react'
import ReactDOM from 'react-dom'
import PayTypeSelector from 'PayTypeSelector'

// addEventListener ensures that the DOM is loaded before the React code is executed
document.addEventListener('turbolinks:load', function () {
    var element = document.getElementById("pay-type-component");
    ReactDOM.render(<PayTypeSelector />, element);
});
