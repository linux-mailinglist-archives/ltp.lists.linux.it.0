Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D17E2CDD
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 11:11:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA6F03C2360
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 11:11:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5C2783C2219
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 20:28:56 +0200 (CEST)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 659B8200C3A
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 20:28:55 +0200 (CEST)
Received: by mail-wr1-x444.google.com with SMTP id z9so23154053wrl.11
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 11:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=colorfullife-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=FO1icP7++q1qCn8suzxihC3IELICMjjLnmnWE+fJqmU=;
 b=PjQQPBtoQxQl3GPqZTshvbiyW+woEGHqnpsjbQSUWAblEvf29P89Bxmv/GSr1kvoDV
 EiW+Z/zlBJdIKMgLHU5NBSTRv47eJCD7Usr+/jeSECvNmSCGvsg/wN3XWY6rbgw8POQ8
 HeWA09el0iZ8oBuDcwlA+c0hDypKGn3En2Nd6lVMEkGtidiW3iSKWwr0+7vHwakibLzW
 iM80EEeY7JrznpMdkIa7HZ6/4wP/PXOAP0Q/YJZyTXm+Y3rC2UZ7fshmBB4FQSFrcS8P
 vt80J80X2Mpw8g8w8XiYO8EkvJL8KBKqInhlucaeA941kzobper8AfmkAfAd3S6bl1p9
 Murw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FO1icP7++q1qCn8suzxihC3IELICMjjLnmnWE+fJqmU=;
 b=gxvmlP4ou+ikvJ2Fch3MfOGYpPFMt3q5tc6B4++uwTDFkpcHgXYkqaBeEL7DVynQJ1
 ClOJxnSow1UTr94Yc7p0t94pbXwWgvuc01sWTN7aAyx274NkdaVTEEiyEc8mM/TZABvf
 k0V5MhyoeOHn2ekUaE4u6e9qWPz7OitGp5+lslC0xwSO9lsc8GJ/zd5/9qz7+zdPfJhO
 9Ujms7W9PFIMzco1bFouy7bS6y7LydZcsMawea6QGusMw17SLWo6i45eBFG+bqPEV4qd
 /lf9vlindjmRqQjh+i1ExKF3efzrd03AFYpuaHyb4rn4n4LEUfJuCOSVPg8Zq64U9hmi
 pnUA==
X-Gm-Message-State: APjAAAWqt825mItetU8y6hxUAsgyNbit/ZMIEEzM60YTKhBLsO+2aUHr
 rCfzmvcBkCJtFJ6eIZpYXtuunYcGOa4=
X-Google-Smtp-Source: APXvYqwM/fNEQgVnYS6gVjEpLMpLYRZ1Tij0RXOubxkQe0HyV3h6C/7J9q7RIQ4qUoG9wD9Rn0Pl5w==
X-Received: by 2002:adf:c448:: with SMTP id a8mr92192wrg.233.1571855334570;
 Wed, 23 Oct 2019 11:28:54 -0700 (PDT)
Received: from linux.fritz.box
 (p200300D9970483001CF3BB0BE954CA02.dip0.t-ipconnect.de.
 [2003:d9:9704:8300:1cf3:bb0b:e954:ca02])
 by smtp.googlemail.com with ESMTPSA id r3sm38070268wre.29.2019.10.23.11.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2019 11:28:53 -0700 (PDT)
To: kernel test robot <rong.a.chen@intel.com>
References: <20191021083514.GE9296@shao2-debian>
From: Manfred Spraul <manfred@colorfullife.com>
Message-ID: <d49d1940-a704-d79e-b44f-79db9f096d5c@colorfullife.com>
Date: Wed, 23 Oct 2019 20:28:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191021083514.GE9296@shao2-debian>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 24 Oct 2019 11:11:43 +0200
Subject: Re: [LTP] [ipc/sem.c] 6394de3b86:
 BUG:kernel_NULL_pointer_dereference, address
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
Cc: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Corbet <corbet@lwn.net>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 lkp@lists.01.org, 1vier1@web.de, Waiman Long <longman@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, ltp@lists.linux.it
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

On 10/21/19 10:35 AM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: 6394de3b868537a90dd9128607192b0e97109f6b ("[PATCH 4/5] ipc/sem.c:=
 Document and update memory barriers")
> url: https://github.com/0day-ci/linux/commits/Manfred-Spraul/wake_q-Clean=
up-Documentation-update/20191014-055627

Yes, known issue:

> @@ -2148,9 +2176,11 @@ static long do_semtimedop(int semid, struct =

> sembuf __user *tsops,
> =A0=A0=A0=A0=A0=A0=A0 }
>
> =A0=A0=A0=A0=A0=A0=A0 do {
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 WRITE_ONCE(queue.status, -EIN=
TR);
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* memory ordering ensured by=
 the lock in sem_lock() */
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 queue.status =3D EINTR;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 queue.sleeper =3D current;
>
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* memory ordering is ensured=
 by the lock in sem_lock() */
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __set_current_state(TASK_IN=
TERRUPTIBLE);
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sem_unlock(sma, locknum);
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rcu_read_unlock();
It must be "-EINTR", not "EINTR".

If there is a timeout or a spurious wakeup, then the do_semtimedop() =

returns to user space without unlinking everything properly.

I was able to reproduce the issue: V1 of the series ends up with the =

shown error.

V3 as now merged doesn't fail.

--

 =A0=A0=A0 Manfred



-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
