package com.ug.uil;

import java.util.Collection;
import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import com.ug.domain.Address;
import com.ug.domain.Guarantor;
import com.ug.domain.Loan;
import com.ug.domain.Profile;
import com.ug.domain.User;
import com.ug.domain.UserRole;

public class UgUtil {

	public static User getLoggedInUser() {
		try {
			SecurityContext securityContext = SecurityContextHolder
					.getContext();
			org.springframework.security.core.userdetails.User u = (org.springframework.security.core.userdetails.User) securityContext
					.getAuthentication().getPrincipal();
			String userName = u.getUsername();
			TypedQuery<User> query = User.findUsersByEmailAddress(userName);
			User targetUser = (User) query.getSingleResult();
			return targetUser;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("*** LoggedInUser: null");

			return null;
		}
	}

	public static UserRole getLoggedInUserRole() {
		try {
			SecurityContext securityContext = SecurityContextHolder
					.getContext();
			org.springframework.security.core.userdetails.User u = (org.springframework.security.core.userdetails.User) securityContext
					.getAuthentication().getPrincipal();
			String userName = u.getUsername();
			TypedQuery<User> query = User.findUsersByEmailAddress(userName);
			User targetUser = (User) query.getSingleResult();

			TypedQuery<UserRole> roleQuery = UserRole
					.findUserRolesByUserEntry(targetUser);

			UserRole role = (UserRole) roleQuery.getSingleResult();
			return role;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String getLoggedInUserRoleName() {
		try {
			SecurityContext securityContext = SecurityContextHolder
					.getContext();
			org.springframework.security.core.userdetails.User u = (org.springframework.security.core.userdetails.User) securityContext
					.getAuthentication().getPrincipal();
			String userName = u.getUsername();
			TypedQuery<User> query = User.findUsersByEmailAddress(userName);
			User targetUser = (User) query.getSingleResult();

			TypedQuery<UserRole> roleQuery = UserRole
					.findUserRolesByUserEntry(targetUser);

			UserRole role = (UserRole) roleQuery.getSingleResult();
			return role.getRoleEntry().getRoleName();

			// for (UserRole userRole : userRoles) {
			// // authorities.add(new
			// // GrantedAuthorityImpl(userRole.getRoleEntry().getRoleName()));
			// }

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public static Collection<Address> getAddresses() {
		try {
			SecurityContext securityContext = SecurityContextHolder
					.getContext();
			org.springframework.security.core.userdetails.User u = (org.springframework.security.core.userdetails.User) securityContext
					.getAuthentication().getPrincipal();
			String userName = u.getUsername();
			TypedQuery<User> query = User.findUsersByEmailAddress(userName);
			User targetUser = (User) query.getSingleResult();
			System.out.println("*** User:" + targetUser.toString());
			TypedQuery<UserRole> roleQuery = UserRole
					.findUserRolesByUserEntry(targetUser);

			UserRole role = (UserRole) roleQuery.getSingleResult();
			role.getRoleEntry().getRoleName();
			UserRole userRole = UgUtil.getLoggedInUserRole();
			if (userRole != null
					&& "admin".equals(userRole.getRoleEntry().getRoleName())) {
				return Address.findAllAddresses();
			} else {
				TypedQuery<Address> tqAddresses = Address
						.findAddressesByUserId(targetUser);
				return tqAddresses.getResultList();

			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public static Collection<Profile> getProfiles() {
		try {
			SecurityContext securityContext = SecurityContextHolder
					.getContext();
			org.springframework.security.core.userdetails.User u = (org.springframework.security.core.userdetails.User) securityContext
					.getAuthentication().getPrincipal();
			String userName = u.getUsername();
			TypedQuery<User> query = User.findUsersByEmailAddress(userName);
			User targetUser = (User) query.getSingleResult();

			TypedQuery<UserRole> roleQuery = UserRole
					.findUserRolesByUserEntry(targetUser);

			UserRole role = (UserRole) roleQuery.getSingleResult();
			role.getRoleEntry().getRoleName();
			UserRole userRole = UgUtil.getLoggedInUserRole();
			if (userRole != null
					&& "admin".equals(userRole.getRoleEntry().getRoleName())) {
				return Profile.findAllProfiles();
			} else {
				TypedQuery<Profile> tqAddresses = Profile
						.findProfilesByUserId(targetUser);
				return tqAddresses.getResultList();

			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public static Collection<Guarantor> getGuaranters() {
		try {
			SecurityContext securityContext = SecurityContextHolder
					.getContext();
			org.springframework.security.core.userdetails.User u = (org.springframework.security.core.userdetails.User) securityContext
					.getAuthentication().getPrincipal();
			String userName = u.getUsername();
			TypedQuery<User> query = User.findUsersByEmailAddress(userName);
			User targetUser = (User) query.getSingleResult();

			TypedQuery<UserRole> roleQuery = UserRole
					.findUserRolesByUserEntry(targetUser);

			UserRole role = (UserRole) roleQuery.getSingleResult();
			role.getRoleEntry().getRoleName();
			UserRole userRole = UgUtil.getLoggedInUserRole();
			if (userRole != null
					&& "admin".equals(userRole.getRoleEntry().getRoleName())) {
				return Guarantor.findAllGuarantors();
			} else {
				TypedQuery<Guarantor> tqAddresses = Guarantor
						.findGuarantorsByUserId(targetUser);
				return tqAddresses.getResultList();

			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public static Collection<Loan> getLoans() {
		try {
			SecurityContext securityContext = SecurityContextHolder
					.getContext();
			org.springframework.security.core.userdetails.User u = (org.springframework.security.core.userdetails.User) securityContext
					.getAuthentication().getPrincipal();
			String userName = u.getUsername();
			TypedQuery<User> query = User.findUsersByEmailAddress(userName);
			User targetUser = (User) query.getSingleResult();

			TypedQuery<UserRole> roleQuery = UserRole
					.findUserRolesByUserEntry(targetUser);

			UserRole role = (UserRole) roleQuery.getSingleResult();
			role.getRoleEntry().getRoleName();
			UserRole userRole = UgUtil.getLoggedInUserRole();
			if (userRole != null
					&& "admin".equals(userRole.getRoleEntry().getRoleName())) {
				return Loan.findAllLoans();
			} else {
				TypedQuery<Loan> tqAddresses = Loan
						.findLoansByUserId(targetUser);
				return tqAddresses.getResultList();

			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}