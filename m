Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8806A7901F2
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Sep 2023 20:16:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 925E83CE041
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Sep 2023 20:16:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E95AA3CBC5F
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 20:16:48 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 086082009A8
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 20:16:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 93957211CE;
 Fri,  1 Sep 2023 18:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1693592206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SczNKaVL1iGLO0+CrAmVKlavPYKq/W/vUS1YtqrLUeA=;
 b=NS3n//SRONg/+5qwYUhU4v7EUfrYcHS6eBYWOfvhso+oKNwFKksOfTgCDTeUIwMwHBARnp
 h1kOIlxIZBBWNKUMr0xYYqdxJc0gMN5wN9x/5STfYZ9uxO/yoUn9xrkqTnz3rJBHn4KAsg
 j+mh+pMUG2KR/j5O0vh0nWMcsmSYzwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1693592206;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SczNKaVL1iGLO0+CrAmVKlavPYKq/W/vUS1YtqrLUeA=;
 b=fMrgFtVvLdrPEqKIjJoDzcyLZuWrTbedHnbRrE/d58/WtNZWw5CYV+ftwQ2YFYm7xjUrAR
 N+pdmTTHgDR6UnCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77D1B13582;
 Fri,  1 Sep 2023 18:16:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +z3/G44q8mQ5SwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 01 Sep 2023 18:16:46 +0000
Date: Fri, 1 Sep 2023 20:17:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZPIqsmTbJh7z-LcO@yuki>
References: <20230901154355.5351-1-chrubis@suse.cz>
 <20230901174529.GB364687@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230901174529.GB364687@pevik>
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] sched/rt: Disallow writing invalid values to
 sched_rt_period_us
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
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Valentin Schneider <vschneid@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Documentation/scheduller/sched-rt-group.rst [1] specifies this as values from -1 to
> (INT_MAX - 1), I guess due int range. Looking into proc_dointvec_minmax() [2]
> even INT_MAX would pass the check. I suppose we can do nothing about that,
> because there is no value in sysctl_vals[] which would represent INT_MAX - 1.
> 
> And you specify in LTP test range: from -1 to INT_MAX.
> 
> But even much shorter value than INT_MAX fails:
> 
> $ echo 1234567 > /proc/sys/kernel/sched_rt_runtime_us
> sh: echo: write error: Invalid argument

That is because runtime_us must be < period_us by definition, since
runtime_us defines how much time is allocated from the period_us. I
guess that this is not described good enough in the kernel docs.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
