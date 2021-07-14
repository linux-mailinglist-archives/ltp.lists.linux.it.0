Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 168633C862B
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 16:30:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9FDD83C865C
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 16:30:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 979043C7565
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 16:30:03 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3052E1401158
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 16:30:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9C71C22A35;
 Wed, 14 Jul 2021 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626273002;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tRXoJ6Sg0c1HBL34jNIZ+eulOrA0FQqK11DLYbEJPo0=;
 b=G3np/elQJkLa1itnsTZ28PmIas2q/TdiKtc7n3avQgJdJZTSxb/f2+gv9VRD3mrTG0GHzD
 6Sto9Wco8VzSU87glWyujymGcupV9gSzr0QcQdv0qx0cVXf/RLg31W9w3S0YqaOfs3MFTD
 W3catezpljRm99T/sD8NHymJMNHpeRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626273002;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tRXoJ6Sg0c1HBL34jNIZ+eulOrA0FQqK11DLYbEJPo0=;
 b=u8inKvYZz+owY+UhcTObiOtvyU0awFmOIe8k1e/ziPCLZhnUhWcB+R2VV+/qJaX04S3Aw4
 asptEKxP7LbWxHBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7BE1713C05;
 Wed, 14 Jul 2021 14:30:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4kvJHOr07mB2eQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 14 Jul 2021 14:30:02 +0000
Date: Wed, 14 Jul 2021 16:30:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YO706MRTx0m8r5au@pevik>
References: <20210714071158.15868-1-rpalethorpe@suse.com>
 <20210714071158.15868-5-rpalethorpe@suse.com>
 <YO7C0DgkpaUSf4Nw@pevik> <87pmvlnhnh.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pmvlnhnh.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/8] doc: Remind authors and maintainers to run
 make check
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

> Hello Petr,

> Petr Vorel <pvorel@suse.cz> writes:

> > Hi Richie,

> >> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> >> ---
> >>  doc/maintainer-patch-review-checklist.txt | 2 +-
> >>  doc/test-writing-guidelines.txt           | 1 +
> >>  2 files changed, 2 insertions(+), 1 deletion(-)

> >> diff --git a/doc/maintainer-patch-review-checklist.txt b/doc/maintainer-patch-review-checklist.txt
> >> index f6682b574..970779acc 100644
> >> --- a/doc/maintainer-patch-review-checklist.txt
> >> +++ b/doc/maintainer-patch-review-checklist.txt
> >> @@ -39,7 +39,7 @@ New test should
> >>  * Use new https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#22-writing-a-test-in-c[C API]
> >>  * Test binaries are added into corresponding '.gitignore' files
> >>  * Check coding style with
> >> -  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/scripts/checkpatch.pl[checkpatch.pl]
> >> +  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/scripts/checkpatch.pl[checkpatch.pl] and `make check`
> >>    (more in https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#131-c-coding-style[C coding style])
> > +1

> > "131" would mean section 1.3.1. If you put it into "2.1 C coding style" the link
> > should be #21-c-coding-style.

> You may want to do a quick-fix commit for that, because it is not part
> of my patch. Although I can add it ofcourse.
I'm sorry, I overlooked that it does not have ^+. Thanks for info!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
