Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 704BB10C60D
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 10:36:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D94553C22CF
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 10:36:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id EBA923C220C
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 10:36:13 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1152720E77C
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 10:36:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0B35BB15B
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 09:36:10 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 28 Nov 2019 10:36:09 +0100
Message-Id: <20191128093610.6903-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/1] Use real FS block size in fallocate05
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

Using fixed-size buffer in fallocate05 caused some failures in the past
due to allocation requests being misaligned with actual file system blocks.
Btrfs in particular will treat misaligned allocation as regular write()
and apply copy-on-write to partially allocated blocks even on the first real
write().

While that behavior is somewhat surprising, it does make sense. Fix the error
by using multiples of real block size in fallocate() and write().

I've also found some XFS and Btrfs quirks which are documented in the patch.
The XFS behavior appears to be intentional. I'm still waiting for reply
whether the Btrfs quirk with deallocating blocks is a bug or not.

I'll also write another fallocate() test later for checking FS behavior
on intentionally misaligned allocation. But this fix can be committed before
that.

Martin Doucha (1):
  Use real FS block size in fallocate05

 .../kernel/syscalls/fallocate/fallocate05.c   | 75 ++++++++++++-------
 1 file changed, 50 insertions(+), 25 deletions(-)

-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
