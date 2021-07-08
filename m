Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E018D3BF8A3
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 13:02:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94C983C7931
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 13:02:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 042403C681D
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 13:02:04 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B77FB1401230
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 13:02:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DA28522191;
 Thu,  8 Jul 2021 11:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625742122;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QS7z7s3DfgqxdpZaaxfgMdsjAtgJrFcRdvRjWUatEMA=;
 b=g4JpB6PQyaM2dDAN+kPJ7ejVdnriC5i0eP5MMrwRebTa+VicV7LMjCUvzwrrYMKbkxSUkw
 5ykh5nPpzmPz7JPd3FPJ359VKFXnkp6+pNgdWnDB+eahjnPP7nQzd6gsfD5btQf4jEptw3
 dBmbE4zJmaFSQnqoSMgagmHwMO42HYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625742122;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QS7z7s3DfgqxdpZaaxfgMdsjAtgJrFcRdvRjWUatEMA=;
 b=PZZl0itiPugZinkPb7fPPHmfci9paBS967YZxVN0tRMuSNc5XuaJMCEBwFDS+kmo9yhF17
 C3Q0Y9XcwqGYHsBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 94C6213B00;
 Thu,  8 Jul 2021 11:02:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 26WxIirb5mCKNwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 08 Jul 2021 11:02:02 +0000
Date: Thu, 8 Jul 2021 13:02:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YObbKCNKUoC7lSxd@pevik>
References: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
 <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
 <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
 <CAEemH2fcubrbMpeoeSJJoZtD+xaiRrs_upG_+KQXB_8C9m3eQg@mail.gmail.com>
 <60E50AB4.7050404@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60E50AB4.7050404@fujitsu.com>
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Huanian Li <huanli@redhat.com>, Richard Palethorpe <rpalethorpe@suse.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu, all,

> Hi Li, Alexey
> > Alexey Kodanev <aleksei.kodanev@bell-sw.com
> > <mailto:aleksei.kodanev@bell-sw.com>> wrote:


> >     It's also possible that some resources will be freed during
> >     the tests... perhaps, moving the loop to verify_*() is the
> >     better option?


> > Yes, good point, that would be more precise for ENOSPC testing.
> AFAIK, ltp doesn't support parallel test now. I think parallel test 
> maybe a future plan that is why we use docparase to collect each case's 
> used resources(so we can convert many groups, like pid, memory, disk 
> space..., then we can run pid group and memory groups test case parallelly).
Yes, parallel support is not supported atm. Richie and Cyril has done some work
on runltp-ng to support it. Yes, first it's needed to add support in resources
(docparse), see Cyril's old block post [1].

Kind regards,
Petr

[1] https://people.kernel.org/metan/towards-parallel-kernel-test-runs

> This is my understanding. If wrong, please correct me.

> Best Regards
> Yang Xu


> > --
> > Regards,
> > Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
