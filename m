Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E89317A15D
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 08:39:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B63A3C1D19
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 08:39:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 63A9F3C1C72
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 08:38:59 +0200 (CEST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2AF6A200FE6
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 08:38:59 +0200 (CEST)
Received: by mail-vs1-f54.google.com with SMTP id u3so42716763vsh.6
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 23:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+5/+Bw2+gbX/ORKgcWpjAO5hzt1+2rpnnzlcmSklrfE=;
 b=tikHC7pbWQRSSrkJnOhFxd0yq2DXzlkMZVRpeqDjkuLeKvdlybUvhpko0dtTQ8uSdY
 gCxcCYobWcel9AlKmVqdHS8bchpbxPJWv2NArFJDd/+4y/FKyky22IDoZB/ZmYc6955o
 Xqhuw1f8pjgQwCWQKeyjzWU7zK1UHAuTq1SbkNdAB6TLyIqEtW7EHRd+zbK+ZF4hwgC6
 pHXsxnaCsb7wrJY4Da4bbeHW2XRi2qrJ7c11HLww+G/tOiR35xr899XMsoC4P4qCm8Aq
 D1dcgd1bcpAv6P8d6cPxcwaiYFHEEeqcwxxX+e+4fQukSVU/TsrQLcTD95vk00BMmHs8
 RC2w==
X-Gm-Message-State: APjAAAX+Z1g1JUFiyNHbRH6nNryur3untCbIiaE9CVSYYtou9ag1wdac
 lrM9JaT/vpB5GrC/e21jgUnLat69XImKeAJLhDPp2Q==
X-Google-Smtp-Source: APXvYqxTaXCo8HfKzgnLPYngAW21qtWV0zeFT3LEZ+4DgUH+NuXUKisFrHkbdsBVDEC7V+kJsHNXIpJLgbqFwt+pcjg=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr10012189vsq.179.1564468738016; 
 Mon, 29 Jul 2019 23:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAEemH2dMW6oh6Bbm=yqUADF+mDhuQgFTTGYftB+xAhqqdYV3Ng@mail.gmail.com>
 <47999e20-ccbe-deda-c960-473db5b56ea0@oracle.com>
In-Reply-To: <47999e20-ccbe-deda-c960-473db5b56ea0@oracle.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 30 Jul 2019 14:38:47 +0800
Message-ID: <CAEemH2eEMS7xrYwTjK8sbNg7OvC7ogRGs24TN8xkkwV1PD4amg@mail.gmail.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] 
	=?utf-8?q?=5BMM_Bug=3F=5D_mmap=28=29_triggers_SIGBUS_while?=
	=?utf-8?b?IGRvaW5nIHRoZeKAiyDigItudW1hX21vdmVfcGFnZXMoKSBmb3Igb2Zm?=
	=?utf-8?q?lined_hugepage_in_background?=
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
Cc: xishi.qiuxishi@alibaba-inc.com, mhocko@kernel.org,
 Linux-MM <linux-mm@kvack.org>, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Jul 30, 2019 at 3:01 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
...
> Something seems strange.  I can not reproduce with unmodified 5.2.3
>
> [root@f23d move_pages]# uname -r
> 5.2.3
> [root@f23d move_pages]# PATH=$PATH:$PWD ./move_pages12
> tst_test.c:1096: INFO: Timeout per run is 0h 05m 00s
> move_pages12.c:201: INFO: Free RAM 6725424 kB
> move_pages12.c:219: INFO: Increasing 2048kB hugepages pool on node 0 to 4
> move_pages12.c:229: INFO: Increasing 2048kB hugepages pool on node 1 to 4
> move_pages12.c:145: INFO: Allocating and freeing 4 hugepages on node 0
> move_pages12.c:145: INFO: Allocating and freeing 4 hugepages on node 1
> move_pages12.c:135: PASS: Bug not reproduced
>
> Summary:
> passed   1
> failed   0
> skipped  0
> warnings 0

FYI:

And, from your test log, it looks like you were running an old LTP
version, the test#2 was added in move_page12 in the latest master
branch.

So, the completely test log should be included two-part:

# ./move_pages12
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
move_pages12.c:252: INFO: Free RAM 63759028 kB
move_pages12.c:270: INFO: Increasing 2048kB hugepages pool on node 0 to 4
move_pages12.c:280: INFO: Increasing 2048kB hugepages pool on node 1 to 6
move_pages12.c:196: INFO: Allocating and freeing 4 hugepages on node 0
move_pages12.c:196: INFO: Allocating and freeing 4 hugepages on node 1
move_pages12.c:186: PASS: Bug not reproduced
move_pages12.c:186: PASS: Bug not reproduced

Summary:
passed   2
failed   0
skipped  0
warnings 0


-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
