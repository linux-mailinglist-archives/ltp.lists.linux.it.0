Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F9F614ED5
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Nov 2022 17:07:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8FA7C3CACE0
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Nov 2022 17:07:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 637C53C9817
 for <ltp@lists.linux.it>; Tue,  1 Nov 2022 17:07:48 +0100 (CET)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 86317200922
 for <ltp@lists.linux.it>; Tue,  1 Nov 2022 17:07:47 +0100 (CET)
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 1D56172C98F;
 Tue,  1 Nov 2022 19:07:45 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
 by imap.altlinux.org (Postfix) with ESMTPSA id D3E8E4A472A;
 Tue,  1 Nov 2022 19:07:44 +0300 (MSK)
Date: Tue, 1 Nov 2022 19:07:44 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: LTP List <ltp@lists.linux.it>, Yang Xu <xuyang2018.jy@fujitsu.com>,
 Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20221101160744.4qb3adfwaf375e6v@altlinux.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] statx01 test failure/bug on i586
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
Cc: "Dmitry V. Levin" <ldv@altlinux.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

We got statx01 failure on LTP 20220930 for runs on i586 arch.

  statx01.c:98: TPASS: statx(AT_FDCWD, test_file, 0, 0, &buff)
  statx01.c:105: TPASS: stx_uid(0) is correct
  statx01.c:111: TPASS: stx_gid(0) is correct
  statx01.c:117: TPASS: stx_size(256) is correct
  statx01.c:125: TPASS: stx_mode(33188) is correct
  statx01.c:131: TPASS: stx_blocks(8) is valid
  statx01.c:138: TPASS: stx_nlink(1) is correct
  statx01.c:82: TFAIL: statx.stx_mnt_id(23) is different from mount_id(13820440305888919575) in /proc/self/mountinfo
  statx01.c:88: TPASS: /proc/9494/fdinfo/3 mnt_id: = 23
  statx01.c:156: TPASS: statx(AT_FDCWD, mntpoint/blk_dev, 0, 0, &buff)
  statx01.c:163: TPASS: stx_rdev_major(8) is correct
  statx01.c:171: TPASS: stx_rdev_minor(1) is correct

Value "13820440305888919575" hints there may be integer overflow.

On Tue, Nov 01, 2022 at 06:31:20PM +0300, Dmitry V. Levin wrote:
> $ grep -Fwn mnt_id testcases/kernel/syscalls/statx/statx01.c
> 20: * - mnt_id
> 58:	uint64_t mnt_id;
> 68:		if (sscanf(line, "%ld %*d %d:%d", &mnt_id, &line_mjr, &line_mnr) != 3)
> ...

On 32-bit systems sscanf of %ld would leave higher part of mnt_id
uninitialized, resulting in false positive test failure.

Thanks,


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
