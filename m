Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B53423064B
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 11:16:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87EFB3C2682
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 11:16:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id EFF313C232B
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 11:16:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 89B9B20111E
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 11:16:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5AEECAE0A
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 09:16:53 +0000 (UTC)
Date: Tue, 28 Jul 2020 11:16:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200728091640.GA24592@dell5510>
References: <20200717163453.9587-1-chrubis@suse.cz>
 <20200717163453.9587-4-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717163453.9587-4-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/9] syscalls/ipc: shmctl04: Rewrite from scratch.
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

Hi Cyril,

> -	/*
> -	 * Create a temporary directory and cd into it.
> -	 * This helps to ensure that a unique msgkey is created.
> -	 * See libs/libltpipc/libipc.c for more information.
> -	 */
> -	tst_tmpdir();
> +	TEST(shmctl(TST_RET, SHM_STAT_ANY, &ds));
Several old distros fail [1] as they miss SHM_STAT_ANY in <bits/shm.h> (added to
glibc in 2.28, to kernel in 4.17).
Of course, it's just enough to add the definition to include/tst_safe_sysv_ipc.h
(or some LAPI file).

Kind regards,
Petr

[1] https://travis-ci.org/github/pevik/ltp/builds/712476731

diff --git include/tst_safe_sysv_ipc.h include/tst_safe_sysv_ipc.h
index 3e0e50e8d..dea85f97c 100644
--- include/tst_safe_sysv_ipc.h
+++ include/tst_safe_sysv_ipc.h
@@ -10,6 +10,10 @@
 #include <sys/msg.h>
 #include <sys/shm.h>
 
+#ifndef SHM_STAT_ANY
+# define SHM_STAT_ANY	15
+#endif
+
 int safe_msgget(const char *file, const int lineno, key_t key, int msgflg);
 #define SAFE_MSGGET(key, msgflg) \
 	safe_msgget(__FILE__, __LINE__, (key), (msgflg))

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
