Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DF1EF7B8
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 10:05:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B53C3C18FE
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 10:05:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 45C123C0B88
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 10:05:22 +0100 (CET)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9C5A41A011C1
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 10:05:21 +0100 (CET)
Received: by mail-lj1-x243.google.com with SMTP id n21so7258653ljg.12
 for <ltp@lists.linux.it>; Tue, 05 Nov 2019 01:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rA5u+Bd7o4h4+9seP6aACrxKlIMXNFFAIuqZbjkmlI0=;
 b=RbfnsGDkVMmsB+rH56xjL0n2dQiLHCqasp/QgdnB+W68jn5zwlhFqm5JvXPGWbowLU
 Zy21LUuS5PA/HaE6CzuCnA7FqgNw/ey6He0GLjqzQ6vUqCWxyfaQQRLUWtY+c55KHrfg
 /larA45CL4pCH0s9HQrYa5R0xMWmVCREod7RTsL2JovMFhp2BW/MIH05/3cgYmXRPlCa
 2/Y4hzTXe76k3befP+PCUfnb8KNV+jKnDxt1CcNXDqf4yzIbgWJJgL+MYXK1I0LBRIjG
 5meGBcwKqTXpYHQpRwu8nqQ8i4wVvGB6FQsAkz2Do4RNvZ+zXnzSXCvJfQ5xIpNDTIAk
 jB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rA5u+Bd7o4h4+9seP6aACrxKlIMXNFFAIuqZbjkmlI0=;
 b=QwPqofzGpfLnejYj5c6pJ2fljObTCKj4qBZnx6Xw1xK4EepORJyEENLLizq3dHkSyI
 4Ts0MVj7wlc7DZEUegrgz4xVqGTh0fC4FzS9YuB+NJvzZoQjpfXqHUu5RJPFY1Qm2Rs2
 njKDUp6Qqf7HEUDuInGtq3URCyBAdWeELhmiqUtlELuWnrFNMrA1zmPsRl5pMQanp7eC
 qyxjnldEDG/212xquPpHIPHNvQAeU1yindn0VlWs+h+kbmFsG83LU7FALCAZhm8WcoEb
 GbNSm2kl9qMYBRTlgoDO50yuN9IeIJXR3ewQHHkLF+d/AKT67VdEE1b6VdlYiK4sSvKS
 vLJg==
X-Gm-Message-State: APjAAAVEvqeT2Eore0A9EdoTFbdrLLuhmB0omWXJ5qxPfx0lygAw1pkz
 MRrva6YGC5BigzuttI7Rd4F6Iydi9iwh/BgOuA6Mh+BT8po=
X-Google-Smtp-Source: APXvYqzyNKc4dpMb5rHk62xNr9VvlKWyAT1W2IiIvB3a5lmoq5ZaYIMPLEizIQSaPG8uAo3QHNqtdXLBOAOyO1xed3g=
X-Received: by 2002:a2e:7016:: with SMTP id l22mr1810137ljc.227.1572944720856; 
 Tue, 05 Nov 2019 01:05:20 -0800 (PST)
MIME-Version: 1.0
References: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
 <20190929132749.GB73158@casparzhang.com>
 <CAFA6WYNNyeU-tL4vg5PddwDOmU1gaGZJj3hRLYUCnJCY=MYNMw@mail.gmail.com>
 <20191016025405.GA86846@casparzhang.com>
 <CAFA6WYNCHNyPb=GX-jLDHc2m=NGxH-Pgi10Dvvbc65stnV5VMA@mail.gmail.com>
 <20191017073653.GA2590@casparzhang.com>
 <CA+G9fYst7ZgkUE0+3YXx0o=ZW+XsxD6AFOpnZHwixBrgr43LJA@mail.gmail.com>
 <CAFA6WYO_xaOqYmyx39OpvJDmjoMi_Cqn09t9+orvTbO2Lrzt-A@mail.gmail.com>
In-Reply-To: <CAFA6WYO_xaOqYmyx39OpvJDmjoMi_Cqn09t9+orvTbO2Lrzt-A@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 5 Nov 2019 14:35:09 +0530
Message-ID: <CA+G9fYs7mSi__a9i9OpmjNW_mX8BDXO3gntHjPpH05iKBvrGSw@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/sync_file_range: add partial file
 sync test-cases
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
Cc: lkft-triage@lists.linaro.org, LTP List <ltp@lists.linux.it>,
 joseph.qi@linux.alibaba.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Sumit,

On Wed, 30 Oct 2019 at 15:15, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Hi Naresh,
>
> Can you test again with the fix proposed here [1]?

I have tested with patch applied but still test fails intermittently.
https://lkft.validation.linaro.org/scheduler/job/991437#L3683

>
> [1] http://lists.linux.it/pipermail/ltp/2019-October/014157.html
>
> -Sumit

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
