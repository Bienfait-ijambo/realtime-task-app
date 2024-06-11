<script lang="ts" setup>
import { getChar } from "../../../../helper/util";
import {
    SingleProjectResponseType,
    TaskStatus,
} from "../actions/getProjectDetail.types";

defineProps<{
    projectData: SingleProjectResponseType;
}>();

const emit = defineEmits<{
    (e: "fromCompletedToPending", taskId: number,projectId:number): Promise<void>;
}>();
</script>
<template>
    <div class="col-md-4 completed_task">
        <div class="card card-header">
            <b>Completed</b>
        </div>
        <div
            v-for="task in projectData?.data?.tasks"
            :key="task.id"
            v-show="task.status === TaskStatus.COMPLETED ? true : false"
            draggable="true"
            @drag="emit('fromCompletedToPending',task.id,projectData?.data?.id)"
            :class="'card card-body task_card completedTask_'+task.id"
        >
            <p>{{ task.name }}</p>
            <div class="assignees">
                <button
                    v-for="(member, index) in task.task_members"
                    :key="member.id"
                    :class="'btn btn-primary member_' + index"
                >
                    {{ getChar(member?.members?.name) }}
                </button>
                <!-- <button class="btn btn-light member_0">L</button>
                <button class="btn btn-light member_1">L</button>
                <button class="btn btn-light member_2">L</button> -->

                <!-- <button class="btn btn-light member_2">L</button>
                <button class="btn btn-secondary member_3">F</button> -->
                {{ task?.task_members.length }} assignees
            </div>
        </div>
    </div>
</template>
