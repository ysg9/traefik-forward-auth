package authorization

// User represents an autorized user
type User struct {
	Name   string
	Email  string
	Groups []string
}

// GetName returns the user name
func (k *User) GetName() string {
	return k.Name
}

// GetEmail returns the email
func (k *User) GetEmail() string {
	return k.Email
}

// GetGroups return list of groups the user belongs to
func (k *User) GetGroups() []string {
	return k.Groups
}
