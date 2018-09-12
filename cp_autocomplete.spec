Summary: Provide bash autocompletion for cpapi2 uapi and whmapi1
Name: %(echo ${NAME})
Version: %(echo ${VERSION})
Release: %(echo ${BUILD})
License: MIT
Group: Applications/System
BuildRoot: %{_topdir}/%{name}-%{version}-%{release}-build
BuildArch: %(echo ${ARCH})

Requires: coreutils, bash, bash-completion

%description
Provides a simple utility to gett basic information about a domain on a cPanel server.

%prep

%build
# steps to build unattended

%install
mkdir -p %{buildroot}/%{_sysconfdir}/bash_completion.d
install -m 0400 %{_sourcedir}/%{name}/_whmapi1.sh %{buildroot}/%{_sysconfdir}/bash_completion.d/_whmapi1.sh
install -m 0444 %{_sourcedir}/%{name}/_cpapi2.sh %{buildroot}/%{_sysconfdir}/bash_completion.d/_cpapi2.sh
install -m 0444 %{_sourcedir}/%{name}/_uapi.sh %{buildroot}/%{_sysconfdir}/bash_completion.d/_uapi.sh

%clean
rm -rf ${RPM_BUILD_ROOT}

%files
%defattr(-,root,root)
/%{_sysconfdir}/bash_completion.d/_whmapi1.sh
/%{_sysconfdir}/bash_completion.d/_cpapi2.sh
/%{_sysconfdir}/bash_completion.d/_uapi.sh

%changelog
* Tue Sep 11 2018 Mark Cunningham <mcunningham@liquidweb.com>
- Made initial RPM Specfile.