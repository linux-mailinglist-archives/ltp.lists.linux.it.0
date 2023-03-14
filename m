Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 835646B95CE
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Mar 2023 14:17:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC6113CD4FC
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Mar 2023 14:17:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 82AA83CAD42
 for <ltp@lists.linux.it>; Tue, 14 Mar 2023 14:17:37 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E22C0600879
 for <ltp@lists.linux.it>; Tue, 14 Mar 2023 14:17:36 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 06FD721A8B;
 Tue, 14 Mar 2023 13:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1678799856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MYNo7WyrIG78xorFu7SYMdFfeLUaDvOsLp75QFcwHCc=;
 b=SE2IeozDkJkJRjoiSLQtBVsD84lW2WI/D2R/ruDttWbfmpEETtcw7vqu45dreT7zP0EYI+
 hLZLhTw7tVFDRlasGqw2waLxffiwkf+yCdwaHTtJ9zEFxkelhYKAyd0hKP4ycANrX4y6nl
 ho5FiNC4NjqLSM1lLk+ObdLumShubp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1678799856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MYNo7WyrIG78xorFu7SYMdFfeLUaDvOsLp75QFcwHCc=;
 b=SjDXEr/uJFkqMvo0Nn7AdHnfRt0fxTcKf3vj1j82e6ihRqGQ+AIB3ELYORsKlJJhlvTUiR
 VJZ0DxNyiLNskJCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E01E913A1B;
 Tue, 14 Mar 2023 13:17:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VqKWNe9zEGTpcgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 14 Mar 2023 13:17:35 +0000
Date: Tue, 14 Mar 2023 14:18:55 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <ZBB0P/nfffbrMFme@yuki>
References: <20230314114037.25581-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230314114037.25581-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add goals of patch review and tips
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
> I see two options for patch review. Either we have a single senior
> maintainer who does most of or it is distributed.
> 
> For now I think it needs to be distributed which is beyond the scope
> of this commit.
> 
> In order to distribute it we need new contributors to review each
> others' work at least for the first few revisions.
> 
> I think that anyone can review a patch if they put the work in to test
> it and try to break it. Then understand why it is broken.
> 
> This commit states some ideas about how to do that, plus some tips for
> more advanced patch review.
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> Cc: Cyril Hrubis <chrubis@suse.cz>
> Cc: Andrea Cervesato <andrea.cervesato@suse.de>
> Cc: Avinesh Kumar <akumar@suse.de>
> Cc: Wei Gao <wegao@suse.com>
> Cc: Petr Vorel <pvorel@suse.cz>
> ---
>  doc/maintainer-patch-review-checklist.txt | 78 ++++++++++++++++++++++-
>  1 file changed, 77 insertions(+), 1 deletion(-)
> 
> diff --git a/doc/maintainer-patch-review-checklist.txt b/doc/maintainer-patch-review-checklist.txt
> index 706b0a516..be0cd0961 100644
> --- a/doc/maintainer-patch-review-checklist.txt
> +++ b/doc/maintainer-patch-review-checklist.txt
> @@ -1,4 +1,80 @@
> -# Maintainer Patch Review Checklist
> +# Patch Review
> +
> +Anyone can and should review patches. It's the only way to get good at
> +patch review and for the project to scale.
> +
> +## Goals of patch review
> +

Maybe start with:

1. Catch typos and obvious mistakes

Everyone does these and usually they are easy to spot for anyone but the
author.

> +1. Prevent false positive test results
> +2. Prevent false negative test results
> +3. Make future changes as easy as possible

I would say that number 3 maybe be a bit controversial, I've seen cases
where attempts to futureproof the code caused steep increase in the test
complexity. So maybe:

3. Keep the code as simple as possible as well as futureproof

Or something along the lines.

> +## How to find clear errors
> +
> +A clear error is one where there is unlikely to be any argument if you
> +provide evidence of it. Evidence being an error trace or logical proof
> +that an error will occur in a common situation.
> +
> +The following are examples and may not be appropriate for all tests.
> +
> +* Merge the patch. It should apply cleanly to master.
> +* Compile the patch with default and non-default configurations.
> +  - Use sanitizers e.g. undefined behaviour, address.
> +  - Compile on non-x86
> +  - Compile on x86 with -m32

Maybe note here that some tests trigger undefined behavior
intentionally, we do have a few tests that dereference NULL to trigger
crash, etc.

> +* Use `make check`
> +* Run effected tests in a VM
> +  - Use single vCPU
> +  - Use many vCPUs and enable NUMA
> +  - Restrict RAM to < 1GB.
> +* Run effected tests on an embedded device
> +* Run effected tests on non-x86 machine in general
> +* Run reproducers on a kernel where the bug is present
> +* Run tests with "-i0"
> +* Compare usage of system calls with man page descriptions
> +* Compare usage of system calls with kernel code
> +* Search the LTP library for existing helper functions
> +
> +## How to find subtle errors
> +
> +A subtle error is one where you can expect some argument because you
> +do not have clear evidence of an error. It is best to state these as
> +questions and not make assertions if possible.
> +
> +Although if it is a matter of style or "taste" then senior maintainers
> +can assert what is correct to avoid bike shedding.
> +
> +* Ask what happens if there is an error, could it be debugged just
> +  with the test output?
> +* Are we testing undefined behaviour?
> +  - Could future kernel behaviour change without "breaking userland"?
> +  - Does the kernel behave differently depending on hardware?
> +  - Does it behave differently depending kernel on configuration?
> +  - Does it behave differently depending on the compiler?
> +* Will it scale to tiny and huge systems?
> +  - What happens if there are 100+ CPUs?
> +  - What happens if each CPU core is very slow?
> +  - What happens if there are 2TB or RAM?
> +* Are we repeating a pattern that can be turned into a library function?
> +* Is a single test trying to do too much?
> +* Could multiple similar tests be merged?
> +* Race conditions
> +  - What happens if a process gets preempted?
> +  - Could checkpoints or fuzzsync by used instead?
> +  - Note, usually you can insert a sleep to prove a race condition
> +    exists however finding them is hard
> +* Is there a simpler way to achieve the same kernel coverage?
> +
> +## How to get patches merged
> +
> +Once you think a patch is good enough you should add your Reviewed-by
> +tags. This means you will get some credit for getting the patch
> +merged. Also some blame if there are problems.

Maybe we should mention the Tested-by: tag explicitly here as well.

> +In addition you can expect others to review your patches and add their
> +tags. This will speed up the process of getting your patches merged.
> +
> +## Maintainers Checklist
>  
>  Patchset should be tested locally and ideally also in maintainer's fork in
>  GitHub Actions on GitHub.
> -- 
> 2.39.2
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
