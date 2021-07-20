Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B599C3CF98F
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 14:28:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 71ACF3C6CAF
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 14:28:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 48FCC3C1C51
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 14:28:23 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AECF160008D
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 14:28:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2584F1FE1A;
 Tue, 20 Jul 2021 12:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626784102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wANdMbwKG5nAn8QgXQbRod6BfcEcyFBbkpf6MwxhVtw=;
 b=pR8h0OfKerHBfveB/RfME5YUx99/JKHOeiuibs6Rjr6iG9HQRgLaxoJlhcLZRJgqwUHMcz
 ZZJnjDl9R9DEY/Eytt7yXiyvgcR7GWdFAZqghf5gafjbafaGAR7y4EXHAysjKikzLxmUr8
 96T1RxM9sde1WsxPvdfJNTrUZWzNcZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626784102;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wANdMbwKG5nAn8QgXQbRod6BfcEcyFBbkpf6MwxhVtw=;
 b=+lBrVso25JQfuwwNuZqYdvQd1rGhI8R/sGFLgwlXVopMLmZyq6f8qjmVcx4jtD0vkZh+hW
 NoziIkVw54vgnEBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62E9E13D68;
 Tue, 20 Jul 2021 12:28:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4tkvF2XB9mBKZQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 20 Jul 2021 12:28:21 +0000
Date: Tue, 20 Jul 2021 14:02:53 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YPa7bSB8pNPrBDn8@yuki>
References: <20210720103941.9767-1-mdoucha@suse.cz>
 <20210720103941.9767-3-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210720103941.9767-3-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] Add lockdown checks to init_module* and
 finit_module* tests
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
> +static void lockdown_setup(struct tcase *tc)
> +{
> +	if (kernel_lockdown)
> +		tc->exp_errno = EPERM;
> +}
> +
>  static struct tcase tcases[] = {
>  	{"invalid-fd", &fd_invalid, "", O_RDONLY | O_CLOEXEC, 0, 0, 0, bad_fd_setup},
>  	{"zero-fd", &fd_zero, "", O_RDONLY | O_CLOEXEC, 0, 0, EINVAL, NULL},
> -	{"null-param", &fd, NULL, O_RDONLY | O_CLOEXEC, 0, 0, EFAULT, NULL},
> -	{"invalid-param", &fd, "status=invalid", O_RDONLY | O_CLOEXEC, 0, 0, EINVAL, NULL},
> +	{"null-param", &fd, NULL, O_RDONLY | O_CLOEXEC, 0, 0, EFAULT,
> +		lockdown_setup},
> +	{"invalid-param", &fd, "status=invalid", O_RDONLY | O_CLOEXEC, 0, 0,
> +		EINVAL, lockdown_setup},
>  	{"invalid-flags", &fd, "", O_RDONLY | O_CLOEXEC, -1, 0, EINVAL, NULL},
>  	{"no-perm", &fd, "", O_RDONLY | O_CLOEXEC, 0, 1, EPERM, NULL},
>  	{"module-exists", &fd, "", O_RDONLY | O_CLOEXEC, 0, 0, EEXIST, NULL},

I'm slightly afraid that the order of checks may change over the time
and we will get EPERM in all these cases, but maybe I'm just overly
cautious. Other than this the code looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
