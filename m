Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C359B2FCD76
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 10:31:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54C013C5DBA
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 10:31:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 239BD3C24E4
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 10:31:42 +0100 (CET)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A5FD1600C22
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 10:31:42 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id s11so17636671edd.5
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 01:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jcKCAAeQtQzxk/w4Q25y6k+NsB0ifvb5xJrK9Do7Kfs=;
 b=t8FlbcQNLLHvvL/4y5DZie/SWzG7QYeiNyoLjdqbyx0FxB+0Vpz03+L7BSlhrgfkMQ
 TPl1caXDO7MIUT9uMf8YiDZfnG/xB6VZohLpWPStpvHHWugdYN0wYSiNS1ms6YpttiL6
 uQo/YodqLFbK1ktbk1ICMs/9Zm1U1ynNHmNNKZ3IxbBWVhMvirt5EXcPeIM/rH9k0tR5
 1WvqlFiD+9bcLnxOXh2eB2u3MiRqf3y/t49pvZdH0qmJ3Bej/l0MAo+4QtFdKAVeb0ab
 uv6DZkfGYukKNOQs+CqTjBVJyk6vyUE+lLn93mmQxfVGYt84cKl9QQr6yhMFwyM8Qveg
 98Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jcKCAAeQtQzxk/w4Q25y6k+NsB0ifvb5xJrK9Do7Kfs=;
 b=VKFeeW+dcN4G+n41IDcRcpGZttY2siXdSOhye/qZrbtHiNHR4nY3XEtFOsTkFPZIiI
 /tzqhESY6ToYUitCOYInjsldjs6o7xAtkQVrsUqWvOSCj6qpIaPCEHRL0vam4LAA54ym
 06h+XF3bN5OZl8XU1TIb2owP3EnOhZLcbYr8K61Y+KwoV2rlp4na5TeWEox/BJnnd/W9
 2GfgEUVr9K0VQ5rGGzovIzvvUHzw/SO/B5qVVNXpnV4clkfb24hltxzpdFOjLjaIloag
 fGifyFhfSsE8sa66azWfTCObBSu3I2UfDJY5M2hGdb+3O67GUiNquv2L62SUOdxN5s3X
 RLeQ==
X-Gm-Message-State: AOAM5312A+sCRpbhgGS8hqWjCm54nItCo1BlUyFYkuyJG/ko2mOEo0M/
 WOzlszzA3+HXO2vlH+nipt7E3FG820XF856DfXdscQ==
X-Google-Smtp-Source: ABdhPJwU7eYLopzpIhyGMEBmEdMjp2XTKTaVHJrs1e0NL+o8e/hr33j+UxjgFRztHvIkUnoow8PKI8APNUhThzAAobQ=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr4550652edd.52.1611135102158; 
 Wed, 20 Jan 2021 01:31:42 -0800 (PST)
MIME-Version: 1.0
References: <X9tMlNxJbwCWIRnO@yuki.lan> <X/Wq28noppvB5MGw@yuki.lan>
 <20210113095724.214c904a@kmaincent-XPS-13-7390>
 <CA+G9fYv1UFr+7ePC7tLjCY4JPsoQdBdf-6Jpr40zmsoYRWVrdQ@mail.gmail.com>
 <db866679-a5e8-35d6-f57a-18a202c7937b@suse.cz>
In-Reply-To: <db866679-a5e8-35d6-f57a-18a202c7937b@suse.cz>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 20 Jan 2021 15:01:30 +0530
Message-ID: <CA+G9fYvRqOH7D04NHwPQNXKyMzak5bDo=GN3k13tcwV3bwN5Yw@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Holidays and LTP release
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, 14 Jan 2021 at 19:44, Martin Doucha <mdoucha@suse.cz> wrote:
>
> On 14. 01. 21 12:12, Naresh Kamboju wrote:
> > on x86_64:
> > The ioctl_sg01 test killed and reported failed.
> >
> > tst_test.c:1263: TINFO: Timeout per run is 0h 15m 00s
> > ioctl_sg01.c:81: TINFO: Found SCSI device /dev/sg1
> > [  332.383394] ioctl_sg01 invoked oom-killer:
>
> Looks like the safety margin in tst_pollute_memory() is too small. Edit
> lib/tst_memutils.c and try setting the "safety" variable on line 23 to a
> higher value. I'd recommend something like MAX(4096 pages, 64MB).

do you mean something like this ?
But this change did not solve the problem (ioctl_sg01) i have reported.

diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
index f134d90c9..00bf45e9c 100644
--- a/lib/tst_memutils.c
+++ b/lib/tst_memutils.c
@@ -20,7 +20,7 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
        struct sysinfo info;

        SAFE_SYSINFO(&info);
-       safety = 4096 * SAFE_SYSCONF(_SC_PAGESIZE) / info.mem_unit;
+       safety = 8192 * SAFE_SYSCONF(_SC_PAGESIZE) / info.mem_unit;

        if (info.freeswap > safety)
                safety = 0;


After the above change the test case ioctl_sg01 fails intermittently
when running
multiple times.
https://lkft.validation.linaro.org/scheduler/job/2170593#L1357


- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
