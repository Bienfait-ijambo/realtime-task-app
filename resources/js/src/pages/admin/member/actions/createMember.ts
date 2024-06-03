import { ref } from "vue";
import { makeHttpReq } from "../../../../helper/makeHttpReq";
import { successMsg } from "../../../../helper/toast-notification";
import { showErrorResponse } from "../../../../helper/util";
import { memberStore } from "../store/memberStore";


export type MemberInputType={
    name:string
    email: string
    
}

export type MemberResponseType={
 
   message:string
    
}


export function useCreateOrUpdateMember(){

    const loading=ref(false)
    async function createOrUpdate(){
       try {
        loading.value = true
       const data = 
       memberStore.edit?
        await updateMember()
        :await createMember()

        loading.value = false
        memberStore.memberInput={} as MemberInputType
        successMsg(data.message)
       } catch (error) {
        loading.value = false
        showErrorResponse(error)
       }
    }
    
    return {createOrUpdate,loading}
}

async function createMember(){
    const data= await makeHttpReq<MemberInputType,MemberResponseType>
    ('members','POST',memberStore.memberInput)
    
    return data
  

}
async function updateMember(){
    const data= await makeHttpReq<MemberInputType,MemberResponseType>
    ('members','PUT',memberStore.memberInput)
    memberStore.edit=false
    return data
   
}