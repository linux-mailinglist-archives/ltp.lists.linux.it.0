Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 580DB47C598
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Dec 2021 18:56:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EAE6A3C9278
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Dec 2021 18:56:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7486C3C0CF0
 for <ltp@lists.linux.it>; Tue, 21 Dec 2021 18:56:18 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AFC8A601EB4
 for <ltp@lists.linux.it>; Tue, 21 Dec 2021 18:56:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4C5E221109;
 Tue, 21 Dec 2021 17:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1640109376;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5jr9s1d+bSN1u/PoUREMaR/KxKFloa3hEoM8v700/24=;
 b=bpmMy6/MQk1rBaV287UWN1xg6n+hdY+5be9fZ4begTO6CTBFfDY/DnDAM69597N86Ku60O
 KIT4Yc87VzTbRsjM785KfwT1ziWNUcwafRxr2gVR4V/ibN0DkEpxUfDI6LBsgtoCffe8ta
 jnzNT2AQkIjJr/xPhxJytY+hswipzHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1640109376;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5jr9s1d+bSN1u/PoUREMaR/KxKFloa3hEoM8v700/24=;
 b=azXwPmTyotKbRzpkrsF75EpvK7rKH40LSTMU4fG8nCcLY25hjvBHl513FYlxjtwz0BrlD8
 9wyNY2Opzsm5wCAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B31B113425;
 Tue, 21 Dec 2021 17:56:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OSDFJz8VwmEvIAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 21 Dec 2021 17:56:15 +0000
Date: Tue, 21 Dec 2021 18:56:13 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YcIVPdcjt8javBGv@pevik>
References: <20211220180748.36A90A3B8E@relay2.suse.de>
 <20211221113042.21357-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211221113042.21357-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] API: Allow testing of kernel features in
 development
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
Cc: ltp@lists.linux.it, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

i all,

[ Cc automated-testing and people who might be interested ]

> Add an unstable kernel ABI flag and a runtest file for unstable
> tests. This means we can add tests which are likely to be broken by
> changes in the kernel ABI. Without disrupting LTP releases which are
> required to be stable.

> Users who require stability can filter the tests with this flag
> or not schedule the unstable runtest file(s).

I'm ok for this from a long term perspective, because agree Richie it can help
people to run tests on kernel from next tree or mainline rc kernel).

It's not much work to maintain this.

It'd also help people writing tests for  fanotify and IMA not having wait
several weeks.

Yes, we could add it to fanotify22 [1], but not to ima_conditionals.sh [2],
which is shell. But adding support to shell is trivial.

Acked-by: Petr Vorel <petr.vorel@gmail.com>

....
> +++ b/runtest/syscalls-unstable
How about having name syscalls-next? Although there can be tests which are from
some kernel maintainer tree (it does not have to be limited to next tree),
unstable can mean "tests which aren't fixed yet and thus buggy".
> @@ -0,0 +1,3 @@
> +# Tests for kernel features which are not finalized
> +
> +fanotify22 fanotify22

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/list/?series=272782
[2] https://patchwork.ozlabs.org/project/ltp/list/?series=265664

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
