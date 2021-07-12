Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C0E3C45E4
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 09:47:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A68193C6740
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 09:47:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E5FD13C1B32
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 09:47:00 +0200 (CEST)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4AC461400264
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 09:47:00 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id b40so22642245ljf.12
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 00:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gzRKN3a4Ggno/lC0FcNQ6JD6h7ecF0zpoToGzU8DCVg=;
 b=n+WovPboQTZcODBeV+pG+5WJ8Wq5mIOfY8Vl5kKF1XGEASi6BzSl9+vehLmXD20CPB
 YOuSWUvCRsNASnPRBGrbKNHrAqyUbeVHggQyYHmJAUnFE3PwXFJa5empx/IUMeluyMQu
 usYrk+FTEOeJfmDbh9fs3qn47vAabE6GN6UNo+ebtP89FVC/alPxY5qByEIGpxTP6dvw
 XuV2CQPB8CalOnnxnzeSUUTtLxKTMFu94+GgnPqNPsIJAMkZKkxIlMXy9lTRZpbBjUf0
 txj3GMqu/NRC6kqKjpdcs+TqJWsON9zx99vDUJJ8Yh1yUhhgSGyKue8aozHs892C+AKV
 IGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gzRKN3a4Ggno/lC0FcNQ6JD6h7ecF0zpoToGzU8DCVg=;
 b=BFDeocYw+Tt4+0GTx4hn5mZ6H+zv6h64LX42h6v3KauLo4Xn2vzDq68qU6V5lTDRkQ
 JD3SzKl1ya70hv6PtnvPpGRCmdrVyPBB5LCMn44xPv2rmEz1qsTAF/D/4zQcT6KToMQ/
 ECVOnHTAEHaeHHikKkKWVvQOM1nMOqA7THzo0SJ6LYW1dFxuYbE1HU0g7vGLOzXfOnIk
 qDBKw1UY1tzqR84LNjzYZZBl+JhgBcUH6IfWZAJJRy9nV62k8M9nR7U46UTqLWyikwnM
 F9yqmj29WenteH87DBQ8PROyjtsAUsf7XCV80HROCKa5omu4Pm+Sihp/SrUpTCGwwn4C
 vFUg==
X-Gm-Message-State: AOAM531nUkFKxjo8bJv5BKmtDPOg4JfbTgabdm/OeV0inFDpYhRp1S6y
 Rdp52U40Zq17Bp1PQRW51j3v
X-Google-Smtp-Source: ABdhPJxMtqonQH3u5rFb7bfaKsPyn7tw24ZV3JT+ZxE9+ll+iiLYLwRIhZ1u2zm541PPC/oexrAg3Q==
X-Received: by 2002:a2e:a312:: with SMTP id l18mr13482923lje.277.1626076019710; 
 Mon, 12 Jul 2021 00:46:59 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.7])
 by smtp.gmail.com with ESMTPSA id e22sm1411398ljb.61.2021.07.12.00.46.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 00:46:59 -0700 (PDT)
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>,
 Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>,
 Li Wang <liwang@redhat.com>
References: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
 <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
 <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
 <CAEemH2fcubrbMpeoeSJJoZtD+xaiRrs_upG_+KQXB_8C9m3eQg@mail.gmail.com>
 <60E50AB4.7050404@fujitsu.com> <YObbKCNKUoC7lSxd@pevik>
 <YObpRzTjx8T2GAZn@yuki> <60EBA9C3.4050103@fujitsu.com>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <c81eee80-6cea-de14-aeff-8919495c4396@bell-sw.com>
Date: Mon, 12 Jul 2021 10:46:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <60EBA9C3.4050103@fujitsu.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>,
 Huanian Li <huanli@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 12.07.2021 05:31, xuyang2018.jy@fujitsu.com wrote:
> Hi All
>> Hi!
>>>>> Yes, good point, that would be more precise for ENOSPC testing.
>>>> AFAIK, ltp doesn't support parallel test now. I think parallel test
>>>> maybe a future plan that is why we use docparase to collect each case's
>>>> used resources(so we can convert many groups, like pid, memory, disk
>>>> space..., then we can run pid group and memory groups test case parallelly).
>>> Yes, parallel support is not supported atm. Richie and Cyril has done some work
>>> on runltp-ng to support it. Yes, first it's needed to add support in resources
>>> (docparse), see Cyril's old block post [1].
>>
>> Besides most of the SHM tests will crash and burn if executed in
>> parallel. The SysV IPC shares a global namespace and because of that we
>> can't really write tests without assuming that we are the only one
>> manipulating them when the test is executed.
> I guess we should reach a consensus that how to fix this problem
> 1)use for loop to trigger this error
> 2)use CLONE_NEWIPC to trigger this error

Perhaps it can be done at the higher level, e.g. in the ltp tests
runner if some tests request it with a newipc flag...

> 3)Or we are the only one that use shm and we can add a api to count the 
> existed_cnt
> 
> ps: I don't want to leave this problem too long time.
> 
> Best Regards
> Yang Xu
>>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
