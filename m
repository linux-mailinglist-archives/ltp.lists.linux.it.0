Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 655D7697F68
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Feb 2023 16:20:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 11C313CBF16
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Feb 2023 16:20:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F41973CBF0C
 for <ltp@lists.linux.it>; Wed, 15 Feb 2023 16:20:19 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 589B214001EC
 for <ltp@lists.linux.it>; Wed, 15 Feb 2023 16:20:18 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8BEBA339A0;
 Wed, 15 Feb 2023 15:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1676474418;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g4OT8/l21icEVuAUFXnjoxNJFpPgi3iJ27zFO6PLoa0=;
 b=PWJOrgFfu8cUfwiBbYgUn40h0erdkRhRz8vzHg3QHDs47SLYkInftKokV8ijVZUIYrFwwm
 eDzCvx8W8BDKEEAF9JZK1L3NBBBbIztJ34CLuuctrb6U5ZxuNb2vTpb8Z0sWtF8SY/xZbc
 6Kcmi6Q92962mjvRlRJ7SXk899uXvxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1676474418;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g4OT8/l21icEVuAUFXnjoxNJFpPgi3iJ27zFO6PLoa0=;
 b=cNOY+hcT2fQxJ80+48rAG5HR3yGZEE+uSqLXD3mkHFJEDL/MXeQBuVd74psW4XO6XDdmaf
 qvl/Zev98ipdApCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A66F134BA;
 Wed, 15 Feb 2023 15:20:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FOaMCzL47GNLIAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 15 Feb 2023 15:20:18 +0000
Date: Wed, 15 Feb 2023 16:20:16 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <Y+z4MNO+jwydz1w8@pevik>
References: <20230215144225.25008-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230215144225.25008-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cve-2015-3290: Fix tst_syscall() return value
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
Cc: ltp@lists.linux.it, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> The modify_ldt() syscall returns 32-bit signed integer value. Recent changes
> in tst_syscall() caused the value to be interpreted as unsigned on older
> kernels/glibc, which breaks the cve-2015-3290 test. Add explicit type cast
> to fix it.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

This is caused by e5d2a05a9 ("regen.sh: Use intptr_t for tst_syscall return")
which changed returning tst_ret from int to intptr_t (which is also int for 32
bit archs, but long for 64 bit archs). This commit is also needed, thus I don't
suggest to revert it, but I wonder how many other tests it broke.

Kind regards,
Petr

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  testcases/cve/cve-2015-3290.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

> diff --git a/testcases/cve/cve-2015-3290.c b/testcases/cve/cve-2015-3290.c
> index f61d2809b..a2a8fcedd 100644
> --- a/testcases/cve/cve-2015-3290.c
> +++ b/testcases/cve/cve-2015-3290.c
> @@ -195,7 +195,8 @@ static void set_ldt(void)
>  		.useable	 = 0
>  	};

> -	TEST(tst_syscall(__NR_modify_ldt, 1, &data_desc, sizeof(data_desc)));
> +	TEST((int)tst_syscall(__NR_modify_ldt, 1, &data_desc,
> +		sizeof(data_desc)));
>  	if (TST_RET == -EINVAL) {
>  		tst_brk(TCONF | TRERRNO,
>  			"modify_ldt: 16-bit data segments are probably disabled");

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
