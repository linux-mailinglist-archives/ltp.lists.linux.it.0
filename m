Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 140753FC4C7
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:51:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFC7D3C2AE0
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:51:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 742EC3C2A68
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:50:58 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 17BEE600C2F
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:50:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4F74A221D1;
 Tue, 31 Aug 2021 09:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630403457; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DcxhERBC/Po5zopIUtc5hpgTA6DlbzYf6TK+HO7VC1o=;
 b=q87BeieHG62B6WbaE2U11QoKI036OWYAWG6bBAjxu8+b6ECdg04pk/h0FfluyK9TiWFaMo
 AU/UrmW0PCsjIeX2+t4pHh8q8xVB7wACu793Y/V5baj1ZeRcPzAvRylq88LheAJUs/T8IJ
 qdMfpr214z807kX73N6z7AwXu+ReOVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630403457;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DcxhERBC/Po5zopIUtc5hpgTA6DlbzYf6TK+HO7VC1o=;
 b=YPMITC4rB7LwspZYTjS0Ob4S3Qm91YemP6iW0y+C/Pz4rDrn6bl6+5yUC/IED2wcBRJ1fx
 dd7kwodgIbOaB+Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 32CE213AC9;
 Tue, 31 Aug 2021 09:50:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1cVSDoH7LWGOTAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 31 Aug 2021 09:50:57 +0000
Date: Tue, 31 Aug 2021 11:51:04 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YS37iPx2tWsy0FF5@yuki>
References: <YSz36VZ18+N4YsM/@yuki>
 <20210831091005.25361-1-rpalethorpe@suse.com>
 <20210831091005.25361-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210831091005.25361-2-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/4] bpf: Print full verification log
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
> diff --git a/testcases/kernel/syscalls/bpf/bpf_common.c b/testcases/kernel/syscalls/bpf/bpf_common.c
> index ba0829a75..aac235cac 100644
> --- a/testcases/kernel/syscalls/bpf/bpf_common.c
> +++ b/testcases/kernel/syscalls/bpf/bpf_common.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2019-2020 Linux Test Project
>   */
>  
> +#include <stdio.h>

I've removed this now unused include.

>  #define TST_NO_DEFAULT_MAIN
>  #include "tst_test.h"
>  #include "bpf_common.h"
> @@ -118,8 +120,10 @@ int bpf_load_prog(union bpf_attr *const attr, const char *const log)
>  	if (ret != -1)
>  		tst_brk(TBROK, "Invalid bpf() return value: %d", ret);
>  
> -	if (log[0] != 0)
> -		tst_brk(TBROK | TERRNO, "Failed verification: %s", log);
> +	if (log[0] != 0) {
> +		tst_printf("%s\n", log);
> +		tst_brk(TBROK | TERRNO, "Failed verification");
> +	}
>  
>  	tst_brk(TBROK | TERRNO, "Failed to load program");
>  	return ret;

And pushed the whole patchset, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
