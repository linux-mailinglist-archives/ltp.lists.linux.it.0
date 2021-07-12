Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C463C5C95
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 14:49:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D72AA3C6742
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 14:49:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D37F63C0123
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 14:49:30 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 54BD61000458
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 14:49:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF7A421FFC;
 Mon, 12 Jul 2021 12:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626094168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YKZkIWb7ThIfvl9TgnunoPTeT1xWgw5cU8fqLIacNcw=;
 b=OMiTDwNM53ZAuh8O76H/eGqgnkqJ61S+Zph+Cc7GDQkoHR4neiUz2S4nQDDo0MLTzap9dU
 wfpyRTBg2Zq/w/ZYm4xWhNDyVgnFT/S/PW7If4MyvNxGFDccEKHaOYhKNTS4zN58KpyxPf
 gXKB9jvBZY9ZUP+u7q78Npi96NDao8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626094168;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YKZkIWb7ThIfvl9TgnunoPTeT1xWgw5cU8fqLIacNcw=;
 b=AH5sLSdITciDvU/zYtWUaHnjZ0FzRK8je0IXZPXB+urLIrOWSZei05WY9ecJRMB7DmFXGX
 GSFQrMF2jwuvNSBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9B5F413BA8;
 Mon, 12 Jul 2021 12:49:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yEe1JFg67GCDXgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 12 Jul 2021 12:49:28 +0000
Date: Mon, 12 Jul 2021 14:23:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YOw0WvldeLvW+gA5@yuki>
References: <20210628080424.245911-1-xieziyao@huawei.com>
 <20210628080424.245911-3-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210628080424.245911-3-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] epoll_pwait2: Add test for epoll_pwait201
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
> +static void run(void)
> +{
> +	TEST(tst_syscall(__NR_epoll_pwait2, efd, &e, 1, NULL, NULL, 0));

It would be better to put the prototype for epoll_pwait2 into
include/lapi/epoll.h.

Also given that the difference between epoll_pwait() and epoll_pwait2()
is only in the timeout parameter type it would make much more sense to
write these tests with two test variants so that we would cover both
epoll_pwait() and epoll_wait2().

I would have put these tests into epoll_wait/ directory and added
epoll_var.h that would make a common wrapper for both of these
functions. We do this for example for select in select/select_var.h but
in this case this would be much easier, I guess that the wrapper would
get timespec structure and convert that to miliseconds for
epoll_pwait().

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
