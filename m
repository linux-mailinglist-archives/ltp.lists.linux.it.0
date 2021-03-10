Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C3880334006
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 15:12:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 30D1D3C6A2A
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 15:12:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3F7913C4B8B
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 15:12:53 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A73791000D25
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 15:12:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 193B3AE78;
 Wed, 10 Mar 2021 14:12:52 +0000 (UTC)
Date: Wed, 10 Mar 2021 15:14:36 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <YEjUTK+UlEcK+6Lx@yuki.lan>
References: <20210310122625.25425-1-chrubis@suse.cz>
 <1320332024.40018791.1615380919351.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1320332024.40018791.1615380919351.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] Add proper filesystem skiplist
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Ack. Can you please also add something to docs?

Sure, what about:

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index dd1911ceb..833f1f7bc 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -978,41 +978,69 @@ LTP_ALIGN(x, a)
 
 Aligns the x to be next multiple of a. The a must be power of 2.
 
-2.2.13 Filesystem type detection
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+2.2.13 Filesystem type detection and skiplist
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Some tests are known to fail on certain filesystems (you cannot swap on TMPFS,
 there are unimplemented 'fcntl()' etc.).
 
-If your test needs to be skipped on certain filesystems, use the interface
-below:
+If your test needs to be skipped on certain filesystems use the
+'.skip_filesystems' field in the tst_test structure as follows:
 
 [source,c]
 -------------------------------------------------------------------------------
 #include "tst_test.h"
 
-	/*
-	 * Unsupported only on NFS.
-	 */
-	if (tst_fs_type(".") == TST_NFS_MAGIC)
-		tst_brk(TCONF, "Test not supported on NFS filesystem");
+static struct tst_test test = {
+	...
+        .skip_filesystems = (const char *const []) {
+                "tmpfs",
+                "ramfs",
+                "nfs",
+                NULL
+        },
+};
+-------------------------------------------------------------------------------
 
-	/*
-	 * Unsupported on NFS, TMPFS and RAMFS
-	 */
-	long type;
+When the '.all_filesystem' flag is set the '.skip_filesystems' list is passed
+to the function that detects supported filesystems any listed filesystem is
+not included in the resulting list of supported filesystems.
+
+[source,c]
+-------------------------------------------------------------------------------
+#include "tst_test.h"
+
+static void run(void)
+{
+	...
 
 	switch ((type = tst_fs_type("."))) {
 	case TST_NFS_MAGIC:
 	case TST_TMPFS_MAGIC:
 	case TST_RAMFS_MAGIC:
-		tst_brk(TCONF, "Test not supported on %s filesystem",
+		tst_brk(TCONF, "Subtest not supported on %s",
 		        tst_fs_type_name(type));
+		return;
 	break;
 	}
+
+	...
+}
 -------------------------------------------------------------------------------
 
+If test needs to adjust expectations based on filesystem type it's also
+possible to detect filesystem type at the runtime. This is preferably used
+when only subset of the test is not applicable for a given filesystem.
+
 2.2.14 Thread-safety in the LTP library
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
