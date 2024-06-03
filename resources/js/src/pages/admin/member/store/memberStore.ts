import { defineStore } from 'pinia';
import { MemberInputType } from '../actions/createMember';


const useMemberStore = defineStore('member', {
  state: () => ({
    memberInput:{} as MemberInputType,
    edit:false
  })
});

export const memberStore = useMemberStore();
