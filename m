Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 654F379097F
	for <lists+linux-ltp@lfdr.de>; Sat,  2 Sep 2023 22:22:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F054E3CC2DB
	for <lists+linux-ltp@lfdr.de>; Sat,  2 Sep 2023 22:22:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 929E53CBA35
 for <ltp@lists.linux.it>; Sat,  2 Sep 2023 22:22:17 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D72F1200078
 for <ltp@lists.linux.it>; Sat,  2 Sep 2023 22:22:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9929D1F385;
 Sat,  2 Sep 2023 20:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1693686135;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K3V4+tJ8iZkq5pdmvFAYXipZkqIlqMU2Z13b7c9+Pio=;
 b=Hhn7++5C+jcS2+Fg3jtpIzFUtQZlHWaaB9yoElRY9JSXCQZSE7hKYO+dbMpTglqSiB81LQ
 mh26Vy0dM8GrcQBURr6unMKY/Dl/tfhKuqgjpbPmCT1EYc7zKYBZc9ZYcHsD2GdQPPDPCx
 AgVd1I8bsbNvcM2xw5U9b3Wl/DfWFRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1693686135;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K3V4+tJ8iZkq5pdmvFAYXipZkqIlqMU2Z13b7c9+Pio=;
 b=N1gHEAcMhHkDLwQTo/RjLi8kizoQUqkSGYDtWH4exbASX75nV6/wY+tSTDra0GDr6KU9Sf
 66tGAsBM5RAY6VDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1060813440;
 Sat,  2 Sep 2023 20:22:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id I15rAneZ82QxAgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Sat, 02 Sep 2023 20:22:15 +0000
Date: Sat, 2 Sep 2023 22:22:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20230902202213.GA418654@pevik>
References: <20230901154355.5351-1-chrubis@suse.cz>
 <20230901174529.GB364687@pevik> <ZPIqsmTbJh7z-LcO@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZPIqsmTbJh7z-LcO@yuki>
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
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
Reply-To: Petr Vorel <pvorel@suse.cz>
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

> Hi!
> > Documentation/scheduller/sched-rt-group.rst [1] specifies this as values from -1 to
> > (INT_MAX - 1), I guess due int range. Looking into proc_dointvec_minmax() [2]
> > even INT_MAX would pass the check. I suppose we can do nothing about that,
> > because there is no value in sysctl_vals[] which would represent INT_MAX - 1.

> > And you specify in LTP test range: from -1 to INT_MAX.

> > But even much shorter value than INT_MAX fails:

> > $ echo 1234567 > /proc/sys/kernel/sched_rt_runtime_us
> > sh: echo: write error: Invalid argument

> That is because runtime_us must be < period_us by definition, since
> runtime_us defines how much time is allocated from the period_us. I
> guess that this is not described good enough in the kernel docs.

Thanks for clarification. +1 for docs update.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
