Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 06105EF7B4
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 10:03:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C53D63C233C
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 10:03:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id D95C03C22BD
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 10:03:41 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CD495140184D
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 10:03:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 31A74B2F1;
 Tue,  5 Nov 2019 09:03:40 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  5 Nov 2019 10:03:38 +0100
Message-Id: <20191105090339.6522-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105082322.GA16218@dell5510>
References: <20191105082322.GA16218@dell5510>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/1] Fix compression ratio calculation in zram01
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

Changes from v1:
- TINFO about amount of data written to zram device changed to TPASS

Shortened patch description from v1:
The compression ratio check in zram01.sh is completely broken. Here's a patch
to calculate the compression ratio correctly using sysfs memory usage
statistics for each zram device. I currently calculate it as
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

Martin Doucha (1):
  Fix compression ratio calculation in zram01

 .../kernel/device-drivers/zram/zram01.sh      | 38 +++++++++----------
 1 file changed, 17 insertions(+), 21 deletions(-)

-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
