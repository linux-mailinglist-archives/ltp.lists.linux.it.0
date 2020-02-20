Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A96D165882
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 08:35:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB2A93C1482
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 08:35:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 6CF983C1482
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 08:35:53 +0100 (CET)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D7A76100175C
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 08:34:31 +0100 (CET)
Received: by mail-pj1-x1044.google.com with SMTP id gv17so516010pjb.1
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 23:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9Yb0L7GDawNQUtnQgz8Mvt0oqAZyX8FAcM9RZ0DUrcI=;
 b=dDmiug7Q8mFByKpwKFnc2KGCruBqY+oWhVO3uMikyTcl0pySxnoIFA3hj7e5FtOy0u
 q9/XlDG7gmfZWpFcNviFeOOHK/qTq7RiV/hRh00JY86eu5dGfhbkzvB/bR89rneOH9Hu
 V+shP01BrX8VPFofcGfiZhEvx41FLpS1F/WMfrpHReExHsj7MpmOvl7IoGDI3qJFyv39
 A6h/PVZRZQ4WdOkhr8CAz46Izj3vrBZFTREJnifslo11/rMR+ik2w/gMq/kSnAAZqVd8
 43qKGDU4VG+XO+1VbI/jbK2al1WJ8RQKdkLhhmh9DuXBJyMOEmV8nxFK+ZToPxF4vc/K
 aOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9Yb0L7GDawNQUtnQgz8Mvt0oqAZyX8FAcM9RZ0DUrcI=;
 b=JrwtwdAdTeqGDvwgOguwGSsdLzydPe2mTJDMHatRiIGXQ5kk/mfZzHwpmwwC4GFQG8
 YeKNEf8IT6Ovjm4D68411M+KRjBfdEGe+1V7t+b/0ZncWoVjPcm1uhkp1oV0EdfbWAa1
 VuVaaGHmOo7VMg1Ya/n/I+x7oV1p5GgvtGTrXwhqJbPiqfxmqXnW1hhzUopDyQl8904k
 kYNts/1BdpDXfh7F4NlqUUtoN3Ynk+fgAx/eAQH2rG8t1ak8MAukp2Mfcnk8YkCwrJ7t
 vUAbF4IR5aNqiFYzkgz5LuLXBF9ZGUE1ponn5sQFL1Ivm+W54GWzlLethoMaoUgxVs6a
 qbnA==
X-Gm-Message-State: APjAAAXVj9dri4rvnY71q08mZDwK+W3lB76PKpACWGkzB85y/mfS7LpX
 1yqVmw+BdMl5eZfxv0FGpWguXg==
X-Google-Smtp-Source: APXvYqwVpFj+fG4fQEoyorNjW9tdNFwQRvT1NtIlj+4i3dJRO3ddMvEEPxVnDUXJJV9lrLUPLCrb9Q==
X-Received: by 2002:a17:902:9a4c:: with SMTP id
 x12mr28676254plv.297.1582184151412; 
 Wed, 19 Feb 2020 23:35:51 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id f127sm2168718pfa.112.2020.02.19.23.35.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 23:35:50 -0800 (PST)
Date: Thu, 20 Feb 2020 13:05:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200220073548.d272x5qzrkc2fq6b@vireshk-i7>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <da324ef2c06239f2cb7fc1eee436209e3bd2e35a.1582104018.git.viresh.kumar@linaro.org>
 <CAEemH2ee77jFMsEptSqy39giJ5aXTsOpsRWg1g+6vLr8kfJsFw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2ee77jFMsEptSqy39giJ5aXTsOpsRWg1g+6vLr8kfJsFw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 10/10] syscalls/open_tree: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 20-02-20, 15:25, Li Wang wrote:
> Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > ...
> > +++ b/testcases/kernel/syscalls/open_tree/open_tree01.c
> > ...
> > +static struct tcase {
> > +       char *name;
> > +       unsigned int flags;
> > +} tcases[] = {
> > +       {"Flag OPEN_TREE_CLONE", OPEN_TREE_CLONE},
> > +       {"Flag OPEN_TREE_CLOEXEC", OPEN_TREE_CLONE | OPEN_TREE_CLOEXEC},
> > +};
> >
> ==> remove Flag
> 
> 
> +++ b/testcases/kernel/syscalls/open_tree/open_tree02.c
> > @@ -0,0 +1,104 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > ...
> > +
> > +       fsmfd = TST_RET;
> > +       TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
> > +                       MOVE_MOUNT_F_EMPTY_PATH));
> > +       SAFE_CLOSE(fsmfd);
> > +
> > +       if (TST_RET == -1)
> > +               tst_brk(TBROK | TERRNO, "move_mount() failed");
> > +
> >
> 
> +       ismounted = 1;
> 
> We need to set 'ismounted' variable to 1 here, otherwise, the test will
> break at the second loop.

Last minute change went untested it seems. Sorry about that.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
