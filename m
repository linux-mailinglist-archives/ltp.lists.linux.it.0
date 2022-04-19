Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F380506AD3
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Apr 2022 13:38:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 832943CA66F
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Apr 2022 13:38:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0B1A63C9C34
 for <ltp@lists.linux.it>; Tue, 19 Apr 2022 13:38:03 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EF9001A00818
 for <ltp@lists.linux.it>; Tue, 19 Apr 2022 13:38:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 215561F38D;
 Tue, 19 Apr 2022 11:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1650368282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S50xE/C5RNsOIh9Tu98l8ovPgDzt/Zf5U477Nxbehhg=;
 b=d5bZ2w3G2dBKsJMWpHRbDcwwElfYIWrMbl4I+oBs6S2MjJt1COWx8oC3SDK6yMbeF9lWZq
 4ldpwcOreoX/3MDHqpRGf7gumilJ+RLD3ePleaJaY++z15OwCF1sjCvpZi8J+UrtoguuZP
 I8TMxEJU1EkXMXQa4GU1bW7nxre9tvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1650368282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S50xE/C5RNsOIh9Tu98l8ovPgDzt/Zf5U477Nxbehhg=;
 b=4pQxToa/NfjZqqH2DrvLtvyXDygm3lmDk590urqkEu03r4qt5r+39Q5p+jbU9eTaxQfwjl
 nRg9hS63b9n0yJAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B18F132E7;
 Tue, 19 Apr 2022 11:38:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2Q+wARqfXmJhUgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 19 Apr 2022 11:38:02 +0000
Date: Tue, 19 Apr 2022 13:40:18 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <Yl6fovbXAC3Jg8Bb@yuki>
References: <20220419085002.65719-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220419085002.65719-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/io_submit: Add TTERRNO/TERRNO when test
 fail
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
> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> ---
>  testcases/kernel/syscalls/io_submit/io_submit01.c | 2 +-
>  testcases/kernel/syscalls/io_submit/io_submit02.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/io_submit/io_submit01.c b/testcases/kernel/syscalls/io_submit/io_submit01.c
> index db541fc01..ba75f6d81 100644
> --- a/testcases/kernel/syscalls/io_submit/io_submit01.c
> +++ b/testcases/kernel/syscalls/io_submit/io_submit01.c
> @@ -130,7 +130,7 @@ static void verify_io_submit(unsigned int n)
>  		return;
>  	}
> 
> -	tst_res(TFAIL, "io_submit() returned %i(%s), expected %s(%i)",
> +	tst_res(TFAIL | TERRNO, "io_submit() returned %i(%s), expected %s(%i)",
>  		ret, ret < 0 ? tst_strerrno(-ret) : "SUCCESS",
>  		errno_name(t->exp_errno), t->exp_errno);
>  }

NACK.

As far as I can tell the io_submit() calls returns negative error
instead of setting errno, at least that's what libaio documentation
states.

> diff --git a/testcases/kernel/syscalls/io_submit/io_submit02.c b/testcases/kernel/syscalls/io_submit/io_submit02.c
> index 38b8555d8..6ba4d99a5 100644
> --- a/testcases/kernel/syscalls/io_submit/io_submit02.c
> +++ b/testcases/kernel/syscalls/io_submit/io_submit02.c
> @@ -79,7 +79,7 @@ static void run(unsigned int i)
>  	if (TST_RET == tc[i].nr)
>  		tst_res(TPASS, "io_submit() %s", tc[i].desc);
>  	else
> -		tst_res(TFAIL, "io_submit() returns %ld, expected %ld", TST_RET, tc[i].nr);
> +		tst_res(TFAIL | TTERRNO, "io_submit() returns %ld, expected %ld", TST_RET, tc[i].nr);

The best we can do here is to use tst_strerrno() to print the error as
we do in the io_submit().

>  	for (j = 0; j < TST_RET; j++) {
>  		tst_syscall(__NR_io_getevents, *tc[i].ctx, 1, 1, &evbuf,
> --
> 2.17.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
