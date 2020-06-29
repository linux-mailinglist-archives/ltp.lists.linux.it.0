Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F86920CDCC
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 12:11:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01D1D3C2B07
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 12:11:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 06BFA3C1419
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 12:11:23 +0200 (CEST)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5824E140184D
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 12:11:23 +0200 (CEST)
Received: by mail-lj1-x242.google.com with SMTP id h22so10196970lji.9
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 03:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cPQxG+SUBvuMUUsA/ZXDHyeaSwF5HzjExNa+MRXZorc=;
 b=M0KWRnehdO1zmhZCMp11XcllbvICB2+XtyFNLPcV3urttphyz/rjOcfXKpKbupIT8z
 fmR7opPWhfm5GVB7ARdFl5gsvhyyD+v42uoOnO/a7EaXk/Erb6RvsGNR+TPm85xX2H6k
 v5Kcdl9MsQXvMw91GRrtNnwZgnshHmTRaTOKqiQiiOB4BRbGc4uxNiOXTyC+f1CQ+kbx
 T9u+RG8XjArppgiKyMwK6tYIiaYdAXDMANB3ZeYz2SxRQOP7SEACuj1jPx1V/tUJgezv
 ZO6HosMqKa4LaFfUYzlI+Yx5HiuqI7CIte61/uj6d+yK8RZRmLoGnDcZwjtb3u/kWKhA
 rssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cPQxG+SUBvuMUUsA/ZXDHyeaSwF5HzjExNa+MRXZorc=;
 b=cCobzpUkPC9z4J5fi0wcdvXE+w369pQkbt16SbUHSRXfqIlDuy07ZD1NhLFohcSREN
 320A3rLeigUu5zhkeLunxYsO1YgxFPaWUy1OuftGt1clwuBTYD+47o6g4Xpzw56iy5E+
 VYQeNWMQrsvQwXrGzBhqvng0vNmzKlc2oyHVUotIAoLar4w3Z877wqlQ8oMPjop1JM79
 B3Y4/IVfnTssGII12LJcbTyf3ATYiRu1cPPsbAbvukiDSt0iEQ993mW8N94h2S2GpaIh
 CEWz390m2YPsOIRSB4vdULuw08Rap2EAY3XpjH0YGTaukXTX43CO/aLiEx1coanrALrk
 BkGA==
X-Gm-Message-State: AOAM532sRk57EjhFOhAfopWnyvIECB+vLdpX+V++PBr9BytNLl4hVtLh
 FP71i+1YzmfpnjVJNhjTFK2Jp25j+st8ACLS3rli0Q==
X-Google-Smtp-Source: ABdhPJxp9+CFOgcfLi0yuJPg1IAPGPl+5L3xvtmkx+0c5aq+cTiS+tjGp4Y1GqDNE+Yz8BRV+r5LLfo7C0FyHGH4GVc=
X-Received: by 2002:a2e:b054:: with SMTP id d20mr7247226ljl.55.1593425482504; 
 Mon, 29 Jun 2020 03:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvU3g1HqOT8UbNBzXCjCD7Ot1pAFjv-8PGee9ObdbYksg@mail.gmail.com>
 <20200601141620.GB8417@yuki.lan>
In-Reply-To: <20200601141620.GB8417@yuki.lan>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 29 Jun 2020 15:41:11 +0530
Message-ID: <CA+G9fYuzvFHMeRksH2o7ZFt=3K_VS68GJR-iuYx5YyEbr5fLjw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>, LTP List <ltp@lists.linux.it>, 
 Amir Goldstein <amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] i386: fanotify01.c:115: BROK: fanotify_mark () failed:
 EFAULT (14)
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, 1 Jun 2020 at 19:46, Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > fanotify01.c:115: BROK: fanotify_mark (6, FAN_MARK_ADD, FAN_ACCESS |
> > FAN_MARK_INODE | FAN_MODIFY | FAN_CLOSE | FAN_OPEN, AT_FDCWD,
> > fs_mnt/tfile_19115) failed: EFAULT (14)
>
> Looking at these failures we do not pass anything that may cause EFAULT,
> the only pointer we pass is the path at the end but that thing is null
> terminated properly. In a case of fanotify09.c it's even constant string.

The reported problem is only seen on i386 and qemu_i386 on
Linus 's 5.8 and stable-rc 5.7 kernels.

Summary of LTP fanotify01 test results on i386 running 5.8 kernel version.

fanotify01: fail
fanotify02: fail
fanotify03: skip
fanotify04: fail
fanotify05: fail
fanotify06: fail
fanotify07: skip
fanotify08: pass
fanotify09: fail
fanotify10: fail
fanotify11: fail
fanotify12: fail
fanotify13: fail
fanotify14: pass
fanotify15: fail
fanotify16: skip

Here is the strace output for more details please refer to the link below.

# cd /opt/ltp/testcases/bin
# strace -f ./fanotify01

strace output snippet:
------------------
[pid   409] rt_sigaction(SIGALRM, {sa_handler=SIG_DFL, sa_mask=[ALRM],
sa_flags=SA_RESTART},  <unfinished ...>
[pid   401] waitpid(409,  <unfinished ...>
[pid   409] <... rt_sigaction resumed> {sa_handler=0x804fde0,
sa_mask=[ALRM], sa_flags=SA_RESTART}, 8) = 0
[pid   409] rt_sigaction(SIGUSR1, {sa_handler=SIG_DFL, sa_mask=[USR1],
sa_flags=SA_RESTART}, {sa_handler=0x804fcc0, sa_mask=[USR1],
sa_flags=SA_RESTART}, 8) = 0
[pid   409] rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[INT],
sa_flags=SA_RESTART}, {sa_handler=0x804fda0, sa_mask=[INT],
sa_flags=SA_RESTART}, 8) = 0
[pid   409] setpgid(0, 0)               = 0
[pid   409] clock_gettime(CLOCK_MONOTONIC, {tv_sec=8, tv_nsec=116015365}) = 0
[pid   409] getppid()                   = 401
[pid   409] kill(401, SIGUSR1)          = 0
[pid   401] <... waitpid resumed> 0xbf9ffcac, 0) = ? ERESTARTSYS (To
be restarted if SA_RESTART is set)
[pid   409] getpid( <unfinished ...>
[pid   401] ---[    8.214748] fanotify01 (409) used greatest stack
depth: 5692 bytes left
 SIGUSR1 {si_signo=SIGUSR1, si_code=SI_USER, si_pid=409, si_uid=0} ---
[pid   409] <... getpid resumed> )      = 409
[pid   401] alarm(300 <unfinished ...>
[pid   409] fanotify_init(FAN_CLASS_NOTIF, O_RDONLY <unfinished ...>
[pid   401] <... alarm resumed> )       = 300
[pid   409] <... fanotify_init resumed> ) = 3
[pid   401] sigreturn({mask=[]} <unfinished ...>
[pid   409] close(3 <unfinished ...>
[pid   401] <... sigreturn resumed> )   = 7
[pid   409] <... close resumed> )       = 0
[pid   401] waitpid(409,  <unfinished ...>
[pid   409] getpid()                    = 409
[pid   409] openat(AT_FDCWD, \"fs_mnt/tfile_409\",
O_WRONLY|O_CREAT|O_TRUNC, 0666) = 3
[pid   409] fstat64(3, {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
[pid   409] write(3, \"1\", 1)            = 1
[pid   409] close(3)                    = 0
[pid   409] getpid()                    = 409
[pid   409] write(2, \"fanotify01.c:89: \33[1;34mINFO: \33[\"...,
61fanotify01.c:89: [1;34mINFO: [0mTest #0: inode mark events
) = 61
[pid   409] fanotify_init(FAN_CLASS_NOTIF, O_RDONLY) = 3
[pid   409] fanotify_mark(3, FAN_MARK_ADD,
FAN_ACCESS|FAN_MODIFY|FAN_CLOSE_WRITE|FAN_CLOSE_NOWRITE|FAN_OPEN,
AT_FDCWD, \"fs_mnt/tfile_409\") = -1 EFAULT (Bad address)
[pid   409] write(2, \"fanotify01.c:115: \33[1;31mBROK: \33\"...,
180fanotify01.c:115: [1;31mBROK: [0mfanotify_mark (3, FAN_MARK_ADD,
FAN_ACCESS | FAN_MARK_INODE | FAN_MODIFY | FAN_CLOSE | FAN_OPEN,
AT_FDCWD, fs_mnt/tfile_409) failed: EFAULT (14)
) = 180

Full strace test log link,
https://lkft.validation.linaro.org/scheduler/job/1532479#L822

LTP syscalls run log,
https://lkft.validation.linaro.org/scheduler/job/1530988#L8403

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
