Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F851A9C2F
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 13:26:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EDBBA3C2B04
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 13:26:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E63583C2B05
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 13:26:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6D55A201114
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 13:26:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3B6AFAD0E;
 Wed, 15 Apr 2020 11:26:42 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 15 Apr 2020 13:26:28 +0200
Message-Id: <20200415112635.14144-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415112635.14144-1-pvorel@suse.cz>
References: <20200415112635.14144-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/9] lib: Fix linking error multiple TCID
 definitions with -fno-common
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

-fno-common is a default for gcc-10 and if not used on many targets
implies a speed and code size penalty on global variable references.
It requires either defining variable in header as extern or moving it
to C source.

https://gcc.gnu.org/gcc-10/porting_to.html

Due different TCID handling in legacy API (which defines TCID in the
test source) and new API (TCID defined in the library header) it's not
enough to simply move that definition into tst_test.c because that would
mean that old API test would end up with multiple definitions one in the
corresponding test and one in the new library library code. To workaround
this added definition in tst_test.c with weak linker attribute.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Tested-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/tst_test.h | 4 ----
 lib/tst_test.c     | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/tst_test.h b/include/tst_test.h
index 42c02b549..484842e59 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -319,9 +319,5 @@ int main(int argc, char *argv[])
 
 #define TST_TEST_TCONF(message)                                 \
         static struct tst_test test = { .tconf_msg = message  } \
-/*
- * This is a hack to make the testcases link without defining TCID
- */
-const char *TCID;
 
 #endif	/* TST_TEST_H__ */
diff --git a/lib/tst_test.c b/lib/tst_test.c
index e502c2c1a..64cd3ac33 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -32,6 +32,11 @@
 #include "old_device.h"
 #include "old_tmpdir.h"
 
+/*
+ * Hack to get TCID defined in newlib tests
+ */
+const char *TCID __attribute__((weak));
+
 #define LINUX_GIT_URL "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id="
 #define CVE_DB_URL "https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-"
 
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
