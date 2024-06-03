import './bootstrap';


import {createApp} from 'vue'
import App from './src/App.vue'
import router from './src/router/index';
import ToastPlugin from 'vue-toast-notification';
// Import one of the available themes
//import 'vue-toast-notification/dist/theme-default.css';
import 'vue-toast-notification/dist/theme-bootstrap.css';
import { createPinia } from 'pinia';

import Error from './src/components/Error.vue';
import BaseBtn from './src/components/BaseBtn.vue';
import BaseInput from './src/components/BaseInput.vue';


createApp(App)
.use(router)
.use(createPinia())
.use(ToastPlugin)
.component('Error',Error)
.component('BaseBtn',BaseBtn)
.component('BaseInput',BaseInput)
.mount("#app")
