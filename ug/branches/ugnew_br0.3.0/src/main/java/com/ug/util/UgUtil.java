package com.ug.util;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.persistence.TypedQuery;

import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.multipart.MultipartFile;

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

	public static String createFile(String type, MultipartFile file,
			String fileLocation, String userId) {
		// String fileName = file.getOriginalFilename();
		// long size = file.getSize();
		String fileNameToReturn = null;
		try {

			String ffname = (userId
			+ "-"
			+ type
			+ file.getOriginalFilename().substring(
					file.getOriginalFilename().indexOf('.'))).toUpperCase();
					
			fileNameToReturn = "/app/"
					+ type
					+ "/"+ffname;
			String fileMe = fileLocation + fileNameToReturn;
			System.out.println(">>>> Created file Location:" + fileMe);
			InputStream in = file.getInputStream();
			FileOutputStream f = new FileOutputStream(fileMe);
			int ch = 0;
			while ((ch = in.read()) != -1) {
				f.write(ch);
			}
			f.flush();
			f.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileNameToReturn;
	}
	
	public static boolean validatePhone(String phone) {
        return phone.matches("^\\d{10}$");
	}
	
	public static boolean validateGeneralEmail(String generalEmail) {
        boolean isValid = false;
        String expression = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{2,4}$";
        CharSequence inputStr = generalEmail;
        Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(inputStr);
        if (matcher.matches()) {
                isValid = true;
        }
        return isValid;
	}

	public static boolean validateStudentEmail(String studentEmail) {
		boolean isValid = false;
		String expression = "^[\\w\\.-]+@([\\w\\-]+\\.)+[E]{1}+[D]{1}+[U]{1}$";
		CharSequence inputStr = studentEmail;
		Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
		Matcher matcher = pattern.matcher(inputStr);
		if (matcher.matches()) {
			isValid = true;
		}
		return isValid;
	}

}
