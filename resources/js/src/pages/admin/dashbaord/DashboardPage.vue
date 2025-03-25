<script lang="ts" setup>
import { onMounted } from "vue";
import ApexDonut from "./components/ApexDonut.vue";
import ApexRadialBar from "./components/ApexRadialBar.vue";
import { useGetPinnedProject } from "./actions/GetPinnedProject";
import { useGetTotalProject } from "./actions/countProject";
import { useGetChartData } from "./actions/getChartData";

const { project, getPinnedProject } = useGetPinnedProject();
const { countProject, getTotalProject } = useGetTotalProject();

const { chartData, getChartData } = useGetChartData();
onMounted(async () => {
    await getPinnedProject();
    getChartData(project.value.id);
    getTotalProject();
});
</script>
<template>
    <div class="row">
        <h2>Dashbaord</h2>
        <br />
        <br />
        <br />
        <div class="row">
            <div class="col-md-8">
                <h3 style="color: rgb(118, 119, 120)">
                    Project :{{ project?.name }}
                </h3>
            </div>
        </div>
        <br /><br />
        <div class="row">
            <div class="col-md-4 col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <b>Total Projects</b>
                    </div>
                    <div class="card-body">
                        <br />
                        <br />

                        <h2 align="center">{{ countProject?.count }}</h2>
                        <br />
                        <br />
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <div class="card">
                    <div class="card-header"><b>Tasks</b></div>
                    <div class="card-body">
                        {{ chartData.tasks }}
                     <div v-if="chartData.tasks">
                        <ApexDonut :task="chartData.tasks" />
                    </div>
                    <div v-else>
                        <ApexDonut :task="[0, 0]" />
                    </div>
                        
                      
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <b>Task Progress</b>
                    </div>

                    <div class="card-body">
                       
                        <div v-if="chartData.progress > 0">
                            <ApexRadialBar :percent="chartData.progress" />
                        </div>
                        <div v-else>
                            <ApexRadialBar :percent="chartData.progress" />
                        </div>
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
