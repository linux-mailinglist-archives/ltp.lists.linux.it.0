Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A587603AF8
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Oct 2022 09:53:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA2FF3CB105
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Oct 2022 09:53:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 507373CAFE9
 for <ltp@lists.linux.it>; Wed, 19 Oct 2022 09:53:40 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7C2141400B78
 for <ltp@lists.linux.it>; Wed, 19 Oct 2022 09:53:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5C7E43398E;
 Wed, 19 Oct 2022 07:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1666166019;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fx7/+pWFkyczeOmjRTicDcJp7cgRU2eLbbKbrWnQZLs=;
 b=XuHOSBigW1skDNGe1HgH2cpEbehOWbWQiEbsiblmqWMUE8L8vEwpczVZoXISsQCyS1lVQz
 tx+apAV8xl+ddBu6J0PIWLSlQvMuu2tHAFY9MsV1widN/QeUoSt3pQMT/RK6LdXd+Yp6yB
 yzxCpvv1TfxYJz8V/FEfxJi7HmM1w7s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1666166019;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fx7/+pWFkyczeOmjRTicDcJp7cgRU2eLbbKbrWnQZLs=;
 b=WIsFJ2R0DBpTzDFWc0aVcdyCvDU26X+mOtEJUbsPPADFOcvLg6PXG5Xn3uLlCpxrEcWOSh
 b32S61qELvwI2gAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CC6813A36;
 Wed, 19 Oct 2022 07:53:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id X1lvCQOtT2MTSwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 19 Oct 2022 07:53:39 +0000
Date: Wed, 19 Oct 2022 09:53:37 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <Y0+tAYbSdXod1tfY@pevik>
References: <1663208146-5239-1-git-send-email-liaohj.jy@fujitsu.com>
 <87czaqob6v.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87czaqob6v.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fork02: Remove it
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

Hi Liao, Richie,

> > ---
> >  testcases/kernel/syscalls/fork/fork02.c | 99 -------------------------
> >  1 file changed, 99 deletions(-)
> >  delete mode 100644 testcases/kernel/syscalls/fork/fork02.c

fork02 entry was left in runtest/syscalls and
testcases/kernel/syscalls/fork/.gitignore.

Not a big deal, I fixed it in 747cd665d. FYI you can use this checklist
(not just reviewers, but also patch authors):
https://github.com/linux-test-project/ltp/wiki/Maintainer-Patch-Review-Checklist

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
