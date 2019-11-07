Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D772F30B8
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 14:59:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B7DD3C203D
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 14:59:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 7F8BA3C1CBA
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 14:59:36 +0100 (CET)
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D64BE1002040
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 14:59:35 +0100 (CET)
Received: by mail-lf1-x142.google.com with SMTP id f5so1699243lfp.1
 for <ltp@lists.linux.it>; Thu, 07 Nov 2019 05:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=zUtIMonLuqK+iWfJbM+SRmDj7hvvfURy8hJeahep4/Y=;
 b=JXVM/MiDFcTdxX8cy44MVmFzKHZugo548aLLV3zop3h5hHOXAzYT6dhtTgattam5zn
 ZHy819NPhLltJnzWcFS5twZCvlR/8x3QLB6r3t4Po1F5oZONbOnSc5g9AgbLwvWauhAi
 yotfq3heZSqtcjbCavMNKNiRu404KbTrb8pgpcIdV9hTDi58CHPXULq304hVVwb2hBg0
 6LODreUSFrglTydMSlJB/vAnPGzhHTgpXFAVvGI4lUsl2yd05M9aWPgtQwLxEHa4m1b5
 FBx+2dk1QMCjwaR6V/2DuSKPMW6c83nrwZUb94/uuRwUAIdlFIbwl3gnqLM4MRRIp0Pm
 be8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=zUtIMonLuqK+iWfJbM+SRmDj7hvvfURy8hJeahep4/Y=;
 b=QsmrL22MK/g41QAzoMTc88A5bxgUyGn2Xqd+5BJjSP/kBJyVJkg/bpJ68UH9DQdsj5
 sJ1cFQ+hUR4GJ897Mz0NoPHH6TFHv88lgVxJk/IEBjuHckIT29080pe2glylmwzVPK00
 xhwPK5NPlvtNxNVMcy8XeI5calWDyPVikL21WIbDwCmhxkos9RbXb+CdRXNDiHqHLHf/
 tP5tgfgdEPJbq8OgYdMCBBiGtP9OdOsjtWmVBg8u1p9YoeiqVGPKWN+ghegsoAuk6AUH
 w/5CIXqmDrUDiQXPyQjHBCz9O4wFz7qld8DbYiYXt5GnKMMk3mcjbCt2JOfwMFXQoqnz
 BAcg==
X-Gm-Message-State: APjAAAWvAmV22/b/XER+01DNZRdq37GgcqUaqYXe6iSxzuhAsA7m6Aod
 Q+WsxG3BuX56liZO1XUd+6A3oYJc/3jSUkBdgqfiYpVQnuE=
X-Google-Smtp-Source: APXvYqxuBAK2h3pUAqLUZxbZFw8/Si0iNv8WQG1sEpgRk4H5vaETXamgdrUD+1wEZUttCeRSrNtVZwS+MutL6tIi1p8=
X-Received: by 2002:ac2:5930:: with SMTP id v16mr2612552lfi.67.1573135174476; 
 Thu, 07 Nov 2019 05:59:34 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 7 Nov 2019 19:29:23 +0530
Message-ID: <CA+G9fYtmA5F174nTAtyshr03wkSqMS7+7NTDuJMd_DhJF6a4pw@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] LTP: diotest4.c:476: read to read-only space. returns 0:
 Success
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
Cc: Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, Mark Brown <broonie@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

LTP test case dio04 test failed on 32bit kernel running linux next
20191107 kernel.
Linux version 5.4.0-rc6-next-20191107.

diotest4    1  TPASS  :  Negative Offset
diotest4    2  TPASS  :  removed
diotest4    3  TPASS  :  Odd count of read and write
diotest4    4  TPASS  :  Read beyond the file size
diotest4    5  TPASS  :  Invalid file descriptor
diotest4    6  TPASS  :  Out of range file descriptor
diotest4    7  TPASS  :  Closed file descriptor
diotest4    8  TPASS  :  removed
diotest4    9  TCONF  :  diotest4.c:345: Direct I/O on /dev/null is
not supported
diotest4   10  TPASS  :  read, write to a mmaped file
diotest4   11  TPASS  :  read, write to an unmapped file
diotest4   12  TPASS  :  read from file not open for reading
diotest4   13  TPASS  :  write to file not open for writing
diotest4   14  TPASS  :  read, write with non-aligned buffer
diotest4   15  TFAIL  :  diotest4.c:476: read to read-only space.
returns 0: Success
diotest4   16  TFAIL  :  diotest4.c:180: read, write buffer in read-only space
diotest4   17  TFAIL  :  diotest4.c:114: read allows  nonexistant
space. returns 0: Success
diotest4   18  TFAIL  :  diotest4.c:129: write allows  nonexistant
space.returns -1: Invalid argument
diotest4   19  TFAIL  :  diotest4.c:180: read, write in non-existant space
diotest4   20  TPASS  :  read, write for file with O_SYNC
diotest4    0  TINFO  :  2/15 test blocks failed

Test results comparison link,
https://qa-reports.linaro.org/lkft/linux-next-oe/tests/ltp-dio-tests/dio04

Test case source link,
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/io/direct_io/diotest4.c

Test case description:

* NAME
* diotest4.c
*
* DESCRIPTION
* The program generates error conditions and verifies the error
* code generated with the expected error value. The program also
* tests some of the boundary condtions. The size of test file created
* is filesize_in_blocks * 4k.
* Test blocks:
* [1] Negative Offset
* [2] Negative count - removed 08/01/2003 - robbiew
* [3] Odd count of read and write
* [4] Read beyond the file size
* [5] Invalid file descriptor
* [6] Out of range file descriptor
* [7] Closed file descriptor
* [8] Directory read, write - removed 10/7/2002 - plars
* [9] Character device (/dev/null) read, write
* [10] read, write to a mmaped file
* [11] read, write to an unmaped file with munmap
* [12] read from file not open for reading
* [13] write to file not open for writing
* [14] read, write with non-aligned buffer
* [15] read, write buffer in read-only space
* [16] read, write in non-existant space
* [17] read, write for file with O_SYNC

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: c68c5373c504078cc0e0edc7d5c88b47ca308144
  git describe: next-20191107
  make_kernelversion: 5.4.0-rc6
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/intel-core2-32/lkft/linux-next/641/config
  build-location:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/intel-core2-32/lkft/linux-next/641

Best regards
Naresh Kamboju

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
