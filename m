Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62584C2044
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Sep 2019 13:59:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E77153C1C72
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Sep 2019 13:59:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 82B1F3C1847
 for <ltp@lists.linux.it>; Mon, 30 Sep 2019 13:59:01 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EB9AE1A00F30
 for <ltp@lists.linux.it>; Mon, 30 Sep 2019 13:59:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6F7C1ABB1
 for <ltp@lists.linux.it>; Mon, 30 Sep 2019 11:59:00 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 30 Sep 2019 13:58:52 +0200
Message-Id: <20190930115852.21672-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930115852.21672-1-pvorel@suse.cz>
References: <20190930115852.21672-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 2/2] doc: Add user-guide.txt
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

atm it's just a stub, containing only Library environment variables
section and Colorized output (moved from colorized-output.txt).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 README.md                |  4 +++-
 doc/colorized-output.txt | 10 ----------
 doc/user-guide.txt       | 29 +++++++++++++++++++++++++++++
 3 files changed, 32 insertions(+), 11 deletions(-)
 delete mode 100644 doc/colorized-output.txt
 create mode 100644 doc/user-guide.txt

diff --git a/README.md b/README.md
index b406a4a44..b0a024fcc 100644
--- a/README.md
+++ b/README.md
@@ -155,7 +155,7 @@ $ testcases/bin/ioctl01 -h
 Many require certain environment variables to be set
 
 ```
-$ LTPROOT=/opt/ltp PATH="$PATH:$LTPROOT/testcases/bin" testcases/bin/wc01.sh
+$ LTPROOT=/opt/ltp PATH="$PATH:$LTPROOT/bin:$LTPROOT/testcases/bin" testcases/bin/wc01.sh
 ```
 
 Most commonly, the path variable needs to be set and also `LTPROOT`, but there
@@ -165,6 +165,8 @@ Note that all shell scripts need the `PATH` to be set. However this is not
 limited to shell scripts, many C based tests need environment variables as
 well.
 
+For more info see `doc/user-guide.txt`.
+
 Developers corner
 =================
 
diff --git a/doc/colorized-output.txt b/doc/colorized-output.txt
deleted file mode 100644
index c1859ccfb..000000000
--- a/doc/colorized-output.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-Colorized output
-================
-
-1. Usage
---------
-By default LTP colorizes it's output unless using pipe or redirect to file.
-
-It's possible to force behaviour with LTP_COLORIZE_OUTPUT environment variable:
-y or 1: always colorize
-n or 0: never colorize
diff --git a/doc/user-guide.txt b/doc/user-guide.txt
new file mode 100644
index 000000000..5d9208bff
--- /dev/null
+++ b/doc/user-guide.txt
@@ -0,0 +1,29 @@
+LTP User Guidelines
+===================
+
+For compiling and installing and running the tests see `README.md`.
+For running LTP network tests see `testcases/network/README.md`.
+
+1. Library environment variables
+--------------------------------
+
+|==============================================================================
+| 'KCONFIG_PATH'        | The path to the kernel config file, (if not set, it tries
+                          the usual paths '/boot/config-RELEASE' or '/proc/config.gz').
+| 'LTPROOT'             | Prefix for installed LTP, the default is '/opt/ltp'.
+| 'LTP_COLORIZE_OUTPUT' | Force colorized output behaviour. 'y' or '1': always colorize
+                          'n' or '0': never colorize.
+| 'LTP_TIMEOUT_MUL'     | Multiply timeout, must be number >= 1 (> 1 is useful for
+                          slow machines to avoid unexpected timeout).
+                          Variable is also used in shell tests.
+| 'PATH'                | It's required to addjust path:
+                          `PATH="$PATH:$LTPROOT/bin:$LTPROOT/testcases/bin"`
+| 'TMPDIR'              | Base directory for template directory, which is required by C tests
+                          `tst_test->needs_tmpdir=1` (or others) or shell 'TST_NEEDS_TMPDIR=1').
+|==============================================================================
+
+2. Colorized output
+-------------------
+
+By default LTP colorizes it's output unless using pipe or redirect to file.
+It's possible to force behaviour with 'LTP_COLORIZE_OUTPUT' environment variable.
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
