import { ref } from "vue";
import { makeHttpReq } from "../../../../helper/makeHttpReq";
import { showErrorResponse } from "../../../../helper/util";
import { successMsg } from "../../../../helper/toast-notification";
import { SingleProjectResponseType } from "./getProjectDetail.types";





export function useGetProjectDetail(){
    const loading=ref(false)
    const ProjectData=ref<SingleProjectResponseType>({} as SingleProjectResponseType)
    async function getProjectDetail(slug:string){
       try {
        loading.value = true
        const data= await makeHttpReq<undefined,SingleProjectResponseType>
        (`projects/${slug}`,'GET')
        loading.value = false
        ProjectData.value = data
       
       } catch (error) {
        loading.value = false
        showErrorResponse(error)
       }
    }

 
    
    return {getProjectDetail,ProjectData,loading}
}