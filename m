Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C6A4C6E92
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Feb 2022 14:49:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 68D443CA251
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Feb 2022 14:49:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 86D543C0F97
 for <ltp@lists.linux.it>; Mon, 28 Feb 2022 14:49:26 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9B8DD1000DDA
 for <ltp@lists.linux.it>; Mon, 28 Feb 2022 14:49:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BC438219A9;
 Mon, 28 Feb 2022 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646056164;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wDeE/Yi/mL7L8TfXrzx/Pq3pvrNyLGP92w5nKjH9BD4=;
 b=mxYOiXRWSqxRZ9mXVU065czbIcmzonEmEvqVUbfBH+qHKjIoXFdKDnTmexKvifmhxS7DKA
 O1wkb6a5dsgN/g7JzL+jDfkbTwHlvE590gy3xq+zkmYXmCkGdBjMP+kkZwrak44wE/f4sl
 1qSQCB5PE/k4kdmLSrIR9mTr60CBftk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646056164;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wDeE/Yi/mL7L8TfXrzx/Pq3pvrNyLGP92w5nKjH9BD4=;
 b=5BrnFxdHdMYFfFnjCG+hBFwxFdjrFfkJxb7uor3EKjWvrcC6r2sAcvwT7jyq0R5DM1JNUW
 U8/BVfPj6berHwBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 79F1613ADA;
 Mon, 28 Feb 2022 13:49:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r0JVGuTSHGIqTQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 28 Feb 2022 13:49:24 +0000
Date: Mon, 28 Feb 2022 14:49:21 +0100
From: Petr Vorel <pvorel@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YhzS4TYk3s4L4jA8@pevik>
References: <20220223153243.317-1-pvorel@suse.cz>
 <20220223153243.317-3-pvorel@suse.cz>
 <6216E3ED.1050700@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6216E3ED.1050700@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] quotactl08: Use do_mount()
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi Petr
> > to change
> > quotactl08.c:160: TBROK: mount(/dev/loop0, mntpoint, ext4, 0, (nil)) failed: ESRCH (3)
> I doubt why fs quota is not supported on this case since we have check
> kernel config?

I have no idea.
And yes, the config contains CONFIG_QFMT_V2=m

Kind regards,
Petr

> Best Regards
> Yang Xu

> > to TCONF if FS quota is not supported (the same fix as 4aab31e4c7).

> > Signed-off-by: Petr Vorel<pvorel@suse.cz>
> > ---
> >   testcases/kernel/syscalls/quotactl/quotactl08.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)

> > diff --git a/testcases/kernel/syscalls/quotactl/quotactl08.c b/testcases/kernel/syscalls/quotactl/quotactl08.c
> > index 3793867f23..9f54bebcc0 100644
> > --- a/testcases/kernel/syscalls/quotactl/quotactl08.c
> > +++ b/testcases/kernel/syscalls/quotactl/quotactl08.c
> > @@ -157,7 +157,7 @@ static void setup(void)
> >   	quotactl_info();

> >   	SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
> > -	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, NULL);
> > +	do_mount(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, NULL);
> >   	mount_flag = 1;

> >   	fd = SAFE_OPEN(MNTPOINT, O_RDONLY);

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
