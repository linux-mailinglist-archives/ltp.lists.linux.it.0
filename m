Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C4A6EE28E
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Apr 2023 15:14:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C71923CBF6E
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Apr 2023 15:14:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 62A3A3C03AE
 for <ltp@lists.linux.it>; Tue, 25 Apr 2023 15:13:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E1AD5140016A
 for <ltp@lists.linux.it>; Tue, 25 Apr 2023 15:13:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3CB061FD9D;
 Tue, 25 Apr 2023 13:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1682428438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dzc72ufk6AADKanyrbwJT4n17usqynMTQSpMggvr1VI=;
 b=a9GYDbla3Rzr8R/c0rLU7PF1wXQn7Yis3klB2Gpb+rDBc3ORH81ttssz1M0+xx/V/HU3Ut
 njc/FckLrpa4xj/EUG0L2H4B0r6S1hXF19nHNNLAFv4Sq+rg4VqoB2cT6onpNbXWHQI/rf
 TmqWI5/TJpeUjEeDVLQVwPJ1yIv/sJk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1682428438;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dzc72ufk6AADKanyrbwJT4n17usqynMTQSpMggvr1VI=;
 b=BT0IpSslvB0sSG1A4/gbPhP1Fd3PaIA8OqO+HAqto20pVVJbYAsQxK+RZfWkw47PFfnYKU
 Da4IdusSH+vzq9Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 23F1513466;
 Tue, 25 Apr 2023 13:13:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OtcLBxbSR2RmDgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 25 Apr 2023 13:13:58 +0000
Date: Tue, 25 Apr 2023 15:12:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZEfRrOpPwkLuBQw5@rei>
References: <20230412082115.1990591-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230412082115.1990591-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] nfs/nfs08.sh: Add test for NFS cache
 invalidation
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
Cc: NeilBrown <neilb@suse.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> v4 [1] of not yet upstreamed patch accidentally broke cache invalidation
> for directories by clearing NFS_INO_INVALID_DATA inappropriately.
> Although it was fixed in v5 [2] thus kernel was not actually broken,
> it's better to prevent this in the future.
> 
> [1] https://lore.kernel.org/linux-nfs/167649314509.15170.15885497881041431304@noble.neil.brown.name/
> [2] https://lore.kernel.org/linux-nfs/167943762461.8008.3152357340238024342@noble.neil.brown.name/
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> NOTE: although Neil suggested to test on ext2 to make the problems more
> obvious (ext2 has low-resolution time stamps) and to use sleep, with
> nfs_lib.sh LTP code it works without sleep and on all filesystems.
> 
> It'd require more changes in nfs_lib.sh to force ext2 only for nfs08.sh
> (other tests are using the library). Not only it's needed, but I also
> plan to switch nfs_lib.sh to use all available filesystems via
> TST_ALL_FILESYSTEMS=1, therefore ext2 will be among tested filesystems
> anyway.
> 
> Test fails also on all available NFS versions, thus using the same
> approach as the other tests - test all versions, although not sure if
> it's really needed. But test runs very quickly (unlike other nfs tests
> it's not a stress test), thus I'd keep it.
> 
> NOTE: anybody trying to test this patch with TMPDIR (to test different
> filesystems) test with this fix [1].
> 
> Kind regards,
> Petr
> 
> [1] https://lore.kernel.org/ltp/20230412073953.1983857-1-pvorel@suse.cz/
> 
>  runtest/net.nfs                           | 11 +++++++++++
>  testcases/network/nfs/nfs_stress/Makefile |  9 +--------
>  testcases/network/nfs/nfs_stress/nfs08.sh | 20 ++++++++++++++++++++
>  3 files changed, 32 insertions(+), 8 deletions(-)
>  create mode 100755 testcases/network/nfs/nfs_stress/nfs08.sh
> 
> diff --git a/runtest/net.nfs b/runtest/net.nfs
> index 3249c35cb..72cf4b307 100644
> --- a/runtest/net.nfs
> +++ b/runtest/net.nfs
> @@ -72,6 +72,17 @@ nfs4_ipv6_07 nfs07.sh -6 -v 4 -t tcp
>  nfs41_ipv6_07 nfs07.sh -6 -v 4.1 -t tcp
>  nfs42_ipv6_07 nfs07.sh -6 -v 4.2 -t tcp
>  
> +nfs3_08 nfs08.sh -v 3 -t udp
> +nfs3t_08 nfs08.sh -v 3 -t tcp
> +nfs4_08 nfs08.sh -v 4 -t tcp
> +nfs41_08 nfs08.sh -v 4.1 -t tcp
> +nfs42_08 nfs08.sh -v 4.2 -t tcp
> +nfs3_ipv6_08 nfs08.sh -6 -v 3 -t udp
> +nfs3t_ipv6_08 nfs08.sh -6 -v 3 -t tcp
> +nfs4_ipv6_08 nfs08.sh -6 -v 4 -t tcp
> +nfs41_ipv6_08 nfs08.sh -6 -v 4.1 -t tcp
> +nfs42_ipv6_08 nfs08.sh -6 -v 4.2 -t tcp
> +
>  nfslock3_01 nfslock01.sh -v 3 -t udp
>  nfslock3t_01 nfslock01.sh -v 3 -t tcp
>  nfslock4_01 nfslock01.sh -v 4 -t tcp
> diff --git a/testcases/network/nfs/nfs_stress/Makefile b/testcases/network/nfs/nfs_stress/Makefile
> index 8cd095867..5b396dede 100644
> --- a/testcases/network/nfs/nfs_stress/Makefile
> +++ b/testcases/network/nfs/nfs_stress/Makefile
> @@ -9,13 +9,6 @@ include $(top_srcdir)/include/mk/testcases.mk
>  nfs04_create_file: CPPFLAGS += -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
>  nfs05_make_tree: LDLIBS += -lpthread
>  
> -INSTALL_TARGETS		:= nfs_lib.sh \
> -			   nfs01.sh \
> -			   nfs02.sh \
> -			   nfs03.sh \
> -			   nfs04.sh \
> -			   nfs05.sh \
> -			   nfs06.sh \
> -			   nfs07.sh
> +INSTALL_TARGETS	:= *.sh
>  
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/network/nfs/nfs_stress/nfs08.sh b/testcases/network/nfs/nfs_stress/nfs08.sh
> new file mode 100755
> index 000000000..8a0f40242
> --- /dev/null
> +++ b/testcases/network/nfs/nfs_stress/nfs08.sh
> @@ -0,0 +1,20 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2023 Petr Vorel <pvorel@suse.cz>
> +# Test reproducer for broken NFS cache invalidation for directories.
> +# Based on reproducer from Neil Brown <neilb@suse.de>
> +
> +TST_TESTFUNC="do_test"
> +
> +do_test()
> +{
> +	tst_res TINFO "testing NFS cache invalidation for directories"
> +
> +	touch 1
> +	EXPECT_PASS 'ls | grep 1'
> +
> +	touch 2
> +	EXPECT_PASS 'ls | grep 2'
> +}

I do not get how this actually detects case invalidation, it probably
does, but slightly better description how this actually excercises the
case would help.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
