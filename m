Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0D83D229A
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 13:17:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 366D53C631E
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 13:17:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ED3013C60F9
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 13:17:24 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F29D2600D1A
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 13:17:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 205652255F;
 Thu, 22 Jul 2021 11:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626952643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bGIvN8o5QEvlB29D/2i0cSx7K6phy9qAQZ3+xTuiPSs=;
 b=kYV3q06GN6aX77cNfrheyVP3l/P5ofWiIodoURdItBSM8oGIIDBAazeudyyMuEChmmAF2O
 93ny39xp1dUv8ybQjiX5k6pLtLb4XsBKLW8gvRdSPh6RiFibKX2KPR70SfDnuYmKYnEoPO
 UFVvYqW1jrWc6LxjJM9029hJL67Bq+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626952643;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bGIvN8o5QEvlB29D/2i0cSx7K6phy9qAQZ3+xTuiPSs=;
 b=a0nQm6hevCPFtX4YWEncncBlprY9vMDicbP/0H8aHN5J0BgkRwBHJbMdXyZ+vv2zSywyex
 SfDgMz5z7r5EPXCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0702B13DC1;
 Thu, 22 Jul 2021 11:17:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mfdEAcNT+WAfHwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 22 Jul 2021 11:17:23 +0000
Date: Thu, 22 Jul 2021 12:51:57 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YPlNzVze5T9r5qCz@yuki>
References: <YNM4rlDJLzb4xk6v@yuki>
 <1624512827-3256-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1624512827-3256-3-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1624512827-3256-3-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/shmget*: Convert into new api
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
> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
> index 4436ca7f8..6be8d8157 100644
> --- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c

...

> +static struct tst_test test = {
> +	.needs_tmpdir = 1,
> +	.needs_root = 1,
> +	.forks_child = 1,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test = do_test,
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.request_hugepages = 0,
> +};

We got some test failures for the ENOMEM hugepage test and then I we
realized that setting .request_hugepages = 0 is no-op since zero is the
default value when it's not initialized and we ignore it the tst_test.c.

Thinking of possible solutions I guess that the easiest would be to add
a special value that would tell the library to set the pool size to 0.

Something as:

diff --git a/include/tst_test.h b/include/tst_test.h
index c7d77eb09..5f05e3a33 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -125,6 +125,8 @@ struct tst_tag {
 
 extern unsigned int tst_variant;
 
+#define TST_NO_HUGEPAGES ((unsigned long)-1)
+
 struct tst_test {
        /* number of tests available in test() function */
        unsigned int tcnt;
diff --git a/lib/tst_hugepage.c b/lib/tst_hugepage.c
index 1d0e62e5b..ef93afc61 100644
--- a/lib/tst_hugepage.c
+++ b/lib/tst_hugepage.c
@@ -34,6 +34,11 @@ unsigned long tst_request_hugepages(unsigned long hpages)
        else
                tst_hugepages = hpages;
 
+       if (hpages == TST_NO_HUGEPAGES) {
+               hpages = 0;
+               goto set_hugepages;
+       }
+
        SAFE_FILE_PRINTF("/proc/sys/vm/drop_caches", "3");
        max_hpages = SAFE_READ_MEMINFO("MemFree:") / SAFE_READ_MEMINFO("Hugepagesize:");
 
@@ -47,6 +52,8 @@ unsigned long tst_request_hugepages(unsigned long hpages)
                        goto out;
        }
 
+set_hugepages:
+
        tst_sys_conf_save("?/proc/sys/vm/nr_hugepages");
        SAFE_FILE_PRINTF(PATH_NR_HPAGES, "%lu", tst_hugepages);
        SAFE_FILE_SCANF(PATH_NR_HPAGES, "%lu", &val);

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
