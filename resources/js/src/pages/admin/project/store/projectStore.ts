import { defineStore } from 'pinia';
import { ProjectInputType } from '../actions/createProject';

const useProjectStore = defineStore('project', {
  state: () => ({
    projectInput:{} as ProjectInputType,
    edit:false
  })
});

export const projectStore = useProjectStore();
