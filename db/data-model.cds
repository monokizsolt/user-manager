namespace test;

using { sap } from '@sap/cds/common';

entity User {
    key ID: UUID;
    name: String;

    projects : Composition of many User_project on projects.User = $self;
}

entity User_project {
    key ID: UUID;
    name: String;

    roles: Composition of many User_project_role on roles.User_project = $self;

    User: Association to User;
}

entity User_project_role {
    key ID: UUID;
    
    User_project: Association to User_project;
    role: Association to Role;
}

entity Role : sap.common.CodeList {
    key code : String(4);
}