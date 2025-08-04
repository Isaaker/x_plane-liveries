export interface DataRef {
    name: string;
    value: number | string;
}

export interface MCDUState {
    flightPlan: string[];
    currentPage: number;
    selectedIndex: number;
    dataRefs: DataRef[];
}

export interface Button {
    label: string;
    action: () => void;
}

export interface DisplayComponent {
    render: () => void;
}