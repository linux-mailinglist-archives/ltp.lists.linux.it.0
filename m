Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3B378FBB1
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Sep 2023 12:20:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D1453CC2EB
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Sep 2023 12:20:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9FFDF3CBBA7
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 12:19:57 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BA365201114
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 12:19:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1325121866;
 Fri,  1 Sep 2023 10:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1693563596;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cNvYNE6igSrAnz4ZQ/Q0qy2w3yzBxtsZ5WVSPPHTBH8=;
 b=Y79MjvAT2BIxZnyDxzKSTRFG//ToUisDVvlfN2887GlJXtWUf9ScSc382AR/zgVmq7Sl3G
 l6GDLatDDi7mPxbpw++bSYDkbyvS+T6HXlaPicJ5plaK3DIPo573OLuzUuoXaevX9CDOpz
 oU99YoYlJkD6jGX6/thaOPhJGFkjPRo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1693563596;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cNvYNE6igSrAnz4ZQ/Q0qy2w3yzBxtsZ5WVSPPHTBH8=;
 b=maCcxUFLoSHlM3rcx4ZnQglx8aC1VWxLf2fbvEilGjnBDGUBeTyy3Kg5Plwp0O1kVJR2hz
 4FkpYlWNctQxL1Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CBA261358B;
 Fri,  1 Sep 2023 10:19:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yRTVLsu68WTdXAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 01 Sep 2023 10:19:55 +0000
Date: Fri, 1 Sep 2023 12:19:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20230901101954.GA323151@pevik>
References: <20230829231845.25866-1-wegao@suse.com>
 <20230831064727.5790-1-wegao@suse.com> <87wmxbh8kh.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wmxbh8kh.fsf@suse.de>
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7] clone3: Add clone3's clone_args cgroup
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

Hi Wei, Richie,

> Hello,

> Wei Gao via ltp <ltp@lists.linux.it> writes:

> > +
> > +static struct tst_test test = {
> > +	.test_all = run,
> > +	.setup = setup,
> > +	.cleanup = cleanup,
> > +	.forks_child = 1,
> > +	.max_runtime = 20,

> I removed this and merged!

This change, merged as 45f6916ba ("clone3: Add clone3's clone_args cgroup")
caused failing clone302:

tst_buffers.c:56: TINFO: Test is using guarded buffers
tst_test.c:1559: TINFO: Timeout per run is 0h 00m 30s
clone302.c:101: TPASS: invalid args: clone3() failed as expected: EFAULT (14)
clone302.c:101: TPASS: zero size: clone3() failed as expected: EINVAL (22)
clone302.c:91: TFAIL: short size: clone3() passed unexpectedly
clone302.c:101: TPASS: extra size: clone3() failed as expected: EFAULT (14)
clone302.c:101: TPASS: sighand-no-VM: clone3() failed as expected: EINVAL (22)
clone302.c:101: TPASS: thread-no-sighand: clone3() failed as expected: EINVAL (22)
clone302.c:101: TPASS: fs-newns: clone3() failed as expected: EINVAL (22)
clone302.c:101: TPASS: invalid pidfd: clone3() failed as expected: EFAULT (14)
clone302.c:101: TPASS: invalid signal: clone3() failed as expected: EINVAL (22)
clone302.c:101: TPASS: zero-stack-size: clone3() failed as expected: EINVAL (22)
clone302.c:101: TPASS: invalid-stack: clone3() failed as expected: EINVAL (22)

Summary:
passed   10
failed   1
broken   0
skipped  0
warnings 0
### TEST clone302 COMPLETE >>> 1.

Could you please have look and fix it?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
