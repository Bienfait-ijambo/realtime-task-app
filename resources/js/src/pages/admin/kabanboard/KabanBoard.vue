<script lang="ts" setup>
import { onMounted } from "vue";
import { useRoute } from "vue-router";
import BreadCrumb from "./components/BreadCrumb.vue";
import { useGetProjectDetail } from "./actions/getProjectDetail";
import ProjectDetail from "./components/ProjectData.vue";
import ProjectProgress from "./components/ProjectProgress.vue";
import NotStartedColumn from "./components/NotStartedColumn.vue";
import PendingColumn from "./components/PendingColumn.vue";
import CompletedColumn from "./components/CompletedColumn.vue";
import AddTaskModal from './components/AddTaskModal.vue';
import { closeModal, openModal } from "../../../helper/util";
import { useGetMembers } from "../member/actions/GetMember";
import { taskStore } from "./store/kabanStore";
import { useDragTask } from "./actions/dragTask";


const route = useRoute();

const { ProjectData, getProjectDetail } = useGetProjectDetail();

const { getMembers, loading, memberData } = useGetMembers();

const slug = route.query?.query as string;

async function openTaskModal(){
    
    openModal('taskModal').then(()=>{
        taskStore.taskInput.projectId=ProjectData.value?.data.id
        taskStore.taskInput.memberIds=[]
        console.log('modal open....')
    })
}

function closeTaskModal(){
    closeModal('taskModal') 
}

const {fromNotStartedToPending,fromPendingToCompleted,
    fromCompletedToPending}=
useDragTask(getProjectDetail,slug)

async function refreshKabanBoard(){
    await getProjectDetail(slug);
}

onMounted(async () => {
    await getProjectDetail(slug);
    getMembers(1,'')
});
</script>
<template>
    <div class="row">
        <AddTaskModal
        @refreshKabanBoard="refreshKabanBoard"
        @getMembers="getMembers"
        :members="memberData"
         @closeModal="closeTaskModal"/>
        <BreadCrumb />
        <ProjectDetail :ProjectData="ProjectData" />
        <ProjectProgress :ProjectData="ProjectData" />

        <br />

        <div class="card">
            <div class="card-body">
                
                <div class="row" style="height: 500px">
                    
                    <NotStartedColumn 
                   @fromNotStartedToPending="fromNotStartedToPending"
                    :projectData="ProjectData"
                     @openTaskModal="openTaskModal" />
                     
                    <PendingColumn  
                    @fromPendingToCompleted="fromPendingToCompleted"
                     :projectData="ProjectData"/>

                    <CompletedColumn
                    @fromCompletedToPending="fromCompletedToPending"  
                     :projectData="ProjectData" />
                </div>
            </div>
        </div>
    </div>
</template>
<style >
.hovered{
    border:2px dashed rgb(157, 156, 156);
    border-radius: 5px;
}
.assignees button {
    border-radius: 50px;
    width: 40px;
    height: 40px;
    border: 1px solid grey;
}
.assignees .member_1 {
    position: relative;
    left: -10px;
}
.assignees .member_2 {
    position: relative;
    left: -20px;
}
.task_card {
    padding: 10px;
    margin-top: 7px;
}
.not_started_task {
    background-color: aliceblue;
}
.pending_task {
    background-color: rgb(232, 233, 233);
}
</style>
