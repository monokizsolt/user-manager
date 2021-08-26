using test as model from '../db/data-model';

service userService {

    @odata.draft.enabled
    entity User as projection on model.User;
}