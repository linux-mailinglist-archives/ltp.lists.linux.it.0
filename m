Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E67B43DE9AA
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 11:25:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B73C03C57B8
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 11:25:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 761B13C245D
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 11:25:40 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C2C911A00CC9
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 11:25:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD0B3220C0;
 Tue,  3 Aug 2021 09:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627982738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q7fNRJzxc0SME/7bLZ+93nRHbEAdw9m1Qw/Io/dhHRY=;
 b=w8MvmO2+DK00pp+b2JkLybVC0f3lkHNiDVJ/aWqkjVdT3IWwQ4ppSOP/3ccZofJ/69LpvX
 E9piylUctNmRcMDL64MG83YYQhOFJjD57qhmO9GSbSLULyrdzXrnani2PxbK7IvDB9hhJ8
 rYV9rogMJqFvR7h5X+Y7EFI9MUTulwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627982738;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q7fNRJzxc0SME/7bLZ+93nRHbEAdw9m1Qw/Io/dhHRY=;
 b=kAu3VbfEgxmXutU0oFoeFUFpfLdD5FTsxv2PTsxbWJi2gz5Jp43m/J5wGYfPxTguvHEPxT
 E57XhTRWKP5hE/CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A50013C8A;
 Tue,  3 Aug 2021 09:25:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +BLcIpILCWFtKgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 03 Aug 2021 09:25:38 +0000
Date: Tue, 3 Aug 2021 11:25:45 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YQkLmb3pUPY8cKP8@yuki>
References: <20210802173536.19525-1-pvorel@suse.cz>
 <20210802173536.19525-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802173536.19525-3-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 2/7] test/test_zero_hugepage.sh: Skip test on
 read-only file system
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
> On GitHub Actions /proc/sys/vm/nr_hugepages is not allowed to be
> changed:
> 
> ./test_zero_hugepage.sh: line 9: can't create /proc/sys/vm/nr_hugepages: Read-only file system
> tst_hugepage.c:57: TBROK: Failed to open FILE '/proc/sys/vm/nr_hugepages' for writing: EROFS (30)
> tst_sys_conf.c:102: TWARN: Failed to open FILE '/proc/sys/vm/nr_hugepages'

Hmm, it's rather strange to have proc mounted RO but I guess that we
can't do much about it. I guess that it wouldn't allow us to remount it
RW, so there is not much we can do about it.

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> New in v7.
> 
>  lib/newlib_tests/test_zero_hugepage.sh | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/newlib_tests/test_zero_hugepage.sh b/lib/newlib_tests/test_zero_hugepage.sh
> index 10113006b..8a462478e 100755
> --- a/lib/newlib_tests/test_zero_hugepage.sh
> +++ b/lib/newlib_tests/test_zero_hugepage.sh
> @@ -1,12 +1,16 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # Copyright (c) 2021 Yang Xu <xuyang2018.jy@fujitsu.com>
> +# Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
>  
>  echo "Testing .request_hugepages = TST_NO_HUGEPAGES"
>  
>  orig_value=`cat /proc/sys/vm/nr_hugepages`
>  
> -echo "128" > /proc/sys/vm/nr_hugepages
> +if ! echo "128" > /proc/sys/vm/nr_hugepages; then
> +	echo "TCONF: failed to open /proc/sys/vm/nr_hugepages"
> +	exit 32
> +fi

I wonder if we should rather check if proc is mounted readonly
explicitly since this may hide all kinds of errors.

>  ./test_zero_hugepage
>  
> -- 
> 2.32.0
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
