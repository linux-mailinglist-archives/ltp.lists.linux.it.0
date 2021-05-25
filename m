Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAEE390461
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 16:57:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3A1C3C77C0
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 16:57:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 178BE3C2B2E
 for <ltp@lists.linux.it>; Tue, 25 May 2021 16:57:36 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A6FF31401120
 for <ltp@lists.linux.it>; Tue, 25 May 2021 16:57:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1621954655;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HIcLBwlms66cE2fubeQ/zsN69tW7K9JqLawfY1wnf7M=;
 b=nq/fphRtyOz5lTrQxGHcl7BjGaVLhI3MGquxekJhUu0TNmG/ckSwwNhomKhQ9jAXP1S46T
 FJQd2PnxEBLzLOk0IsbqI8TdDUmG/1CbZKkh56fQZQn4mMo+nf4RPbKFR6zP7LrE6HE5cC
 PsTqcWDrYJTue79rrk6Hk0LPMlkbl2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1621954655;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HIcLBwlms66cE2fubeQ/zsN69tW7K9JqLawfY1wnf7M=;
 b=vT406kGVg4aAfHpuoqhhgbYNGxwDSJZ65NT8sUpEtEieCyH67f9P9U3+vFSiYthf9MlCj2
 Q8j+LgbcUWU6zABg==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1079CAE5C;
 Tue, 25 May 2021 14:57:35 +0000 (UTC)
Date: Tue, 25 May 2021 16:57:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YK0QXeP8740nQJ7e@pevik>
References: <20210506130950.110267-1-xieziyao@huawei.com>
 <20210506130950.110267-3-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506130950.110267-3-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] syscalls/fchown: Convert fchown02 to the new
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

thanks! Merged with these changes (NOTE: "for (unsigned int i = 0" breaks on
older compilers, which are represented with CentOS in our travis).

Kind regards,
Petr

diff --git testcases/kernel/syscalls/fchown/fchown02.c testcases/kernel/syscalls/fchown/fchown02.c
index a99962911..d541f0450 100644
--- testcases/kernel/syscalls/fchown/fchown02.c
+++ testcases/kernel/syscalls/fchown/fchown02.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) Linux Test Project, 2003-2021
+ * Copyright (c) 2014 Cyril Hrubis <chrubis@suse.cz>
  * Copyright (c) International Business Machines  Corp., 2001
  * 07/2001 Ported by Wayne Boyer
- * Copyright (c) 2014 Cyril Hrubis <chrubis@suse.cz>
  */
 
 /*\
@@ -43,6 +44,7 @@ struct test_case_t {
 
 static void run(unsigned int i)
 {
+	struct stat stat_buf;
 	uid_t uid;
 	gid_t gid;
 
@@ -53,7 +55,6 @@ static void run(unsigned int i)
 
 	TST_EXP_PASS(FCHOWN(*tc[i].fd, uid, gid));
 
-	struct stat stat_buf;
 	SAFE_STAT(tc[i].filename, &stat_buf);
 
 	if (stat_buf.st_uid != uid || stat_buf.st_gid != gid)
@@ -67,13 +68,17 @@ static void run(unsigned int i)
 
 static void setup(void)
 {
-	for (unsigned int i = 0; i < ARRAY_SIZE(tc); ++i)
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(tc); i++)
 		*tc[i].fd = SAFE_OPEN(tc[i].filename, O_RDWR | O_CREAT, FILE_MODE);
 }
 
 static void cleanup(void)
 {
-	for (unsigned int i = 0; i < ARRAY_SIZE(tc); ++i)
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(tc); i++)
 		SAFE_CLOSE(*tc[i].fd);
 }
 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
