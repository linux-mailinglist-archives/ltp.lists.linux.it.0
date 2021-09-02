Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D20473FEF14
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 16:03:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A61D03C939D
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 16:03:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 270003C2982
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 16:03:08 +0200 (CEST)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4E52B140120C
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 16:03:08 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id i6so3070267edu.1
 for <ltp@lists.linux.it>; Thu, 02 Sep 2021 07:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=hUzWJcdfQhfud3uRFK51QwpcOlINZhZFuA16L2RdrPU=;
 b=Xm7VbLS3uRyMgm6cfXnFTU6GF2+JgMndFp5SVQ0GiiqN/21NF0J6oB2zEl31OOHMWZ
 bpD/jg+xUPhRl+7YSZJPa9VHJPEkFUoMkTsRBqRiESploEfxswi9cJ7/FZRmHbYF+06t
 skGA5/Zqm2oI4qC7hfHkIr0nqGAjLKhQbrEG6Tou0tSmxSNsxS1fomGSjgbzDMYisRPP
 3SeXZAyi9TtI8QxQ3nQQt3Rt67X6dryRQTzBu2EjEQ03eMABUDvPnLmM+OTia0UEfyzG
 61m0+cdnt4Vi6uUIW/IYQgCiTDrEHmmq3UlqzEdGRUjRvunzhoYFFISszvBBiv/s76NB
 0a5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=hUzWJcdfQhfud3uRFK51QwpcOlINZhZFuA16L2RdrPU=;
 b=WtfPPS7Pa5d/LDM5EkIcXCLAvOjZoG0c1ffFlhWqkx+A9Rfn1cKvHDyM88ivgvDNhY
 +MT0EPnNolbMQPgUwk5oA6tu/YffYQRfBLiUM8ooUE1eMbLGFuy3lTmpvkugaF9MQUic
 7tv/otIbrcEnBfJdh94mlhj/Gy+J3eAzacd4LeJ6t6hOXfzNqV60ZuNwASE3B3gG4n3k
 8/qoLJ5NM029RXl9srHLNKMhqWocbK3dLlVGj3nBmMPY5KRc4ytnMgdECdwfnQADtZh0
 wZ8xo6w20+LorK6SC1eup1SB1v6RZVMIDdpEoe5hheGc1EcAwsgWkXtLFb/AfKZ6rERe
 HqAQ==
X-Gm-Message-State: AOAM532BULGOsLdOxkaIn2xCwzw/IFAEnczExyVMeyIt1UFmTY0XIfK9
 ic/cOJfzz+BbHxvDVASeEkaHW5Qm7EbCGISiEP5UTw7ckRGWAvP5
X-Google-Smtp-Source: ABdhPJy/ahojUbN3NAhrTuVMSc+2NsB9Osb593CarCGmU0aJ7tJvqOD6jb+ZmwS15Y9NxsP5xYtUE/pTy++07bQOj7M=
X-Received: by 2002:a05:6402:1b02:: with SMTP id
 by2mr3707318edb.365.1630591386637; 
 Thu, 02 Sep 2021 07:03:06 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 2 Sep 2021 19:32:55 +0530
Message-ID: <CA+G9fYs=GY7eQSEc08PHdaT1WtzZtaxD3Fc8jpu1Dy4g=o5Xtg@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>, 
 lkft-triage@lists.linaro.org
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] ftruncate04: WARNING: the mand mount option is being
 deprecated and will be removed in v5.15!
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
Cc: Robbie Williamson <robbiew@us.ibm.com>, Roy Lee <roylee@andestech.com>,
 Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

While running LTP syscalls test case ftruncate04 found this warning.

[  136.115071] loop0: detected capacity change from 0 to 524288
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:889: TINFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
mke2fs 1.43.8 (1-Jan-2018)
[  136.250270] EXT4-fs (loop0): mounting ext2 file system using the
ext4 subsystem
[  136.255226] ext2 filesystem being mounted at
/tmp/ltp-GKVnWFZH5N/nTMmf9/mntpoint supports timestamps until 2038
(0x7fffffff)
[  136.258936] ======================================================
[  136.258936] WARNING: the mand mount option is being deprecated and
[  136.258936]          will be removed in v5.15!
[  136.258936] ======================================================
tst_test.c:1313: TINFO: Timeout per run is 0h 15m 00s
[  136.266703] EXT4-fs (loop0): re-mounted. Opts: (null). Quota mode: none.
[  136.267843] ext2 filesystem being remounted at
/tmp/ltp-GKVnWFZH5N/nTMmf9/mntpoint supports timestamps until 2038
(0x7fffffff)
ftruncate04.c:116: TINFO: Child locks file
ftruncate04.c:60: TPASS: ftruncate() offset before lock failed with EAGAIN
ftruncate04.c:60: TPASS: ftruncate() offset in lock failed with EAGAIN
ftruncate04.c:84: TPASS: ftruncate() offset after lock succeded
ftruncate04.c:127: TINFO: Child unlocks file
ftruncate04.c:84: TPASS: ftruncate() offset in lock succeded
ftruncate04.c:84: TPASS: ftruncate() offset before lock succeded
ftruncate04.c:84: TPASS: ftruncate() offset after lock succeded

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Full test log link,
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.14.y/build/v5.14-rc6-389-g95dc72bb9c03/testrun/5607838/suite/linux-log-parser/test/check-kernel-warning-3410862/log

Test case link,
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/ftruncate/ftruncate04.c

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
