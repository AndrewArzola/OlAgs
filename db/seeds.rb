# frozen_string_literal: true

if Member.count.zero?
  Member.create!([
    {
      fname: 'Walter',
      lname: 'Ritchie',
      joinDate: '01/01/2001',
      email: 'writchie3@tamu.edu',
      phoneNumber: '2148936415',
      city: 'College Station',
      admin: true,
      major: 'Computer Science',
      active: true,
      gradDate: '2022-03-04'
    },
    {
      fname: 'CJ',
      lname: 'Sewell',
      joinDate: '01/01/2002',
      email: 'c.j.sewell07@tamu.edu',
      phoneNumber: '',
      city: '',
      admin: true,
      major: 'Computer Engineering',
      active: true,
      gradDate: nil
    },
    {
      fname: 'Anna',
      lname: 'Kolodziejcyk',
      joinDate: '01/01/2003',
      email: 'akk962@tamu.edu',
      phoneNumber: '',
      city: '',
      admin: true,
      major: '',
      active: true,
      gradDate: nil
    },
    {
      fname: 'Alex',
      lname: 'Torres',
      joinDate: '01/01/2004',
      email: 'robincrass@tamu.edu',
      phoneNumber: '',
      city: '',
      admin: true,
      major: '',
      active: false,
      gradDate: nil
    },
    {
      fname: 'Andrew',
      lname: 'Arzola',
      joinDate: '01/01/2005',
      email: 'andrew.j.arzola@tamu.edu',
      phoneNumber: '',
      city: '',
      admin: true,
      major: '',
      active: false,
      gradDate: nil
    }
  ]
                )
end
