Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5811D49AC
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 11:32:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DA9E3C53C6
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 11:32:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id AC8CB3C53AB
 for <ltp@lists.linux.it>; Fri, 15 May 2020 11:32:26 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DB502100128A
 for <ltp@lists.linux.it>; Fri, 15 May 2020 11:32:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE43BB0A5;
 Fri, 15 May 2020 09:32:27 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 15 May 2020 11:32:13 +0200
Message-Id: <20200515093216.829-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515093216.829-1-pvorel@suse.cz>
References: <20200515093216.829-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/4] INSTALL: Update requirements, modernise text
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

* replace links to several years old versions with installation commands
  for various distros
* mention pkgconf in both INSTALL and README.md (many distros migrated
  from pkg-config to pkgconf)
* remove make version requirement (make 3.81 is in CentOS 6, which
  support were going to drop)
* remove CVS tag :)

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 INSTALL   | 46 +++++++++++++++++-----------------------------
 README.md |  5 +++--
 2 files changed, 20 insertions(+), 31 deletions(-)

diff --git a/INSTALL b/INSTALL
index 8bf6fe005..dccf7a072 100644
--- a/INSTALL
+++ b/INSTALL
@@ -1,42 +1,30 @@
-$Id: INSTALL,v 1.36 2010/01/18 23:46:09 yaberauneya Exp $
-
 Requirements
 -------------------
 
-1. In order to compile ltp you must have make 3.80+ (make 3.81 preferred).
-2. In order to compile and use ltp-scanner (a utility in the pan directory),
-   you must have bison/yacc, and flex installed.
-
-bison can be obtained here:
-- http://ftp.gnu.org/gnu/bison/bison-2.4.1.tar.gz
-
-Berkeley yacc can be obtained here:
-- ftp://invisible-island.net/byacc/byacc.tar.gz
+Tools are needed for LTP compilation. They should be available as a
+package in any Linux distribution (no specific version is required).
 
-flex can be obtained here:
-- http://downloads.sourceforge.net/project/flex/flex/flex-2.5.33/flex-2.5.33.tar.bz2
+Debian / Ubuntu
+# apt install gcc git make pkgconf autoconf automake bison flex m4 linux-headers-$(uname -r) libc6-dev
 
-make 3.81 can be obtained here:
-- http://ftp.gnu.org/gnu/make/make-3.81.tar.bz2
+OpenSUSE / SLES
+# zypper install gcc git make pkgconf autoconf automake bison flex m4 linux-glibc-devel glibc-devel
 
-If you want to use auto configuration you also need autoconf-2.61+, automake-1.10+
-and pkg-config.
+Fedora / CentOS / RHEL
+# yum install gcc git make pkgconf autoconf automake bison flex m4 kernel-headers glibc-headers
 
-automake-1.10.2's sources can be downloaded from:
-- ftp://ftp.gnu.org/gnu/automake/automake-1.10.2.tar.bz2
-- ftp://ftp.gnu.org/gnu/automake/automake-1.10.2.tar.gz
+These are minimal build requirements for git compilation. Some tests require
+extra development files of some libraries, see travis/*.sh. There is also
+support for other Linux distributions not listed here.
 
-autoconf-2.61's sources can be downloaded from:
-- ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.61.tar.bz2
-- ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.61.tar.gz
+autoconf, automake, m4 (autoconf requirement), git and pkgconf (or pkg-config
+on older distros) are required only for compilation from git (used for creating
+configure file).
 
-autoconf-2.61 also requires m4-1.4.7+ be installed. Its sources can be
-downloaded from:
-- http://ftp.gnu.org/gnu/m4/m4-1.4.7.tar.bz2
-- http://ftp.gnu.org/gnu/m4/m4-1.4.7.tar.gz
+pkgconf is recommended also for compilation from tarball as it
+does automatic detection of some library support.
 
-pkg-config can be downloaded from:
-- https://pkg-config.freedesktop.org/releases/
+GNU Bison / Berkeley Yacc is required for ltp-scanner.
 
 Configuration
 -------------------
diff --git a/README.md b/README.md
index a2a623f40..56d10d450 100644
--- a/README.md
+++ b/README.md
@@ -37,8 +37,9 @@ on properly functioning systems, they are intended to find (or cause) problems.
 Quick guide to running the tests
 ================================
 
-If you have git, autoconf, automake, m4 and pkg-config, the linux headers and
-the common developer packages installed, the chances are the following will work:
+If you have git, autoconf, automake, m4, pkgconf / pkg-config, libc headers,
+linux kernel headers and other common development packages installed (see
+INSTALL and travis/*.sh), the chances are the following will work:
 
 ```
 $ git clone https://github.com/linux-test-project/ltp.git
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
