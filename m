Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD982DA833
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Dec 2020 07:49:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 165443C4AE4
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Dec 2020 07:49:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9DD833C2A02
 for <ltp@lists.linux.it>; Tue, 15 Dec 2020 07:49:11 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B4432600840
 for <ltp@lists.linux.it>; Tue, 15 Dec 2020 07:49:10 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 2E5DE9F616;
 Tue, 15 Dec 2020 06:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1608014949; bh=d7cps9hnfNI4CJCecwKLZDmuyHZFPdFCgriYiB6nSy8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=jJ2SxQ1sUBOtSBp6ivyjmcfo73F7tDc8w3Tu8veK+PiZuJ+O7IRegVTG8RCSGGj4C
 pbtff4xVSZR6fCpIOAiAY2TvR1RxKTx0drNwN1N+4DbiLf86iyLVCN90RYOS91cXpC
 DEyic45FhGWf15vY8rrmAv6d91y4RlxfJ3MDluHQ=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Tue, 15 Dec 2020 07:49:02 +0100
Message-Id: <20201215064902.518801-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] shm_open/37-1: Remove non-portable output
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

This test could mess up some tools, because it wrote characters
outside of the ansi character set. Since most systems expect utf-8 now,
this could lead to messed up or even output.

This replaces the verbatim output of the shm ames used in the test with
a short description.

It also replaces the no-protable characters with escape sequences and
adds the missing close, if the shm was opend successfully.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../conformance/interfaces/shm_open/37-1.c    | 62 +++++++++----------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/shm_open=
/37-1.c b/testcases/open_posix_testsuite/conformance/interfaces/shm_open/37=
-1.c
index 69dabd951..09b4d6657 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/shm_open/37-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/shm_open/37-1.c
@@ -1,65 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
  * Test that the shm_open() function sets errno =3D EINVAL if the shm_open=
()
  * operation is not supported for the given name.
  *
  * The supported names are implementation-defined, so the test is done for
- * several differents names. The test pass for a given name if shm_open ma=
ke no
+ * several different names. The test pass for a given name if shm_open mak=
e no
  * error or set errno to EINVAL.
  */
 =

 #include <stdio.h>
+#include <unistd.h>
 #include <sys/mman.h>
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <errno.h>
 #include "posixtest.h"
 =

-static char *shm_name[] =3D {
-	/* char which are in portable character set but not in portable
-	   filename character set */
-	"$#\n@\t\a,~}",
-	/* char which are not in portable character set (accentuated char and c
-	   cedilla) */
-	"=E9=EA=EE=F4=E7=E0",
-	/* some file or directory which should exist */
-	"..",
-	"/",
-	"//",
-	"/abc",
-	NULL
+struct test_data {
+	const char *desc;
+	const char *name;
+};
+
+struct test_data testdata[] =3D {
+	{
+		"char which are in portable character set, "
+		"but not in portable filename character set",
+		"$#\n@\t\a,~}"
+	},
+	{
+		"chars which are not in portable character set "
+		 "(accentuated char and c cedilla)",
+		"\xe9\xea\xee\xf4\xe7\xe0"
+	},
+	{ "parent directory", ".." },
+	{ "root directory", "/" },
+	{ "double slash", "//" },
+	{ "non-existent directory", "/abc" }
 };
 =

 int main(void)
 {
-	int fd, i =3D 0, result =3D PTS_PASS;
+	unsigned int i;
+	int fd, result =3D PTS_PASS;
 =

-	while (shm_name[i]) {
+	for (i =3D 0; i < ARRAY_SIZE(testdata); i++) {
 		fflush(stderr);
-		printf("Name: '%s'\n", shm_name[i]);
+		printf("Test: %s\n", testdata[i].desc);
 		fflush(stdout);
 =

-		fd =3D shm_open(shm_name[i], O_RDWR | O_CREAT, 0);
-
+		fd =3D shm_open(testdata[i].name, O_RDWR | O_CREAT, 0);
 		if (fd =3D=3D -1 && errno =3D=3D EINVAL) {
 			printf("   OK: errno =3D=3D EINVAL\n");
 		} else if (fd !=3D -1) {
-			printf("   OK: open  with success.\n");
+			printf("   OK: open with success.\n");
+			close(fd);
 		} else {
 			perror("   Unexpected error");
 			result =3D PTS_FAIL;
 		}
 =

-		shm_unlink(shm_name[i]);
-
-		i++;
+		shm_unlink(testdata[i].name);
 	}
 =

 	if (result =3D=3D PTS_PASS)
-- =

2.25.1


-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
