Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCDD58A1F6
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Aug 2022 22:32:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32C593C93E2
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Aug 2022 22:32:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CB3853C1BBA
 for <ltp@lists.linux.it>; Thu,  4 Aug 2022 22:32:21 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 328221401217
 for <ltp@lists.linux.it>; Thu,  4 Aug 2022 22:32:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6529433BE6;
 Thu,  4 Aug 2022 20:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1659645135;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pkigYPeUut6TdEoWnglqATIPjSyGsB2WdGd2RXHdTKk=;
 b=w2v7bNxELECyImcOBGjHlDXBe7Tzl/RgxvkGyDupLGB7M5tG2X1M6leqXz8NWIjZ9vrgvV
 Iua4Ht8C/1nwjFaDtSxu1vilSL35hRYK+U6GoG6SNExGvEW/LvCrvi3ulS82hZqjJOXq0Y
 rwxuM8o/oy5KPFdptSul38xiR99KV/0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1659645135;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pkigYPeUut6TdEoWnglqATIPjSyGsB2WdGd2RXHdTKk=;
 b=RAxZFFWmwcdPZNaR6QtGu1uN7jdbeIGEFNjO0HcHO/4NOhtlny2B6DzNUbDzmKc9B31G87
 TLtFmT7atz+1jkCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30F4413434;
 Thu,  4 Aug 2022 20:32:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7VYpCs8s7GLVeAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 04 Aug 2022 20:32:15 +0000
Date: Thu, 4 Aug 2022 22:32:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YuwszCiMuZj3JgYA@pevik>
References: <1659497063-2212-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1659497063-2212-2-git-send-email-xuyang2018.jy@fujitsu.com>
 <c266e389-c6f4-502f-523d-6d51fbf3ed58@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c266e389-c6f4-502f-523d-6d51fbf3ed58@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/openat: Add new regression test
 when using open(O_TMPFILE) under umask
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
Cc: brauner@kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

...
> > +static void open_tmpfile_supported(int dirfd)
> > +{
> > +	TEST(openat(dirfd, ".", O_TMPFILE | O_RDWR, S_IXGRP | S_ISGID));
> > +
> > +	if (TST_RET == -1) {
> > +		if (errno == ENOTSUP)
> > +			tst_brk(TCONF, "fs doesn't support O_TMPFILE");
> > +		else
> > +			tst_brk(TBROK | TTERRNO, "open(%d, O_TMPFILE) failed", dirfd);
> > +	}

> What if openat() returns some other negative value?
How about add ENOTSUP to safe_openat() (lib/tst_safe_file_at.c) and use SAFE_OPENAT() here?

Kind regards,
Petr

> > +
> > +	SAFE_CLOSE(TST_RET);
> > +}
...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
