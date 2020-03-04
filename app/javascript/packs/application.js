import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import flatpickr from "flatpickr";
import { initFlatPicker } from '../plugins/init_flatpickr';
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
initFlatPicker();
