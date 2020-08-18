Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFAB248204
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 11:37:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBB303C2FEA
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 11:37:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 701993C26C8
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 11:37:21 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 15316200B25
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 11:37:20 +0200 (CEST)
Received: from mail-lj1-f199.google.com ([209.85.208.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1k7y3U-0005yD-5P
 for ltp@lists.linux.it; Tue, 18 Aug 2020 09:37:20 +0000
Received: by mail-lj1-f199.google.com with SMTP id z9so3267666ljj.21
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 02:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H2wuLIhzTjLbTsszqgNgP/D/yLAElOXYxtpUh2+3TOU=;
 b=nRZupZM9tCDARnhC2xtpLDGVmd0RFt0FTbJAZfhpO9ZtMJVyxjZrKxEY2fgsqsAmUd
 sRpB4W92kTvQtYW7iSY/5SEKGvDy1VmFKXB/skz3bdvqZGa/nHTHEFtQ0K2AsJYjR+82
 Er77NSE8rsqh7ABVaLnqraXlzRwjtorvfMMc6UWe4QYZuA5TIZbmIWGBKEP/TpdiQVEg
 vMEDUmvMH7GKDXE2Oma0GF8Yvy/rs8RWqPuAu8QFKgJIZAeeCVoxVAEFTHPalHxhdrVE
 ywzcJ8b/BTmsLZXQLeDlkyvEaolSHK0ciqxAY/KCz1/WOP1VxM0pIDws0Pk4eJMmIA5q
 BGuA==
X-Gm-Message-State: AOAM530feaUW25JYklJk8dlu0Pd+CbY8cz2mOmawZP/UmNROMvAafOHp
 MhN8VuXg45Gov1B6ZjaaXgSFBZtw6VTOX/dM8LkyYxt2Hs/fPOe8V8ZrOHTq2cqvK6ZAKJ5ZjnD
 sT7xxnbGpRZG4A6HrW56xbRyvp5+KmMqm+iXNYnnO2F4=
X-Received: by 2002:a05:651c:543:: with SMTP id
 q3mr9155102ljp.145.1597743439637; 
 Tue, 18 Aug 2020 02:37:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfNydNtfO2SQenNscVxoKkLM5AuFxlftBCu6NHtgHCdlGxFslgqZVfIN6YsL7xIMvflVp86iR1nj6yx5jdY5g=
X-Received: by 2002:a05:651c:543:: with SMTP id
 q3mr9155094ljp.145.1597743439381; 
 Tue, 18 Aug 2020 02:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200817120644.9401-1-po-hsu.lin@canonical.com>
 <20200817120644.9401-2-po-hsu.lin@canonical.com>
 <20200817123403.GA8445@yuki.lan> <20200817124504.GC8445@yuki.lan>
In-Reply-To: <20200817124504.GC8445@yuki.lan>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Tue, 18 Aug 2020 17:37:07 +0800
Message-ID: <CAMy_GT8YkSR_xM9iwSGEG55XewODiVAbDnhrkp5S-_M0R3xb4g@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib/tst_kvercmp: Add support to get distname
 for Ubuntu in tst_kvcmp_distname
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

On Mon, Aug 17, 2020 at 8:44 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > It should be as easy as one SAFE_FILE_SCANF() in the case that the file
> > exists.
>
> It's SAFE_FILE_LINES_SCANF()

Hello Cyril,
thanks for your suggestion, I will submit V2 for this.

>
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
