Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B5843B3E6
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 16:23:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D84AF3C68BB
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 16:23:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0F6273C67DE
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 16:23:05 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4F0061A0111F
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 16:23:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9C6B7218B8;
 Tue, 26 Oct 2021 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635258184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zxjmItgm4YVzJ/9Gx+xyR/QEFsE+UuW7/E9PYCllszI=;
 b=Z8mLkg2z/JR7Xl1yqGhEbAkuE7CuFAfsznYV914rp7jcZYZ/fB45R99IEl8skHks/OoWVG
 L0Ae1TKDHfyRmRsyCnLZ2R3ak50toJGZxBNkSakuxOMYOyHUmOthaKA34uH+8GO8Ea7+r7
 UPWtVo0j9vWd+4lxg7RyQuMtNl2jJWc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635258184;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zxjmItgm4YVzJ/9Gx+xyR/QEFsE+UuW7/E9PYCllszI=;
 b=P7m5SlsTmq3dVN2uY2i1IxhvovzPJYWj/iVtU7guARIPxAMDAW42g3s/z921drgPLR9jBb
 1w1Sk4DymBpdZACA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 82E9D13B06;
 Tue, 26 Oct 2021 14:23:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oYJDH0gPeGHIEwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 26 Oct 2021 14:23:04 +0000
Date: Tue, 26 Oct 2021 16:23:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YXgPep456QvfyAgw@yuki>
References: <1634562888-5987-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1634562888-5987-3-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1634562888-5987-3-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 08/11] syscalls/quotaclt02,
 5: Add quotactl_fd test variant
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
> @@ -166,9 +174,11 @@ static struct tst_test test = {
>  	.tcnt = ARRAY_SIZE(tcases),
>  	.mount_device = 1,
>  	.dev_fs_type = "xfs",
> -	.mntpoint = mntpoint,
> +	.mntpoint = MNTPOINT,
>  	.mnt_data = "usrquota,grpquota",
>  	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_variants = 2,

It may be a slightly cleaner to #define QUOTACTL_VARIANTS 2 in the
quotactl_var.h and use it here.

>  };
>  #else
>  	TST_TEST_TCONF("System doesn't have <xfs/xqm.h>");
> diff --git a/testcases/kernel/syscalls/quotactl/quotactl02.h b/testcases/kernel/syscalls/quotactl/quotactl02.h
> index 37f3d7eb7..5b7c5ab32 100644
> --- a/testcases/kernel/syscalls/quotactl/quotactl02.h
> +++ b/testcases/kernel/syscalls/quotactl/quotactl02.h
> @@ -14,18 +14,20 @@
>  #include <stdio.h>
>  #include "tst_test.h"
>  #include "lapi/quotactl.h"
> +#include "quotactl_var.h"

Here as well, no need to include the "lapi/quotactl.h" anymore.


Other than that this patch looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
