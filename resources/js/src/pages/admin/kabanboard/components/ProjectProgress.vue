

<script lang="ts" setup>
import { SingleProjectResponseType } from "../actions/getProjectDetail.types"

defineProps<{
    ProjectData:SingleProjectResponseType
}>()
</script>
<template>
   
<div class="row">
    <div class="col-md-12">
        <div
            class="progress"
            role="progressbar"
            aria-label="Example with label"
            aria-valuenow="5"
            aria-valuemin="0"
            aria-valuemax="100"
        >
            <div
                class="progress-bar bg-success"
               :style="{width:parseInt(ProjectData?.data?.task_progress?.progress)+'%'}"
            >
            {{ ProjectData?.data?.task_progress?.progress }}
                %
            </div>
        </div>
    </div>
</div>
</template>
