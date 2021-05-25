Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1569A390463
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 16:58:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4CC83C67E4
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 16:58:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C775A3C2B2E
 for <ltp@lists.linux.it>; Tue, 25 May 2021 16:58:33 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 75BD81000230
 for <ltp@lists.linux.it>; Tue, 25 May 2021 16:58:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1621954712;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0KSlBzKFrGD+nl46Qsp3whi7NKvT4J0MOTOB8I69JdU=;
 b=ItfL/bxpnU050vMlaf+yLypYQfMPFNf31mH5TI8fq+tpGfAKWk4ihOxEH7YADMpem5FT9G
 Us8jsOTQl4FtF15f7PB6qlEi4QbXyRyfN8nmpHJA2bdktF4ugGMZ1bIKdXSti3ywDc56OB
 aGGivKpsIEJymLQWAEaJBns/dCnYjBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1621954712;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0KSlBzKFrGD+nl46Qsp3whi7NKvT4J0MOTOB8I69JdU=;
 b=QH2W7Jzy9WRYDWFoTTKX9XNBlKs0LzuhRTRf2UPbw9TXpYRLoul0aW/X+Lehi5QV13Ylqj
 L6tEWocza6u4q9DQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AECBFAB71;
 Tue, 25 May 2021 14:58:32 +0000 (UTC)
Date: Tue, 25 May 2021 16:58:31 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YK0Qlxbtyfci5b2z@pevik>
References: <20210506130950.110267-1-xieziyao@huawei.com>
 <20210506130950.110267-4-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506130950.110267-4-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] syscalls/fchown: Convert fchown03 to the new
 API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Ziyao,

Merged with these changes below. Thanks!

Kind regards,
Petr

diff --git testcases/kernel/syscalls/fchown/fchown03.c testcases/kernel/syscalls/fchown/fchown03.c
index a69ec86ae..752d9c394 100644
--- testcases/kernel/syscalls/fchown/fchown03.c
+++ testcases/kernel/syscalls/fchown/fchown03.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) Linux Test Project, 2001-2021
  * Copyright (c) International Business Machines  Corp., 2001
  * 07/2001 Ported by Wayne Boyer
  */
@@ -10,7 +11,7 @@
  * Verify that, fchown(2) succeeds to change the group of a file specified
  * by path when called by non-root user with the following constraints:
  *
- * - euid of the process is equal to the owner of the file;
+ * - euid of the process is equal to the owner of the file
  * - the intended gid is either egid, or one of the supplementary gids
  *   of the process.
  *
@@ -36,8 +37,7 @@ static struct passwd *ltpuser;
 static void check_owner(struct stat *s, uid_t exp_uid, gid_t exp_gid)
 {
 	if (s->st_uid != exp_uid || s->st_gid != exp_gid)
-		tst_res(TFAIL, "%s: wrong owner set to (uid=%d, gid=%d),"
-			       " expected (uid=%d, gid=%d)",
+		tst_res(TFAIL, "%s: wrong owner set to (uid=%d, gid=%d), expected (uid=%d, gid=%d)",
 			FILENAME, s->st_uid, s->st_gid, exp_uid, exp_gid);
 }
 
@@ -50,17 +50,18 @@ static void check_mode(struct stat *s, mode_t exp_mode)
 
 static void run(void)
 {
+	uid_t uid;
+	gid_t gid;
+	struct stat stat_buf;
+
 	SAFE_SETEUID(0);
 	SAFE_FCHOWN(fd, -1, 0);
 	SAFE_FCHMOD(fd, NEW_PERMS);
 	SAFE_SETEUID(ltpuser->pw_uid);
 
-	uid_t uid;
-	gid_t gid;
 	UID16_CHECK((uid = geteuid()), "fchown");
 	GID16_CHECK((gid = getegid()), "fchown");
 
-	struct stat stat_buf;
 	SAFE_STAT(FILENAME, &stat_buf);
 	check_owner(&stat_buf, uid, 0);
 	check_mode(&stat_buf, NEW_PERMS);

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
