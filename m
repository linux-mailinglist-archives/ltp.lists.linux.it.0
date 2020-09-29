Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C96BC27D585
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 20:11:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8DFE23C2AAC
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 20:11:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 221DE3C0596
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 20:11:55 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A794710009EC
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 20:11:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1041CAB91;
 Tue, 29 Sep 2020 18:11:54 +0000 (UTC)
Date: Tue, 29 Sep 2020 20:11:52 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20200929181152.GD15188@dell5510>
References: <20200929144635.28874-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929144635.28874-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] utimensat01: Test all available FS and handle FS
 with no attributes
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: chrubis@suse.com, ltp@lists.linux.it, viresh.kumar@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie,

LGTM.

Although this fails on NTFS and exfat and FUSE.
I don't remember which flag removes these filesystems, there was some
workaround. Cyril, Li, Jan, do you remember?

Kind regards,
Petr

tst_test.c:1248: TINFO: Timeout per run is 0h 05m 00s
utimensat01.c:298: TINFO: Testing variant: syscall with old kernel spec
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315525600: 315525600)
utimensat01.c:282: TPASS:  0: utimensat() passed
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315525600: 315525600)
utimensat01.c:282: TPASS:  1: utimensat() passed
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315525600: 315525600)
utimensat01.c:274: TFAIL:  2: atime shouldn't have changed but did
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315525600: 315525600)
utimensat01.c:278: TFAIL:  3: mtime shouldn't have changed but did
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315525600: 315525600)
utimensat01.c:274: TFAIL:  4: atime shouldn't have changed but did
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315525600: 315525600)
utimensat01.c:282: TPASS:  5: utimensat() passed
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315525600: 315525600)
utimensat01.c:282: TPASS:  6: utimensat() passed
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315525600: 315525600)
utimensat01.c:282: TPASS:  7: utimensat() passed
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315525600: 315525600)
utimensat01.c:274: TFAIL:  8: atime shouldn't have changed but did
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315525600: 315525600)
utimensat01.c:278: TFAIL:  9: mtime shouldn't have changed but did
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315525600: 315525600)
utimensat01.c:274: TFAIL: 10: atime shouldn't have changed but did
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315525600: 315525600)
utimensat01.c:282: TPASS: 11: utimensat() passed
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315525600: 315525600)
utimensat01.c:188: TCONF: Attributes not supported by FS: ENOTTY (25)
tst_test.c:1316: TINFO: Testing on exfat
tst_mkfs.c:89: TINFO: Formatting /dev/loop1 with exfat opts='' extra opts=''
tst_test.c:1248: TINFO: Timeout per run is 0h 05m 00s
utimensat01.c:298: TINFO: Testing variant: syscall with old kernel spec
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315532800: 315532800)
utimensat01.c:282: TPASS:  0: utimensat() passed
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315532800: 315532800)
utimensat01.c:282: TPASS:  1: utimensat() passed
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315532800: 315532800)
utimensat01.c:274: TFAIL:  2: atime shouldn't have changed but did
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315532800: 315532800)
utimensat01.c:278: TFAIL:  3: mtime shouldn't have changed but did
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315532800: 315532800)
utimensat01.c:274: TFAIL:  4: atime shouldn't have changed but did
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315532800: 315532800)
utimensat01.c:282: TPASS:  5: utimensat() passed
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315532800: 315532800)
utimensat01.c:282: TPASS:  6: utimensat() passed
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315532800: 315532800)
utimensat01.c:282: TPASS:  7: utimensat() passed
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315532800: 315532800)
utimensat01.c:274: TFAIL:  8: atime shouldn't have changed but did
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315532800: 315532800)
utimensat01.c:278: TFAIL:  9: mtime shouldn't have changed but did
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315532800: 315532800)
utimensat01.c:274: TFAIL: 10: atime shouldn't have changed but did
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315532800: 315532800)
utimensat01.c:282: TPASS: 11: utimensat() passed
utimensat01.c:213: TFAIL: Failed to reset access and modification time (315532800: 315532800)
utimensat01.c:188: TCONF: Attributes not supported by FS: ENOTTY (25)
tst_test.c:1316: TINFO: Testing on ntfs
tst_mkfs.c:89: TINFO: Formatting /dev/loop1 with ntfs opts='' extra opts=''
The partition start sector was not specified for /dev/loop1 and it could not be obtained automatically.  It has been set to 0.
The number of sectors per track was not specified for /dev/loop1 and it could not be obtained automatically.  It has been set to 0.
The number of heads was not specified for /dev/loop1 and it could not be obtained automatically.  It has been set to 0.
To boot from a device, Windows needs the 'partition start sector', the 'sectors per track' and the 'number of heads' to be set.
Windows will not be able to boot from this device.
safe_macros.c:755: TINFO: Trying FUSE...
tst_test.c:1248: TINFO: Timeout per run is 0h 05m 00s
utimensat01.c:298: TINFO: Testing variant: syscall with old kernel spec
utimensat01.c:282: TPASS:  0: utimensat() passed
utimensat01.c:282: TPASS:  1: utimensat() passed
utimensat01.c:282: TPASS:  2: utimensat() passed
utimensat01.c:274: TFAIL:  3: atime should have changed but didn't
utimensat01.c:278: TFAIL:  4: mtime should have changed but didn't
utimensat01.c:282: TPASS:  5: utimensat() passed
utimensat01.c:282: TPASS:  6: utimensat() passed
utimensat01.c:282: TPASS:  7: utimensat() passed
utimensat01.c:282: TPASS:  8: utimensat() passed
utimensat01.c:274: TFAIL:  9: atime should have changed but didn't
utimensat01.c:278: TFAIL: 10: mtime should have changed but didn't
utimensat01.c:282: TPASS: 11: utimensat() passed
utimensat01.c:190: TBROK: ioctl(fd, FS_IOC_GETFLAGS, &attr) failed: EINVAL (22)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
