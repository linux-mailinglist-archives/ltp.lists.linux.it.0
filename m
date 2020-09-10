Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5F92647B3
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 16:05:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14D6A3C535F
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 16:05:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id EE4193C224B
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 16:05:13 +0200 (CEST)
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 953EE200D48
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 16:05:13 +0200 (CEST)
Received: by mail-io1-xd41.google.com with SMTP id u6so7165057iow.9
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 07:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fTpKTBng6lfDgdqUcNgb0tU6e7PUdCR1qHrSENS09SE=;
 b=YDiE/df3nr2cVHVfC/B+zxOSYlxborPG8dIz4eq0LGsp4fp6q6q7UO8GPcoJhBwsIb
 1rNVdCipRJpu9Wp0LVMMnJcEWikzLC60i+j8zrQgB11njvG7Ig5vXbmHx+87T7QLmj2f
 NB85jsUKxfFSlkle2uUSwT/28IfdhIPL+B5RFZxfQYj6f04MQYB5WEe+dLBQETWxV3qG
 XrAPjAYurjg//ou4knY5EK5wBOlbfkS8ELcXTZUl8+kYsiXkLVNYJe615RvSntyabZQI
 MPJkVH5VcS7VY41azc1S0g/2b0N217irDYZjOJ3hMvZRCnQBjCbyMgeNyQla3JHsieU6
 rfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fTpKTBng6lfDgdqUcNgb0tU6e7PUdCR1qHrSENS09SE=;
 b=kIno2kKHcGNnn8uvg1fRUbUxRGT8e2bTzpSoPJcwTtz7p7TxSPEvHjC3E0xJTuqNNt
 qnbUn2Z+4M5TO+GzzWH9P057bM1FYKJ8ykD4Plm6BE59GNB8StsJ7FXJc16G2iBAo8EN
 xYHhX9x3CWF029+hN55H1Y5Ky8he6oc67ppg6NcyZb0HA0XQaOtrBKhRTQ/cXtc6M+8s
 edu1/SU/HbenFt/peIOd4G7siXi/aUXfMJc7lk3n1uyuzZDv7KBTbXYSAhaGjQrDCi0b
 XRpEG3o751eb2PMerJ3VLNDTQZB0ucOy54PtG61XEWQaXut3XqY9ny/nPxuoa+gVo43M
 Lnyg==
X-Gm-Message-State: AOAM531N/YDQInaY811dfCeLw4HptbEyfkVSBoiUEru7FhljcLoC92Hf
 UKg4yFeBc3T1eyeN02pJurWsizJNQSWQHwfiwOo=
X-Google-Smtp-Source: ABdhPJx8abqzSmz3zY0U1q9nQ5+0e+Dj3uldbGa7NNq6B8f8qR0VLsxU5YhR1gxLVrPmxgjoJ698mFU9iRv4+ah9Njc=
X-Received: by 2002:a05:6602:2e81:: with SMTP id
 m1mr7601377iow.64.1599746712277; 
 Thu, 10 Sep 2020 07:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200910110712.2181-1-pvorel@suse.cz>
In-Reply-To: <20200910110712.2181-1-pvorel@suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 10 Sep 2020 17:05:01 +0300
Message-ID: <CAOQ4uxgVkz3Xatg43Py4md7LKEUoJKbb4H-Z5y1PyzPdZbx-Rw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] syscalls/fanotify15: TCONF also on EOPNOTSUPP
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Sep 10, 2020 at 2:07 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> instead of TBROK:
> fanotify15.c:86: INFO: Test #0: FAN_REPORT_FID on filesystem including FAN_DELETE_SELF
> fanotify15.c:96: BROK: fanotify_mark(3, FAN_MARK_ADD | FAN_MARK_FILESYSTEM, FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_MODIFY | FAN_ONDIR | 0x400, AT_FDCWD, mntpoint/test_dir) failed: EOPNOTSUPP (95)
>
> is now reported:
> fanotify15.c:86: INFO: Test #0: FAN_REPORT_FID on filesystem including FAN_DELETE_SELF
> fanotify15.c:93: CONF: FAN_REPORT_FID not supported on exfat filesystem
>
> fanotify15.c:86: INFO: Test #0: FAN_REPORT_FID on filesystem including FAN_DELETE_SELF
> fanotify15.c:93: CONF: FAN_REPORT_FID not supported on ntfs filesystem
>
> Found on 5.8.0 on openSUSE Tumbleweed.
>
> Fixes: 403f11f3a ("syscalls/fanotify15: verify fid for dirent events")
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
>
> I suppose that EXDEV (in fanotify_test_fid()) is really error which
> should be caught as TBROK (unlike ENODEV and EOPNOTSUPP). Am I correct?

No. EXDEV is also an indication of problematic filesystem.
You will get it if you try to setup the mark on a btrfs subvolume, which is not
the root volume, because in that case the "fsid" information from event is
not reliable.

Probably this is not going to happen in LTP, but still.

Good spotting.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
