Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF743A9C21
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 15:39:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7BC193C62CD
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 15:39:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E8D003C2174
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 15:39:19 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 394BB1000F5F
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 15:39:18 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6F67D1FD49;
 Wed, 16 Jun 2021 13:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623850758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PfEp8WexBmIufY6f7egkwllMGA7HZYfxN+wNFcNt3Zg=;
 b=DoBbMn//7XpFMiJPTFqCvX+lNBMAmSVkWIC5LIehV2PXL6kd8QCwtEg429qB3Y+RsdrqFe
 MVYDCrMsZ2CPHAaMTE9L8eNlxveKewZJTmeRb8ymzkEfCwK+Px5Z6kbkLhKlhfmEEiLB5N
 693hTUsDHAcA2lH7vZUYrqGj+bDxFW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623850758;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PfEp8WexBmIufY6f7egkwllMGA7HZYfxN+wNFcNt3Zg=;
 b=FDebN4LS1xCh44FAiIgJSJM6Kb0UN+2QEIPA9Vgc1I9rVPMg/rLeJvzNFiXIJJhCyPJbRI
 zJVSbtF2jtU0S7BA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 4FAF3118DD;
 Wed, 16 Jun 2021 13:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623850758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PfEp8WexBmIufY6f7egkwllMGA7HZYfxN+wNFcNt3Zg=;
 b=DoBbMn//7XpFMiJPTFqCvX+lNBMAmSVkWIC5LIehV2PXL6kd8QCwtEg429qB3Y+RsdrqFe
 MVYDCrMsZ2CPHAaMTE9L8eNlxveKewZJTmeRb8ymzkEfCwK+Px5Z6kbkLhKlhfmEEiLB5N
 693hTUsDHAcA2lH7vZUYrqGj+bDxFW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623850758;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PfEp8WexBmIufY6f7egkwllMGA7HZYfxN+wNFcNt3Zg=;
 b=FDebN4LS1xCh44FAiIgJSJM6Kb0UN+2QEIPA9Vgc1I9rVPMg/rLeJvzNFiXIJJhCyPJbRI
 zJVSbtF2jtU0S7BA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id WxQMEgb/yWBoPwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 16 Jun 2021 13:39:18 +0000
Date: Wed, 16 Jun 2021 15:13:38 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YMn5AvbsDDV8ojWu@yuki>
References: <20210616093606.214856-1-xieziyao@huawei.com>
 <20210616093606.214856-3-xieziyao@huawei.com>
 <YMnk5QUhwnOHrWLi@yuki>
 <8f8852e0-eed3-f7ae-744e-db48724e9b02@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f8852e0-eed3-f7ae-744e-db48724e9b02@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] syscalls/getrusage: Cleanup and bugfix for
 getrusage03
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Same with lib: tst_process_state: Add tst_process_release_wait().
> 
> If we call the signal(SIGCHLD,SIG_IGN), the SIGCHLD signal is ignored by 
> the system. Thus, no zombie is created before the child is terminated. 
> The logs are as follows:
> 
> getrusage03.h:27: TINFO: allocate 400MB
> getrusage03.c:39: TPASS: check that initial.children ~= pre_wait.children
> getrusage03.c:39: TPASS: check that post_wait.children ~= 400MB
> getrusage03.h:27: TINFO: allocate 500MB
> getrusage03.c:123: TBROK: Failed to open FILE '/proc/84598/stat' for 
> reading: ENOENT (2)
> 
> So I write TST_PROCESS_RELEASE_WAIT() here to check /proc/$PID.

Ah right, reading the documentation if parent ignores sigchild the child
is discarded and there is no trace of it on the system once it returns
from main().

So I guess that we should add a function that checks that a given pid is
present on a system but there is simpler interface for this, if you do
kill(2) with signal == 0 it returns with with errno set to ESRCH if the
pid is no longer present on a system.

Also I'm not sure if release is right word here, maybe it would better
describe the action if the function name was tst_process_exit_wait().

> I noticed that some safe_ micro checks tst_test->forks_child or other 
> tst_test->xx, while tst_test is not defined in some functions with 
> #define TST_NO_DEFAULT_MAIN.

Ah right, I guess that in a case of fork() and clone() calls it would be
easier not to use SAFE_MACROS() for processes that have been started by
exec().

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
