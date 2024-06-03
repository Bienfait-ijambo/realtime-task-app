import { ref } from "vue"
import { makeHttpReq } from "../../../../helper/makeHttpReq"
import { showErrorResponse } from "../../../../helper/util"


export type ProjectType={
    id:number,
    name:string,
    status:number,
    startDate:string,
    endDate:string
    slug:string
    task_progress:{
        progress:string
    }
}

    


export type GetProjectResponseType={
    data:{data:Array<ProjectType>}
} & Record<string, any>


export function useGetProject(){
    const loading=ref(false)
    const projectData=ref<GetProjectResponseType>({} as GetProjectResponseType)
    async function getProjects(page:number=1,query:string=''){
       try {
        loading.value = true
        const data= await makeHttpReq<undefined,GetProjectResponseType>
        (`projects?query=${query}&page=${page}`,'GET')
        loading.value = false
        projectData.value = data
       
       } catch (error) {
        loading.value = false
        showErrorResponse(error)
       }
    }
    
    return {getProjects,projectData,loading}
}