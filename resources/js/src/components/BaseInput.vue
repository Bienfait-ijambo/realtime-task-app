<script lang="ts" setup>
defineProps<{
    type?: string;
    modelValue: string;
}>();

const emit=defineEmits<{
    (e:'update:modelValue',val:any):void
}>()

function updateValue(event:any){
    const val=event.target.value
    emit('update:modelValue',val)
    // console.log(val)
}
</script>

<template>
    <input
      
        :value="modelValue"
        :type="typeof type==='undefined'?'text':type"
        class="form-control"
        @input="updateValue"
        placeholder=""
    />
</template>
