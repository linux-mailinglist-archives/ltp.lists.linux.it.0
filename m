Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 812E2395514
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 07:33:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3D6C3C2973
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 07:33:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 062823C2900
 for <ltp@lists.linux.it>; Mon, 31 May 2021 07:33:53 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3DA3C1A0089C
 for <ltp@lists.linux.it>; Mon, 31 May 2021 07:33:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622439230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y09WchAEZZmcowTlT3A3/BDBoWsyB5mGk6AVY9L90s0=;
 b=egix1GkxlnmIPUel/VYI43FsR7qAtcDdFjkSMGGB49BxWKBXgwAm+vGD5KCqcmE4CAuXDg
 GrS10XANIGzY4CDG7Hwiz5x4XDuH+QPJ1jmGDP5k64tkN+aCMCmaWR9BM7gXmRWppqp7/c
 29zSnEd7i/unyUi0NAQcC4x1lSbKKus=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-r8vwTsPZN9yFSC0EtGtVGw-1; Mon, 31 May 2021 01:33:48 -0400
X-MC-Unique: r8vwTsPZN9yFSC0EtGtVGw-1
Received: by mail-yb1-f200.google.com with SMTP id
 d4-20020a25b5c40000b02904f8e3c8c6c9so12457818ybg.14
 for <ltp@lists.linux.it>; Sun, 30 May 2021 22:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y09WchAEZZmcowTlT3A3/BDBoWsyB5mGk6AVY9L90s0=;
 b=YLnj4npJkIw8czMJGXow0E2OTWpwYooq2x6TrIAI3ttTBzLIBR/nLnL9qoTdKSFJLz
 cOTvkaG6XgQATtSLYbKkeE9hewZaQ8tonGNXBpkA74YhynF/OHy2+BA3cOFWFb0iOzx7
 8cF4XmKacdcpofAp0PqJStKPs5Q9hntDw5h7GWA4AiRTnnbSH9BinAic4FMl0hgZygHv
 MJvyQNjo06+L8b2QpAELs/TO+RtW17lITwOspd1XmTHYQyPBf3Ou9chmaH3sUjkx2IAA
 qHUEe2UJs3Ihy8v7z4xkUDIvJyRBtjZ8+kl6/t30dm0Ge/8uN/wIgvCptrMPDkj9IEHK
 vAhg==
X-Gm-Message-State: AOAM530DbIViGtJhiIRMZi3Ct/TY4q8qNTJlCUEZNIJIDN2bC2dOK3sn
 rJ23p6oYtGBFBHODURwnNiQS+rTjbcyc5ysw9V8YZmIqy4s/pXzLD6UdpzjNwzhTiMruRisBMOR
 ZcHgVKLAovVhQVy92LfQGAgTyNZU=
X-Received: by 2002:a25:1189:: with SMTP id 131mr29728193ybr.286.1622439227911; 
 Sun, 30 May 2021 22:33:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfEdW+nhHwqvs7p8tYJPrwvkmUhAt9fg2n3w2KT33rcxUpWKHSpYwwjDA8e/LnagHO3j/7CsruygAiY3m0l2s=
X-Received: by 2002:a25:1189:: with SMTP id 131mr29728171ybr.286.1622439227665; 
 Sun, 30 May 2021 22:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210521102528.21102-1-rpalethorpe@suse.com>
 <20210521102528.21102-7-rpalethorpe@suse.com>
 <CAEemH2c2yTKbUyW5RQoyqOh2k0JFe3wNJwdcRfBkZD9w8SHG0w@mail.gmail.com>
 <87k0njjj11.fsf@suse.de>
In-Reply-To: <87k0njjj11.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Mon, 31 May 2021 13:33:35 +0800
Message-ID: <CAEemH2fww4Zwqh6E_C+R9erUpXbebKUzS2eHe4JT9LXnsgLUGQ@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
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
Subject: Re: [LTP] [PATCH v2 6/6] sched/cgroup: Add cfs_bandwidth01
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

Hi Richard,

> >> +static void do_test(void)
> >> +{
> >> +       size_t i;
> >> +
> >> +       for (i = 0; i < ARRAY_SIZE(cg_workers); i++)
> >> +               fork_busy_procs_in_cgroup(cg_workers[i]);
> >> +
> >> +       tst_res(TPASS, "Scheduled bandwidth constrained workers");
> >> +
> >> +       sleep(1);
> >> +
> >> +       set_cpu_quota(cg_level2, 50);
> >
> > This test itself looks good.
> > But I got a series of warnings when testing on CGroup V1:
>
> Thanks for testing it.
>
> >
> > # uname -r
> > 4.18.0-296.el8.x86_64
> >
> > [root@dhcp-66-83-181 cfs-scheduler]# ./cfs_bandwidth01
> > tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
> > tst_buffers.c:55: TINFO: Test is using guarded buffers
> > cfs_bandwidth01.c:48: TINFO: Set 'worker1/cpu.max' = '3000 10000'
> > cfs_bandwidth01.c:48: TINFO: Set 'worker2/cpu.max' = '2000 10000'
> > cfs_bandwidth01.c:48: TINFO: Set 'worker3/cpu.max' = '3000 10000'
> > cfs_bandwidth01.c:111: TPASS: Scheduled bandwidth constrained workers
> > cfs_bandwidth01.c:42: TBROK:
> > vdprintf(10</sys/fs/cgroup/cpu,cpuacct/ltp/test-8450/level2>,
> > 'cpu.cfs_quota_us', '%u'<5000>): EINVAL (22)
>
> I wonder if your kernel disallows setting this on a trunk node after it
> has been set on leaf nodes (with or without procs in)?

After looking a while, I think the CGrup V1 disallows the parent quota
less than the max value of its children.

This means we should set in level2 at least '3000/10000', just like what
we did for level3.

  cfs_bandwidth01.c:48: TINFO: Set 'worker1/cpu.max' = '3000 10000'
  cfs_bandwidth01.c:48: TINFO: Set 'worker2/cpu.max' = '2000 10000'
  cfs_bandwidth01.c:48: TINFO: Set 'worker3/cpu.max' = '3000 10000'

But in the failure, it shows level2 only set to 5000/100000 (far less than
3000/10000), that's because function set_cpu_quota changes the system
default value 'cpu.cfs_period_us' from 100000 to 10000.

To verify my suppose, I got all PASS when changing it back to default 100000.

--- a/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
+++ b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
@@ -31,7 +31,7 @@ static struct tst_cgroup_group *cg_workers[3];
 static void set_cpu_quota(const struct tst_cgroup_group *const cg,
                          const float quota_percent)
 {
-       const unsigned int period_us = 10000;
+       const unsigned int period_us = 100000;
        const unsigned int quota_us = (quota_percent / 100) * (float)period_us;

        if (TST_CGROUP_VER(cg, "cpu") != TST_CGROUP_V1) {


# ./cfs_bandwidth01
tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
tst_buffers.c:55: TINFO: Test is using guarded buffers
cfs_bandwidth01.c:48: TINFO: Set 'worker1/cpu.max' = '30000 100000'
cfs_bandwidth01.c:48: TINFO: Set 'worker2/cpu.max' = '20000 100000'
cfs_bandwidth01.c:48: TINFO: Set 'worker3/cpu.max' = '30000 100000'
cfs_bandwidth01.c:111: TPASS: Scheduled bandwidth constrained workers
cfs_bandwidth01.c:48: TINFO: Set 'level2/cpu.max' = '50000 100000'
cfs_bandwidth01.c:122: TPASS: Workers exited

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0


> > unlinkat(10</sys/fs/cgroup/cpu,cpuacct/ltp/test-8450/level2>,
> > 'level3b', AT_REMOVEDIR): EBUSY (16)
> > tst_cgroup.c:896: TWARN:
> > unlinkat(9</sys/fs/cgroup/cpu,cpuacct/ltp/test-8450>, 'level2',
> > AT_REMOVEDIR): EBUSY (16)
> > tst_cgroup.c:766: TWARN: unlinkat(7</sys/fs/cgroup/cpu,cpuacct/ltp>,
> > 'test-8450', AT_REMOVEDIR): EBUSY (16)
>
> This happens because the child processes are still running at cleanup
> because we skipped stopping them. I guess I should fix that.

+1

Patchset looks good with adding the above two fixes.

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
