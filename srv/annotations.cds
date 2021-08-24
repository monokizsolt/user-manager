using userService as service from './cat-service';

// Master
annotate service.User with @(
    UI.SelectionFields: [
        name
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
            ![@UI.Importance] : #High,
        }
    ]
);

// Detail
annotate service.User with @(
    UI: {
        HeaderInfo: {
            TypeName: 'User',
            TypeNamePlural: 'Users',
            Title: {Value: name}
        },
        Facets: [
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : 'Projects',
                Target : 'projects/@UI.LineItem'
            }
        ]
	}
);

annotate userService.User_project with @(UI : {
    LineItem : [        
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Label: 'roles',
            Value : roles.role_code
        }
    ]
});