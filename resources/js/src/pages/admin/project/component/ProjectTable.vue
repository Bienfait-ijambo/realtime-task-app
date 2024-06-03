<script setup lang="ts">
import { GetProjectResponseType } from '../actions/getProject';


defineProps<{
   projects:GetProjectResponseType
}>();

// const emit=defineEmits<{
  
// }>()
</script>

<template>
    <table class="table table-bordered table-striped">
        <thead>
            <tr style="font-weight: bold;">
                <td width="5%">ID</td>
                <td width="30%">Title</td>
               
                <td  width="20%">Completion</td>
                <td  width="10%">Pinned</td>

                <td  width="15%">View</td>
                
            </tr>
        </thead>

        <tbody>
            <tr v-for="project in projects?.data?.data" :key="project.id">
                <td>{{ project.id }}</td>
                <td>{{ project.name }}</td>
                <td>


                    <div
                    class="progress"
                    role="progressbar"
                    aria-label="Example with label"
                    aria-valuenow="5"
                    aria-valuemin="0"
                    aria-valuemax="100"
                >
                    <div class="progress-bar bg-success" :style="{width: project.task_progress.progress+'%'}">{{project.task_progress.progress}} %</div>
                </div>

                </td>
                
                <!-- @click="emit('pinnedProject',project.id)" -->
                <td>
                    <button  type="button" class="btn btn-light">Pinned <i class="bi bi-activity"></i></button>
                </td>
          
                <td>
                    <RouterLink
                        class="btn btn-warning"
                        
                    >View <i class="bi bi-arrow-right"></i></RouterLink>
                </td>
            </tr>
        </tbody>
    </table>
</template>
