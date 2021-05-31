Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B57395532
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 08:02:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4645E3C2982
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 08:02:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ED22E3C20B6
 for <ltp@lists.linux.it>; Mon, 31 May 2021 08:02:47 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E67431A0091F
 for <ltp@lists.linux.it>; Mon, 31 May 2021 08:02:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622440965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q6/Kqd+9SZOt2OnVqAtUYbDaweD+VuJUOLyE+Iy2H5o=;
 b=G2pDUznbCAcw6Ra0kqDhGeZSpivwRg0V5OB+wgR6RfRu2bi8TJPPzGz3OzSjBmKo73M4MQ
 1JggKO1HUXNME/95RNiXhtECQs9AXht0FPB8KZS7t8jlqIHXY1DZwDW2RTU6ktoI7NOVE1
 Zt3Sj8I6QP6eSwdrn3CXmiJ8/XQfslQ=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-_vC7boX0Oy6VNFYQdk5EGw-1; Mon, 31 May 2021 02:02:43 -0400
X-MC-Unique: _vC7boX0Oy6VNFYQdk5EGw-1
Received: by mail-yb1-f200.google.com with SMTP id
 q63-20020a25d9420000b0290532e824f77cso9226842ybg.10
 for <ltp@lists.linux.it>; Sun, 30 May 2021 23:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q6/Kqd+9SZOt2OnVqAtUYbDaweD+VuJUOLyE+Iy2H5o=;
 b=YSHHYv30P16xXrPuUeFn/SjQ5Rx+bFKbUYrPNWzDL4yBOVfTJxhpqiVnfr5eA0bN67
 OYJV3SAnv5p7fK3cgTX6jL7j9k0j07Nd+J3h0azai49M7PzQV3MzZvQxcdh7oRvfkYW1
 jTDxEJXerNCYhELCsS4Nm7hqLNKYOvFcBVr0W1+Q9VxRzRKkkrYWPi2Ee+AfwGX19fm/
 BzaiadogY79f4+c1/R2+UfubIRDUVL2lLsHIdbFM/bSgudrXGW8OiIjbKukdF5PefT12
 r2QZS4IbpeZp0u3CQyKMYUtemiSxO5tMGSw5p2fRP+ple2MpzGMBoAhgbGH0vJkRaeXH
 ja/g==
X-Gm-Message-State: AOAM5336crWX1oGb6fDK8n48L1RBoGYKR1UtXpj8njnLOD4mSVlWqXjN
 MY4TdF+SoLc745d1iYvm1joI4rSuxUW0r0/zo9Fr04+G9rg1FjxDOqBrZ2ShIjtqgANXa4B84Ig
 /oxw8r8Uaz03fEUkNypTvZoRXAaQ=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr28367893ybp.366.1622440962538; 
 Sun, 30 May 2021 23:02:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeGlhJ/uq5OhS8athhL6o/KfUee9Hl6Su4Rmvq1IiyuBVwdOgyHyIUhXVD2aH0Zw96/xUSxD0LiMt4ns/PsBY=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr28367880ybp.366.1622440962371; 
 Sun, 30 May 2021 23:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210521102528.21102-1-rpalethorpe@suse.com>
 <20210521102528.21102-7-rpalethorpe@suse.com>
 <CAEemH2c2yTKbUyW5RQoyqOh2k0JFe3wNJwdcRfBkZD9w8SHG0w@mail.gmail.com>
 <87k0njjj11.fsf@suse.de>
 <CAEemH2fww4Zwqh6E_C+R9erUpXbebKUzS2eHe4JT9LXnsgLUGQ@mail.gmail.com>
In-Reply-To: <CAEemH2fww4Zwqh6E_C+R9erUpXbebKUzS2eHe4JT9LXnsgLUGQ@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 31 May 2021 14:02:30 +0800
Message-ID: <CAEemH2dTr7vDjdEJ3TsoPnQMM6TSk7-0dPX0yC2Emd1z+8vDFg@mail.gmail.com>
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

> > > [root@dhcp-66-83-181 cfs-scheduler]# ./cfs_bandwidth01
> > > tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
> > > tst_buffers.c:55: TINFO: Test is using guarded buffers
> > > cfs_bandwidth01.c:48: TINFO: Set 'worker1/cpu.max' = '3000 10000'
> > > cfs_bandwidth01.c:48: TINFO: Set 'worker2/cpu.max' = '2000 10000'
> > > cfs_bandwidth01.c:48: TINFO: Set 'worker3/cpu.max' = '3000 10000'
> > > cfs_bandwidth01.c:111: TPASS: Scheduled bandwidth constrained workers
> > > cfs_bandwidth01.c:42: TBROK:
> > > vdprintf(10</sys/fs/cgroup/cpu,cpuacct/ltp/test-8450/level2>,
> > > 'cpu.cfs_quota_us', '%u'<5000>): EINVAL (22)
> >
> > I wonder if your kernel disallows setting this on a trunk node after it
> > has been set on leaf nodes (with or without procs in)?
>
> After looking a while, I think the CGrup V1 disallows the parent quota
> less than the max value of its children.
>
> This means we should set in level2 at least '3000/10000', just like what
> we did for level3.
>
>   cfs_bandwidth01.c:48: TINFO: Set 'worker1/cpu.max' = '3000 10000'
>   cfs_bandwidth01.c:48: TINFO: Set 'worker2/cpu.max' = '2000 10000'
>   cfs_bandwidth01.c:48: TINFO: Set 'worker3/cpu.max' = '3000 10000'
>
> But in the failure, it shows level2 only set to 5000/100000 (far less than
> 3000/10000), that's because function set_cpu_quota changes the system
> default value 'cpu.cfs_period_us' from 100000 to 10000.

Or, just reverse the code order to set cfs_period_us first, that also works.

--- a/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
+++ b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
@@ -38,10 +38,10 @@ static void set_cpu_quota(const struct
tst_cgroup_group *const cg,
                SAFE_CGROUP_PRINTF(cg, "cpu.max",
                                   "%u %u", quota_us, period_us);
        } else {
-               SAFE_CGROUP_PRINTF(cg, "cpu.max",
-                                  "%u", quota_us);
                SAFE_CGROUP_PRINTF(cg, "cpu.cfs_period_us",
                                  "%u", period_us);
+               SAFE_CGROUP_PRINTF(cg, "cpu.max",
+                                  "%u", quota_us);
        }


-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
