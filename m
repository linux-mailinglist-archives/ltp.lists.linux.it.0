Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E3E44610E
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 10:03:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A95F3C72F7
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 10:03:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 585A23C136D
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 10:03:28 +0100 (CET)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A9F7F60106B
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 10:03:27 +0100 (CET)
Received: from dggeml757-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HlvYn5Q2Bzcb3Q
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 16:58:37 +0800 (CST)
Received: from dggeml753-chm.china.huawei.com (10.1.199.152) by
 dggeml757-chm.china.huawei.com (10.1.199.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Fri, 5 Nov 2021 17:03:23 +0800
Received: from dggeml753-chm.china.huawei.com ([10.1.199.152]) by
 dggeml753-chm.china.huawei.com ([10.1.199.152]) with mapi id 15.01.2308.015;
 Fri, 5 Nov 2021 17:03:22 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Petr Vorel <pvorel@suse.cz>, Amir Goldstein <amir73il@gmail.com>
Thread-Topic: [LTP] [PATCH] syscalls/fanotify: Kill the child process before
 exit
Thread-Index: AdfSI+ORg6gbLgYfS7KVywAEcf7nnw==
Date: Fri, 5 Nov 2021 09:03:22 +0000
Message-ID: <8db5b877820f47b8be4c6706af42ab56@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fanotify: Kill the child process before
 exit
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
Cc: Matthew Bobrowski <repnop@google.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

I have resubmit a patch as your review. Please see: https://patchwork.ozlabs.org/project/ltp/patch/20211105090200.103485-1-zhaogongyi@huawei.com/

Thanks so much!
Gongyi

> 
> Hi all,
> 
> ...
> > This would be the obvious solution.
> > But simpler to skip zero values then stop the iterator.
> +1
> > This makes the cleanup helper reenetrant:
> 
> > static int stop_children(void)
> > {
> >         int child_ret;
> >         int i, ret = 0;
> 
> >         for (i = 0; i < MAX_CHILDREN; i++) {
> >                 if (!child_pid[i]) continue;
> >                 SAFE_KILL(child_pid[i], SIGKILL);
> >         }
> >         for (i = 0; i < MAX_CHILDREN; i++) {
> >                 if (!child_pid[i]) continue;
> >                 SAFE_WAITPID(child_pid[i], &child_ret, 0);
> >                 if (!WIFSIGNALED(child_ret))
> >                         ret = 1;
> >                 child_pid[i] = 0;
> >        }
> 
> >         return ret;
> > }
> 
> Amir, thanks! Zhao, could you please test this in your setup?
> (+ please be verbose about your setup, it helps to decide in the future that
> fix is still needed).
> 
> Kind regards,
> Petr
> 
> > Thanks,
> > Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
