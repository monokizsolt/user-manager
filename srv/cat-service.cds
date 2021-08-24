using test as model from '../db/data-model';

service userService {

    @odata.draft.enabled
    entity User as projection on model.User;

    entity Roles as projection on model.Role;
}