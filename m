Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCF51EA563
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jun 2020 15:55:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B0EB3C30C9
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jun 2020 15:55:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 922FE3C2314
 for <ltp@lists.linux.it>; Mon,  1 Jun 2020 15:55:43 +0200 (CEST)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D9402600A1D
 for <ltp@lists.linux.it>; Mon,  1 Jun 2020 15:55:08 +0200 (CEST)
Received: by mail-lj1-x242.google.com with SMTP id q2so8200663ljm.10
 for <ltp@lists.linux.it>; Mon, 01 Jun 2020 06:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ZzakF3JxigJ1i63QdUVyUrevod2UiBMguTqkmqVTfbE=;
 b=W+754dizesNkEZAj90UwFZpGFQYHWHtViligfFIGcmvK5RnA+sGdBu8p23+rSM0G1/
 yHXyAC20Y4IWpA2KJ4CjNB0A840/eW6sH2F5Fj6TakcHmHmrS92nMSRcfUaYZLJfE1D7
 jps9Lkc8ST7InJJbJvao42eIgxwhyR5L7aUzbISKGG5YbktbhWnGwKq+wG5vBXC3HyL8
 ZUjsnnRbH5xryiTRVkZ71FWX9931NFEZuuRuFhVzn7MXjgSU567HulpA3DJE6rDccOBe
 f+l3U3TOFrmn+DxxpS5dTNPthMcFb8a8M6CTs9nwsluXhsR6Qu34FMq3sMcZkO9f2snP
 oa6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ZzakF3JxigJ1i63QdUVyUrevod2UiBMguTqkmqVTfbE=;
 b=KcnMU4/zWMmCxXnOiE7x0/mSySLPG+Ycow3Pq7rIzlbQXAoSBHJ2wVZ5J3W6iCe+PR
 UsZYo5/tW5msekUCNXZTrkL/it/LmDnWwrf65qNaQ2X7GI9tIMlHfjMKftQpLhsev/uy
 bt0qfEcTwZPprNm45p9IqtK7t+JGGC3trVzBlCsrmNhRDxTo3xDp1CKKsOBJNTVI127e
 huJ7WDRUvuQxWDx2IFkag0qQjWynTRUto3LIurLKBQsQgATvpTYpaF2bGSuuvm5Y6vDp
 7DPMe4d5qo4gazdt3cGkWq8k1kvdbJQlzORDWrCr1tNXglSA9gVWR2N1COj7gGDL50ZK
 66Lg==
X-Gm-Message-State: AOAM533zJRZDS8Ai6AAckQSDe7cSARRIl9jvhkCnpf09xnVPkb2Liqun
 Ehix6w8eBoJGBJ14iLEV+6rrBlwXY0i66o+sEAJZSx1o+koFOg==
X-Google-Smtp-Source: ABdhPJxGmOpiG092Qd7n1rSAh2j7yLtsM+IMhwLInhpSRnMnLtivElx4vVXwyQGz55S00aQZ+KlgGnkut/jxbmsEjT8=
X-Received: by 2002:a2e:9b4f:: with SMTP id o15mr10125493ljj.358.1591019741619; 
 Mon, 01 Jun 2020 06:55:41 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 1 Jun 2020 19:25:30 +0530
Message-ID: <CA+G9fYvU3g1HqOT8UbNBzXCjCD7Ot1pAFjv-8PGee9ObdbYksg@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>, Amir Goldstein <amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] i386: fanotify01.c:115: BROK: fanotify_mark () failed: EFAULT
 (14)
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
Cc: Jan Kara <jack@suse.cz>, lkft-triage@lists.linaro.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

We have recently enabled CONFIG_FANOTIFY=y in our testing builds and
i386 kernel running on x86_64 machine testing LTP 20200515 test runs reported
fanotify{01,02,04..15} failures on linux mainline 5.7.0-rc6
Where as these tests pass on x86_64, arm and arm64.

Is this a known issue on i386 ?
As you know, these tests cases were skipped before enabling CONFIG_FANOTIFY.

The file system mounted on NFS and the LTP tests using a external mounted
SSD drive. LTP tests running as

Steps to reproduce:
-------------------
./runltp -d /scratch -f syscalls

and easily reproducible on qemu_i386 also which is mounting local rootfs.img

configs:
-----------
CONFIG_FANOTIFY=y
# CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set --> not set of x86_64 and i386.


Test output log:
-----------------
tst_device.c:262: INFO: Using test device LTP_DEV='/dev/loop0'
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
mke2fs 1.43.8 (1-Jan-2018)
[  391.914376] EXT4-fs (loop0): mounting ext2 file system using the
ext4 subsystem
[  391.962316] EXT4-fs (loop0): mounted filesystem without journal. Opts: (null)
[  391.969684] ext2 filesystem being mounted at
/scratch/ltp-86JZJboUf9/Sl4t1D/fs_mnt supports timestamps until 2038
(0x7fffffff)
tst_test.c:1246: INFO: Timeout per run is 0h 15m 00s
fanotify01.c:89: INFO: Test #0: inode mark events
fanotify01.c:115: BROK: fanotify_mark (6, FAN_MARK_ADD, FAN_ACCESS |
FAN_MARK_INODE | FAN_MODIFY | FAN_CLOSE | FAN_OPEN, AT_FDCWD,
fs_mnt/tfile_19115) failed: EFAULT (14)

fanotify02.c:57: BROK: fanotify_mark (6, FAN_MARK_ADD, FAN_ACCESS |
FAN_MODIFY | FAN_CLOSE | FAN_OPEN | FAN_EVENT_ON_CHILD | FAN_ONDIR,
AT_FDCWD, '.') failed: EFAULT (14)

fanotify03.c:236: CONF: CONFIG_FANOTIFY_ACCESS_PERMISSIONS not
configured in kernel?: EINVAL (22)

fanotify04.c:66: FAIL: fanotify_mark (6, FAN_MARK_ADD |
FAN_MARK_ONLYDIR, FAN_OPEN, AT_FDCWD, '.') failed
fanotify04.c:71: PASS: fanotify_mark (6, FAN_MARK_ADD |
FAN_MARK_ONLYDIR, FAN_OPEN, AT_FDCWD, 'fname_19127') failed
fanotify04.c:66: FAIL: fanotify_mark (6, FAN_MARK_ADD |
FAN_MARK_DONT_FOLLOW, FAN_OPEN, AT_FDCWD, 'symlink_19127') failed
fanotify04.c:66: FAIL: fanotify_mark (6, FAN_MARK_ADD | 0, FAN_OPEN,
AT_FDCWD, 'symlink_19127') failed
fanotify04.c:198: BROK: fanotify_mark (6, FAN_MARK_ADD, FAN_OPEN,
AT_FDCWD, 'fname_19127') failed: EFAULT (14)

fanotify05.c:115: BROK: fanotify_mark (6, FAN_MARK_MOUNT |
FAN_MARK_ADD, FAN_OPEN, AT_FDCWD, \".\") failed: EFAULT (14)

fanotify06.c:98: BROK: fanotify_mark(6, FAN_MARK_ADD | FAN_MARK_MOUNT,
FAN_MODIFY, AT_FDCWD, mntpoint/tfile_19139) failed: EFAULT (14)

fanotify07.c:112: CONF: CONFIG_FANOTIFY_ACCESS_PERMISSIONS not
configured in kernel?: EINVAL (22)

fanotify09.c:108: BROK: fanotify_mark(6, FAN_MARK_ADD |
FAN_MARK_MOUNT, FAN_MODIFY, AT_FDCWD, '.') failed: EFAULT (14)

fanotify10.c:239: BROK: fanotify_mark(6, FAN_MARK_ADD |
FAN_MARK_MOUNT,FAN_OPEN, AT_FDCWD, fs_mnt) failed: EFAULT (14)

fanotify11.c:82: BROK: fanotify_mark FAN_MARK_ADD fail ret=-1

fanotify12.c:160: BROK: fanotify_mark(6, FAN_MARK_ADD |
FAN_MARK_INODE, 20, AT_FDCWD, fname_19160) failed: EFAULT (14)

fanotify13.c:300: BROK: fanotify_mark(6, FAN_MARK_ADD,
FAN_CLOSE_WRITE, AT_FDCWD, mntpoint/file_one) failed: EFAULT (14)

fanotify15.c:101: BROK: fanotify_mark(6, FAN_MARK_ADD |
FAN_MARK_FILESYSTEM, FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_MODIFY |
FAN_ONDIR | 0x400, AT_FDCWD, mntpoint/test_dir) failed: EFAULT (14)

full test log link,
i386 kernel running on x86_64 machine
https://lkft.validation.linaro.org/scheduler/job/1446082#L8947
https://lkft.validation.linaro.org/scheduler/job/1457258#L8946

qemu_i386 test log link,
https://lkft.validation.linaro.org/scheduler/job/1446103
https://qa-reports.linaro.org/lkft/linux-mainline-oe/build/v5.7-rc6-100-g444565650a5f/testrun/1446103/

Test results comparison:
https://qa-reports.linaro.org/lkft/linux-mainline-oe/tests/ltp-syscalls-tests/fanotify01
https://qa-reports.linaro.org/lkft/linux-mainline-oe/tests/ltp-syscalls-tests/fanotify15

-- 
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
