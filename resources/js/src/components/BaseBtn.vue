<script lang="ts" setup>
defineProps<{
    loading: boolean;
    label: string;
}>();


</script>
<template>
    <button :disabled="loading" class="btn btn-primary w-100">
    <span v-if="loading ? false:true" >  {{label}}</span>
    <div v-if="loading ? true:false" class="d-flex justify-content-center">
      <div class="spinner-border" role="status">
        <span class="visually-hidden">Loading... </span>
      </div>
    </div>
  </button>
</template>