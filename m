Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8E237B99A
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 11:49:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D0DC3C8A71
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 11:49:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 45B813C4CA7
 for <ltp@lists.linux.it>; Wed, 12 May 2021 11:49:28 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 38FBF200D59
 for <ltp@lists.linux.it>; Wed, 12 May 2021 11:49:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620812965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t5CUKFP0/UHt7ejHNqUMf1d44N/ZqIPHRO0BLUwxKwY=;
 b=SMmPmRKXqxFaJwJ3242fzMnvARcmQ4qbwFsTfyT1BqxL/bLA8Sbi190ltwvT9w7Izj/a0c
 C/c5vAsOKyfNQKU/NXQjv6oVWqMOk1f4jY0jLntPijyee6HURXyqVQvE96MRPdLs5WYJtb
 slb1cL2aAdxD1cdo9E9nh8izXoqtUu0=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-qgkH2pWMOcCZp7bQXizUIg-1; Wed, 12 May 2021 05:49:23 -0400
X-MC-Unique: qgkH2pWMOcCZp7bQXizUIg-1
Received: by mail-yb1-f197.google.com with SMTP id
 r2-20020a25ac420000b02904f5a9b7d37fso27271642ybd.22
 for <ltp@lists.linux.it>; Wed, 12 May 2021 02:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t5CUKFP0/UHt7ejHNqUMf1d44N/ZqIPHRO0BLUwxKwY=;
 b=Z/e/SNgKemLH8y+pzJ8cXp5ectb2BCusy//azODgaqRFKj24wYd7HKZLipWBpYoI04
 DH0bsKt+dYhKs5XQQuLiIPA39m5Ei2F9fP+nWt06iuzISI2o4lz4msLheEpLqNw7NVn3
 cyN10WNH2xEPV1+4NZEszTlQBD193uSDZrJB4lW/msMNstXtNSqfWZvPbPZHO2U/yLs3
 Fe5tHVMFdOF1KAIqo4ArZQJ4RfiaXZv5hFt1qPAWUG1VgY4PxuRM5uao6EFZa4yVqyhE
 wL4IzBzRZjFc1jn7MxflvSa2m6Izcoq0/368PaAOyTBYWE0hVdqJP3EfpiRJnp3Ut2Lf
 43HA==
X-Gm-Message-State: AOAM530FGnIJIbsz/e/v0puf6mQqFgP+5z4fagb79t7Msg7R0BFBU6Lw
 Allyj7AkuMKwYwYF4Y5+OasXLF5USt8x9/TEjd4ASgUv615HO6UleDxDXtzHt6sqNz/17Cv2P80
 G0Ip7dePzF80lQzoVZPayJ0H3qdw=
X-Received: by 2002:a25:1189:: with SMTP id 131mr47899287ybr.286.1620812963116; 
 Wed, 12 May 2021 02:49:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4RbUJslQt/aMAkA5AZaMH7/Vyfb2aklbw1JqRNrklCh1QvGKH8PKDWZdKuFFy+0Fp6nfqzX0FfjK12tFOjso=
X-Received: by 2002:a25:1189:: with SMTP id 131mr47899258ybr.286.1620812962807; 
 Wed, 12 May 2021 02:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210508055109.16914-4-liwang@redhat.com>
 <dfdd8e9a-90ca-642d-1c21-da169ca3878f@jv-coder.de>
In-Reply-To: <dfdd8e9a-90ca-642d-1c21-da169ca3878f@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Wed, 12 May 2021 17:49:11 +0800
Message-ID: <CAEemH2et8_SXWJTsofdt7gc0NRV=91rPe0RtAMt1BX=SbAzhig@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/4] lib: ignore SIGINT in _tst_kill_test
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

Hi Joerg,

On Tue, May 11, 2021 at 1:52 PM Joerg Vehlow <lkml@jv-coder.de> wrote:
>
> Hi Li,
>
> first of all thanks for fixing my patchset and getting it merged.
>
> On 5/8/2021 7:51 AM, Li Wang wrote:
> > We have to guarantee _tst_kill_test alive for a while to check if
> > the target test eixst or not, so ignore SIGINT in _tst_kill_test
> > is necessary, otherwise it will be stopped by the SIGINT sending
> > by itself.
> >
> > The timeout03.sh verify this mechanism proccess well in output:
> >
> >    timeout03 1 TBROK: Test timeouted, sending SIGINT! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
> >    timeout03 1 TBROK: test interrupted or timed out
> >    timeout03 1 TPASS: test run cleanup after timeout
> >    timeout03 1 TINFO: Test is still running, waiting 10s
> >    timeout03 1 TINFO: Test is still running, waiting 9s
> >    timeout03 1 TINFO: Test is still running, waiting 8s
> >    timeout03 1 TINFO: Test is still running, waiting 7s
> >    timeout03 1 TINFO: Test is still running, waiting 6s
> >    timeout03 1 TINFO: Test is still running, waiting 5s
> >    timeout03 1 TINFO: Test is still running, waiting 4s
> >    timeout03 1 TINFO: Test is still running, waiting 3s
> >    timeout03 1 TINFO: Test is still running, waiting 2s
> >    timeout03 1 TINFO: Test is still running, waiting 1s
> >    timeout03 1 TBROK: Test still running, sending SIGKILL
> >    Killed
> At first I did bot understand the problem you found, because I tried
> with dash, busybox sh and zsh.
> All three shells had no problem here. But then I tried with bash and it
> failed.
>
> I wonder if this is a bug in bash or in the other shells. I guess
> sending the signal to the whole
> process group should also send it to the process running _tst_kill_test.
>
> I did some digging into this while writing this (see conclusion below
> for results only):
> 1. All shells have their own implementation of kill (compare <SHELL> -c
> kill with /usr/bin kill)
> 2. When replacing "just" kill in the script with /usr/bin/kill, it still
> only fails in bash.
> 3. zsh seems to ignore SIGINT, but it can be caught using trap. busybox
> sh, and dash can't even get it when trapped
> 4. zsh disables SIGINT by callling "trap '' INT" internally somehow.
> When resetting SIGINT to default behavior, it is the same as bash.
>
> For zsh this seems to be default behavior for background processes,
> probably to prevent keyboard interruption by CTRL+C:
> zsh -c "trap&"
> trap -- '' INT
> trap -- '' QUIT
>
> zsh -c "trap"
> # No output
>
>
>
> To conclude:
> - bash does not seem to care about SIGINT delivery to background
> processes, but can be blocked using trap
> - zsh ignores SIGINT for background processes by default, but can be
> allowed using trap
> - dash and busybox sh ignore the signal to background processes, and
> this cannot be changed with trap
>
> I tried with the following snippets:
> <SHELL> -c 'trap "echo trap;" INT; (sleep 2; echo end sub) & sleep 1;
> kill -INT -$$; echo end main'
> <SHELL> -c 'trap "echo trap;" INT; (trap - SIGINT sleep 2; echo end sub)
> & sleep 1; kill -INT -$$; echo end main'
> <SHELL> -c 'trap "echo trap;" INT; (trap "exit" SIGINT sleep 2; echo end
> sub) & sleep 1; kill -INT -$$; echo end main'
>

Thanks for the demos above, it shows the difference clearly.

> SIGINT handling for child processes is strange. This might have some
> implication for the shell tests,
> because it is possible, that SIGINT is not delivered to all processes
> and some may reside as orphans.
> Since this can happen only in case of timeouts, I guess there is no real
> Problem.

Yes.

Looks like the behaviors on signal 'SIGINT' are not unify in background
processes handling for different SHELL. So as you said that using SIGINT
seems NOT a good idea to stop the process in timeout.

>
> A possible fix could be using SIGTERM instead of SIGINT. This signal
> does not seem to have some "intelligent" handling for background processes.

I agree. Can you make a patch to replace that INT?

(and this is only a timeout issue, so patch merging may be delayed due
to LTP new release)

> I do not know why LTP used SIGINT in the first place. My first thought
> would have been to use SIGTERM.  It is the way to "politely ask
> processes to terminate"

Yes, but that not strange to me, the possible reason is just to
stop(ctrl ^c) the LTP test manually for debugging, so we went
too far for using SIGINT but forget the original purpose :).

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
