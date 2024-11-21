Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3649D4A26
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2024 10:45:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1732182300; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=jv29ERr3DPH/nW6B1lMwSNHvVB7L16WUHKtlfaSfKwE=;
 b=iiteoM8vE+V7Eg41cOB7AcOAPQm/rykk3ge2qyhTyFtfIcDoWx0ZCfbCoEgds8fDqM5Ui
 ydbGtYqfOPotd8n4+5u/UfUQpZvCotrU811Ys93/c7pe9dj6toO+n8EFFjsQaXRMmDxUtua
 ndcOxpBgSXtYj+2BjgRG8b6JmbkwhrA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 163CD3D952A
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2024 10:45:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4D2773C2184
 for <ltp@lists.linux.it>; Thu, 21 Nov 2024 10:44:47 +0100 (CET)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6AB9E22F59B
 for <ltp@lists.linux.it>; Thu, 21 Nov 2024 10:44:46 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4315eeb2601so7839285e9.2
 for <ltp@lists.linux.it>; Thu, 21 Nov 2024 01:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1732182285; x=1732787085; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=F3IOD+ZKO/yH08i0YKI48TeOTe7KN5zfp4m3MTj+q1E=;
 b=KtTCxU5VZ0TZIMV4uRSNFDpbJ7iN5gUF1eLc5HIGWXmWVtg8gu7K/RjduZ/fX8crl2
 qJN7qnK8iwlx2TVbyLPGaPW3Xn8neuP1yGsFXxyTZHZJDvbW/W6/wJjxmXtnR5TDiO8B
 TqfveFg9zTNcs70YetOwW9yq6JqunilRVxrlehsXd8jVXwOJt3pf/jQ5U4LKsaSUGO/Z
 Tpzl+KNAXt1IEbkx2LvCJ/L2i3VHcdZzoD4elhD3kKN2XiQndBx+AFWSG8rNr1NhTwoh
 hpKPuitJ88CPTVEieaQxiptygzr5QPe27odZIVG4DicAhOx+oeMcOpG6V5lmNj6sudJ0
 vinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732182285; x=1732787085;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F3IOD+ZKO/yH08i0YKI48TeOTe7KN5zfp4m3MTj+q1E=;
 b=rCvBLrvy01BmVeOs3+4Hfcy7J/oXaONcAhlk0mulA3gi1SxkK1aXEGsRfbQrqBZGFW
 6LzRVV2rxZNft6YKbMgTJrY7YUl4CmU0wn9qNUrnt1k/UAGmHex1aD4mNelw2zSYCLeX
 l/Kiz2bYx94I4JwZjBWpgiRMlCWOf3hj3JNfkO2dpxKfcRV1wo7jSWSxO3phvxazuSyT
 qbbDtOnXVgfUMKSvvNlyjH+J9cTz1i6ldKg0qkym975J+O6ZIo8WpMINtFnAXlnU+4sh
 yhcZg3CtrBE4SkyjIv79oHQ/OpqkDtSzcnlrd9UmOs3N4wNpLBe/WU1VLZSijhnbNqlW
 Yzug==
X-Gm-Message-State: AOJu0YxeHTvbDvlq/ViMFA+OwZjvWhDw7zCrYbUMeSLiNZGNG79rVB17
 52SgdkuiRdeVR8eDVqA4TcbztCI8K80PgrN3ohjEnt5t/6lrZ/QB12t5job0AC3iJeT7vCfPQzQ
 CiPnxv087
X-Google-Smtp-Source: AGHT+IEY5oqG6dLlyjKCUUKk3Kxi9k/eSQYiY3No+OcuZWx86luNokOlC3w+W8vizxTIeUYW/1pmIg==
X-Received: by 2002:a5d:584f:0:b0:382:5141:f63d with SMTP id
 ffacd0b85a97d-38254b1ba1emr6056664f8f.53.1732182285523; 
 Thu, 21 Nov 2024 01:44:45 -0800 (PST)
Received: from ?IPV6:2003:ef:2f40:8100:6dd4:7858:e1d3:156c?
 (p200300ef2f4081006dd47858e1d3156c.dip0.t-ipconnect.de.
 [2003:ef:2f40:8100:6dd4:7858:e1d3:156c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825494b974sm4386604f8f.108.2024.11.21.01.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 01:44:45 -0800 (PST)
Message-ID: <50668c09-1d9f-4f12-a485-2fa0ff93be35@suse.com>
Date: Thu, 21 Nov 2024 10:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ltp@lists.linux.it, guojie.jin@gmail.com
References: <eb40aae4-1b25-43a7-a592-cf03690edeb8.jinguojie.jgj@alibaba-inc.com>
 <CA+B+MYSAN9kYUvmRF7ooox3koJjFf+6o73kfEWZ9oiYU2eLDjA@mail.gmail.com>
 <CA+B+MYQPoqtKrnTiVsqyJEvo1_=r3-EJqCQT+RxqfaSG0xXgYw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CA+B+MYQPoqtKrnTiVsqyJEvo1_=r3-EJqCQT+RxqfaSG0xXgYw@mail.gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] memcg/memcontrol04: Fix the judgment error in
 test_memcg_low()
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!

Thanks for checking this test, but did you take a look at the 
explanation given in the test "tags" ? -> 
https://bugzilla.suse.com/show_bug.cgi?id=1196298

Regards,
Andrea

On 11/21/24 04:05, Jin Guojie wrote:
> When running memcontrol04, TFAIL results will appear on various Linux
> distributions, kernel versions, and CPUs:
>
> (1) Test platform
>
> * Linux distribution: Ubuntu 24.10
> * CPU: X86_64, Arm64
> * Kernel: 6.6 longterm
> * glibc:  2.40
> * LTP version:  commit ec4161186e5, Oct 24 12:18:17 2024
>
> (2) Error logs
>
> During the operation of memcontrol04, file systems such as ext2, ext3,
> ext4, xfs, ntfs, and vfat will be tested.
> For any of the file system, the same TFAIL result will appear:
>
> root@vm:~/ltp/testcases/kernel/controllers/memcg# ./memcontrol04
>
> tst_test.c:1823: TINFO: === Testing on ext2 ===
> memcontrol04.c:208: TPASS: Expect: (C oom events=0) == 0
> memcontrol04.c:211: TPASS: Expect: (C low events=437) > 0
> memcontrol04.c:208: TPASS: Expect: (D oom events=0) == 0
> memcontrol04.c:211: TPASS: Expect: (D low events=437) > 0
> memcontrol04.c:208: TPASS: Expect: (E oom events=0) == 0
> memcontrol04.c:214: TPASS: Expect: (E low events=0) == 0
> memcontrol04.c:208: TPASS: Expect: (F oom events=0) == 0
> memcontrol04.c:214: TFAIL: Expect: (F low events=412) == 0
>
> tst_test.c:1823: TINFO: === Testing on ext3 ===
> memcontrol04.c:208: TPASS: Expect: (C oom events=0) == 0
> memcontrol04.c:211: TPASS: Expect: (C low events=437) > 0
> memcontrol04.c:208: TPASS: Expect: (D oom events=0) == 0
> memcontrol04.c:211: TPASS: Expect: (D low events=437) > 0
> memcontrol04.c:208: TPASS: Expect: (E oom events=0) == 0
> memcontrol04.c:214: TPASS: Expect: (E low events=0) == 0
> memcontrol04.c:208: TPASS: Expect: (F oom events=0) == 0
> memcontrol04.c:214: TFAIL: Expect: (F low events=411) == 0
>
> ......
>
> Summary:
> passed   55
> failed   5
> broken   0
> skipped  0
> warnings 0
>
> It looks like there is an error in the processing logic of cgroup F.
>
> (3) Cause analysis
>
> In the test_memcg_low() function, 4 subgroups (C, D, E, F) are created under B,
> and 50MB pagecache is allocated in C, D, and F. Therefore, when checking whether
> it is successful at the end, only E should be judged to have low_events==0,
> and the judgment conditions for all other subgroups should be low_events > 0.
>
> (4) Fix issure
>
> #1209
> https://github.com/linux-test-project/ltp/issues/1209
>
> Signed-off-by: Jin Guojie <guojie.jin@gmail.com>
>
> ---
>   testcases/kernel/controllers/memcg/memcontrol04.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/testcases/kernel/controllers/memcg/memcontrol04.c
> b/testcases/kernel/controllers/memcg/memcontrol04.c
> index 1b8d115f8..0dddb7449 100644
> --- a/testcases/kernel/controllers/memcg/memcontrol04.c
> +++ b/testcases/kernel/controllers/memcg/memcontrol04.c
> @@ -207,7 +207,7 @@ static void test_memcg_low(void)
>
>                  TST_EXP_EXPR(oom == 0, "(%c oom events=%ld) == 0", id, oom);
>
> -               if (i < E) {
> +               if (i != E) {
>                          TST_EXP_EXPR(low > 0,
>                                       "(%c low events=%ld) > 0", id, low);
>                  } else {
> --
> 2.45.2
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
