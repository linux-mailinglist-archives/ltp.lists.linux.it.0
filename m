Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7581D0AC9
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 10:25:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E05853C2591
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 10:25:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4B91C3C14BC
 for <ltp@lists.linux.it>; Wed, 13 May 2020 10:25:41 +0200 (CEST)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D1B9A201122
 for <ltp@lists.linux.it>; Wed, 13 May 2020 10:25:40 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id u15so16788324ljd.3
 for <ltp@lists.linux.it>; Wed, 13 May 2020 01:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sW5HeMudXWcISgbVeiC3rm0l+ZwbMLO3MCJHqFbjR0o=;
 b=v50oj3LZjTSemOMrsis7MrePL/268pHPv79tehER/SD8V9m35i8fumnxfB6QNdW4hB
 uglbt8Tjdk8Hl0xqyI2+k2NuVe6AaxsbKOtMIRhYc2ZCBHlzMLIuuRXQIIXC+jTdkzmW
 cZ4zoye4gmAzfoWOUmCjYrDcRU9nmiaB5fsekEvcTy1X7DwTwcBWAD4F3mdNJXav1IJU
 6XJCQhft62QpF3IZQRT/8JrK+YZW1ZEuIYL4aIDdqzOpc5By3QXsiSPGWX/XQkmeic8m
 AMUC4cxsk3XrxlJ+totACejOXo+wJHEw+zxRH2ITLGL49uNQ0KOwEjofqUuQE4tNNU+v
 JbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sW5HeMudXWcISgbVeiC3rm0l+ZwbMLO3MCJHqFbjR0o=;
 b=YpjXbjkjcW1F7DQ0Jek54yEstcWL4diKjXV6W6ipL4DKTrGIuKAMCmpZ/TY0q7FQD8
 x7bIh5YA1d2FyT8muSoBiwSC6ebDu7ikk4VmoX3TymGFq/P/wjKM/DGWXF9a7i9IUTxw
 d0VtPBWCEmWqfF3D6R3VbfYvW1/DT8OYzXv7xAj9I3EChR31LSrt+xQTyDZXTWSvallf
 yOWb1YSOoZIIIHjmmdG9D0e7VM+eXpJnKeoHpFQY2ixsVbsSWcZMRoSsg4eCc0zzlNFU
 +nkINuCeuueAeWNxN7dp2XomAFCxVhUWMpgT6+hVjtJ1/hw+05zx5GEsM6oQpSGXAg25
 Zp+g==
X-Gm-Message-State: AOAM532z4d+nNvwyYizy36vDf1WCC9kd9yplHAEeoIsi85NQwE+XD/rJ
 DUiBiNbvDMldLodRt4SLzflI/5E0D8bjcVz2heW53w==
X-Google-Smtp-Source: ABdhPJwRyEFUrnDXcJcnTWZ4vkJw0iu2srgvR4IeuhK/umN1gsSde/SqDixWmn2SYykGppQKiyFcFhIY5OZidwsWXfU=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr15780382ljm.165.1589358340112; 
 Wed, 13 May 2020 01:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYsRUp8U_gMMjFD=6zHQZOHREvq+a9kj=6VK4LD1xHpMJA@mail.gmail.com>
In-Reply-To: <CA+G9fYsRUp8U_gMMjFD=6zHQZOHREvq+a9kj=6VK4LD1xHpMJA@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 13 May 2020 13:55:28 +0530
Message-ID: <CA+G9fYtt5Xo8ZFcU=+XGyA6M-WKNUtBo_pSYZophsrLvAhn41w@mail.gmail.com>
To: Amir Goldstein <amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP: fanotify09
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
Cc: LTP List <ltp@lists.linux.it>, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Apology for sending this draft email :(
I will post a detailed email regarding fanotify problems on stable-rc
4.4 kernel.

- Naresh

On Wed, 13 May 2020 at 13:52, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Test running fanotify09 resubmitted job
> https://lkft.validation.linaro.org/scheduler/job/1428062
> https://lkft.validation.linaro.org/scheduler/job/1428657
>
> https://qa-reports.linaro.org/lkft/linux-stable-rc-4.4-oe/tests/ltp-syscalls-tests/fanotify09
>
> - Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
