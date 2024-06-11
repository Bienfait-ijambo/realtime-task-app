
export enum TaskStatus{
    NOT_STARTED = 0,
    PENDING=1,
    COMPLETED=2,
}

export type SingleProjectResponseType = {
    data: {
        id: number;
        name: string;
        status: number;
        startDate: string;
        endDate: string;
        slug: string;
        created_at: string;
        updated_at: string;
        tasks: [
            {
                id: number;
                projectId: number;
                name: string;
                status: number;
                created_at: string;
                updated_at: string;
                task_members: [
                    {
                        id: number;
                        projectId: number;
                        taskId: number;
                        memberId: number;
                        created_at: string;
                        updated_at: string;
                        members: {
                            id: number;
                            name: string;
                            email: string;
                       
                            created_at: string;
                            updated_at: string;
                        };
                    }
                ];
            }
        ];
        task_progress: {
            id: number;
            projectId: number
            progress: string
            pinned_on_dashbaord:number
            created_at: string
            updated_at: string
        };
    };
};
