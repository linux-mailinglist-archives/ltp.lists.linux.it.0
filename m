Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 103FD3C9CCC
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 12:35:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CAB343C7448
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 12:35:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CE8103C65C5
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 12:35:28 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2BD911001199
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 12:35:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E568228D2;
 Thu, 15 Jul 2021 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626345327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YTQUlh9vL9qiNESgcSnRPc/TbwWxFhouXMM1zDM8qEI=;
 b=ynIfDlArv7BfPW9thzJL9nsVP4KMs5sFA+xYW8z426Qh4HLnJGZqc03XwiUzw5QK+ixVBe
 OtcNoQuLgfHEm3CiO9tSgfVRo5SpkP27cfGENmO//yISqU2uh9HnYTwUybcBUlJBXKoR4t
 PiQwGuhuJusemI7QGS/WHUxycD6WT04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626345327;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YTQUlh9vL9qiNESgcSnRPc/TbwWxFhouXMM1zDM8qEI=;
 b=KUemkxHd0k7jWdnXlRV1aiscgrpmEAqr2mzvHdR3hZ06qUYgLpoyJTJhWnMDH9AayXfKkh
 9ngEcg5ySrisWLDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 607C313C33;
 Thu, 15 Jul 2021 10:35:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yYnLFm8P8GCQGwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 15 Jul 2021 10:35:27 +0000
Date: Thu, 15 Jul 2021 12:09:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YPAJcuQ7irZAI+1Z@yuki>
References: <20210715050812.1950884-1-lkml@jv-coder.de>
 <60EFF034.6070800@fujitsu.com>
 <4aaba9d9-e013-3c12-500a-647ff2c0b82d@jv-coder.de>
 <YO//gakCvqaDZl9f@yuki>
 <f2fd323e-a5da-2959-d130-2d3c0aa59e89@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f2fd323e-a5da-2959-d130-2d3c0aa59e89@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
> > For instance mount_device flag needs implies format_device which implies
> > needs_device which implies needs_tmpdir.
> I agree with that. If needs_tmpdir was only required, because 
> needs_device is required, I wouldn't add it.
> But if needs_device implementation is changed, the test still needs a 
> tmpdir. That's why I would always vote for adding it here.

The .needs_device flag implies .needs_tmpdir that's a part of the test
library API.

> > Also the dev_min_size = 1 does not have any efect here, since it can be
> > used only to request bigger-than-default size and gets ignored here. I
> > guess that we can merge this as it is and I will add needs_loopdev to
> > the tst_test structure later which will just allocate loop device and
> > pass it down to the test.
> This is true, but the test should also specify what it needs. If for 
> whatever reason DEV_SIZE_MB is redefined to a smaller value, the test 
> would still work.

The DEV_SIZE_MB will never go backward, this is actually the minimal
size that is needed in order to create all supported Linux filesystems
and we need to bump the size up every few years. I think that it was
100MB when I started to work on LTP and it got up to 256MB, which is
also the reason the tests cannot know and why this is hidden in the
library.

> To be honest, for "1" it doesn't matter. But it it was bigger, it makes 
> total sense to specify the size if the test knows it...

Also LTP allows to be passed a real block device to the tests, in a case
that you want to test a block driver, in which case the test has no
exact controll on the device size, which is also the reason why we
allow minimal size to be specified but not exact size.

> I don't understand why a lot of developers like implicit definitions so 
> much more over explicit definitions.
> I could understand it for language intrinsic stuff, because that is (or 
> could be) known to all developers.
> But for someone, who rarely works on a project or switches between 
> different projects implicit information is bad!

I think that we can actually make things better by adding all of the
text I've written above as a top level description in the tst_device.c.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
