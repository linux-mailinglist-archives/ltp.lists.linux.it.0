Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE6419A8BF
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Apr 2020 11:39:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D95E53C3086
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Apr 2020 11:39:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2F05B3C3036
 for <ltp@lists.linux.it>; Wed,  1 Apr 2020 11:39:25 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7CC6B6018A1
 for <ltp@lists.linux.it>; Wed,  1 Apr 2020 11:39:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CC131AFC5;
 Wed,  1 Apr 2020 09:39:23 +0000 (UTC)
Date: Wed, 1 Apr 2020 11:39:34 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200401093934.GA23773@yuki.lan>
References: <20200401083228.GA18685@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401083228.GA18685@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] LTP compilation broken with -fno-common
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
Cc: Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it,
 Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> LTP compilation breaks with -fno-common (we don't use as the default).
> This is the default for GCC 10, is there a way to fix it or do we need to disable it?
> 
> Compilation on gcc-10 (or gcc-9 with CFLAGS="-fno-common":
> 
> gcc-9 -Werror=implicit-function-declaration -fno-common -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -W  -I../../include -I../../include -I../../include/old/   -L../../lib  tst_checkpoint_wait_timeout.c   -lltp -o tst_checkpoint_wait_timeout
> /usr/lib64/gcc/x86_64-suse-linux/9/../../../../x86_64-suse-linux/bin/ld: ../../lib/libltp.a(tst_test.o):ltp.git/lib/../include/tst_test.h:325: multiple definition of `TCID'; /tmp/cc49yYO6.o:ltp.git/lib/tests/tst_strsig.c:27: first defined here
> /usr/lib64/gcc/x86_64-suse-linux/9/../../../../x86_64-suse-linux/bin/ld: ../../lib/libltp.a(tst_sys_conf.o):ltp.git/lib/../include/tst_test.h:325: multiple definition of `TCID'; /tmp/cc49yYO6.o:ltp.git/lib/tests/tst_strsig.c:27: first defined here
> 
> It's somehow related to the "hack" in include/tst_test.h:
> 
> /*
>  * This is a hack to make the testcases link without defining TCID
>  */
> extern const char *TCID;

This is not the original line, the original line is without the extern.

Now this will not be easy to solve since the problem is:

* All old style test define TCID in the test source that also implements main()

* The test library uses that variable in various places

* The variable definition is in the tst_test.h so that all new test also
  define TCID

We cannot move that definition into tst_test.c beacuse that would mean
that old API test would end up with multiple definitions one in the
corresponding test and one in the new library library code.

Maybe we can add it with a weak linker attribute. What about this patch:

diff --git a/include/tst_test.h b/include/tst_test.h
index 259d87d60..352e2cd64 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -322,9 +322,7 @@ int main(int argc, char *argv[])
 
 #define TST_TEST_TCONF(message)                                 \
         static struct tst_test test = { .tconf_msg = message  } \
-/*
- * This is a hack to make the testcases link without defining TCID
- */
-const char *TCID;
+
+extern const char *TCID;
 
 #endif /* TST_TEST_H__ */
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 73827d472..4ce8cc301 100644
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



I guess that we can even drop the TCID extern definition from the tst_test.h
header if the weak attribute works fine.


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
