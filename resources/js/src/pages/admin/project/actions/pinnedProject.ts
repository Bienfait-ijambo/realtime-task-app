import { ref } from "vue";
import { makeHttpReq } from "../../../../helper/makeHttpReq";
import { showErrorResponse } from "../../../../helper/util";
import { successMsg } from "../../../../helper/toast-notification";



export function usePinnedProject(){
    const loading=ref(false)
    async function pinnedProject(projectId:number){
       try {
        loading.value = true
        const data= await makeHttpReq<{projectId:number},{message:string}>
        (`projects/pinned`,'POST',{projectId:projectId})
        loading.value = false
        successMsg(data.message)
       } catch (error) {
        loading.value = false
        showErrorResponse(error)
       }
    }

 
    
    return {pinnedProject}
}