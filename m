Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A123CB73D
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 14:13:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D513C3C861D
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 14:13:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 729B33C65C0
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 14:13:01 +0200 (CEST)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 01C5F1A007FD
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 14:13:00 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id f30so9074028lfv.10
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 05:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DSDL8tCRBo4dgaVIDi2aj4yUgjPGDALcuYP9+KQGMqQ=;
 b=XpXty9Whh5wy4tDwBnMjgAsldaQ8/fmPT+UEFatsPu94lKiIDj8pSFq+BZke6KLVZH
 I4KWDIw6C2khc8tgzXvG5lnJ4hEqKmcQdupzSJKYV5Ar8Tn7FATxPhWw4Pe8BCFlnBKT
 xuiWlkxLwBn8eKsaUnSXItYaj0x8pouaM1MEuV0b7ESTik4o7s1v4WxOxPa0+8+8eVWn
 9zUIt3oF0i6maQpe+NuJRYfvyMrCV52wqsiDgeRzYRttWoyi9RQ2/WrZGh4myON1bT8n
 +CE0JSNZxMrKcNWvvBM1VR1uS+auio4HWGE0zETMXtXigocheKAPniQM/c8H116ZWRnT
 ceWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DSDL8tCRBo4dgaVIDi2aj4yUgjPGDALcuYP9+KQGMqQ=;
 b=V0KHy2mkc88PxuaKcVZDW6jFszsF/8FjK5Uy/ymYQ49BZRCuHmpy7OGQ+6kEbQtk2D
 pm2/vjYc+MF9lsqR7NwSsc+O6Vm1pLPQk4Mat1oUYRtZ8RfsVDQMumoTVI60G/Kh5bsp
 aMtJOc5dI0jazw1Fhd8Umipk/BHEwYTd00iq/WcstreUGPNIdtC4t4BH4f4Bu2UaxR1X
 kCE6k9tC0MEZYFphlPTx+JQ47tmbwBO2ZYaC5HNSgEGbV6pmEJOrQVJOrk5iBByV1qHq
 crT+zvG9Sw8YPuVT+G747uF03eyKKzlHbjr3ziJ1yWZ9RC81LzEuxaLoOxVOldrRVj0m
 4aGQ==
X-Gm-Message-State: AOAM530KzTrsLeG8xO85kIpTX05UO97/Gldt6twAkcWrqmNAFfLX57J9
 Yow4/7Zghu66EkcsB8fwVWHy
X-Google-Smtp-Source: ABdhPJxuvdGTU0NzEtKAPpXeU3g5Q9Qp4aTK9yRwWLS51ATK4NV8PV/MHBNC9aihDaCx1p2cN122tA==
X-Received: by 2002:a19:4950:: with SMTP id l16mr7525104lfj.4.1626437578841;
 Fri, 16 Jul 2021 05:12:58 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id g9sm115410lfh.95.2021.07.16.05.12.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 05:12:58 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>, Li Wang <liwang@redhat.com>
References: <20210715102813.106843-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cXAY8KSFNNv8_23uSs-wRaResAkTPmPyZQNN6UwcMcgA@mail.gmail.com>
 <YPFWn+/sbK1vlJKt@pevik>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <ea0bf295-29e2-169c-04cc-216003c1e7b1@bell-sw.com>
Date: Fri, 16 Jul 2021 15:12:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YPFWn+/sbK1vlJKt@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] crypto/af_alg02: use pthread_tryjoin_np() instead
 of pthread_kill()
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

Hi Petr,
On 16.07.2021 12:51, Petr Vorel wrote:
>> Hi Alexey,
> 
>> On Thu, Jul 15, 2021 at 6:29 PM Alexey Kodanev <aleksei.kodanev@bell-sw.com>
>> wrote:
> 
>>> musl doesn't return ESRCH for pthread_kill() if thread id is not found.
> Maybe ask on MUSL mailing list?

It's not a musl issue, but I was going to send a few improvements (including
this) when time permits.

> 
>>> POSIX only recommends to return ESRCH, and also says that pthread_kill()
>>> produces undefined behavior if tid lifetime has ended [1].
> 
>>> [1]: https://man7.org/linux/man-pages/man3/pthread_kill.3.html
> 
>>> Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
>>> ---
>>>  testcases/kernel/crypto/af_alg02.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
>>> diff --git a/testcases/kernel/crypto/af_alg02.c
>>> b/testcases/kernel/crypto/af_alg02.c
>>> index 31d30777c..0f5793c16 100644
>>> --- a/testcases/kernel/crypto/af_alg02.c
>>> +++ b/testcases/kernel/crypto/af_alg02.c
>>> @@ -60,7 +60,7 @@ static void run(void)
> 
>>>         TST_CHECKPOINT_WAIT(0);
> 
>>> -       while (pthread_kill(thr, 0) != ESRCH) {
>>> +       while (pthread_tryjoin_np(thr, NULL) == EBUSY) {
> 
> 
>> I'm not sure if safe enough to use because it is nonstandard GNU extensions
>> and the "_np" means nonportable.
> Others please double check, but pthread_tryjoin_np() seems to be in uclibc-ng
> and musl (+ of course in glibc). It's only missing in bionic (it looks like
> people would like to have it [1]).
> 

Yeah, I think it's quite useful.

>> Maybe another workaround is to define a volatile flag 'thread_complete',
>> initialize it to '0' when thread_B starts and reset to '1' while exit, and
>> just
>> do a value check in the while loop of thread_A should acquire thread_B
>> status.
>> Is this way a bit better?
> Sounds as reasonable workaround for me.
> 
> Kind regards,
> Petr
> 
> [1] https://github.com/kito-cheng/android-checkpoint/blob/master/bionic/0003-bionic-Implement-pthread_tryjoin_np.patch
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
