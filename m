Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F75414529
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Sep 2021 11:31:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A2393CA200
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Sep 2021 11:31:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 387643C2178
 for <ltp@lists.linux.it>; Wed, 22 Sep 2021 11:31:26 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 72E8D600D71
 for <ltp@lists.linux.it>; Wed, 22 Sep 2021 11:31:25 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9DE5F2221E;
 Wed, 22 Sep 2021 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1632303084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a5qn7Ou8ETrK5P0Z+VtsgNtYkBYTYetzuA57RUPPEMY=;
 b=ZxiAzWZTWpicfbK0VIIAjDwnay2P/OmbaUtk8jq+zFSgZjm5Oiw4T+3DVelmS/hi/9AyoU
 uqMhr+QpVmCmQo4H0yG9t8+o/z1cvPH3A2Hrph48nUjzGPLzZbg5q0Cl40loS7NAdx8jkN
 dGS1lGUtOtNrisZpEBeSI/fm2Qx/S9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1632303084;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a5qn7Ou8ETrK5P0Z+VtsgNtYkBYTYetzuA57RUPPEMY=;
 b=F3WBLwLgrU2P5Ru52/cEf70xpis9gS2+ho/N5/d25Z53UYQcwaWPBrTGXRyfFGiuOTvQSl
 fsHcDDUQ0MOOrFAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4BFC813D6E;
 Wed, 22 Sep 2021 09:31:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8dcuEez3SmEINQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 22 Sep 2021 09:31:24 +0000
Date: Wed, 22 Sep 2021 11:31:55 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YUr4C3VOYI4qtS/F@yuki>
References: <20210920122146.31576-1-chrubis@suse.cz>
 <CAEemH2eRgUDNLmmzNF5cDaAXp7kMgPOBHeJeWqyStOiAq7QLHw@mail.gmail.com>
 <YUnCYvtAZkO/LZIP@yuki>
 <CAEemH2e0kHun++Y2w99N68WAhjFdQkSvkF-1UaDxjbkA1sBrAw@mail.gmail.com>
 <YUrxJfAOO3+B8//7@yuki>
 <CAEemH2d=+h1k62SnVY8Rh=c0UGGEvvTQieW3YgUq8j2Mg6UW=g@mail.gmail.com>
 <YUr1ga3JSak7Gfry@yuki>
 <CAEemH2etot5qBfTWkk3JqRZ1ywTo75M7Vu-ZhXvnQgVqcZovBw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2etot5qBfTWkk3JqRZ1ywTo75M7Vu-ZhXvnQgVqcZovBw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lib: shell: Fix timeout process races
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > Agreed, that sounds like a great method.
> >
> > Should I send v3 or can I commit v2 with this change?
> >
> 
> V3 please, I will help test it all.

Ok, will send ASAP.

> I just think of setsid(), is that works and better than setpgid(0, 0)?

For moving the process out of the process group setpgid() is enough, we
use it in the lib/tst_test.c for the fork_testrun() in order to track
all children of the test process as well.

I do not think that we need a new session here, that would probably have
strange side effects, for instance it would isolate the tst_timeout_kill
process from the terminal the tests were started in.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
