Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2761D3C10
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 21:09:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F25E83C544C
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 21:09:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id F0FA73C13DE
 for <ltp@lists.linux.it>; Thu, 14 May 2020 21:09:14 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0F33B20023A
 for <ltp@lists.linux.it>; Thu, 14 May 2020 21:09:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D29D3B02E
 for <ltp@lists.linux.it>; Thu, 14 May 2020 19:09:15 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 14 May 2020 21:09:06 +0200
Message-Id: <20200514190906.27130-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/4] INSTALL: Update requirements
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

* mention pkgconf in both INSTALL and README.md (many distros migrated
  from pkg-config to pkgconf)
* replace links to old versions to projects' homepage
* modernize text a bit
* remove CVS tag :)

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v1->v2:
* Few pkg-config related changes

@@ -8,12 +8,16 @@ For compilation from tarball
 * make
 https://www.gnu.org/software/make/
 
-For auto configuration from git
 * pkgconf / pkg-config
 https://git.sr.ht/~kaniini/pkgconf
 http://pkgconf.org/
 https://www.freedesktop.org/wiki/Software/pkg-config/
 
+pkgconf / pkg-config is not necesarry for compliation from tarball
+(libraries wont be found), but it's required for compilation from git
+(needed for creating configure file).
+
+For auto configuration when installing from git
 * autoconf
 https://www.gnu.org/software/autoconf/
 


 INSTALL   | 53 +++++++++++++++++++++++++----------------------------
 README.md |  5 +++--
 2 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/INSTALL b/INSTALL
index 8bf6fe005..250330e2b 100644
--- a/INSTALL
+++ b/INSTALL
@@ -1,42 +1,39 @@
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
+These tools are needed for LTP compilation. They should be available as a
+package in any Linux distribution (no specific version is required).
 
-Berkeley yacc can be obtained here:
-- ftp://invisible-island.net/byacc/byacc.tar.gz
+For compilation from tarball
+* make
+https://www.gnu.org/software/make/
 
-flex can be obtained here:
-- http://downloads.sourceforge.net/project/flex/flex/flex-2.5.33/flex-2.5.33.tar.bz2
+* pkgconf / pkg-config
+https://git.sr.ht/~kaniini/pkgconf
+http://pkgconf.org/
+https://www.freedesktop.org/wiki/Software/pkg-config/
 
-make 3.81 can be obtained here:
-- http://ftp.gnu.org/gnu/make/make-3.81.tar.bz2
+pkgconf / pkg-config is not necesarry for compliation from tarball
+(libraries wont be found), but it's required for compilation from git
+(needed for creating configure file).
 
-If you want to use auto configuration you also need autoconf-2.61+, automake-1.10+
-and pkg-config.
+For auto configuration when installing from git
+* autoconf
+https://www.gnu.org/software/autoconf/
 
-automake-1.10.2's sources can be downloaded from:
-- ftp://ftp.gnu.org/gnu/automake/automake-1.10.2.tar.bz2
-- ftp://ftp.gnu.org/gnu/automake/automake-1.10.2.tar.gz
+* automake
+https://www.gnu.org/software/automake/
 
-autoconf-2.61's sources can be downloaded from:
-- ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.61.tar.bz2
-- ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.61.tar.gz
+* m4 (autoconf requirement)
+https://www.gnu.org/software/m4/
 
-autoconf-2.61 also requires m4-1.4.7+ be installed. Its sources can be
-downloaded from:
-- http://ftp.gnu.org/gnu/m4/m4-1.4.7.tar.bz2
-- http://ftp.gnu.org/gnu/m4/m4-1.4.7.tar.gz
+For ltp-scanner
+* GNU Bison / Berkeley Yacc
+https://www.gnu.org/software/bison/
+https://invisible-island.net/byacc/byacc.html
 
-pkg-config can be downloaded from:
-- https://pkg-config.freedesktop.org/releases/
+* Flex
+https://github.com/westes/flex
 
 Configuration
 -------------------
diff --git a/README.md b/README.md
index a2a623f40..15f8814c3 100644
--- a/README.md
+++ b/README.md
@@ -37,8 +37,9 @@ on properly functioning systems, they are intended to find (or cause) problems.
 Quick guide to running the tests
 ================================
 
-If you have git, autoconf, automake, m4 and pkg-config, the linux headers and
-the common developer packages installed, the chances are the following will work:
+If you have git, autoconf, automake, m4, pkgconf / pkg-config, linux kernel
+headers and the common developer packages installed, the chances are the
+following will work:
 
 ```
 $ git clone https://github.com/linux-test-project/ltp.git
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
