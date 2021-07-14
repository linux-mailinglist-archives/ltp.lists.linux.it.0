Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A52ED3C7F53
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 09:28:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE2A83C866C
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 09:28:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5A1963C60E0
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 09:28:23 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 745B06001E1
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 09:28:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D05002025F;
 Wed, 14 Jul 2021 07:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626247702;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NLGs9a/g9Z6Tu7fCe45S7iZ5A9jE7I5/8prHBZCuAC0=;
 b=pV8D6QTMUFZd4qp2fSkhH29mXQLNZCQ6oD5afghIgLtzTZ+SGfsq5Hl47a5iw6zPsuNsNW
 FUnmiLCAo+lQvL8cDGO8ZddQ2BO99QWj/rI8UJetungfWoL5BvIIsHcfc8UcRtCjrDBnQ8
 hsTV/C5clrTpmt1a9HuRNJxaVypDuUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626247702;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NLGs9a/g9Z6Tu7fCe45S7iZ5A9jE7I5/8prHBZCuAC0=;
 b=bl37O5TAKE2N4gf09j7dsbA+p64be241OKdeio4MgU3auZxiDndSqGf/huIepd/ARmtdPF
 qI8j6i5pbLdRNXBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 98C6613BEC;
 Wed, 14 Jul 2021 07:28:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2BGFIxaS7mBeewAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 14 Jul 2021 07:28:22 +0000
Date: Wed, 14 Jul 2021 09:28:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <YO6SFGTvHJkAR5+9@pevik>
References: <20210713162450.34947-1-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210713162450.34947-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fanotify19: Add test cases for elevated
 reader privileges
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> Even when event reader has elevated privileges, the information provided
> in events is determined by the privileges of the user that created the
> fanotify group.

> Add test cases for unprivileged listener and privileged event reader.

> This is a regression test for kernel commit
> a8b98c808eab ("fanotify: fix permission model of unprivileged group")

> Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> ---

> Hi Petr,

> Added test for a fix in v5.13-rc5.

Thanks for your patch, pushed!

Things I've found, not related to this patch:

TBROK when running with higher number of iterations:
./fanotify19 -i 30
...
fanotify19.c:224: TPASS: Received event: mask=2b, pid=11351 fd=-1
fanotify19.c:224: TPASS: Received event: mask=b, pid=11351 fd=-1
fanotify19.c:224: TPASS: Received event: mask=a, pid=11351 fd=-1
fanotify19.c:224: TPASS: Received event: mask=8, pid=11351 fd=-1
fanotify19.c:147: TINFO: Test #3 unprivileged lisneter, privileged reader - events by child
fanotify19.c:151: TINFO: Running as privileged user, revoking.
fanotify19.c:136: TBROK: Child process terminated incorrectly. Aborting

Summary:
passed   316
failed   0
broken   1
skipped  0
warnings 0

Could you have look into it?

very minor nit: checkpatch complains about minor issues. Although all but quoted
string split across lines are easily fixable we don't need to bother with it.
But could you please use checkpatch for new tests?
Also I'd personally join also strings which are below 100 chars, because it
helps to grep.

> @@ -248,6 +285,10 @@ static struct tst_test test = {
>  	.needs_root = 1,
>  	.mount_device = 1,
>  	.mntpoint = MOUNT_PATH,
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "a8b98c808eab"},
FYI we also support "linux-stable-git", but we mainly use it for stable branch
specific patches (something required just for stable), not for regular backports
of fixes.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
