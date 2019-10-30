Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B1CE9656
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Oct 2019 07:18:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 039433C22AF
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Oct 2019 07:18:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 186643C17A3
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 07:18:13 +0100 (CET)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6489A1400B82
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 07:18:12 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id y23so879389ljc.5
 for <ltp@lists.linux.it>; Tue, 29 Oct 2019 23:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=4SWIBlbxk1DSs0Bra5jeZQkn14I9hH+ukJb+QcPcKX8=;
 b=R9f4aynPA5t2YTbmtg+zRd9qsLI9cI/+WRnsRa8GD7dFo+WcIerF8M05zseFlYm2bC
 D4rGf5DfT1vI4VFDhZl5//8Lt9YNfOEhwXKIx4YrVlllsAX7wdxg7znJdGwl5zUQDZCm
 +2y+E88Uq7gsZwoUJUorZjc9atQFJ92LU6m7tGUZGAn49wC85OR9GrX3xTH6gjAiwqYR
 gi9dvXGOlZvd2pi+z47/fmAMLRl1waemdmxgL9muNr2JCsmILorUtt5nNO1FfMtkJzgq
 BiOQWK2Cofvk6BL36RUg+MG9InAX6WW9QKFXWIHTkYNVQHA6KgOEPaaFyLIdWIbBwN/3
 gsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=4SWIBlbxk1DSs0Bra5jeZQkn14I9hH+ukJb+QcPcKX8=;
 b=rcs1qfY4Pc4oltjDLWZNEeIIrYOTT3+5JYRsWrpIKNah+9LZz7MUApajFoHVeky8JB
 ONVN8xuxGdZ/HoA1FfTTUrGSQ1+4fH2oktoSfyTCiOrWxMVivAERiV04i4teEy00Np6g
 e9ZcwZuprZDCk3//ZmlQU+NSQaz6lQHSFJQ6DvsmvNGQNI4JBSUAeLOJFHwR/Ht4LDIY
 VfQIl/aSGzBh8KOisY2PQ9tYRoPP+Rjd+0McoEg6FxR0AyuqTK34CUNpTNj0VTJ3K+DJ
 hDr7ocaj0hlhsXMckHC3nJ1a0XxqJr5nMrnWmfALcFYQAv93UeHwzCftmBHs530yQYHP
 L2Yg==
X-Gm-Message-State: APjAAAWQBI/Iz1rk7MFTCqXK0UKutrPdi5vcGsMy50eBmrAzuAfGHlia
 j75n2TW5XgmyPJltWHUbQBRSyA6ak7mkvMbJcE+rvol7
X-Google-Smtp-Source: APXvYqyyfduBmHycGN+dgwi1uErq+RcHQFkM5JPOga1t9MSf/pKCeej5biEUw8Ea9UdVXD8swUd6DKwqejwH6pjGLXQ=
X-Received: by 2002:a2e:91c9:: with SMTP id u9mr5411574ljg.227.1572416290962; 
 Tue, 29 Oct 2019 23:18:10 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 30 Oct 2019 11:47:59 +0530
Message-ID: <CA+G9fYv+-dz11fSjMNt8SHaAhRpu1F=8MF7ieS4ZASAwDzH7Eg@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] LTP: accept02: BROK: accept02.c:52: setsockopt(6, 0, 42,
 0xffff9c56df78, 136) failed: ENODEV (19)
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
Cc: camann@suse.com, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

LTP syscall accept02 test failed intermittently on hikey arm64 device,
qemu_x86_64 and qemu_i386.

Do you see this intermittent failure at your end ?

hikey arm64 output log,

tst_test.c:1118: INFO: Timeout per run is 0h 15m 00s
tst_buffers.c:55: INFO: Test is using guarded buffers
accept02.c:127: INFO: Starting listener on port: 35903
safe_net.c:186: BROK: accept02.c:52: setsockopt(6, 0, 42,
0xffff9c56df78, 136) failed: ENODEV (19)

qemu_x86_64 output log,

tst_test.c:1118: INFO: Timeout per run is 0h 15m 00s
tst_buffers.c:55: INFO: Test is using guarded buffers
accept02.c:127: INFO: Starting listener on port: 47245
safe_net.c:186: BROK: accept02.c:52: setsockopt(6, 0, 42,
0x7f5397ca3f78, 136) failed: ENODEV (19)

Test results comparison,
https://qa-reports.linaro.org/lkft/linux-mainline-oe/tests/ltp-syscalls-tests/accept02

Full test log,
https://lkft.validation.linaro.org/scheduler/job/976363
https://lkft.validation.linaro.org/scheduler/job/977681

Best regards
Naresh Kamboju

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
