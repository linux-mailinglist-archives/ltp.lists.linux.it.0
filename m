Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA483F722F
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 11:46:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E7F53C3015
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 11:46:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C9DA83C2F5C
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 11:46:03 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6436E200D42
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 11:46:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B838C22056;
 Wed, 25 Aug 2021 09:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629884761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+cqB5RuLAItrIcFsspUI383WL5PxslgJqP9J4K9bn9g=;
 b=U6JynSbwCH4OriqjdTH8d450Ej4G7YWOpY1DApiELYHd+f84xw++o2IAeZ9Fo0CheKQN5B
 xwlnuuWdKO7GN32Tm52CaeNkSFg9IsnGzjr81OsiiSFYo1TrtSIb+6CPa4k+qJGm/tUSWD
 9exNMzheTULmVWVg2zII8/mztC6eA0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629884761;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+cqB5RuLAItrIcFsspUI383WL5PxslgJqP9J4K9bn9g=;
 b=eZDW3T+UksXnjPjnJpFcGZCD3dflx0SQL6kK3/GULyyP5A9xveGNS2hQjZrGBWa0Bt7XEH
 /KfUoKgHO9KO3EAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 76F4F13C0C;
 Wed, 25 Aug 2021 09:46:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id duZFGVkRJmEcIQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 25 Aug 2021 09:46:01 +0000
Date: Wed, 25 Aug 2021 11:46:06 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YSYRXrgx6u+kxnpc@yuki>
References: <20210817064924.127970-1-xieziyao@huawei.com>
 <20210817064924.127970-5-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817064924.127970-5-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/7] epoll_create1: Add docparse formatting and
 cleanup for epoll_create1_01
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
Pushed with a few changes, thanks.

The main problem was that the commit added empty epoll_create1_02.c
which did break the compilation and had to be removed.

Apart from that I've changed the tst_brk(TFAIL, ...) to tst_res(TFAIL,
...) since there is no real need for tst_brk() and adjusted the messages
a bit.

diff:

diff --git a/testcases/kernel/syscalls/epoll_create1/epoll_create1_01.c b/testcases/kernel/syscalls/epoll_create1/epoll_create1_01.c
index 39e01eb8b..ed359d434 100644
--- a/testcases/kernel/syscalls/epoll_create1/epoll_create1_01.c
+++ b/testcases/kernel/syscalls/epoll_create1/epoll_create1_01.c
@@ -8,7 +8,7 @@
  * [Description]
  *
  * Verify that epoll_create1 sets the close-on-exec flag for the returned
- * file descriptor with the only flag support, EPOLL_CLOEXEC.
+ * file descriptor with EPOLL_CLOEXEC.
  */
 
 #include <sys/epoll.h>
@@ -22,8 +22,8 @@ static struct test_case_t {
 	int exp_flag;
 	const char *desc;
 } tc[] = {
-	{0, 0, "flags=0 didn't set close-on-exec flag"},
-	{EPOLL_CLOEXEC, 1, "flags=EPOLL_CLOEXEC set close-on-exec"}
+	{0, 0, "without EPOLL_CLOEXEC"},
+	{EPOLL_CLOEXEC, 1, "with EPOLL_CLOEXEC"}
 };
 
 static void run(unsigned int n)
@@ -36,8 +36,9 @@ static void run(unsigned int n)
 
 	coe = SAFE_FCNTL(fd, F_GETFD);
 	if ((coe & FD_CLOEXEC) != tc[n].exp_flag)
-		tst_brk(TFAIL, "epoll_create1(...) with %s", tc[n].desc);
-	tst_res(TPASS, "epoll_create1(...) with %s", tc[n].desc);
+		tst_res(TFAIL, "epoll_create1(...) %s", tc[n].desc);
+	else
+		tst_res(TPASS, "epoll_create1(...) %s", tc[n].desc);
 
 	SAFE_CLOSE(fd);
 }

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
