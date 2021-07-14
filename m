Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D83C3C823E
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 11:59:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 90CE43C866C
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 11:59:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A06723C562F
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 11:58:59 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3752314010FF
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 11:58:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78260229FC;
 Wed, 14 Jul 2021 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626256738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NiHPZOvmmkCVMs0bU5QLD7im7CSf8tA5icUktdZHw4Q=;
 b=26TA8F1hrYZUjowotJD2dNqMc5AD+DI0X2JylDIe6p6g6ZMJBu16T8pvosOSt+GGk+e1Ro
 58FUc/rHPKTpeJAlf+xiTPBpNDA5StBn1WHCqjC6W+G9uO7IHpRSuRgUaa6Kgx2f5kYXiq
 1pMnPow+utbEjHyhjBCTnxCdiW3HRIM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626256738;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NiHPZOvmmkCVMs0bU5QLD7im7CSf8tA5icUktdZHw4Q=;
 b=G8UAISf3EMI6ylGPgLyPGjoT8XUuHskC6GOoukm+RZQmkCQvyZe0/gAWNADR1fDr0mHyKA
 g06F0AAm5iE595Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A87A13BFB;
 Wed, 14 Jul 2021 09:58:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /JGAFmK17mAkKQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 14 Jul 2021 09:58:58 +0000
Date: Wed, 14 Jul 2021 11:33:24 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YO6vZDRj4C15sg7K@yuki>
References: <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
 <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
 <CAEemH2fcubrbMpeoeSJJoZtD+xaiRrs_upG_+KQXB_8C9m3eQg@mail.gmail.com>
 <60E50AB4.7050404@fujitsu.com> <YObbKCNKUoC7lSxd@pevik>
 <YObpRzTjx8T2GAZn@yuki> <60EBA9C3.4050103@fujitsu.com>
 <c81eee80-6cea-de14-aeff-8919495c4396@bell-sw.com>
 <YOwASqNKNXBl4lqe@pevik>
 <0b622e21-453c-5dc2-214e-c9c0a5d48f44@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b622e21-453c-5dc2-214e-c9c0a5d48f44@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
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
Cc: Huanian Li <huanli@redhat.com>, Richard Palethorpe <rpalethorpe@suse.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> Perhaps it can be done at the higher level, e.g. in the ltp tests
> >> runner if some tests request it with a newipc flag...
> > Well, we have at least two runners (runltp which uses ltp-pan, runltp-ng) and we
> > also support running tests without runner, it'd be nice to solve this in LTP
> > API.
> 
> I didn't mean these runners, I was thinking about fork_testrun() in tst_test.c.

We will need to have some kind of flag that would tell the testrunner
that the test is using/modifying SysV IPC anyways as without namespaces
these tests cannot run in parallel at all.

So I would say that we should:

* Write these tests in a way that they expect that they are the only
  process that modifies these resources during the testrun

* Mark all these tests with .sysv_ipc flag in the tst_test structure

* Then we can easily add support for running them in a separate
  namespace in the test library

Does that sound reasonable?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
