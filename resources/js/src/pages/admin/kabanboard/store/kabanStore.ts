import { defineStore } from 'pinia';
import { CreateTaskInput } from '../actions/CreateTask';


const useTaskStore = defineStore('task', {
  state: () => ({
    taskInput:{} as CreateTaskInput,
    edit:false,
    currentTaskId:0 as number
  
  })
});

export const taskStore = useTaskStore();
