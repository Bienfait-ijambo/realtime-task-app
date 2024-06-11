import { ref } from "vue";
import { MemberType } from "../../member/actions/GetMember";
import { showError } from "../../../../helper/toast-notification";
import { taskStore } from "../store/kabanStore";



export function useSelectMember(){

    const selectedMembers=ref<Array<MemberType>>([])

    function selectMember(member:MemberType){
        const exist=selectedMembers.value.filter(memberItem => memberItem.id===member.id)

        if(exist.length===0){

            selectedMembers.value.push({
                id:member.id,
                name:member.name,
                email:member.email
            })
            taskStore.taskInput.memberIds.push(member.id)

        }else{
            showError('You have already selected this member !')
        }
    }

    function unSelectMember(memberId:number){
        const filteredMembers=selectedMembers.value.filter(memberItem => memberItem.id!==memberId)
        const filteredMemberIds= taskStore.taskInput.memberIds.filter(item=> item!==memberId)
        taskStore.taskInput.memberIds=filteredMemberIds
        selectedMembers.value=filteredMembers
    }


    

    return {selectedMembers,selectMember,unSelectMember}
}