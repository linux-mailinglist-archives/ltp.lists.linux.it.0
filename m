Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE551D9341
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 11:22:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3D373C4E8D
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 11:22:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 47A573C1811
 for <ltp@lists.linux.it>; Tue, 19 May 2020 11:22:27 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AECD4100203A
 for <ltp@lists.linux.it>; Tue, 19 May 2020 11:22:26 +0200 (CEST)
Received: from mail-qv1-f54.google.com ([209.85.219.54]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MPp0l-1jN2Kf03sp-00MtCr for <ltp@lists.linux.it>; Tue, 19 May 2020
 11:22:26 +0200
Received: by mail-qv1-f54.google.com with SMTP id z5so6130966qvw.4
 for <ltp@lists.linux.it>; Tue, 19 May 2020 02:22:25 -0700 (PDT)
X-Gm-Message-State: AOAM533fQOY+y7eaLcKdrdoE1xOnt/QXV4nUrdGMbKS0m0OyEKO780FY
 j3gzlX6PnUMg6ODx4anmtFXLC+9bv4BFZij1Tl8=
X-Google-Smtp-Source: ABdhPJy66b1vSQvJbmLbhfT+FL2VtRamf7DzSO4mczeVWpyRM49y9Hnr+/2IP6fQq+L+VjtWthgRhLPTeoJK3wMvEDo=
X-Received: by 2002:a05:6214:905:: with SMTP id
 dj5mr20170624qvb.222.1589880144972; 
 Tue, 19 May 2020 02:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <3f3b7d669d47ae701385b43deb8280a353dd231e.1589877853.git.viresh.kumar@linaro.org>
In-Reply-To: <3f3b7d669d47ae701385b43deb8280a353dd231e.1589877853.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 19 May 2020 11:22:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2+OMw4dGWkwNT1GLkBtgVN=-zYZt2G955M--WG2fyjgA@mail.gmail.com>
Message-ID: <CAK8P3a2+OMw4dGWkwNT1GLkBtgVN=-zYZt2G955M--WG2fyjgA@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:4hBtKcFxKT4Kf1Olroyu+T35II2HUQHWMqsjFGil6NsDpizoGSN
 BxrlMEMIGBqjLsSk2QZOTR+nHUFRbIImdjrk+6uR8ZJQ2FQj7B49EoLZU36rMnwKQ8dUj2P
 cHoZoLXH3KGuLaqGaX9C78y1NsFCEptvK+UWrIrpTs4MvmYWx3GHLQ2AXR5GpUzvuC4Pkoi
 KNPoO/hIkp2BBa1a5rcWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K2wPoiZ4zNw=:x/ZU4CHejKgxFbJ+qE4vVt
 40CCFA9chkwXaIPKNN9HkDhoMwaIQS+EJx3cCjeXAJenuLaFDut8r2GuBvZ7Q2u+6Exy/fhtT
 tEKOPwXjU0Aq0JXwi8cLHwnONV7gk8ql5Ighe4n4D4+CjH9DgEMXtIlSp1ryrv0NsCCwdj8QA
 2d6hno5sWv+VnCoy3GIxm7bynYcDABtfvHOWVyXKc8R0G5tfWifNGIprkwSuPgOg5qE2nUhHV
 8veduxv8lPsbbKZ1lPoQPN+3um3zWlYMBx2gs0ajnSs0cqWjXuj13sslT5rgOpTP7vjuI/a9H
 MnkSPRaDP/1EkgCOiogVj1uNBZ/DXFcSijLt4KadWPZKg6K/W8amdF9WnvUSA1Zd0CB/HX8bd
 e/ntKxmkLJ5qRY5mYmc6hXgdhQ7H0dJkv3bJbDd66k7VtOLgo6JYShsihLiEu2E5HujGQ1Wv1
 4xHFP4O8kdm+1kq0VMdyZYn5o9KaYNpGDfJpjex5aiuVkJqgYajtUddo5GrUQcAiWNOkcUMzf
 tvi0oI/WAa2fyL7323QzCfj/7+VtghFlc7IrSq3alKTAmcaIJJNPVWasC6FTIUUem3Zlrnsal
 7KhE17t7D2zh9TiuPzjBHTrb0CHGx838BKId28L1AK+dkzfzuVxfVEnBwD/W4LJcaHpqMNa0a
 zKdhMB1CAvdGtqBhnvJPcdwBcB1bYomoIejN66i61VMtgW/U/6bd/zpnMFY2xhQPhQy52jn8m
 3sEvV9R2l5LvHYTcjMLkUzROkuEarz9BVRRsOobhVM/XUL0rGMhBenvTU5+W1MmBHfvodvZlK
 mtmY6mi/yY3fl2fu0f05AjKXC7HShynInvBh02IGKNpbAb2Arg=
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] syscalls: Don't use tst_syscall()
 unnecessarily
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, May 19, 2020 at 10:51 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:

> @@ -472,7 +471,7 @@ static uint64_t get_current_time(void)
>  {
>         struct timespec ts;
>
> -       tst_clock_gettime(CLOCK_MONOTONIC, &ts);
> +       clock_gettime(CLOCK_MONOTONIC, &ts);

Again, you are changing from the low-level syscall interface that is not
present on new 32-bit architectures which only have clock_gettime64
to a high-level interface.

This change correctly changes it to pass matching timespec variant, but
the changelog text does not mention that.

      Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
