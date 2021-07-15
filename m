Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6E23C9C35
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 11:53:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 16C293C82F3
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 11:53:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3798F3C65D4
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 11:53:03 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B45F31A01462
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 11:53:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC0781FDF6;
 Thu, 15 Jul 2021 09:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626342781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4gm4ZSnCmtuFdsXmeJHhKT/uOG1WHn4NvCVKjzh3SfY=;
 b=tmvjTY7b5gkraqF3a7kgVxc0mk+fcB5cRJx+vMWUku3PBWPUQiOZTZpu/xutUht1NGPxHe
 ro9LI+YkMsiLg5EvtyFjabigyIM9+fCOHj2wx6awxowluNANV1lkI+qnliQlRBdRHHATyN
 X+QQ6UnlGg1tLpGbg7wlWq3FLfLHccY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626342781;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4gm4ZSnCmtuFdsXmeJHhKT/uOG1WHn4NvCVKjzh3SfY=;
 b=fmVG77oL8U8WgX09MW+Qb2u8JChnOqyMUz5LVzGxtanlZxo74662oulkCAHHXjkKi8KZg8
 6Y9A/2xH/f1MqWDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D0CD113C31;
 Thu, 15 Jul 2021 09:53:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id URr+Mn0F8GB/DgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 15 Jul 2021 09:53:01 +0000
Date: Thu, 15 Jul 2021 11:27:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YO//gakCvqaDZl9f@yuki>
References: <20210715050812.1950884-1-lkml@jv-coder.de>
 <60EFF034.6070800@fujitsu.com>
 <4aaba9d9-e013-3c12-500a-647ff2c0b82d@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4aaba9d9-e013-3c12-500a-647ff2c0b82d@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] squashfs: Add regression test for sanity check
 bug
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> +static struct tst_test test = {
> >> +	.test_all = run,
> >> +	.cleanup = cleanup,
> >> +	.setup = setup,
> >> +	.needs_root = 1,
> >> +	.needs_device = 1,
> >> +	.dev_min_size = 1,
> >> +	.needs_cmds = (const char *const []) {
> >> +		"mksquashfs",
> >> +		NULL
> >> +	},
> >> +	.needs_drivers = (const char *const []) {
> >> +		"squashfs",
> >> +		NULL
> >> +	},
> >> +	.tags = (const struct tst_tag[]) {
> >> +		{"linux-git", "c1b2028315c"},
> >> +		{"linux-git", "8b44ca2b634"},
> >> +		{}
> >> +	},
> >> +	.needs_tmpdir = 1,
> > needs_device has enabled needs_tmpdir in internal, so we don't need to
> > set it here.
> Honestly I hate implicitness like that. I think if the test itself needs 
> the tmpdir, it should state it and not rely on some other "needs_*" 
> stuff to also enable it.
> But if whoever merges this agrees with you, he can change it...

We tend to avoid listing full subtree of dependencies, in this case it's
not that bad, but it tends to get out of hand quickly.

For instance mount_device flag needs implies format_device which implies
needs_device which implies needs_tmpdir.

Also the dev_min_size = 1 does not have any efect here, since it can be
used only to request bigger-than-default size and gets ignored here. I
guess that we can merge this as it is and I will add needs_loopdev to
the tst_test structure later which will just allocate loop device and
pass it down to the test.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
