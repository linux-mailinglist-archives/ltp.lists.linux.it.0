Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 797706EF98F
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Apr 2023 19:42:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 672503CDE2C
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Apr 2023 19:42:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4CEA03CB653
 for <ltp@lists.linux.it>; Wed, 26 Apr 2023 19:42:55 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AC54A10009EF
 for <ltp@lists.linux.it>; Wed, 26 Apr 2023 19:42:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 75AA31FDD6;
 Wed, 26 Apr 2023 17:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1682530973;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LTUkzilxp2Tf3FT5/MsOuGOHHwxgd7GgTNhhEQ0D29w=;
 b=pXdqe/B/yvsrMUlR9+2G77Qp5jEly0Acrivu3e3ewu83DKiAOA9xfvC3jfzFCc7yiZMDEr
 26FO9FWE+1i/NqC+CLfrAhAeWpS0wNT4AW7tzPa1ixhFFgeOsNOxC06aKAM9T/CYJnO7up
 VxV/HYBfUZ9+DJKpdlRZvXkipzaGF6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1682530973;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LTUkzilxp2Tf3FT5/MsOuGOHHwxgd7GgTNhhEQ0D29w=;
 b=+luw71MyZtxmMqMxvfjoW7jZTAT87zgTk+2sUTV9hnujK3nyxRQFq/21OvspLXnc9jmk1Q
 r1bIGUtKYR7w9NBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BCACE138F0;
 Wed, 26 Apr 2023 17:42:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id giiPKZxiSWQ2TQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 26 Apr 2023 17:42:52 +0000
Date: Wed, 26 Apr 2023 19:43:02 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, NeilBrown <neilb@suse.de>,
 ltp@lists.linux.it
Message-ID: <20230426174302.GB3089461@pevik>
References: <20230412082115.1990591-1-pvorel@suse.cz> <ZEfRrOpPwkLuBQw5@rei>
 <20230425134845.GA3014439@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230425134845.GA3014439@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] nfs/nfs08.sh: Add test for NFS cache
 invalidation
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
Cc: linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> > Hi!
> > > v4 [1] of not yet upstreamed patch accidentally broke cache invalidation
> > > for directories by clearing NFS_INO_INVALID_DATA inappropriately.
> > > Although it was fixed in v5 [2] thus kernel was not actually broken,
> > > it's better to prevent this in the future.

> > > [1] https://lore.kernel.org/linux-nfs/167649314509.15170.15885497881041431304@noble.neil.brown.name/
> > > [2] https://lore.kernel.org/linux-nfs/167943762461.8008.3152357340238024342@noble.neil.brown.name/

> ...
> > > --- /dev/null
> > > +++ b/testcases/network/nfs/nfs_stress/nfs08.sh
> > > @@ -0,0 +1,20 @@
> > > +#!/bin/sh
> > > +# SPDX-License-Identifier: GPL-2.0-or-later
> > > +# Copyright (c) 2023 Petr Vorel <pvorel@suse.cz>
> > > +# Test reproducer for broken NFS cache invalidation for directories.
> > > +# Based on reproducer from Neil Brown <neilb@suse.de>
> > > +
> > > +TST_TESTFUNC="do_test"
> > > +
> > > +do_test()
> > > +{
> > > +	tst_res TINFO "testing NFS cache invalidation for directories"
> > > +
> > > +	touch 1
> > > +	EXPECT_PASS 'ls | grep 1'
> > > +
> > > +	touch 2
> > > +	EXPECT_PASS 'ls | grep 2'
> > > +}

> > I do not get how this actually detects case invalidation, it probably
> > does, but slightly better description how this actually excercises the
> > case would help.

> The behavior is:

> "touch 1" asks for data invalidation (new file created), therefore following ls
> (EXPECT_PASS 'ls | grep 1') fills the cache.  "touch 2" should again ask for
> data invalidation, but it the unfixed v4 version of the patch it did not
> resulted to cache invalidation.  Therefore second ls (EXPECT_PASS 'ls | grep 2')
> shows just 1, but not 2. i.e. in the affected kernel only second ls failed,
> but obviously both should be checked (nobody knows how another bug on cache
> invalidation will behave).

> I can add the description above to the commit message and adjust the comment in
> the file.

Merged with the updated description.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
