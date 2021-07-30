Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AFE3DB9A5
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 15:52:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A8D043C8EE8
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 15:52:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C69113C5638
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 15:52:50 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DD38114012BF
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 15:52:49 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 21E1022424;
 Fri, 30 Jul 2021 13:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627653169;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8DbzbqZ61UYN+muZxS4Bzr6eAcPIAfj9J1dslKe0MJQ=;
 b=voXF8IQV706yV/nyYCeHX7YVc5xqpAeasc7vNATOcIqfRQB5st1UqOEJG9aXLO1p5ZSuCC
 01KM4leU7zSTxK738MaJjD57/+PYh7mca4NQyQu2P9zdjj4hLYuAFkuAtwsF2BzkwxFY+7
 TAckqhJa/s/wBow3kloNczPdn1aZn94=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627653169;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8DbzbqZ61UYN+muZxS4Bzr6eAcPIAfj9J1dslKe0MJQ=;
 b=nNAErpeppRrMJuiMGGIU3gBCK+UnzPdVJ910F+lQd/yJ8CzDB90J3hABILgubXpnGnosx3
 +d4evtbatDk5HZDQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id DA238137FD;
 Fri, 30 Jul 2021 13:52:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id kg0tMzAEBGGDbgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 30 Jul 2021 13:52:48 +0000
Date: Fri, 30 Jul 2021 15:52:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YQQEL/Tlun7pAI5X@pevik>
References: <20210726151736.14299-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210726151736.14299-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Add tst_hexdump utility
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Thanks! I suppose I'll merge it as is, but few notes below:

As you use only -d in this patchset I suppose you want to have
it as a general utility. It might be worth to mention that xxd by default wraps by
16 cols (-c 16), which we don't do:

$ echo "06a441375b431e06280e2d4e199ba650c14c47d9" | ./testcases/lib/tst_hexdump; echo
303661343431333735623433316530363238306532643465313939626136353063313463343764390a

$ echo "06a441375b431e06280e2d4e199ba650c14c47d9" | xxd -p
303661343431333735623433316530363238306532643465313939626136
353063313463343764390a

Other option would be just make -d as default and remove encode_hex() until is
really needed.

Kind regards,
Petr


> tst_hexdump implements conversion between binary and hexadecimal values in both
> directions for shell tests.

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  testcases/lib/Makefile      |  2 +-
>  testcases/lib/tst_hexdump.c | 55 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+), 1 deletion(-)
>  create mode 100644 testcases/lib/tst_hexdump.c

> diff --git a/testcases/lib/Makefile b/testcases/lib/Makefile
> index 98d9e4613..38813e640 100644
> --- a/testcases/lib/Makefile
> +++ b/testcases/lib/Makefile
> @@ -11,6 +11,6 @@ INSTALL_TARGETS		:= *.sh
>  MAKE_TARGETS		:= tst_sleep tst_random tst_checkpoint tst_rod tst_kvcmp\
>  			   tst_device tst_net_iface_prefix tst_net_ip_prefix tst_net_vars\
>  			   tst_getconf tst_supported_fs tst_check_drivers tst_get_unused_port\
> -			   tst_get_median
> +			   tst_get_median tst_hexdump

>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/lib/tst_hexdump.c b/testcases/lib/tst_hexdump.c
> new file mode 100644
> index 000000000..f83b8bfbf
> --- /dev/null
> +++ b/testcases/lib/tst_hexdump.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 SUSE LLC <mdoucha@suse.cz>
> + *
> + * Convert bytes from standard input to hexadecimal representation.
> + *
> + * Parameters:
> + * -d   Convert hexadecimal values from standard input to binary representation
> + *      instead.
This could be printed in -h parameter if really meant to be a general tool.
But understand you didn't bother.

Kind regards,
Petr

> + */
> +
> +#include <stdio.h>
> +#include <unistd.h>
> +
> +int decode_hex(void)
> +{
> +	int ret;
> +	unsigned int val;
> +
> +	while ((ret = scanf("%2x", &val)) == 1)
> +		putchar(val);
> +
> +	return ret != EOF || ferror(stdin);
> +}
> +
> +int encode_hex(void)
> +{
> +	int val;
> +
> +	for (val = getchar(); val >= 0 && val <= 0xff; val = getchar())
> +		printf("%02x", val);
> +
> +	return val != EOF || ferror(stdin);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	int ret, decode = 0;
> +
> +	while ((ret = getopt(argc, argv, "d"))) {
> +		if (ret < 0)
> +			break;
> +
> +		switch (ret) {
> +		case 'd':
> +			decode = 1;
> +			break;
> +		}
> +	}
> +
> +	if (decode)
> +		return decode_hex();
> +	else
> +		return encode_hex();
> +}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
