Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E0AB4BCE
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 12:17:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50BFD3C20BA
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 12:17:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 982093C2079
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 12:17:41 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9A60B140174F
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 12:17:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BA29EAF79
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 10:17:39 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 17 Sep 2019 12:17:04 +0200
Message-Id: <20190917101706.10013-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] Increase fsync() coverage - GH#452
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

Martin Doucha (2):
  Update syscalls/fsync03 to new API
  Improve coverage in syscalls/fsync03

 testcases/kernel/syscalls/fsync/fsync03.c | 189 +++++++++-------------
 1 file changed, 76 insertions(+), 113 deletions(-)

-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
