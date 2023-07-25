Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAA47617E3
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jul 2023 14:00:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7EF393C95DD
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jul 2023 14:00:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C5A0A3C8CDD
 for <ltp@lists.linux.it>; Tue, 25 Jul 2023 14:00:21 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8B8311A0106B
 for <ltp@lists.linux.it>; Tue, 25 Jul 2023 14:00:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E6F2E21E1E;
 Tue, 25 Jul 2023 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1690286419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uxIbNDenB/Hi1WcOqd4KjzVHawrauSMh8JH7fOd+2t8=;
 b=kLOZcA+9grSFcGH7CqvB5yGFsMAMieWmp1F6NQhLJMBGdR9b7KoniWIlxtknkPjzm8PFFB
 y+a/PqcQowXyuwBLNFWhp1eCtui86rnccntMuB7JyiCS6bcWJ7m5SgbZMM1+A3C06pyaKu
 qMPHy4nQa9jhtfBroJ3c9K3DdaJkMn4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1690286419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uxIbNDenB/Hi1WcOqd4KjzVHawrauSMh8JH7fOd+2t8=;
 b=KPLjHuIUKNEWoQ9I2VAMYLYB4R2z4K/VqDQUZAIFDt1hm0fa3zfwZxIEO/frLcx1915Uu3
 tSt3LR/cnCW20RBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD02013487;
 Tue, 25 Jul 2023 12:00:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Q8nqMVO5v2RoMAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 25 Jul 2023 12:00:19 +0000
Date: Tue, 25 Jul 2023 14:01:21 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZL-5kfsRIzh1ZkNd@yuki>
References: <20230719110051.1237775-1-pvorel@suse.cz>
 <20230719110051.1237775-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719110051.1237775-3-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/4] lib/C-API: Add option -V to print LTP
 version
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
> It can be useful for troubleshooting reported issues.

I still wonder if this should be rather put into the output of the -h or
both.

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  lib/tst_test.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 04da456c6..456d3d1e6 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -34,6 +34,7 @@
>  #include "old_resource.h"
>  #include "old_device.h"
>  #include "old_tmpdir.h"
> +#include "ltp-version.h"
>  
>  /*
>   * Hack to get TCID defined in newlib tests
> @@ -509,6 +510,7 @@ static struct option {
>  	{"h",  "-h       Prints this help"},
>  	{"i:", "-i n     Execute test n times"},
>  	{"I:", "-I x     Execute test for n seconds"},
> +	{"V",  "-V       Prints LTP version"},
>  	{"C:", "-C ARG   Run child process with ARG arguments (used internally)"},
>  };
>  
> @@ -686,6 +688,10 @@ static void parse_opts(int argc, char *argv[])
>  			else
>  				duration = SAFE_STRTOF(optarg, 0.1, HUGE_VALF);
>  		break;
> +		case 'V':
> +			fprintf(stderr, "LTP version: " LTP_VERSION "\n");
> +			exit(0);
> +		break;
>  		case 'C':
>  #ifdef UCLINUX
>  			child_args = optarg;
> -- 
> 2.40.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
