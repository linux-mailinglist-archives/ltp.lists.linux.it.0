Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 446802A6339
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 12:25:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A17A23C5451
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 12:25:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 7E0903C2610
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 12:25:24 +0100 (CET)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BA98F1000740
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 12:25:23 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id za3so29219551ejb.5
 for <ltp@lists.linux.it>; Wed, 04 Nov 2020 03:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=kwIxmB3LTVuXhoJJT9+oGgcs9w27IJzw7Apq/DRcRAM=;
 b=t9Gt+1wE/yKV8h2AxbkVbB3ND69vn80foiCF4I+YA6mGJuNEsL3OQi2IDY7Ob3Dgys
 4lnBjaRKMhT+oIFgEZsZHAcxbVbeCWotq0o4RRtW1WoO5NDrPnQDM8DY3FR6zd6kVZDk
 5nfRa7/AVoxb3MIIhbftM8UwfJ6M7FpK17Yfp+l1iXZzItohzWcdJzRycWM8LAY29Eu0
 hhlIC5D7dZt/b29BhV9PH226SIvz+rQcZC1NwumvAas6dnLw5aHT8ktEBtVK/mxRcwUo
 H53KhumrVWpkmVrgdJTE02t7KMAm+uzHc+PfbUb6kmAWvOVYkepYTc+/mJ2HoI2dp5a8
 6aFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=kwIxmB3LTVuXhoJJT9+oGgcs9w27IJzw7Apq/DRcRAM=;
 b=nkgWnucCEP5zLoD8F/Xx3/tpQsP494m6IsGjCIQJ8y6n0KE51AoidbY1C2I5qP9Tcz
 kxOrbeOTuCZ2wLeTE8PuDLDyVKLB0VankTEwTD3fwV62NUUKsfVd5bPXzT8e9iId1xu2
 2bzntgeGYBbENvxosKvx8DMPdoyGmAXWVKnAjUpPb6v7s1oBJAxWZYA95U97AbmjQCCw
 MSW/CBN2XY0ltTxwB3DwpWg0vKfqDtpsep4cIqQ3ZygdtzuKWCEEflxD54/x8lihHoMT
 WCA5KJ6uaUkT/dTjpd1L/2jtm9O1a5sdrWWjg5xdQFRw/7eX4QLrkubCl1vYVVpDKko5
 66Sg==
X-Gm-Message-State: AOAM530YYVdDpqUXtVi3Fg7J6ltnHCaLrEB9TQSiStDE8NclSNG/bbQc
 t2fJ5ZkKgFcEJLjDQh2xBKxMm0OGNPx6gV29iFG3Aw==
X-Google-Smtp-Source: ABdhPJxS9Tq9pHnjR4nT8shXk47P+NeubekhGQ42dxLQpkMtfign2/6XnfB9qmx6RHFbwv1M32sayGd0gCeXM3gcSPU=
X-Received: by 2002:a17:906:4742:: with SMTP id
 j2mr23848852ejs.247.1604489123213; 
 Wed, 04 Nov 2020 03:25:23 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 4 Nov 2020 16:55:12 +0530
Message-ID: <CA+G9fYu4RdH7zdd5MU=E-o+azMRx-EqR-7VYuJCUastKRd0KCA@mail.gmail.com>
To: linux- stable <stable@vger.kernel.org>, LTP List <ltp@lists.linux.it>, 
 lkft-triage@lists.linaro.org
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [stable-rc 4.14] shmctl04.c:115: TFAIL: SHM_INFO haven't
 returned a valid index: SUCCESS (0)
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

LTP syscalls test shmctl04 test modified in latest LTP release 20200930
and this test reported as fail. so reporting to LTP mailing list.
Failed on stable-rc 4.14, 4.9 and 4.4 branches but
passed on stable-rc 4.19, 5.4 and 5.9 branches for arm64, arm, x86_64 and i386.

shmctl04.c:115: TFAIL: SHM_INFO haven't returned a valid index: SUCCESS (0)
shmctl04.c:131: TFAIL: Counted used = 0, used_ids = 1
shmctl04.c:72: TPASS: used_ids = 1
shmctl04.c:79: TPASS: shm_rss = 0
shmctl04.c:86: TPASS: shm_swp = 0
shmctl04.c:93: TPASS: shm_tot = 1

Reported-by: Naresh Kamboju  <naresh.kamboju@linaro.org>

Test log link,
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-4.14.y/build/v4.14.203-126-g8c25e7a92b2f/testrun/3392140/suite/ltp-syscalls-tests/test/shmctl04/log

kernel: 4.14.204-rc1
git repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
git branch: linux-4.14.y
Test details: https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-4.14.y/build/v4.14.203-126-g8c25e7a92b2f

-- 
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
