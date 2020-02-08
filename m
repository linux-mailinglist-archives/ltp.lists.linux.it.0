Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 63261156394
	for <lists+linux-ltp@lfdr.de>; Sat,  8 Feb 2020 10:20:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E36863C25A7
	for <lists+linux-ltp@lfdr.de>; Sat,  8 Feb 2020 10:20:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 815293C2078
 for <ltp@lists.linux.it>; Sat,  8 Feb 2020 10:20:32 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 76FBF1A00EA2
 for <ltp@lists.linux.it>; Sat,  8 Feb 2020 10:20:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581153629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wDym2W2yycYyf2Kp5/WLltRzj7R9caPVcg5x8XQgn3k=;
 b=ZvQJfr5a0PHvXdGIQonmRqnUoM8tDoUSRy/ijNEhnlzIVRs4hK4Q+aBLh+gOS+5NRXTiyp
 leRovh3+NTCDt1cTLpskeQ/wFG/cvSKyJBPQZp50trSNjEbPOwcbRgrYKVc3b/TbqXCH2n
 /T4EF6rmV2vgVPxDmKFbgedYRbidCwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-VonRyfJyMzaz15lGCh7eMw-1; Sat, 08 Feb 2020 04:20:25 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D54C1088388
 for <ltp@lists.linux.it>; Sat,  8 Feb 2020 09:20:24 +0000 (UTC)
Received: from bootp-66-81-246.lab.eng.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54CBB60BEC
 for <ltp@lists.linux.it>; Sat,  8 Feb 2020 09:20:22 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Sat,  8 Feb 2020 17:20:13 +0800
Message-Id: <20200208092014.24824-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: VonRyfJyMzaz15lGCh7eMw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/2] lib: add .request_hugepages to reserve hugepage
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
Content-Type: multipart/mixed; boundary="===============1801313750=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1801313750==
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: quoted-printable

Many of the ltp tests need to use hugepage in their testing, this allows
the test can reserve hpages from system only via .request_hugepages =3D xx.

If set non-zero number of request_hugepages, test will try to reserve the
expected number of hugepage for testing in setup phase. If system does not
have enough hpage for using, it will try the best to reserve 80% available
number of hpages. For a system without hugetlb supporting, variable
'tst_hugepage' will be set to 0.

Signed-off-by: Li Wang <liwang@redhat.com>
---

Notes:
    v3 --> v4
      * add doc to check the hpage number in setup()
      * remove the TCONF print if hugepage is not supported
      * check here that max_hpages * 0.8 > 1

 doc/test-writing-guidelines.txt | 58 ++++++++++++++++++++++++++++++++
 include/tst_hugepage.h          | 29 ++++++++++++++++
 include/tst_test.h              | 13 ++++++++
 lib/newlib_tests/.gitignore     |  1 +
 lib/newlib_tests/test20.c       | 45 +++++++++++++++++++++++++
 lib/tst_hugepage.c              | 59 +++++++++++++++++++++++++++++++++
 lib/tst_test.c                  |  6 ++--
 7 files changed, 209 insertions(+), 2 deletions(-)
 create mode 100644 include/tst_hugepage.h
 create mode 100644 lib/newlib_tests/test20.c
 create mode 100644 lib/tst_hugepage.c

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.=
txt
index 546bb7a49..fa7cb89c1 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1933,6 +1933,64 @@ specified by the user plus some other heuristics.
=20
 For full documentation see the comments in 'include/tst_fuzzy_sync.h'.
=20
+2.2.34 Reserving hugepages
+^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Many of the ltp tests need to use hugepage in their testing, this allows t=
he
+test can reserve hugepages from system only via .request_hugepages =3D xx.
+
+If set non-zero number of request_hugepages, test will try to reserve the
+expected number of hugepage for testing in setup phase. If system does not
+have enough hpage for using, it will try the best to reserve 80% available
+number of hpages. With success test stores the reserved hugepage number in
+'tst_hugepages. For the system without hugetlb supporting, variable
+'tst_hugepages' will be set to 0.
+
+Also, we do cleanup and restore work for the hpages resetting automaticall=
y.
+
+[source,c]
+--------------------------------------------------------------------------=
-----
+#include "tst_test.h"
+
+static void run(void)
+{
+=09...
+
+=09if (tst_hugepages =3D=3D test.request_hugepages)
+=09=09TEST(do_hpage_test);
+=09else
+=09=09...
+=09...
+}
+
+struct tst_test test =3D {
+=09.test_all =3D run,
+=09.request_hugepages =3D 2,
+=09...
+};
+
+or,
+
+#include "tst_test.h"
+
+static void run(void)
+{
+=09...
+}
+
+static void setup(void)
+{
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tst_hugepages !=3D test.requested_hugepage=
s)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TCONF, "..=
.");
+}
+
+struct tst_test test =3D {
+=09.test_all =3D run,
+=09.request_hugepages =3D 2,
+=09...
+};
+--------------------------------------------------------------------------=
-----
+
 2.3 Writing a testcase in shell
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
diff --git a/include/tst_hugepage.h b/include/tst_hugepage.h
new file mode 100644
index 000000000..10e0eaf47
--- /dev/null
+++ b/include/tst_hugepage.h
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Red Hat, Inc.
+ */
+
+#ifndef TST_HUGEPAGE__
+#define TST_HUGEPAGE__
+
+#define PATH_HUGEPAGES=09"/sys/kernel/mm/hugepages/"
+#define PATH_NR_HPAGES=09"/proc/sys/vm/nr_hugepages"
+
+/*
+ * Try the best to request a specified number of huge pages from system,
+ * it will store the reserved hpage number in tst_hugepages.
+ *
+ * Note: this depend on the status of system memory fragmentation.
+ */
+int tst_request_hugepages(int hpages);
+
+/*
+ * This variable is used for recording the number of hugepages which syste=
m can
+ * provides. It will be equal to 'hpages' if tst_request_hugepages on succ=
ess,
+ * otherwise set it to a number of hugepages that we were able to reserve.
+ *
+ * If system does not support hugetlb, then it will be set to 0.
+ */
+extern unsigned int tst_hugepages;
+
+#endif /* TST_HUGEPAGE_H */
diff --git a/include/tst_test.h b/include/tst_test.h
index 21c7dfbdb..1026a422a 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -37,6 +37,7 @@
 #include "tst_coredump.h"
 #include "tst_buffers.h"
 #include "tst_capability.h"
+#include "tst_hugepage.h"
=20
 /*
  * Reports testcase result.
@@ -148,6 +149,18 @@ struct tst_test {
 =09 */
 =09int all_filesystems:1;
=20
+=09/*
+=09 * If set non-zero number of request_hugepages, test will try to reserv=
e the
+=09 * expected number of hugepage for testing in setup phase. If system do=
es not
+=09 * have enough hpage for using, it will try the best to reserve 80% ava=
ilable
+=09 * number of hpages. With success test stores the reserved hugepage num=
ber in
+=09 * 'tst_hugepages. For the system without hugetlb supporting, variable
+=09 * 'tst_hugepages' will be set to 0.
+=09 *
+=09 * Also, we do cleanup and restore work for the hpages resetting automa=
tically.
+=09 */
+=09unsigned int request_hugepages;
+
 =09/*
 =09 * If set non-zero denotes number of test variant, the test is executed
 =09 * variants times each time with tst_variant set to different number.
diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index d4aa4935f..ab3a92c4c 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -23,6 +23,7 @@ tst_strstatus
 test17
 test18
 test19
+test20
 tst_expiration_timer
 test_exec
 test_exec_child
diff --git a/lib/newlib_tests/test20.c b/lib/newlib_tests/test20.c
new file mode 100644
index 000000000..92e230976
--- /dev/null
+++ b/lib/newlib_tests/test20.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Li Wang <liwang@redhat.com>
+ */
+
+/*
+ * Tests .request_hugepages + .save_restore
+ */
+
+#include "tst_test.h"
+#include "tst_hugepage.h"
+#include "tst_sys_conf.h"
+
+static const char * const save_restore[] =3D {
+=09"!/proc/sys/kernel/numa_balancing",
+=09NULL,
+};
+
+static void do_test(void) {
+
+=09int val, hpages;
+
+=09tst_res(TINFO, "tst_hugepages =3D %u", tst_hugepages);
+=09SAFE_FILE_PRINTF("/proc/sys/kernel/numa_balancing", "1");
+
+=09hpages =3D test.request_hugepages;
+=09SAFE_FILE_SCANF(PATH_NR_HPAGES, "%d", &val);
+=09if (val !=3D hpages)
+=09=09tst_brk(TBROK, "nr_hugepages =3D %d, but expect %d", val, hpages);
+=09else
+=09=09tst_res(TPASS, "test .needs_hugepges");
+
+=09hpages =3D tst_request_hugepages(3);
+=09SAFE_FILE_SCANF(PATH_NR_HPAGES, "%d", &val);
+=09if (val !=3D hpages)
+=09=09tst_brk(TBROK, "nr_hugepages =3D %d, but expect %d", val, hpages);
+=09else
+=09=09tst_res(TPASS, "tst_request_hugepages");
+}
+
+static struct tst_test test =3D {
+=09.test_all =3D do_test,
+=09.request_hugepages =3D 2,
+=09.save_restore =3D save_restore,
+};
diff --git a/lib/tst_hugepage.c b/lib/tst_hugepage.c
new file mode 100644
index 000000000..d37b45e3a
--- /dev/null
+++ b/lib/tst_hugepage.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Red Hat, Inc.
+ */
+
+#define TST_NO_DEFAULT_MAIN
+
+#include "tst_test.h"
+#include "tst_hugepage.h"
+
+unsigned int tst_hugepages;
+
+int tst_request_hugepages(int hpages)
+{
+=09int val;
+=09long mem_avail, max_hpages;
+
+=09if (access(PATH_HUGEPAGES, F_OK)) {
+=09=09tst_hugepages =3D 0;
+=09=09goto out;
+=09}
+
+=09tst_hugepages =3D hpages;
+
+=09SAFE_FILE_PRINTF("/proc/sys/vm/drop_caches", "3");
+
+=09if (FILE_LINES_SCANF("/proc/meminfo",
+=09=09=09=09"MemAvailable: %ld", &mem_avail)) {
+=09=09/*
+=09=09 * Using "MemFree:" on kernel that doesn't have
+=09=09 * "MemAvailable:" in Meminfo
+=09=09 */
+=09=09tst_res(TINFO, "MemAvailable: not found in /proc/meminfo");
+
+=09=09mem_avail =3D SAFE_READ_MEMINFO("MemFree:");
+=09}
+
+=09max_hpages =3D mem_avail / SAFE_READ_MEMINFO("Hugepagesize:");
+
+=09if (hpages > max_hpages) {
+=09=09tst_res(TINFO, "Requested number(%d) of hugepages is too large, "
+=09=09=09=09"limiting to 80%% of the max hugepage count %ld",
+=09=09=09=09hpages, max_hpages);
+=09=09tst_hugepages =3D max_hpages * 0.8;
+
+=09=09if (tst_hugepages < 1)
+=09=09=09goto out;
+=09}
+
+=09tst_sys_conf_save("?/proc/sys/vm/nr_hugepages");
+=09SAFE_FILE_PRINTF(PATH_NR_HPAGES, "%d", tst_hugepages);
+=09SAFE_FILE_SCANF(PATH_NR_HPAGES, "%d", &val);
+=09if (val !=3D tst_hugepages)
+=09=09tst_brk(TBROK, "nr_hugepages =3D %d, but expect %d", val, tst_hugepa=
ges);
+
+=09tst_res(TINFO, "%d hugepage(s) reserved", tst_hugepages);
+out:
+=09return tst_hugepages;
+}
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 8d7dee2cc..9a24cffc5 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -890,6 +890,9 @@ static void do_setup(int argc, char *argv[])
 =09if (tst_test->all_filesystems)
 =09=09tst_test->needs_device =3D 1;
=20
+=09if (tst_test->request_hugepages)
+=09=09tst_request_hugepages(tst_test->request_hugepages);
+
 =09setup_ipc();
=20
 =09if (tst_test->bufs)
@@ -1006,8 +1009,7 @@ static void do_cleanup(void)
 =09=09tst_rmdir();
 =09}
=20
-=09if (tst_test->save_restore)
-=09=09tst_sys_conf_restore(0);
+=09tst_sys_conf_restore(0);
=20
 =09if (tst_test->restore_wallclock)
 =09=09tst_wallclock_restore();
--=20
2.20.1


--===============1801313750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1801313750==--
