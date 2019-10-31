Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A63EAD4E
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 11:21:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E29A3C22C9
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 11:21:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2F5FB3C176C
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 11:21:18 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6DE36601F43
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 11:21:17 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BEAD1B12E
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 10:21:16 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 31 Oct 2019 11:21:14 +0100
Message-Id: <20191031102116.10592-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009152459.GB15291@rei.lan>
References: <20191009152459.GB15291@rei.lan>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/2] Increase fsync() coverage - GH#452
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

This patchset partially solves GH issue #452. New test cases: Call fsync()
on open socket, fifo, and closed non-negative file descriptor.

What is not tested (yet): fsync() calls which produce EINTR, EIO, ENOSPC,
EROFS or EDQUOT errors. These errors can only happen while data in kernel
buffers is being written to disk. Producing these errors reliably would
require some control over the block device underlying the file system.

Changes since v2:
- coding style fixes
- cleaner setup() and cleanup()
- use TEST() macro for checking fsync() result
- pedantic check of fsync() return value

Martin Doucha (2):
  Update syscalls/fsync03 to new API
  Improve coverage in syscalls/fsync03

 testcases/kernel/syscalls/fsync/fsync03.c | 178 ++++++++--------------
 1 file changed, 63 insertions(+), 115 deletions(-)

-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
