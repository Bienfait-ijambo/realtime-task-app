// import {useToast} from 'vue-toast-notification';
// import 'vue-toast-notification/dist/theme-sugar.css';

// const $toast = useToast();
// let instance = $toast.success('You did it!');
import { useToast } from "vue-toast-notification";

const toast = useToast();

export function showError(message: string) {
  toast.error(message, {
    position: 'bottom-right',
    duration: 4000,
    dismissible: true,
  });
}



export function successMsg(message: string) {
  toast.success(message, {
    position: 'bottom-right',
    duration: 4000,
    dismissible: true,
  });
}