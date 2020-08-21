Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4334024CB27
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 05:10:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 11FF93C2FCF
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 05:10:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0E3753C2F97
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 05:10:17 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D4251600868
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 05:10:16 +0200 (CEST)
Received: from mail-lf1-f72.google.com ([209.85.167.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1k8xRX-0006sJ-Pm
 for ltp@lists.linux.it; Fri, 21 Aug 2020 03:10:15 +0000
Received: by mail-lf1-f72.google.com with SMTP id 138so4519lff.22
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 20:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4lQE5eQoZ3xZ0tO9KNkxYgcsdBXI9Ud7CBBvjhl3scE=;
 b=bd9rM00FtvwjGF5LRr9z9Zg5TnIQMO5itBljlqpCwkCN1jjMOLhvxScI3Z3gp+DwCA
 xpsWTLX6EwupsnOe408bic9hfnG+7p8bFqnwLcP+SyvcyS7DBY0XpOoVvaJjAbTK1/xP
 js4kFVe4LK7jVqzQAEw+2nwBGFoxDrtAVMDmmT1RBMUk1r09gD+mg0HPYkjiNzNMxtj4
 3rvyC4x6iOGpaat5LoR3yvUoawuUO6g7XEvpboCS7/v1kMuuBn+Xn+UOId/LHbllabb6
 ijkmpQh7j2DHUhQA2VS3PJslmJ67Qgz3zdzvJCwStvv12SgTwSOnZVqcLsRhL6kuPWFi
 PrNg==
X-Gm-Message-State: AOAM5302wXXyCn2zKeP/fnEG9pUPzpGD8Glevd9DjlKW6z4sBOMAN9Jb
 nPA+n3rvsuzR9x3w4U3P7PFYhCowRILNPaEcjV/aZroHBv1i070Hai6w9YIsUM/EOJhOGSUi7/O
 y1ynD6fnC8qWsGnp8DAXaPkk1P0TPr9HzF+5q4NORKV4=
X-Received: by 2002:a2e:3506:: with SMTP id z6mr451890ljz.418.1597979415120;
 Thu, 20 Aug 2020 20:10:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5ZW/gHOSk8+CGFVPPllq4XpGljcrxiohasz1x9p19hnoS18mwhu23UxtjbEPV76OsXGy9TFh6l3YowyKuUEc=
X-Received: by 2002:a2e:3506:: with SMTP id z6mr451883ljz.418.1597979414899;
 Thu, 20 Aug 2020 20:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200820133032.16840-1-pvorel@suse.cz>
 <20200820134557.GG9000@yuki.lan>
 <CAMy_GT_0yg4CEW+a8TC-9rrYeNWW0Xa+UsMa70v495WBrUXeBA@mail.gmail.com>
 <20200820203335.GA7560@x230>
In-Reply-To: <20200820203335.GA7560@x230>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Fri, 21 Aug 2020 11:10:03 +0800
Message-ID: <CAMy_GT_K5OSg_8ZJqi__VHrEhvHN-QnQJ0YzPJCmYeCBL5xfoA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/1] tst_kvcmp: Strip double quotes when
 parsing /etc/os-release
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Aug 21, 2020 at 4:33 AM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Po-Hsu,
>
> > LGTM,
> > Tested with crafted ID, it can correctly parse the ID with or without
> > the double quote.
>
> > Another thing to note is that I found the loop in tst_kvercmp2 could
> > iterate outside the size of "vers" and causing
> > tst_test.c:1298: BROK: Test killed by SIGSEGV!
> Will you post the patch for this?
>
> > Reviewed-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> I'm sorry, I've merged it before, but forget to notify.
> Is the bug mentioned above related to my commit?
Hello Petr,
Don't worry it's not related to this commit :)
I will have a look at that bug.

Cheers
>
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
