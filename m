Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE053FB886
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 16:50:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14E1E3C9B29
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 16:50:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 77D6A3C2AE6
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 16:50:04 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B4DD610007DE
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 16:50:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C10CD22122;
 Mon, 30 Aug 2021 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630335002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/9iF2RaRRpKERGasgY2Sa7H9kZD5YM9qShZkBdDsUNk=;
 b=2UV9jGdqfL+QhlURpD3q4SJ5odmpMjve285Gm8Ux9s2Ft1cmpxnRfh5Ir/hEmkKB4vn+Zn
 8JDhYfa1iWmrIMLCInaN0UQbqt+1Bmo998gru50FksoavKz3KN5d0TuYM0R/qR4iFXis6f
 H8koDp8QwujBqTwQd5kP0hbeMJW7EWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630335002;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/9iF2RaRRpKERGasgY2Sa7H9kZD5YM9qShZkBdDsUNk=;
 b=CcglRGXShLMKM/B0sh66RsqwxEmI5HNc/ToOsl0OjOyRpPZu9+YlveRFiZo560mPBNtSXu
 twshuNkNVu/u5zCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB8EE13B68;
 Mon, 30 Aug 2021 14:50:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kZTfKRrwLGEqPgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 30 Aug 2021 14:50:02 +0000
Date: Mon, 30 Aug 2021 16:50:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <ziyaoxie@outlook.com>
Message-ID: <YSzwIwm7q533tlpD@yuki>
References: <OSZP286MB087168E8DE5E0E49C9F90E27CCC89@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OSZP286MB087168E8DE5E0E49C9F90E27CCC89@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] epoll_creat01: Replace TST_PASS with TST_RET
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
> diff --git a/testcases/kernel/syscalls/epoll_create/epoll_create01.c b/testcases/kernel/syscalls/epoll_create/epoll_create01.c
> index 54fd0810d..29ac3763e 100644
> --- a/testcases/kernel/syscalls/epoll_create/epoll_create01.c
> +++ b/testcases/kernel/syscalls/epoll_create/epoll_create01.c
> @@ -26,9 +26,8 @@ static void run(unsigned int n)
>  {
>  	TST_EXP_FD(tst_syscall(__NR_epoll_create, tc[n]), "epoll_create(%d)", tc[n]);
> 
> -	if (!TST_PASS)
> -		return;
> -	SAFE_CLOSE(TST_PASS);
> +	if (TST_RET)
> +		SAFE_CLOSE(TST_RET);
>  }

Isn't this broken as well?

As far as I can tell the if (!TST_PASS) part in the test is correct and
we only have to change the TST_PASS to TST_RET in the SAFE_CLOSE().

So we should apply:

diff --git a/testcases/kernel/syscalls/epoll_create/epoll_create01.c b/testcases/kernel/syscalls/epoll_create/epoll_create01.c
index 54fd0810d..3ef5b5cac 100644
--- a/testcases/kernel/syscalls/epoll_create/epoll_create01.c
+++ b/testcases/kernel/syscalls/epoll_create/epoll_create01.c
@@ -28,7 +28,7 @@ static void run(unsigned int n)

        if (!TST_PASS)
                return;
-       SAFE_CLOSE(TST_PASS);
+       SAFE_CLOSE(TST_RET);
 }

 static struct tst_test test = {


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
