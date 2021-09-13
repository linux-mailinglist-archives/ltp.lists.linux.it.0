Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F30E408564
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 09:31:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5797A3C8A74
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 09:31:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 49A973C1DC0
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 09:31:33 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AA1B71000D09
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 09:31:32 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A3E6421F95;
 Mon, 13 Sep 2021 07:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631518291;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/ss3h6pW+q+unN2XCYFs+Lvj1kqqRD0KQLZqmzUK2U=;
 b=o1ccTSxQj97DCQR4LCj0nyG5HhegL3yn39WkYf+3zjSPZd28Jq3AyDhxvQYvt4Krd6NmA7
 jNPCFt9x7teDddBn30/8HQzDO8iv0lXLufRsOTfwevtYtEDMHNmw5DI8h2kG+4mF17VScb
 4DjXtQZ4ONKSphcuD7Zd2Nyrhuolw2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631518291;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/ss3h6pW+q+unN2XCYFs+Lvj1kqqRD0KQLZqmzUK2U=;
 b=YGhsv+JIQxRWyoZVR/FNwtsgIxM7nQ7TTKabFEDa04wfuiJwMShRXvXvGsTJGnFO3VS83c
 xs0U40+UsZTqn7Dw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 77AA6132AB;
 Mon, 13 Sep 2021 07:31:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id R8z/GlP+PmEzAQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 13 Sep 2021 07:31:31 +0000
Date: Mon, 13 Sep 2021 09:31:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YT7+UU1d3llds9br@pevik>
References: <20210910130820.21141-1-pvorel@suse.cz>
 <CAEemH2evPtStSndYb0viwt-+x+g4dB3FER366_KEjcRUn7pWYg@mail.gmail.com>
 <YT7wZrmi8Jc0YHfL@pevik>
 <CAEemH2cO31kSwK3=tk6krB8ZZYPPaP+c-+5D7FGRK2ofYSmbtg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cO31kSwK3=tk6krB8ZZYPPaP+c-+5D7FGRK2ofYSmbtg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/7] Cleanup sched/process.c
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> > > But I just wondering, is there a run test file to perform this test case?
> > > I greped the runtest/* but find no file currently includes this:(.

> > IMHO it's in sched:
> > $ git grep -w process runtest/
> > runtest/sched:hackbench01 hackbench 50 process 1000


> Hmm, here "process" is only a parameter to hackbench01, it
> has no direct relevance to the process_stress/process.c.

> After checking the history a while, I think that process_stress/process.c
> is an independent test and obsoleted for a quite long time, maybe
> we can add online back to runtest/sched file or just let is there until
> someone converting to the new API.

> commit 576f1ee560b2370818b49366bad581952af3dd70
> Author: robbiew <robbiew>
> Date:   Fri Feb 1 16:39:39 2002 +0000

>     Removed a test that was not correctly running.

Ah, good catch! I didn't check it's not a binary which would be required.
I'll recheck it once again and send a patch to remove it then.

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
