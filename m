Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0275B7FD88C
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Nov 2023 14:46:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 707CB3CC28F
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Nov 2023 14:46:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EB0293CC28F
 for <ltp@lists.linux.it>; Wed, 29 Nov 2023 14:46:42 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 16B2D1400FB3
 for <ltp@lists.linux.it>; Wed, 29 Nov 2023 14:46:41 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EFBCC1FCE6;
 Wed, 29 Nov 2023 13:46:40 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id CCFD41376F;
 Wed, 29 Nov 2023 13:46:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id vHJDMcBAZ2XtIwAAn2gu4w
 (envelope-from <pvorel@suse.cz>); Wed, 29 Nov 2023 13:46:40 +0000
Date: Wed, 29 Nov 2023 14:46:39 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Kara <jack@suse.cz>
Message-ID: <20231129134639.GA1426618@pevik>
References: <20231129114617.12660-1-jack@suse.cz>
 <20231129115440.19100-3-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231129115440.19100-3-jack@suse.cz>
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: EFBCC1FCE6
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/6] fanotify: Switch event and mark tests to
 *_on_fs() variant
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan, Amir,

> Switch event availability and mark type availability tests to be
> performed on the filesystem actually used for testing instead of on the
> current directory. This is more reliable as not all filesystems support
> the same set of features.

Jan, unfortunately this commit breaks fanotify09 and fanotify10 on SLES15 based kernels:

# ./fanotify09
tst_device.c:97: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:1106: TINFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
mke2fs 1.46.4 (18-Aug-2021)
tst_test.c:1120: TINFO: Mounting /dev/loop0 to /tmp/LTP_fanRt2Q1k/fs_mnt fstyp=ext2 flags=0
tst_test.c:1690: TINFO: LTP version: 20230929-156-gf7f69b7ef
tst_test.c:1576: TINFO: Timeout per run is 0h 00m 30s
fanotify.h:210: TBROK: fanotify_mark (3, FAN_MARK_ADD, ..., AT_FDCWD, fs_mnt) failed: EINVAL (22)
...

# ./fanotify10
tst_device.c:97: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:1106: TINFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
mke2fs 1.46.4 (18-Aug-2021)
tst_test.c:1120: TINFO: Mounting /dev/loop0 to /tmp/LTP_fanTNt5os/fs_mnt fstyp=ext2 flags=0
tst_test.c:1690: TINFO: LTP version: 20230929-156-gf7f69b7ef
tst_test.c:1576: TINFO: Timeout per run is 0h 00m 30s
fanotify.h:210: TBROK: fanotify_mark (3, FAN_MARK_ADD, ..., AT_FDCWD, fs_mnt) failed: EINVAL (22)
fanotify10.c:948: TWARN: unlink(fs_mnt/testdir/testfile) failed: ENOENT (2)
fanotify10.c:949: TWARN: rmdir(fs_mnt/testdir/testdir2) failed: ENOENT (2)
fanotify10.c:950: TWARN: rmdir(fs_mnt/testdir) failed: ENOENT (2)
fanotify10.c:951: TWARN: rmdir(mntpoint) failed: ENOENT (2)
...

I suppose the problem is somewhere in fanotify_flags_supported_on_fs(), i.e. in
the first commit. It works well on Tumbleweed, which uses latest official stable
kernel.

Can you please have look on the issue?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
