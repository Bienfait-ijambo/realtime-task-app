<script lang="ts" setup>
import { ref } from "vue";
import { GetMemberType, MemberType } from "../actions/GetMember";
import { myDebounce } from "../../../../helper/util";

defineProps<{
    members: GetMemberType;
    loading: boolean;
}>();

const emit = defineEmits<{
    (e: "editMember", member: MemberType): void;
    (e: "getMember", page:number,query: string,): Promise<void>;
}>();

const query = ref("");
const search = myDebounce(async function () {
    await emit("getMember",1,query.value,);
}, 200);
</script>
<template>
    <div class="row">
        <div class="row">
            <div class="col-md-4">
                <input
                    type="text"
                    @keydown="search"
                    v-model="query"
                    placeholder="search..."
                    class="form-control"
                />
                <span
                    style="color: blue"
                    v-show="loading === true ? true : false"
                    ><b>Searching....</b></span
                >
            </div>
        </div>
        <br />
        <br />

        <div class="row">
            <table class="table table-bordered table-hover table-striped">
                <thead>
                    <tr>
                        <td>ID</td>
                        <td>Name</td>
                        <td>Email</td>
                        <td>Edit</td>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="member in members?.data?.data" :key="member.id">
                        <td>{{ member.id }}</td>
                        <td>{{ member.name }}</td>
                        <td>{{ member.email }}</td>
                        <td>
                            <button
                                @click="emit('editMember', member)"
                                class="btn btn-outline-primary"
                            >
                                Edit
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <slot name="pagination"></slot>
    </div>
</template>
