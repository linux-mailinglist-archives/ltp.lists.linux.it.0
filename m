Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0A6EE077
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 13:52:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00C463C2434
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 13:52:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8C4B33C23ED
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 13:52:38 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 82A8B6009AE
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 13:52:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8DE23B16C
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 12:52:36 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  4 Nov 2019 13:52:27 +0100
Message-Id: <20191104125228.17173-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 0/1] Fix zram01.sh
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

The compression ratio check in zram01.sh is completely broken:
- It uses `free -m` to *guess* zram memory usage which is distorted by all
  other processes running on the system.
- It calculates memory usage backwards ($before - $after; which should
  produce a negative value if the two values weren't nonsense).
- It mixes bytes with megabytes when calculating the final ratio.

Here's a patch to calculate the compression ratio correctly using sysfs memory
usage statistics for each zram device. I currently calculate it as
$bytes_written / $mm_stat_compr_data_size.

One question for debate is whether I should use a different formula:
- $bytes_written / $mm_stat_mem_used_total
  (mem_used_total includes internal zram memory management overhead)
- $mm_stat_orig_data_size / $mm_stat_compr_data_size
  (zram01.sh fills the zram device with binary zeroes so the data will be
  compacted even before compression; orig_data_size << bytes_written)
- $mm_stat_orig_data_size / $mm_stat_mem_used_total)
  (this could easily produce ratio <100% due to page compacting)
See https://www.kernel.org/doc/Documentation/blockdev/zram.txt

The mm_stat sysfs file is available since kernel 4.1. Unfortunately,
I couldn't test the TCONF branch when mm_stat doesn't exist because there's
no SLE release with kernel version between 3.14 and 4.1.

Verifcation run: https://openqa.suse.de/tests/3552880#step/zram01/6

Martin Doucha (1):
  Fix compression ratio calculation in zram01

 .../kernel/device-drivers/zram/zram01.sh      | 36 +++++++++----------
 1 file changed, 16 insertions(+), 20 deletions(-)

-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
