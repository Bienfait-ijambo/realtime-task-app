
<script lang="ts" setup>
import { SingleProjectResponseType } from "../actions/getProjectDetail.types"

defineProps<{
    ProjectData:SingleProjectResponseType
}>()
</script>
<template>
    <div class="row" style="margin-bottom: 20px">
            <h3 style="color: #767778">
                Project : {{ProjectData?.data?.name}}
            </h3>
            <span
                >StartDate : <b>{{ProjectData?.data?.startDate}}</b> -
                EndDate : <b>{{ProjectData?.data?.endDate}}</b></span
            >
        </div>
</template>