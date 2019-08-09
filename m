Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BE93A87715
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 12:18:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A3E13C1D23
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 12:18:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 52B2C3C17C5
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 12:18:05 +0200 (CEST)
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
 [209.85.221.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 66EDF1401B07
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 12:18:04 +0200 (CEST)
Received: by mail-vk1-f194.google.com with SMTP id 9so19377202vkw.4
 for <ltp@lists.linux.it>; Fri, 09 Aug 2019 03:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pCX0GpE+MGjYWLQxAd37EKkcpdipXtKJxvZWAAExnMs=;
 b=c4YBXC0trXFSo+MX2caIMlw8g4yuveCUfbX2afcene0BHFcg40Mq/FyFFm5f1OmxDB
 31wxLp0Oixbhs0KNWAqzykfmcHoOGEx3+7CQY7K55N+ZsXD3tCKy0FyfT9/xP+NNBYTl
 rGv5/Ygd57IKjOyoSS99XREym4dwdLHniOrN/lH/TK1rZgasBAsP8RnvAs192ZXQ6bxQ
 dNDn+3S7LfqPwJ8rAOv2yBY6dq7ZXm5V/syeewlnlMyMSyC8IjscYltFxsFeIt4v9gCr
 hW3MRjA3WybFakUipMSnF5ofJvbgAgoN2GDCNtAxBTCmrGEsEp1XVJyhVMk2JkD/cJq5
 prWg==
X-Gm-Message-State: APjAAAWdeS2XPOnJGI3GOeDvnNkoY3+OrelZIunVrOiTZWll1sGyv46w
 RuYLRCONDEqa69zGsWhZcvI9surkjU2YB7lGDUd6iA==
X-Google-Smtp-Source: APXvYqzy/SdDHWfRVsR3twHb1DCUun7u/I7+/KDgxnQDuD7isJcSHYX26fDbriOSxAG4e6yTSbClBFWLh6+RnrSD7jU=
X-Received: by 2002:a1f:d3c3:: with SMTP id k186mr3057775vkg.24.1565345883052; 
 Fri, 09 Aug 2019 03:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190807094119.10834-1-pvorel@suse.cz>
 <CAEemH2cM7mhkYBvTTFC4UhjnYxG0D_e-nkCmSF2U8pB61UT0bw@mail.gmail.com>
 <20190809094259.GA27030@dell5510>
In-Reply-To: <20190809094259.GA27030@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Fri, 9 Aug 2019 18:17:52 +0800
Message-ID: <CAEemH2dmQsq7EuN0UqWJuuomQxPXF2Rh_O-EQyW9r4vTHbdpjA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02: Fix #12 when TMPDIR
 is on tmpfs or ext[234]
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
Cc: "Darrick J . Wong" <darrick.wong@oracle.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Aug 9, 2019 at 5:43 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> > Or, anything else?
>
> How about try errno for latest kernel for any kernel (in case it has been
> backported) and if not do the check based on kernel version?
> Probably combined with TWARN.

To combine the methods(1 and 2) together sounds good. But not sure if
that could be a formal policy/rule for LTP. We need some more
thinking/comments.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
