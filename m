Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B75843C0C0
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 05:28:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C46EF3C6843
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 05:28:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 151D13C67EA
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 05:28:47 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F0196600700
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 05:28:44 +0200 (CEST)
Received: from dggeml758-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HfDdf6q0sz8trB;
 Wed, 27 Oct 2021 11:27:18 +0800 (CST)
Received: from dggeml753-chm.china.huawei.com (10.1.199.152) by
 dggeml758-chm.china.huawei.com (10.1.199.159) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Wed, 27 Oct 2021 11:28:40 +0800
Received: from dggeml753-chm.china.huawei.com ([10.1.199.152]) by
 dggeml753-chm.china.huawei.com ([10.1.199.152]) with mapi id 15.01.2308.015;
 Wed, 27 Oct 2021 11:28:39 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Jan Stancek <jstancek@redhat.com>
Thread-Topic: [LTP] [PATCH] lapi/syscalls: Add epoll_create for aarch64.in
Thread-Index: AdfK4MPuM5VVybBTTHCDLv/mQLWULw==
Date: Wed, 27 Oct 2021 03:28:39 +0000
Message-ID: <366c70644bfb48ddb13e33e80cea5718@huawei.com>
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
Subject: Re: [LTP] [PATCH] lapi/syscalls: Add epoll_create for aarch64.in
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

Hi,

> 
> On Tue, Oct 26, 2021 at 9:49 AM Zhao Gongyi <zhaogongyi@huawei.com>
> wrote:
> >
> > Add epoll_create for aarch64.in and modify the value of epoll_ctl for
> > aarch64.in. Otherwise, the testcase epoll_create01/epoll_create02 will
> > fail.
> >
> > Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> > ---
> >  include/lapi/syscalls/aarch64.in | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/lapi/syscalls/aarch64.in
> > b/include/lapi/syscalls/aarch64.in
> > index a47185954..e9023a1d0 100644
> > --- a/include/lapi/syscalls/aarch64.in
> > +++ b/include/lapi/syscalls/aarch64.in
> > @@ -19,7 +19,6 @@ getcwd 17
> >  lookup_dcookie 18
> >  eventfd2 19
> >  epoll_create1 20
> > -epoll_ctl 21
> >  epoll_pwait 22
> >  dup 23
> >  dup3 24
> > @@ -243,6 +242,8 @@ rt_tgsigqueueinfo 240  perf_event_open 241
> >  accept4 242
> >  recvmmsg 243
> > +epoll_create 250
> > +epoll_ctl 251
> 
> These values are for 32 bit only syscalls. Won't this break 64 bit?

Yes, these values are for 32 bit only syscalls, the syscall epoll_create is not support for 64bit arm64. 

Reference to man 2 epoll_create, we can see that epoll_create/epoll_create1 are supported If only we include the header file sys/epoll.h.

Is it better that we call epoll_create replace to syscall __NR_epoll_create since some plateform not support it?


Thanks for you review!

> 
> >  wait4 260
> >  prlimit64 261
> >  fanotify_init 262
> > --
> > 2.17.1
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> >


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
