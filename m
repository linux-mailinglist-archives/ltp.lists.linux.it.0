Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A89F377040
	for <lists+linux-ltp@lfdr.de>; Sat,  8 May 2021 09:08:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 44DE73C5547
	for <lists+linux-ltp@lfdr.de>; Sat,  8 May 2021 09:08:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4992D3C54C7
 for <ltp@lists.linux.it>; Sat,  8 May 2021 09:08:38 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BCA671A00441
 for <ltp@lists.linux.it>; Sat,  8 May 2021 09:08:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620457716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IEmYopbcz26hFKoX7gRLAKepxU1+HIXFwC8eU/+d/fA=;
 b=Aw2svwmlMkj02/W4fD0phDAhVPGy95W1ChX6zzXn6QSS8ew3XSsuL9qme4DXXa0+F0LLF6
 6S1RiQQqyO14doqLaiZz5YY0bUBmWH+a6cRy7goTbZBbPyaOeDnoI/PtcgwsYv4wR4/lWp
 3mFaDTsOZg9/MGkXCINodWr9p+LQmDI=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-YRTWclM_PFuYCcfHUv8afw-1; Sat, 08 May 2021 03:08:34 -0400
X-MC-Unique: YRTWclM_PFuYCcfHUv8afw-1
Received: by mail-yb1-f197.google.com with SMTP id
 a7-20020a5b00070000b02904ed415d9d84so12913405ybp.0
 for <ltp@lists.linux.it>; Sat, 08 May 2021 00:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IEmYopbcz26hFKoX7gRLAKepxU1+HIXFwC8eU/+d/fA=;
 b=ZGNMl82ylXzHet38sQsTAsa5f5weB4UC3u5RuBNEnn7HhUfhqIT2Es3RSQr+r3/hj4
 olJCmH/FVDpVKKc9Y4MuGYEDVLKg9TaAq4Bq3zAmBuC+2o25Y2mTwEe0DOgH8H9SZrrY
 5xBGNQjiw/LJRv+pcEHI00JidAdR2992qDWJ40/0nJ9p81w1Bjl+CAENEIcFvqZpQFNj
 HW+lCKsq+l878kyv4AH473IZR8FyDWjdlCGp7sI+CUlM8epYUq9ZKEA20s29riucN6ez
 l4W93maZvhXs/PMrZeHd8HpE1biqo+PgrLyrsA/2ekd3ZrV2inbUItla1CVOJvZYs8h5
 GRzw==
X-Gm-Message-State: AOAM532Lod/+Emr+Bjl8lP6ZS/v7wjIuOAQaCkC+I2/O3fO85g+B6dOq
 5I/QyiwoucfL60/kXEKevl+DK4ui/Emprl59MzqHb35ey1tV+x8b/Jx2/+VebGjKEO3BP+maMze
 46P99NbPqFjDXFuYYvAf2N9raNuE=
X-Received: by 2002:a25:ae24:: with SMTP id a36mr19260199ybj.97.1620457713867; 
 Sat, 08 May 2021 00:08:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzrMd/l/yEJByMljsFC8tWpre7I3MUZIKAsPDunDU5Lyenrfik96jr9PrjULkBo91IvHzklWDq4W4FKkWryZY=
X-Received: by 2002:a25:ae24:: with SMTP id a36mr19260185ybj.97.1620457713699; 
 Sat, 08 May 2021 00:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <1619684694-116827-1-git-send-email-wangxin410@huawei.com>
In-Reply-To: <1619684694-116827-1-git-send-email-wangxin410@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Sat, 8 May 2021 15:08:22 +0800
Message-ID: <CAEemH2ddDeXCix9EPeeydWSHTA6d--TPW+ZV9nG9xOCtns_3sQ@mail.gmail.com>
To: Wang Xin <wangxin410@huawei.com>, Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH v2] controllers/cpuset: Restore the value of
 cpuset.sched_load_balance
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

On Thu, Apr 29, 2021 at 4:08 PM Wang Xin <wangxin410@huawei.com> wrote:
>
> When we run the cpuhotplug03 test case on the arm64 machine,
> we conclude that no error occurs when the cpuhotplug03 case is executed alone,
> but once the cpuset_sched_domains case is executed first,
> After cpuhotplug03 is executed, the error "cpuhotplug03 1 TFAIL: No cpuhotplug_do_spin_loop processes found on" occurs.
> The cpuset_sched_domains test case changes the value of cpuset.sched_load_balance in the cpuset cgroup subsystem,
> but does not restore the value at the end of the test.
> Modify the cpuset_funcs.sh file. The test result shows that the problem is solved successfully.
>
> Signed-off-by: Wang Xin <wangxin410@huawei.com>
Reviewed-by: Li Wang <liwang@redhat.com>

This just does saves/restore action in setup/cleanup phase, looks no
harmful to merge in this release.


--
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
