Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A16C39BB0F
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 16:43:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B4C13C7FDA
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 16:43:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9536E3C27F0
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 16:43:37 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 774362010E7
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 16:43:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D7E521FD4A;
 Fri,  4 Jun 2021 14:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622817815;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C9IQaPVJ8qPKC1XZoT1pFyeYPG5TgWB27CHSJMYtKUs=;
 b=CmFy8osqW13GT3/Ar6jtYtB0zI/icRM9/87PlRIA9XltnIO7U0sHPPXIumckMJ1vXW0Pov
 tUCvshPfO7JYarEbwIbzaqpLMMmCciiehSnBiUO2gGLRDUtU2CBN0arsXXP2Aa6kzX/U82
 NDr411HzUwQWVA/rVYrA5aBm3pnVRZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622817815;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C9IQaPVJ8qPKC1XZoT1pFyeYPG5TgWB27CHSJMYtKUs=;
 b=61Nr2DhOAzKwhPZ9btV9bJxLJ8oT8C6vECQz2mpjglPC2KpyhSjewsAQAvBOXMju50YlTn
 7gZLYvzibJQtTSAA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5E9A9A3B85;
 Fri,  4 Jun 2021 14:43:35 +0000 (UTC)
References: <20210603183827.24339-1-pvorel@suse.cz>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <20210603183827.24339-1-pvorel@suse.cz>
Date: Fri, 04 Jun 2021 15:43:34 +0100
Message-ID: <87wnr9itbd.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 0/3] build: make check target
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
Reply-To: rpalethorpe@suse.de
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Petr,

Petr Vorel <pvorel@suse.cz> writes:

> Hi,
>
> actually, there are 3 targets: check, check-c, check-shell.

Usually, if you only want to make a sub group of tests. Then you cd into
the sub directory and do 'make'.

So why do we need three targets?

Just an idea, but maybe in a future patch this could run some actual
tests as well? A lot of the old syscall tests would be fine to run in
CI. More likely if they fail it is due to LTP library changes than a
kernel bug on the host.

>
> Previous attempt: make: Add make check target + run.sh [1].
> This is built on the top of patchset tst_net.sh: Allow to skip
> initialization [2]. Hope this time library check will made it :).
>
> I plan to wrap tests with a script in the future, which will parse
> expected output, i.e. approach from #312 [3].
>
> It's not ready due several problems, but for curious here is a test run:
> https://github.com/pevik/ltp/runs/2739826773
>
> 1) I made something wrong, I have no idea how to fix this error:
> make[1]: Entering directory 'ltp/lib'
> ../include/mk/generic_trunk_target.inc:105: warning: overriding recipe for target 'check-c'
> ../include/mk/generic_leaf_target.inc:110: warning: ignoring old recipe for target 'check-c'
> ../include/mk/generic_trunk_target.inc:105: warning: overriding recipe for target 'check-shell'
> ../include/mk/generic_leaf_target.inc:118: warning: ignoring old recipe for target 'check-shell'
>
> 2) I obviously have problem with out-of-tree build
> https://github.com/pevik/ltp/runs/2739826612?check_suite_focus=true
> where path of shell tests (which are in src directory only) is obviously
> broken:
> make[2]: *** No rule to make target 'shell/tst_check_driver.sh', needed by 'check-shell'.  Stop.
> 20
> make[1]: *** [/__w/ltp/ltp/include/mk/generic_trunk_target.inc:105: check-shell] Error 2
> 21
> make[1]: Leaving directory '/__w/ltp/ltp-build/lib'
>
> 3)  tst_bool_expr fails on some systems when run via make check:
> https://github.com/pevik/ltp/runs/2739826773?check_suite_focus=true
> But it runs ok when running normally. It might be dash issue
> (it's on Debian).
>
> Kind regards,
> Petr
>
> [1] https://patchwork.ozlabs.org/project/ltp/patch/20190924182841.4528-1-pvorel@suse.cz/
> [2] https://patchwork.ozlabs.org/project/ltp/list/?series=247078
> [3] https://github.com/linux-test-project/ltp/issues/312
>
> Petr Vorel (3):
>   make: Add make check{,-c,-shell} targets
>   build.sh: Add support for make check
>   CI: Run also make check
>
>  .github/workflows/ci.yml            |  3 +++
>  Makefile                            | 21 ++++++++++++++++++++-
>  build.sh                            | 18 +++++++++++++++++-
>  include/mk/generic_leaf_target.inc  | 25 ++++++++++++++++++++++---
>  include/mk/generic_trunk_target.inc |  4 ++--
>  lib/newlib_tests/Makefile           |  8 ++++++++
>  6 files changed, 72 insertions(+), 7 deletions(-)
>
> -- 
> 2.31.1


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
