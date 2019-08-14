import "bootstrap";

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
