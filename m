Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D64437FCF4
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 17:05:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DDFD3C2048
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 17:05:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 44B353C2017
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 17:04:54 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C454A6096BE
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 17:04:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4F54FAF33;
 Fri,  2 Aug 2019 15:04:52 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  2 Aug 2019 17:04:42 +0200
Message-Id: <20190802150445.10984-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802150445.10984-1-pvorel@suse.cz>
References: <20190802150445.10984-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/4] make: Remove C++ related flags
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

as we have no C++ code. Removed:
CXXFLAGS, DEBUG_CXXFLAGS, OPT_CXXFLAGS, WCXXFLAGS

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 INSTALL                      |  4 +---
 build.sh                     |  2 +-
 doc/build-system-guide.txt   | 10 ----------
 include/mk/config.mk.default |  4 ----
 include/mk/config.mk.in      |  4 ----
 5 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/INSTALL b/INSTALL
index b2fe630bf..6e3b26e24 100644
--- a/INSTALL
+++ b/INSTALL
@@ -239,7 +239,7 @@ Cross compiling
 ---------------
 
 To cross compile, you must specify the correct variables when running configure.
-e.g. CC, CXX, CXXFLAGS, LDFLAGS, etc...
+e.g. CC, LDFLAGS, etc...
 
 After configure has run, it will generate include/mk/config.mk. You can tweak
 settings in there if need be, but you should not specificy settings on the
@@ -264,8 +264,6 @@ The conventions enforced are standard ones. Here's a quick summary:
 
 CFLAGS   - used when compiling/linking C code, e.g. -D_GNU_SOURCE (no CPPFLAGS!)
 
-CXXFLAGS - used when compiling/linking C++ code (no CPPFLAGS!)
-
 CPPFLAGS - used when preprocessor is run (so C/C++ compiling with $(CPP)
 	   functions, e.g. -I$SYSROOT/usr/include -I$SYSROOT/include -I$SYSROOT
 
diff --git a/build.sh b/build.sh
index ae3b86ff2..634ef51b5 100755
--- a/build.sh
+++ b/build.sh
@@ -21,7 +21,7 @@ CC=gcc
 build_32()
 {
 	echo "===== 32-bit ${1}-tree build into $PREFIX ====="
-	build $1 CFLAGS="-m32" CXXFLAGS="-m32" LDFLAGS="-m32"
+	build $1 CFLAGS="-m32" LDFLAGS="-m32"
 }
 
 build_native()
diff --git a/doc/build-system-guide.txt b/doc/build-system-guide.txt
index e9717f1ae..c4b36239b 100644
--- a/doc/build-system-guide.txt
+++ b/doc/build-system-guide.txt
@@ -137,20 +137,14 @@ $(AR)			: The library archiver.
 
 $(CC)			: The system C compiler.
 
-$(CXX)			: The system C++ compiler.
-
 $(CPP)			: The system C preprocessor.
 
 $(CFLAGS)		: C compiler flags.
 
 $(CPPFLAGS)		: Preprocessor flags, e.g. -I arguments.
 
-$(CXXFLAGS)		: C++ compiler flags, e.g. -I arguments.
-
 $(DEBUG_CFLAGS)		: Debug flags to pass to $(CC), -g, etc.
 
-$(DEBUG_CXXFLAGS)	: Debug flags to pass to $(CXX).
-
 $(LD)			: The system linker (typically $(CC), but not
 			  necessarily).
 
@@ -179,14 +173,10 @@ $(OPT_CFLAGS)		: Optimization flags to pass into the C compiler, -O2,
 			  logic in the tree-optimization portion of the gcc
 			  compiler, from 3.3.x to 4.4.
 
-$(OPT_CXXFLAGS)		: Optimization flags to pass to the C++ compiler.
-
 $(RANLIB)		: What to run after archiving a library.
 
 $(WCFLAGS)		: Warning flags to pass to $(CC), e.g. -Werror,
 			  -Wall, etc.
-
-$(WCXXFLAGS)		: Same as $(WCFLAGS), but for $(CXX).
 -------------------------------------------------------------------------------
 
 Make System Variables
diff --git a/include/mk/config.mk.default b/include/mk/config.mk.default
index 0934d9453..857067cb3 100644
--- a/include/mk/config.mk.default
+++ b/include/mk/config.mk.default
@@ -59,18 +59,14 @@ LDLIBS			:=
 LDFLAGS			:=
 
 DEBUG_CFLAGS		?= -g
-DEBUG_CXXFLAGS		?= $(DEBUG_CFLAGS)
 
 # Please see README.mk-devel about -fstrict-aliasing.
 OPT_CFLAGS		?= -O2 -fno-strict-aliasing -pipe
-OPT_CXXFLAGS		?= $(OPT_CFLAGS)
 
 WCFLAGS			?= -Wall
-WCXXFLAGS		?= $(WCFLAGS)
 
 LDFLAGS			+= $(WLDFLAGS)
 CFLAGS			+= $(DEBUG_CFLAGS) $(OPT_CFLAGS) $(WCFLAGS)
-CXXFLAGS		+= $(DEBUG_CXXFLAGS) $(OPT_CXXFLAGS) $(WCXXFLAGS)
 
 LINUX_VERSION		:=
 LINUX_DIR		:=
diff --git a/include/mk/config.mk.in b/include/mk/config.mk.in
index d55fe9602..0bc59887a 100644
--- a/include/mk/config.mk.in
+++ b/include/mk/config.mk.in
@@ -63,18 +63,14 @@ LDLIBS			:= @LIBS@
 LDFLAGS			:= @LDFLAGS@
 
 DEBUG_CFLAGS		?= -g
-DEBUG_CXXFLAGS		?= $(DEBUG_CFLAGS)
 
 # Please see README.mk-devel about -fstrict-aliasing.
 OPT_CFLAGS		?= -O2 -fno-strict-aliasing -pipe
-OPT_CXXFLAGS		?= $(OPT_CFLAGS)
 
 WCFLAGS			?= -Wall -W @GCC_WARN_OLDSTYLE@
-WCXXFLAGS		?= $(WCFLAGS)
 
 LDFLAGS			+= $(WLDFLAGS)
 CFLAGS			+= $(DEBUG_CFLAGS) $(OPT_CFLAGS) $(WCFLAGS)
-CXXFLAGS		+= $(DEBUG_CXXFLAGS) $(OPT_CXXFLAGS) $(WCXXFLAGS)
 
 LINUX_VERSION		:= @LINUX_VERSION@
 LINUX_DIR		:= @LINUX_DIR@
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
