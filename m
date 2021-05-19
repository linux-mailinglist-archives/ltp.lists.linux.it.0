Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2F0388B8B
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 12:19:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 594993C3067
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 12:19:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C7E5F3C1B0F
 for <ltp@lists.linux.it>; Wed, 19 May 2021 12:19:17 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 87AD51A011D9
 for <ltp@lists.linux.it>; Wed, 19 May 2021 12:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621419555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iByLzIrt9B2nMCsMPUywzBRacvykPRdvNBzxAOHe/lI=;
 b=Sd7rxoATZRtJ2L0a23/NbqNkdei7w00RYLsC1PKVfJWILx9kd60y/27lqRp3V1hPwE20xU
 iWI5wNCdHh9ML4Lfii4hcY2hxVsZ6yQ4xLiYL5rdZxhfGAEXuO1tlhevbhJSYwF3NLGa9I
 9Ybwa3W6d1t97SES73LVfQ5AgnItuW8=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-MdXDMrqtP-mAd4ITGUpr9g-1; Wed, 19 May 2021 06:19:12 -0400
X-MC-Unique: MdXDMrqtP-mAd4ITGUpr9g-1
Received: by mail-yb1-f197.google.com with SMTP id
 q6-20020a25bfc60000b02904f9715cd13cso17213153ybm.3
 for <ltp@lists.linux.it>; Wed, 19 May 2021 03:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iByLzIrt9B2nMCsMPUywzBRacvykPRdvNBzxAOHe/lI=;
 b=MliyKxBYCdsHVbK74WoyaEVx7347aTjB8R7VlT+XuM9yhEp0dhL+9SoZHwzFd8dKrr
 L0vjSl0sNw9gce3UuqMqW0U6jAn3a3KchuZSlNaulsjFspC8Tt7UeQr0RB8ahWDKi8Sz
 aBoBPj+eo5wsbMUBUIqe2OKb/FN7nekzKKuDlfBr2erUzLsJi2YcedL2lztfyCpUFoMs
 121WyhzYOC1643mVt8XdcRI7t5zghNPjeR4yDQ2xNlZhMUaR6LLY/pB9rmJKKMQ3agU4
 bitE7LQRJ+tkTJDyirMO1oqPHwe817lqleQ0XRHLFoWQMeDHZFwAMAf+967ogIY6Uszi
 443g==
X-Gm-Message-State: AOAM532iKB1lT5tADUthMbkG1ui4ALEJWUE1NbObXNPwX5nv4oRcaTWQ
 DguVbF9AaTG+mwUIGQOiA3jwfgJVpC4JxAJTJQ52/ZiP3v8K3cWQx2qMHHCKNmx2iwATlI902mx
 mclNYEJKuzLTtHB9HAQqRGR4KDaw=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr13742900ybg.86.1621419551718; 
 Wed, 19 May 2021 03:19:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVjYL8RdNDd1DLd2RBEau7WDMW0s1pMlKWsPdB9C/CbazirY6Bots1jlHJl+ExGwAjI6zQPQ7uVXZWPKg6oPs=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr13742886ybg.86.1621419551513; 
 Wed, 19 May 2021 03:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210519063109.224352-1-lkml@jv-coder.de>
In-Reply-To: <20210519063109.224352-1-lkml@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Wed, 19 May 2021 18:18:59 +0800
Message-ID: <CAEemH2fcuMtZgthknbsLKHdhqq7NrtB=nm6Oi9pvxG6MH0_jsQ@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] shell: Fix timeout process termination for zsh
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, May 19, 2021 at 2:31 PM Joerg Vehlow <lkml@jv-coder.de> wrote:
>
> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
>
> NOTE: This fix should be part of the release,
> because it fixes something broken in this release only!
>
> On zsh an exit in the trap for SIGTERM is ignored,

I'm wondering if this is zsh feature or a bug on a specific version?
if the latter, we probably have no need to fix it in LTP.
Btw, which zsh version do you use?

Odd, I tried on my laptop(Fedora34) with zsh-5.5.1-6.el8_1.2.x86_64,
but could NOT reproduce it.

my reproducer:
-----------------

# cat test.sh

echo "pid is $$" # send TERM to pid in another terminal

sleep 100 &
sleep_pid=$!

trap "kill $sleep_pid; exit;" TERM

wait $sleep_pid
[ $? -eq 143 ] && echo "FAIL"



> but wait returns with TERM exit status (143).
> This can only improve the situation for other processe,
> e.g. if the wait is killed by the SIGTERM from the main process,
> it will still terminate the timeout process now.
>
> Fixes: a30410f6ad77 ("shell: Prevent orphan timeout sleep processes")
>
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
>  testcases/lib/tst_test.sh | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index 3a5651c01..1b25f4c44 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -472,6 +472,7 @@ _tst_timeout_process()
>         sleep_pid=$!
>         trap "kill $sleep_pid; exit" TERM
>         wait $sleep_pid
> +       [ $? -eq 143 ] && exit
>         trap - TERM
>         _tst_kill_test
>  }
> --
> 2.25.1
>


--
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
