import { ref } from "vue";
import { makeHttpReq } from "../../../../helper/makeHttpReq";
import { showErrorResponse } from "../../../../helper/util";
import { successMsg } from "../../../../helper/toast-notification";

type countProjectType = { count: number };

export function useGetTotalProject() {
    const countProject = ref<countProjectType>({} as countProjectType);
    async function getTotalProject() {
        try {
            // loading.value = true
            const data = await makeHttpReq<undefined, countProjectType>(
                `count/projects`,
                "GET"
            );
            countProject.value = data;
            updateData();
        } catch (error) {
            showErrorResponse(error);
        }
    }

    function updateData() {
        window.Echo.channel("countProject").listen(
            "NewProjectCreated",
            (e: {countProject: number}) => {
              countProject.value={count:e.countProject}
                // console.log(e);
            }
        );
    }

    return { countProject, getTotalProject };
}
