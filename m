Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC144AF3ED
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Feb 2022 15:19:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F07D3C9D7F
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Feb 2022 15:19:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 24EFD3C9CB8
 for <ltp@lists.linux.it>; Wed,  9 Feb 2022 15:19:08 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8B925600CEE
 for <ltp@lists.linux.it>; Wed,  9 Feb 2022 15:19:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 951121F383;
 Wed,  9 Feb 2022 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644416346;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Z2D77rE6r69Vb+9Ph7yjxnCXBcha4meUp5DXPTdMbs=;
 b=Pn8O57qBXCFt/Lapxn+3u7AR8QkVPePa3QgUEgi5mmRuHSzuwBFBLRDAQN9jqKduLUKA7U
 x6X7/ERzm+1tFFOlnd39Wna3iUJ3k+UaJgyuFa9WWtMoNYiRQpS5+kMpnxX1hNcQ0BnsLe
 BkMmJ07PR/ajxJfCyBB3S9Dgd2sG+vk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644416346;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Z2D77rE6r69Vb+9Ph7yjxnCXBcha4meUp5DXPTdMbs=;
 b=9CL+hL3NvjM72EUNeqW2WUjtIa3i7j8vJpJdlMcvq2eGdAxLrPeMsP6Hf1UhDwhw2h1hz4
 HGYsckqKUQ4TbLAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 67DAB13D45;
 Wed,  9 Feb 2022 14:19:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9aySF1rNA2LIYwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 09 Feb 2022 14:19:06 +0000
Date: Wed, 9 Feb 2022 15:19:04 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YgPNWHc+xwKCRcvv@pevik>
References: <1644399738-2155-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1644399738-2155-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/pidfd_open: Simplify code
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

Hi Xu,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Nice cleanup.
+1 for Cyril's note to TST_EXP_FD_SILENT().

> diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
> +static void setup(void)
> +{
> +	pidfd_open_supported();
> +}
> +
>  static struct tst_test test = {
> -	.min_kver = "5.3",
> +	.setup = setup,
>  	.test_all = run,
why not just .setup = pidfd_open_supported; ?

...

> diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
> index 48470e5e1..f41afa2fc 100644
> --- a/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
> +++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
...
> +static void setup(void)
> +{
> +	pidfd_open_supported();
> +}
> +
And here as well.

Kind regards,
Petr

>  static struct tst_test test = {
> -	.min_kver = "5.3",
> +	.setup = setup,
>  	.test_all = run,
>  	.forks_child = 1,
>  	.needs_checkpoints = 1,

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
