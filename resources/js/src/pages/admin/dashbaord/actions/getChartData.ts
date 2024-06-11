import { ref } from "vue";
import { makeHttpReq } from "../../../../helper/makeHttpReq";
import { showErrorResponse } from "../../../../helper/util";
import { successMsg } from "../../../../helper/toast-notification";

type chartDataType={
    tasks:Array<number>
    progress:number    
}

export function useGetChartData(){
  const chartData=ref<chartDataType>({} as chartDataType)
    async function getChartData(projectId:number){
       try {
        // loading.value = true
        const data= await makeHttpReq<undefined,chartDataType>
        (`chart-data/projects?projectId=${projectId}`,'GET')
        chartData.value=data
        updateData()
        
       } catch (error) {
     
        showErrorResponse(error)
       }
    }

    function updateData() {
      
      window.Echo.channel("projectProgress").listen(
          "TrackProjectProgress",
          (e: {projectProgress: number}) => {
            chartData.value.progress=0
            setTimeout(()=>chartData.value.progress=e.projectProgress,2000)

            
          }
      );

      window.Echo.channel("tasks").listen(
        "TrackCompletedAndPendingTask",
        (e: {tasks:Array<number>}) => {
          chartData.value.tasks=undefined as any
          setTimeout(()=>chartData.value.tasks=e.tasks,2000)

          console.log(e);
          
        }
    );
      
      
      
  }

   
 
    
    return {getChartData,chartData}
}