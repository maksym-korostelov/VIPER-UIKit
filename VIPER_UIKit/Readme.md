Application Overview
Functionality: A simple app that fetches a list of users from a mock API and displays their names in a list. When a user taps on a name, the app navigates to a detail view showing more information.

Key Objectives:

Implement the VIPER architecture in both UIKit and SwiftUI.
Highlight the differences in how VIPER components interact in each framework.
Focus on the View, Presenter, and Router to show the most significant contrasts.


_Summary of the Data Flow_
UserDetailViewController invokes presenter.saveButtonTapped(with:) when the Save button is pressed.

UserDetailPresenter:
  Creates a new User object with the updated name.
  Calls interactor.updateUser(user).

UserDetailInteractor:
  Updates its local user variable.
  Notifies the presenter via presenter.didUpdateUser(user).

UserDetailPresenter:
  Calls delegate?.didUpdateUser(user) to notify the delegate (which is the UserListPresenter).
  Calls router.navigateBack() to return to the previous screen.

UserListPresenter:
  Receives the updated user via didUpdateUser(_:).
  Calls interactor.updateUser(user).

UserListInteractor:
  Finds the user in its users array and updates it.
  Calls presenter.didFetchUsers(users) to notify of the updated list.

UserListPresenter:
  Calls view?.showUsers(users) to update the view.

UserListViewController:
  Updates the users array and reloads the table view.
