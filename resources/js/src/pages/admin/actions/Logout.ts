import { ref } from "vue";
import { makeHttpReq } from "../../../helper/makeHttpReq";
import { showError, successMsg } from "../../../helper/toast-notification";
import { showErrorResponse } from "../../../helper/util";




export function useLogoutUser(){

    const loading=ref(false)
    async function logout(userId:number|undefined){
       try {
        loading.value = true
        const data= await makeHttpReq<{userId:number|undefined},{message:string}>
        ('logout','POST',{userId:userId})
        loading.value = false
       
       
       } catch (error) {
        console.log(error)
        showErrorResponse(error)
        if((error as Error).message=='Not authenticated'){
window.location.href="/app/login"
        }
        loading.value = false
        
      
       }
    }
    
    return {logout,loading}
}