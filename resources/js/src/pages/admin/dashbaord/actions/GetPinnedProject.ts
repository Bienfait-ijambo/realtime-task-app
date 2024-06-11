import { ref } from "vue";
import { makeHttpReq } from "../../../../helper/makeHttpReq";
import { showErrorResponse } from "../../../../helper/util";
import { successMsg } from "../../../../helper/toast-notification";

type pinnedProject={id:number,name:string}
export type PinnedProjecType={data:pinnedProject}

export function useGetPinnedProject(){
  const project=ref<pinnedProject>({} as pinnedProject)
    async function getPinnedProject(){
       try {
        // loading.value = true
        const {data}= await makeHttpReq<undefined,PinnedProjecType>
        (`pinned/projects`,'GET')
        project.value=data
        // loading.value = false
        // ProjectData.value = data
       
       } catch (error) {
     
        showErrorResponse(error)
       }
    }

 
    
    return {getPinnedProject,project}
}