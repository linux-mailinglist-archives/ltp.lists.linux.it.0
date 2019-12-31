Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3DC12D670
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 06:31:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFCAD3C23EC
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 06:31:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 052CA3C1CB0
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 06:31:30 +0100 (CET)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 09F701002879
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 06:31:29 +0100 (CET)
Received: by mail-lj1-x242.google.com with SMTP id o13so23918607ljg.4
 for <ltp@lists.linux.it>; Mon, 30 Dec 2019 21:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+4YqiH8i71MYLdRFFoG2D6t7E4A/THl/X8N6bdnNwBM=;
 b=uZoWKhRey4KKk415/eO7ptM/84d6S95eg90PVx8qKO/RNc3UvZspFhe5RuLvFq/JW8
 Z3z2VocuTJjlarf2IhxcZsaWyGLiO8wx2N1dXW9l2v28Idm7+JP+I3jVMe78L8wSO153
 JQ1QmpvDzJo40MW+ELxxrMdgtYRmywOD1A1etdMTv6RKip93iaZYLZNVKH2ZU/aEavSd
 pnqYbVtW8NGOyB2QhXfRht07cGvgX+vitkkCIPr4Eiqg5fAOceVMcpwchYQEVeiiqPW4
 /97mRAiADp6821uosYQrjITKBvH9EEJXK1gnaARk2U1YPPVFeFiGdZ2Jq5t3TxETI5SF
 gufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+4YqiH8i71MYLdRFFoG2D6t7E4A/THl/X8N6bdnNwBM=;
 b=Bweql6eIsd01uzGrBafwy8Suh/ZDlZEhBXqUbBRF88xrfZfGOUBHBrvdQSVPgYyS5D
 /ZdseQppXj1cwD5/3E48uXFyw+9rCic0fXyasxF9UOfkq4LFVl/w7SfsalWUK42QAkwC
 7AForuanLUtRycI938vQwh6/+EIMDM4GfXp8vp6kKjb022dAoLKJfsPr0BFDtp+rAk2Q
 shCCrUuA5Zak2YdKBls82RiaFPUWHBSYfGV+/qWEUNVz+QJ1doLA4IcIs1v5tSrEZC3+
 GQfQiTe7jv7AQVuSHMUie2xMYSl57KiDFjRP+AKUWaXVlBCFX9kM3mKJ0ZFxBGnT0MiS
 2dNg==
X-Gm-Message-State: APjAAAXrtzI+2JwcSMNn7fKlAFDoPStyAxN7g+bM87hdtDfmJNJxxAQO
 xCqCcxrgZjl6nakj/5b/s5fGsN2QAkemjCqSIlpJhQ==
X-Google-Smtp-Source: APXvYqyuY62EcHehhyJPyuUUQjwvatQzXNAEif5DogszhQZuMgQWpMDMm/TZiENbggZOVFE6GYMxwwGDeglGfOtHMGA=
X-Received: by 2002:a2e:85cd:: with SMTP id h13mr39655909ljj.191.1577770289204; 
 Mon, 30 Dec 2019 21:31:29 -0800 (PST)
MIME-Version: 1.0
References: <20191218082826.25083-1-liwang@redhat.com>
 <2104821569.17247635.1576661091375.JavaMail.zimbra@redhat.com>
 <CAFA6WYN1ssqCzCqvT=9=DLjZdQz8OnH7+YBi8VGo7XLRdNLyvg@mail.gmail.com>
 <CAEemH2eRhmozt5OiT6z-YBjJUBNaGZgQVQRh40hNpKcq2d4-aw@mail.gmail.com>
 <CAFA6WYOBbH8UbwrK1f3ZQjGuqHJqGZxhQ-N0w1mpBHz0bnPG1w@mail.gmail.com>
 <CAEemH2eXvZB9uCuZFsc2uMAt5k2F_gfgXCqch58juMsJn4Gr4w@mail.gmail.com>
 <CAEemH2coGZGjFLhHzeR4JJYWpERGypjRdXRQ2dO0f1=Drh2KOg@mail.gmail.com>
In-Reply-To: <CAEemH2coGZGjFLhHzeR4JJYWpERGypjRdXRQ2dO0f1=Drh2KOg@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 31 Dec 2019 11:01:17 +0530
Message-ID: <CAFA6WYMC=vh9xevacVwLCTVTn=KB0TjFUug5=ZVXkSu11io17g@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] sync_file_range02: remove the toplimit of
 write back
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
Cc: LTP List <ltp@lists.linux.it>, Caspar Zhang <caspar@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, 31 Dec 2019 at 10:55, Li Wang <liwang@redhat.com> wrote:
>
> Hi,
>
> On Thu, Dec 19, 2019 at 5:15 PM Li Wang <liwang@redhat.com> wrote:
>>
>>
>>
>> On Thu, Dec 19, 2019 at 4:52 PM Sumit Garg <sumit.garg@linaro.org> wrote:
>>>
>>> ...
>>> >> To avoid similar scenarios, I suggested to add a "sync()" call just
>>> >> prior to test here [1]. And I couldn't reproduce the failure in
>>> >> 1000-times run with 4.19 kernel.
>>> >
>>> >
>>> > Yes, that makes sense to me.
>>> >
>>>
>>> Would you mind to give it a try and check if you could reproduce the failure?
>>
>>
>> Actually, I haven't had one time to reproduce it. This failure was reported by CI jobs and very low frequency occurred. The fix is based on a discussion with FS developer analysis.
>>
>> But I would have a try with this patch(+ sync()).
>
>
> I have tried this for many different systems, and it doesn't hit the failure at least one time. So if no more comments, I would merge the patch as below in the next step.
>
> --- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> +++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> @@ -48,6 +48,8 @@ static void verify_sync_file_range(struct testcase *tc)
>
>         lseek(fd, tc->write_off, SEEK_SET);
>
> +       sync();
> +
>         tst_dev_bytes_written(tst_device->dev);
>
>         tst_fill_fd(fd, 0, TST_MB, tc->write_size_mb);
> @@ -66,8 +68,7 @@ static void verify_sync_file_range(struct testcase *tc)
>
>         SAFE_CLOSE(fd);
>
> -       if ((written >= tc->exp_sync_size) &&
> -           (written <= (tc->exp_sync_size + tc->exp_sync_size/10)))
> +       if (written >= tc->exp_sync_size)
>                 tst_res(TPASS, "%s", tc->desc);
>         else
>                 tst_res(TFAIL, "%s: Synced %li, expected %li", tc->desc,
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

> --
> Regards,
> Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
