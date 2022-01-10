Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDD8489B82
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jan 2022 15:44:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CEAB3C93D4
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jan 2022 15:44:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1018F3C051B
 for <ltp@lists.linux.it>; Mon, 10 Jan 2022 15:44:31 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 982701A01490
 for <ltp@lists.linux.it>; Mon, 10 Jan 2022 15:44:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B95F31F383;
 Mon, 10 Jan 2022 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1641825869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rQYAKoHyROzPr1VMnEKzrQ1A6jRm6PZn6adkmV9Ds+M=;
 b=1CZJEPdDPhW1rHTUs6CdY+dsp655PT9HXhjbkA15CVSQqoqZfVXy6Rh9WEi9QkGJL0JMEj
 OyJIbPxxHKzc1yvdo0d4e5Y7yenQu9IuFQfzbIrqfhk3BNICygryTh3J+ZVzpBgR3nMSMA
 T0x36dxRi5eD1DgcT2SkAEsxXpNg55A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1641825869;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rQYAKoHyROzPr1VMnEKzrQ1A6jRm6PZn6adkmV9Ds+M=;
 b=GBTYzduWJuysUN2T/PRDrUBlPxcsvtM8uV1j+TEtTIm7S3ovtXZcnGhpqWz0D2qrboj6Ku
 CMBlGALHXy+Zz5Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 97B2413D9D;
 Mon, 10 Jan 2022 14:44:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0SRMIk1G3GHXYwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 10 Jan 2022 14:44:29 +0000
Date: Mon, 10 Jan 2022 15:46:04 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YdxGrO40TwVJmeWG@yuki>
References: <YY0o7jAxgIHvmczq@yuki>
 <1639380414-24390-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1639380414-24390-5-git-send-email-xuyang2018.jy@fujitsu.com>
 <YdhhTeot7Z9861B0@yuki> <61DBD6D0.1000104@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61DBD6D0.1000104@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 5/6] syscalls/quotactl09: Test error when quota
 info hidden in filesystem
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> +	if (tc->exp_err == ENOTBLK)
> >> +		TEST(do_quotactl(fd, tc->cmd, "/dev/null", *tc->id, tc->addr));
> >> +	else
> >> +		TEST(do_quotactl(fd, tc->cmd, tst_device->dev, *tc->id, tc->addr));
> >
> > How does this work for the tst_variant == 1? We still do pass the fd
> > pointing to device right?
> Yes, but for tst_variant ==1 ,we don't use dev.

Well yes, but the fd points to the device, right? So we pass a fd that
points to a device and we expect ENOTBLK if tst_variant == 1 and
exp_err == ENOTBLK? That does not sound fine, what do I miss?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
