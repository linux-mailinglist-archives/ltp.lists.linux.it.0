Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE64249265
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 03:34:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3442B3C5888
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 03:34:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E780C3C0639
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 03:34:26 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 43CB910006C1
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 03:34:25 +0200 (CEST)
Received: from mail-lf1-f71.google.com ([209.85.167.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1k8Czg-0001BY-Vl
 for ltp@lists.linux.it; Wed, 19 Aug 2020 01:34:25 +0000
Received: by mail-lf1-f71.google.com with SMTP id u26so4981333lfk.7
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 18:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2mKhkiWmfL2XZnzXf0K2Q42RgNGUiHOgi9tNu9cKmMA=;
 b=pCmLrA7NTsaGJtbp89ahZtbtf7t1hoSorS3UkN3VRLJfakgFBcufUIb6I9U0AZWI9y
 oZPfUNkb45eb13e5uLuxj7YSHst/OS+fOLTFvauNxqDAxBlVB3OJEYwirwtVUjGPw7HY
 tiZn/EScixG/uiQUXu3fBucrQlg9PLE7dRMCgG6IpFEWdobhp0uKLmbF1xgn2iAHKnzx
 QM9t6fqa7ZnMzfuVFJuqHsTvNBTtV0XSfGJhh3NkLUJEY0yfnDiZo93kDBEvBHn2W9hm
 csxsq6Jy0/2gUePQy6iinPnBKi0rDiAirWjvEHm/kmiGyhNrt6hCDkvAt3a0SeDApkMu
 v0tw==
X-Gm-Message-State: AOAM531JrcwiuwlhCZ/tRZ8m8PeCCRz1X/VyjOulShsNOhWjybD3uABv
 SsSmHk5DkfVwzT84+aF57VkmTBz5Ad1nMBHlU2t/eWe5GBImEyV40m7puaKE29ZQ/4fb/5g49qj
 Ogt0aZLVDjB6uMRaQ6i8wgksNuHrqAV2vNcP7/pk8O0E=
X-Received: by 2002:ac2:5f64:: with SMTP id c4mr11484969lfc.170.1597800864327; 
 Tue, 18 Aug 2020 18:34:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG9dX7folam1XVl2L3ACzzoLWJbBnmF7FvBKiAUQ6SAPBJ5wXRTnSrCzBJeVOhups5Sx8og3ml5ad2Y8WmfYk=
X-Received: by 2002:ac2:5f64:: with SMTP id c4mr11484960lfc.170.1597800864087; 
 Tue, 18 Aug 2020 18:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200818100422.27775-1-po-hsu.lin@canonical.com>
 <20200818100422.27775-2-po-hsu.lin@canonical.com>
 <20200818152941.GG27964@yuki.lan>
 <CAMy_GT9kZbvC9=t9e2J4nrfW+vMHzK-DH2bU3=ZbkJepk4TrEQ@mail.gmail.com>
 <20200818183019.GH27964@yuki.lan>
In-Reply-To: <20200818183019.GH27964@yuki.lan>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Wed, 19 Aug 2020 09:34:12 +0800
Message-ID: <CAMy_GT8Ek5f=tNVH-s2yo1iJ5D8oGcUx6ypUzsNqNZYraNo1FA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCHv2 1/2] lib/tst_kvercmp: Add support to get
 distname for different OS in tst_kvcmp_distname
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Aug 19, 2020 at 2:29 AM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > oh indeed, the delimiter in strtok will become null character anyway.
> > I think just tok = distname can do the trick here.
> > I will send v3 tomorrow.
>
> I can easily fix that before I push the patch, no need for v3.

Hello Cyril,
that would be great, thanks for the review!

>
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
