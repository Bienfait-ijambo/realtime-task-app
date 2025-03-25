<script lang="ts" setup>
import { onMounted } from "vue";
import ProjectTable from "./components/ProjectTable.vue";
import { useRouter } from "vue-router";
import { projectStore } from "./store/projectStore";
import { ProjectInputType } from "./actions/createProject";
import { usePinnedProject } from "./actions/pinnedProject";
import { useGetProject,ProjectType } from "./actions/getProject";

const { getProjects, loading, ProjectData } = useGetProject();
async function showListOfProjects() {
    await getProjects();
}

const router=useRouter()
function editProject(project:ProjectType){
    projectStore.projectInput={
        id:project.id,
        name:project.name,
        startDate:project.startDate,
        endDate:project.endDate
    }
    
    projectStore.edit=true
    router.push('/create-projects')

}

const {pinnedProject}=usePinnedProject()

async function pinnedProjectOnDashboard(projectId:number){
    await pinnedProject(projectId)
    router.push('/admin')
}
onMounted(async () => {
    showListOfProjects();
    projectStore.edit=false
    projectStore.projectInput={} as ProjectInputType
});
</script>
<template>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        Projects
                        <RouterLink
                            style="float: right"
                            to="/create-projects"
                            class="btn btn-primary"
                            >Create Project</RouterLink
                        >
                    </div>
                    <div class="card-body">
                        <ProjectTable
                        @getProject="getProjects"
                        :loading="loading"
                        @editProject="editProject"
                        :projects="ProjectData"
                        @pinnedProject="pinnedProjectOnDashboard"
                        >
                            <template #pagination>
                                <Bootstrap5Pagination 
                                v-if="ProjectData?.data"
                                :data="ProjectData?.data"
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
