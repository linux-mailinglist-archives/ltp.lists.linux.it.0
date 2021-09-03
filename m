Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AAD400298
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 17:49:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFC0B3C7093
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 17:49:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D59313C27DB
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 17:48:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C32EA14012D2
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 17:48:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6ABB4203F7
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 15:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630684130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y10UsmgL1LM3rb0kWFRpY2OuocjCdb5o8H2IEuRNbSA=;
 b=hKEEPvQiuuYmaNXZTX+znz3jDsJoilEGepht8+1fs1MK4tSz7a4bz2lyfhnh1GQ5Vn28fY
 08iRfLF+GNTDBjA2+tFB8jMvE3QOZPbOqrpWHeG8yk/MIPEtz7y5DwpmCtBesXcrE9N84j
 psqGqnI3np/tjufM+FoTSU4KaIs9Vtc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630684130;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y10UsmgL1LM3rb0kWFRpY2OuocjCdb5o8H2IEuRNbSA=;
 b=meTcv0Mspf4mhfYkqTN4+cE86iGekVnO+p0yS5e/y0/NZeVFecInCSzey7qqg1VIGYnZtN
 WuTyiJV+Aw2Ve+Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CB8F13B86
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 15:48:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oNvvEeJDMmHpXgAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 03 Sep 2021 15:48:50 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  3 Sep 2021 17:48:48 +0200
Message-Id: <20210903154848.18705-8-mdoucha@suse.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903154848.18705-1-mdoucha@suse.cz>
References: <20210903154848.18705-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 7/7] syscalls/setregid02-04: Eliminate named group
 lookups
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

Group names like "bin" or "daemon" may not exist on some systems. Find and use
any unprivieged group IDs instead of specific named groups.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 .../kernel/syscalls/setregid/setregid02.c     | 39 +++++++++--------
 .../kernel/syscalls/setregid/setregid03.c     | 43 +++++++++----------
 .../kernel/syscalls/setregid/setregid04.c     | 22 +++++++---
 3 files changed, 58 insertions(+), 46 deletions(-)

diff --git a/testcases/kernel/syscalls/setregid/setregid02.c b/testcases/kernel/syscalls/setregid/setregid02.c
index 2174f81f9..d7d5eaa24 100644
--- a/testcases/kernel/syscalls/setregid/setregid02.c
+++ b/testcases/kernel/syscalls/setregid/setregid02.c
@@ -17,6 +17,7 @@
 #include <stdlib.h>
 
 #include "tst_test.h"
+#include "tst_uid.h"
 #include "compat_tst_16.h"
 
 static gid_t root_gid, nobody_gid, other_gid, neg_one = -1;
@@ -40,26 +41,17 @@ static struct tcase {
 	&neg_one, &root_gid, EPERM, &nobody_gid, &nobody_gid,
 		    "After setregid(-1, root),"}, {
 	&neg_one, &other_gid, EPERM, &nobody_gid, &nobody_gid,
-		    "After setregid(-1, bin)"}, {
+		    "After setregid(-1, other)"}, {
 	&root_gid, &neg_one, EPERM, &nobody_gid, &nobody_gid,
 		    "After setregid(root,-1),"}, {
 	&other_gid, &neg_one, EPERM, &nobody_gid, &nobody_gid,
-		    "After setregid(bin, -1),"}, {
+		    "After setregid(other, -1),"}, {
 	&root_gid, &other_gid, EPERM, &nobody_gid, &nobody_gid,
-		    "After setregid(root, bin)"}, {
+		    "After setregid(root, other)"}, {
 	&other_gid, &root_gid, EPERM, &nobody_gid, &nobody_gid,
-		    "After setregid(bin, root),"}
+		    "After setregid(other, root),"}
 };
 
-static gid_t get_group_by_name(const char *name)
-{
-	struct group *ret = SAFE_GETGRNAM(name);
-
-	GID16_CHECK(ret->gr_gid, setregid);
-
-	return ret->gr_gid;
-}
-
 void gid_verify(gid_t rg, gid_t eg, char *when)
 {
 	if ((getgid() != rg) || (getegid() != eg)) {
@@ -101,15 +93,26 @@ static void run(unsigned int n)
 
 static void setup(void)
 {
+	struct group *grp;
+
 	ltpuser = SAFE_GETPWNAM("nobody");
+	nobody_gid = ltpuser->pw_gid;
+	root_gid = getgid();
+	setgrent();
 
-	SAFE_SETGID(ltpuser->pw_gid);
-	SAFE_SETUID(ltpuser->pw_uid);
+	do {
+		grp = SAFE_GETGRENT();
+	} while (grp->gr_gid == root_gid || grp->gr_gid == nobody_gid);
 
-	nobody_gid = ltpuser->pw_gid;
+	other_gid = grp->gr_gid;
+	endgrent();
+
+	GID16_CHECK(root_gid, setregid);
 	GID16_CHECK(nobody_gid, setregid);
-	root_gid = get_group_by_name("root");
-	other_gid = get_group_by_name("bin");
+	GID16_CHECK(other_gid, setregid);
+
+	SAFE_SETGID(ltpuser->pw_gid);
+	SAFE_SETUID(ltpuser->pw_uid);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/setregid/setregid03.c b/testcases/kernel/syscalls/setregid/setregid03.c
index 35aa92b8e..66667c6b2 100644
--- a/testcases/kernel/syscalls/setregid/setregid03.c
+++ b/testcases/kernel/syscalls/setregid/setregid03.c
@@ -9,9 +9,12 @@
  * Test setregid() when executed by a non-root user.
  */
 
+#include <sys/types.h>
+#include <grp.h>
 #include <pwd.h>
 
 #include "tst_test.h"
+#include "tst_uid.h"
 #include "compat_tst_16.h"
 
 static int fail = -1;
@@ -30,44 +33,40 @@ struct tcase {
 } tcases[] = {
 	{
 	&primary_gid, &secondary_gid, &pass, &primary_gid, &secondary_gid,
-		    "After setregid(daemon, bin),"}, {
+		    "After setregid(primary, secondary),"}, {
 	&neg_one, &primary_gid, &pass, &primary_gid, &primary_gid,
-		    "After setregid(-1, daemon)"}, {
+		    "After setregid(-1, primary)"}, {
 	&neg_one, &secondary_gid, &pass, &primary_gid, &secondary_gid,
-		    "After setregid(-1, bin),"}, {
+		    "After setregid(-1, secondary),"}, {
 	&secondary_gid, &neg_one, &pass, &secondary_gid, &secondary_gid,
-		    "After setregid(bin, -1),"}, {
+		    "After setregid(secondary, -1),"}, {
 	&neg_one, &neg_one, &pass, &secondary_gid, &secondary_gid,
 		    "After setregid(-1, -1),"}, {
 	&neg_one, &secondary_gid, &pass, &secondary_gid, &secondary_gid,
-		    "After setregid(-1, bin),"}, {
+		    "After setregid(-1, secondary),"}, {
 	&secondary_gid, &neg_one, &pass, &secondary_gid, &secondary_gid,
-		    "After setregid(bin, -1),"}, {
+		    "After setregid(secondary, -1),"}, {
 	&secondary_gid, &secondary_gid, &pass, &secondary_gid, &secondary_gid,
-		    "After setregid(bin, bin),"}, {
+		    "After setregid(secondary, secondary),"}, {
 	&primary_gid, &neg_one, &fail, &secondary_gid, &secondary_gid,
-		    "After setregid(daemon, -1)"}, {
+		    "After setregid(primary, -1)"}, {
 	&neg_one, &primary_gid, &fail, &secondary_gid, &secondary_gid,
-		    "After setregid(-1, daemon)"}, {
+		    "After setregid(-1, primary)"}, {
 	&primary_gid, &primary_gid, &fail, &secondary_gid, &secondary_gid,
-		    "After setregid(daemon, daemon)"},};
-
-
-static gid_t get_group(const char *group)
-{
-	struct group *junk;
-
-	junk = SAFE_GETGRNAM(group);
-	GID16_CHECK(junk->gr_gid, setregid);
-	return junk->gr_gid;
-}
+		    "After setregid(primary, primary)"},};
 
 static void setup(void)
 {
+	gid_t test_groups[2];
+
 	nobody = *SAFE_GETPWNAM("nobody");
 
-	primary_gid = get_group("daemon");
-	secondary_gid = get_group("bin");
+	tst_get_gids(2, test_groups);
+	primary_gid = test_groups[0];
+	secondary_gid = test_groups[1];
+	endgrent();
+	GID16_CHECK(primary_gid, setregid);
+	GID16_CHECK(secondary_gid, setregid);
 
 	/* set the appropriate ownership values */
 	SAFE_SETREGID(primary_gid, secondary_gid);
diff --git a/testcases/kernel/syscalls/setregid/setregid04.c b/testcases/kernel/syscalls/setregid/setregid04.c
index 6b9e3f524..911dc0d01 100644
--- a/testcases/kernel/syscalls/setregid/setregid04.c
+++ b/testcases/kernel/syscalls/setregid/setregid04.c
@@ -9,7 +9,11 @@
  * Test setregid() when executed by root.
  */
 
+#include <sys/types.h>
+#include <grp.h>
+
 #include "tst_test.h"
+#include "tst_uid.h"
 #include "compat_tst_16.h"
 
 static gid_t first_gid, second_gid, root_gid, neg_one = -1;
@@ -30,7 +34,7 @@ struct test_data_t {
 	&root_gid, &root_gid, &root_gid, &root_gid,
 		    "After setregid(root, root),"}, {
 	&first_gid, &neg_one, &first_gid, &root_gid,
-		    "After setregid(nobody, -1)"}, {
+		    "After setregid(first, -1)"}, {
 	&root_gid, &neg_one, &root_gid, &root_gid,
 		    "After setregid(root,-1),"}, {
 	&neg_one, &neg_one, &root_gid, &root_gid,
@@ -40,11 +44,11 @@ struct test_data_t {
 	&root_gid, &neg_one, &root_gid, &root_gid,
 		    "After setregid(root, -1),"}, {
 	&second_gid, &first_gid, &second_gid, &first_gid,
-		    "After setregid(daemon, nobody)"}, {
+		    "After setregid(second, first)"}, {
 	&neg_one, &neg_one, &second_gid, &first_gid,
 		    "After setregid(-1, -1)"}, {
 	&neg_one, &first_gid, &second_gid, &first_gid,
-		    "After setregid(-1, nobody)"}
+		    "After setregid(-1, first)"}
 };
 
 static void gid_verify(gid_t rg, gid_t eg, const char *when)
@@ -77,9 +81,15 @@ static void run(unsigned int i)
 
 static void setup(void)
 {
-	root_gid = SAFE_GETGRNAM("root")->gr_gid;
-	first_gid = SAFE_GETGRNAM_FALLBACK("nobody", "nogroup")->gr_gid;
-	second_gid = SAFE_GETGRNAM("daemon")->gr_gid;
+	gid_t groups[3];
+
+	tst_get_gids(3, groups);
+	root_gid = getgid();
+
+	/* At most one of the groups may be equal to root_gid */
+	first_gid = groups[0] != root_gid ? groups[0] : groups[2];
+	second_gid = groups[1] != root_gid ? groups[1] : groups[2];
+	endgrent();
 }
 
 static struct tst_test test = {
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
