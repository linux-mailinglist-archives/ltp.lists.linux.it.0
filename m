Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 464223F0125
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 12:01:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0CB063C55AA
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 12:01:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 593023C1B12
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 12:01:38 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 229451000D28
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 12:01:37 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7490D2206A;
 Wed, 18 Aug 2021 10:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629280897;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=90xhEiiDBMEHlG0zmhRG1+MklxVLfMXLI30ktxYtu2k=;
 b=L9n3+LOQBO11hdUCTjEyAuY5mXAwU8qRZT7hQ+zzNdMgeJDmq4FX4Yq9S8opPL0uPHkp3a
 KK6IJcK50z41wG7Ycdg88UQZntGfKXDF04ci8rwFtM83UL30IltsJi+5qeEJS0tOYTROUq
 MPw8Of1xi2ceKcoxM01jdc7OZMR2I1E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629280897;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=90xhEiiDBMEHlG0zmhRG1+MklxVLfMXLI30ktxYtu2k=;
 b=y+7UDCIAu4E7Ah5EBqIt6Og+uZK9lrA1bTMwya+tVkWPbvzcw0sxvVzHZ6XW1uilUsN9wG
 tlpHEbMWxSNk47AQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4E56813651;
 Wed, 18 Aug 2021 10:01:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id W9uGEYHaHGHcIwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 18 Aug 2021 10:01:37 +0000
Date: Wed, 18 Aug 2021 12:01:35 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YRzaf3jq02zM306Y@pevik>
References: <20210818091224.27578-1-pvorel@suse.cz>
 <20210818091224.27578-4-pvorel@suse.cz>
 <8589e81b-4c45-e62e-297a-ef6a3cd548dc@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8589e81b-4c45-e62e-297a-ef6a3cd548dc@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] commands: Drop which01.sh
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> Hi Petr,

> On 8/18/2021 11:12 AM, Petr Vorel wrote:
> > "which" has been discontinued after 2.21 release in 2015 due this (git
> > repository is empty [1]).
> I am a bit against dropping this. which is widely used and I think as long
> as it is available, it should behave as expected.
First, thanks for your review of all patchset.

I should have marked this commit as RFC. I have no problem to postpone
deleting this test fairly long time (even for 1-2 years).

But, if we really want to test basic shell commands (IMHO they should be part of
particular shell implementation code and most of these projects have it: e.g.
bash, busybox, coreutils, util-linux, ...), in this particular test it'd be more
useful to test "type" or "command" than "which", which code hasn't been changed
since 2015. Looking into openSUSE code [1], there is no patch on "which"
command.

Also, I might be a bit too aggressive when removing tests for legacy code, but
in this case Debian has deprecated "which" from it's basic tools [2], proving
there is a push to use "type" / "command -v" at least in some distros.

Kind regards,
Petr

[1] https://build.opensuse.org/package/show/Base:System/which
[2] https://salsa.debian.org/debian/debianutils/-/commit/3a8dd10b4502f7bae8fc6973c13ce23fc9da7efb

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
