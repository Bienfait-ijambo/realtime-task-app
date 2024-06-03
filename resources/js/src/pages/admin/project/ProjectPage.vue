
<script lang="ts" setup>
import { onMounted } from "vue";
import { useGetProject } from "./actions/getProject";
import ProjectTable from "./components/ProjectTable.vue";
import { Bootstrap5Pagination } from "laravel-vue-pagination";


const {getProjects,loading,projectData}=useGetProject()

onMounted(()=>{
    getProjects()
})
</script>
<template>
    <div class="container">
        <div class="row">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header">
                        Members
                        <RouterLink
                            style="float: right"
                            to="/create-members"
                            class="btn btn-primary"
                            >Create Member</RouterLink
                        >
                    </div>
                    <div class="card-body">
                        <ProjectTable :projects="projectData">
                            <template #pagination>
                                <Bootstrap5Pagination 
                                v-if="projectData?.data"
                                :data="projectData?.data"
                                @pagination-change-page="getProjects"
                                />
                               
                            </template>
                        </ProjectTable>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
