import { ref } from "vue"
import { makeHttpReq } from "../../../../helper/makeHttpReq"
import { showErrorResponse } from "../../../../helper/util"


export type MemberType={
    id:number
    name:string
    email:string
}

export type GetMemberType={
    data:{data:Array<MemberType>}
} & Record<string, any>


export function useGetMembers(){
    const loading=ref(false)
    const memberData=ref<GetMemberType>({} as GetMemberType)
    async function getMembers(page:number=1,query:string=''){
       try {
        loading.value = true
        const data= await makeHttpReq<undefined,GetMemberType>
        (`members?query=${query}&page=${page}`,'GET')
        loading.value = false
        memberData.value = data
       
       } catch (error) {
        loading.value = false
        showErrorResponse(error)
       }
    }
    
    return {getMembers,memberData,loading}
}