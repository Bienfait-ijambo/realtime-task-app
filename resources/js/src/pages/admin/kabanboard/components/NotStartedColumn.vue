<script lang="ts" setup>
import { getChar } from '../../../../helper/util';
import { SingleProjectResponseType,TaskStatus } from '../actions/getProjectDetail.types';


defineProps<{
    projectData:SingleProjectResponseType
}>()
const emit=defineEmits<{
(e:'openTaskModal'):Promise<void>
(e:'fromNotStartedToPending',taskId:number,projectId:number):Promise<void>


}>()
</script>
<template>
    <div class="col-md-4 not_started_task">
        <div class="card card-header">
            <button @click="emit('openTaskModal')" class="btn btn-warning">Add Task</button>
        </div>

        <div
        v-for="task in projectData?.data?.tasks"
        :key="task.id"
        v-show="task.status===TaskStatus.NOT_STARTED ?true:false"
        @drag="emit('fromNotStartedToPending',task.id,projectData?.data?.id)"
         draggable="true"
          :class="'card card-body task_card notStartedTask_'+task.id">
            <p>{{task.name}}</p>
            <div class="assignees">
                <button v-for="(member,index) in task.task_members" 
                :key="member.id"
                :class="'btn btn-primary member_'+index">{{getChar(member?.members?.name)}}</button>
                <!-- <button class="btn btn-light member_0">L</button>
                <button class="btn btn-light member_1">L</button>
                <button class="btn btn-light member_2">L</button> -->

                <!-- <button class="btn btn-light member_2">L</button>
                <button class="btn btn-secondary member_3">F</button> -->
                {{task?.task_members.length}} assignees
            </div>
        </div>
      
    </div>
</template>
