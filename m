Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 00700417040
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Sep 2021 12:22:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F6DE3C8F53
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Sep 2021 12:22:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 56ADA3C8F19
 for <ltp@lists.linux.it>; Fri, 24 Sep 2021 12:22:53 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DFDCA2011EC
 for <ltp@lists.linux.it>; Fri, 24 Sep 2021 12:22:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2B3E9223F3;
 Fri, 24 Sep 2021 10:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1632478972;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bJBzwtLiOn+MrnnYsWKlXvAH0Ajm8DQfVFjLQ8mzEhw=;
 b=XUFu7x55QLIKb6zNNZFnBIB4xZYhPMiZrl9tg3w9j4EYjrPhmut5D7Vl+nAYO1kmIpXzVx
 z8enwe/IeV8qcWOq5C+Pc1wp4bAJsUgU/1+5YBzkqsAA2onD+SM3eXx2XpZ+Vw18MOSzoP
 USBjjDGVDoDJco81EZDXn+EknArBtIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1632478972;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bJBzwtLiOn+MrnnYsWKlXvAH0Ajm8DQfVFjLQ8mzEhw=;
 b=CLQ1KaxtB7d1BSv6Iya08iYAsbxU961JV/2tqR2vTzkQIOVOetkxOf3kOyO7YHJK9YJPuC
 oZ47nwwuG+F+TBAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3CE313AB5;
 Fri, 24 Sep 2021 10:22:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VLK4M/umTWGYTgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 24 Sep 2021 10:22:51 +0000
Date: Fri, 24 Sep 2021 12:22:49 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YU2m+WkXus4IEDrZ@pevik>
References: <20210924092111.20012-1-rpalethorpe@suse.com>
 <20210924092111.20012-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210924092111.20012-2-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] msgrcv07: Cleanup indentation
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie,

> make make check happy.
thx!
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>  testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

> diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
> index 8635ef7a4..4528f69b2 100644
> --- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
> +++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
> @@ -201,7 +201,7 @@ static void test_positive_msgtyp(void)

>  	if (strcmp(rcv_buf.mtext, MSG2) == 0 && rcv_buf.type == MSGTYPE2) {
>  		tst_res(TPASS,
> -		        "msgtyp got the first message in the queue of type msgtyp");
> +			"msgtyp got the first message in the queue of type msgtyp");
>  	} else {
>  		tst_res(TFAIL,
>  			"msgtyp didn't get the first message in the queue of type msgtyp");
> @@ -226,7 +226,7 @@ static void test_negative_msgtyp(void)

>  	if (strcmp(rcv_buf.mtext, MSG1) == 0 && rcv_buf.type == MSGTYPE1) {
>  		tst_res(TPASS,
> -		        "-msgtyp got the first message in the queue with the lowest type");
> +			"-msgtyp got the first message in the queue with the lowest type");
>  	} else {
>  		tst_res(TFAIL,
>  			"-msgtyp didn't get the first message in the queue with the lowest type");

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
