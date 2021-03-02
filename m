Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5134232A169
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 14:50:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 212813C56DD
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 14:50:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 917053C4D28
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 14:50:05 +0100 (CET)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1C952602427
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 14:50:05 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id e23so2271658wmh.3
 for <ltp@lists.linux.it>; Tue, 02 Mar 2021 05:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=sSH/9h9YpGTePwcIx5ocTbfkxetd0Svywoevqr9l8Q0=;
 b=H3XLB4eQEl+M5VzuG1slgzm6s3mz5VwP75ImvBR10ynoBwEdhGsNTyq1119YP/lYSO
 Z0b/Vg2D0GQ+Nk+wvseFQg3Sxjky3ySuoLiDBmdWWmUkxAVgI6EsKZ1NX8sfe5vLMzqp
 jZqQSoGymChaJ6VmpXXG/kp2CJhNMnlhvEorc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=sSH/9h9YpGTePwcIx5ocTbfkxetd0Svywoevqr9l8Q0=;
 b=X+mOtB9PxFY40zEhhkKGqwzI2M8SOmUGcN9ArQ5fOQ439XD1+8Uumaa5nkL2Zg8pFZ
 E3DCrOkEp/wHlO5y4nVKZFuxAfzIavcGkpLDSE8aTKWxSXmSFArRmA6C4y3blrg80JNv
 kPRHTHQGLReYeeYAyIEUGS2SuOwqMCeOiOO7VjeaafD2h5qcDKmpMlWaG7ITNJ9RLpsT
 kTagH5J2U0vynABAiPCMHscL+xnR3T0HXeGX9VP1cHNQKNTVRVnUZqUIiZcVwY+JTsZR
 ncGOFJ3L6tA5PuNDJxFqc2EKK59Tx6rSK26h/GJCOoM+neOutsmldYqWGJ871SN9XnTj
 st7g==
X-Gm-Message-State: AOAM531T0bmLdH/+lOCGKh6Jxg403e/QWc6fYBD8a4pip0F2BdUOmfjT
 YhoelnUs4LwsJjjmI+NMv+3EpFU5Hc33JQ==
X-Google-Smtp-Source: ABdhPJwryRGgm2ZsxeFj5ofio9Z3Q13sgygoP6JpFeL7PFp7zjH6lbQcvhZD+DfgQJehwQeDO02thQ==
X-Received: by 2002:a05:600c:3511:: with SMTP id
 h17mr4198536wmq.2.1614693004509; 
 Tue, 02 Mar 2021 05:50:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fd4c:95a0:62b1:7d53?
 ([2001:8b0:aba:5f3c:fd4c:95a0:62b1:7d53])
 by smtp.gmail.com with ESMTPSA id s20sm2613794wmj.36.2021.03.02.05.50.04
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:50:04 -0800 (PST)
Message-ID: <ae126f8484a916daa5e9b3970461dd3ac4083273.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: LTP List <ltp@lists.linux.it>
Date: Tue, 02 Mar 2021 13:50:03 +0000
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] Determinism issue for swapon/swapoff tests
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

I've been ensuring the ltp binaries/packages used by Yocto Project
are reproducible. I've sent two patches which address most of the issues,
the remaining one was with the swapon/swapoff tests.

The challenge there is they share libswapon.o. There is a race over
building it depending on whether swapon or swapoff is built first.
The issue is that in one case "../swapon/libswapon.c" is referenced
in libswapon.o and in the other, "libswapon.c" is referenced. This
means the build isn't deterministic/reproducible.

I've worked around this in Yocto Project by executing:

"make -C XXX/testcases/kernel/syscalls/swapon/"

before running the main compile. That ensures we're deterministic
but I wanted to mention the issue in case you had a better solution
to fix the Makefiles?

Cheers,

Richard


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
