Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1053D3A23
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 14:24:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E0FD3C6FF6
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 14:24:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 92AAA3C58B2
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 14:24:19 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 03BA61A00359
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 14:24:18 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D806B1FFA3;
 Fri, 23 Jul 2021 12:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627043057;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8pjOmQz8BWDpHnLXmLkmkHAjxUn/r4Cgckb0NquTd7c=;
 b=2rmfm3kkw90R8RZyPDcb7buoEg2wkeUp6f+iTmHwt/ZsvzFs1hheHyZdhZ6BVMllrHdh/4
 /Lo8jgKM4IwjV/Ia8eNGuCErKUFrYCVMKv32c45eLDBOY3JHcjUhcltk1iGXaQx0y/GNzp
 YGEoC9vCBuxtV9NimaPINbhMpzI/fWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627043057;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8pjOmQz8BWDpHnLXmLkmkHAjxUn/r4Cgckb0NquTd7c=;
 b=HbxNyJWwAEjQL5KclPbTVna+m2804/k88dvhf2jf5lBlxSe41z9eSP/HxsNJ6CoL/5Axo6
 D9Q7auawwYNmr3Dw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id ADB4413697;
 Fri, 23 Jul 2021 12:24:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id czK5KPG0+mC9EwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 23 Jul 2021 12:24:17 +0000
Date: Fri, 23 Jul 2021 14:24:15 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YPq0749ZnnGsAV2q@pevik>
References: <20210712075223.10682-1-aleksei.kodanev@bell-sw.com>
 <20210712075223.10682-2-aleksei.kodanev@bell-sw.com>
 <YPkkZ0Zq9DyHKBaT@pevik> <YPlhMeRRsNnemT05@yuki>
 <YPlsK8fsMI8T+H7c@pevik> <YPlsVD2gbIiX8JJk@yuki>
 <60FA81E4.3060709@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60FA81E4.3060709@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] msgget03: don't depend on existed shared
 resources
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Hi Cyril, Petr
> > Hi!
> >>> I think that we allready discussed this in another thread:

> >>> https://lists.linux.it/pipermail/ltp/2021-July/023831.html

> >> Thanks, I forgot this. In that case my approach (not using<=, but count
> >> segments in /proc/sysvipc/shm before testing) might be more precise.
> >> But no strong feeling about that, both solutions fix the test, let's chose one
> >> and merge.

> > As I said previously, there are many SysV IPC tests that do expect that
> > nobody will add/remove IPC shm/queue/semaphores during the testrun and
> > some of the testcases cannot even be implemented without this
> > expectation.

> > Hence I wouldn't complicate the test here and just count how many
> > segments are there at the start and be done with it.
> Agree.

> A possible solution(alter get_used_queues api in new ipc lib and add 
> file parametrers, so we can use this api for msgget03) I have mentioned 
> in the previous email, the url as below:
> https://lists.linux.it/pipermail/ltp/2021-July/023653.html
LGTM. Or use /proc/sysvipc/shm instead of /proc/sysvipc/msg in get_used_queues()
as you noted get_used_queues() has not been used yet.

BTW searching where get_used_queues() appeared, I see [LTP] [PATCH v3 1/4]
syscalls/ipc: add newipc library for new API [1], but if I'm not mistaken
get_used_queues() was not used even there, maybe it was in some previous
versions.

Kind regards,
Petr

[1] https://lists.linux.it/pipermail/ltp/2016-December/003239.html

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
