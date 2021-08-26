using userService as service from './cat-service';
using test from '../db/data-model';

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
            Title: { Value: name }
        },
        Facets: [
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : 'details',
                Target : '@UI.FieldGroup#details'
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : 'Projects',
                Target : 'projects/@UI.LineItem'
            }
        ],
        FieldGroup #details : {
            $Type : 'UI.FieldGroupType',
            Data  : [
                {
                    $Type : 'UI.DataField',
                    Value : name
                },
                {
                    $Type : 'UI.DataField',
                    Value : role_code
                }
            ]
        }
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
            Value : role_code
        },
        {
            $Type : 'UI.DataField',
            Label: 'roles',
            Value : roles.role_code
        }
    ]
});

annotate test.User with {
   role @title: 'role' @Common : {
        Text            : role.name,
        TextArrangement : #TextOnly,
        ValueListWithFixedValues
    };
}

annotate test.Role with {
    code @Common : {
        Text            : name,
        TextArrangement : #TextOnly,
        ValueListWithFixedValues
    }
}

annotate test.User_project with {
    role @title : 'role'  @Common : {
        Text            : role.name,
        TextArrangement : #TextOnly,
        ValueListWithFixedValues
    };
}

annotate test.User_project_role with @title : 'roles' {
    role @title : 'role'  @Common : {
        Text            : role.name,
        TextArrangement : #TextOnly,
        ValueListWithFixedValues
    };
}