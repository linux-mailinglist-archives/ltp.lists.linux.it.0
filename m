Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4F82B0ABB
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 17:50:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0AD9E3C5FFF
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 17:50:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 13C8B3C4FD1
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 17:50:16 +0100 (CET)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 74FC51A008AB
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 17:50:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=DJP/8vs4ykzHKc6DHLcxHUQQ4kXE+U15/2xsaVbVlkc=; b=AKPC7cTPU7x858fam2CQQEv3D5
 PRUCOM6nvX1J0KxcgF6MEIotk/rL8Acxarp6Xnb6dr+OaUsverD//0zDounuTom3O52cVcoqDGxfU
 C6fMvPen3vb0TsTDjszfcOxJhdc5BEuzJGJMqpTJ/ZOkGdHhx2MHl9kBnoXVGonQF4j2Usoqtin1i
 VXKiEhpRA+TtgBGyvihNHi1rwnAYLmmOgswREmMYuwNoE9xNJ0K56Kz6KlD7B/rC2UW6vDmCouCUw
 SnrATPE9AMdrWqg8KPyrXFW4L0OcZaOkSEkQf4AGhUrRo407uxIMJzCc9YLxBWOTEiHxB5+Fy3mtJ
 kS9khKTw==;
Received: from [2001:4bb8:180:6600:5c73:9bb4:23ff:391c] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdFnW-0006yy-5o; Thu, 12 Nov 2020 16:50:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 12 Nov 2020 17:50:05 +0100
Message-Id: <20201112165005.4022502-3-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201112165005.4022502-1-hch@lst.de>
References: <20201112165005.4022502-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] loop: Fix occasional uevent drop
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
Cc: linux-block@vger.kernel.org, Martijn Coenen <maco@android.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Petr Vorel <pvorel@suse.cz>

Commit 716ad0986cbd ("loop: Switch to set_capacity_revalidate_and_notify")
causes an occasional drop of loop device uevent, which are no longer
triggered in loop_set_size() but in a different part of code.

Bug is reproducible with LTP test uevent01 [1]:

i=0; while true; do
    i=$((i+1)); echo "== $i =="
    lsmod |grep -q loop && rmmod -f loop
    ./uevent01 || break
done

Put back triggering through code called in loop_set_size().

Fix required to add yet another parameter to
set_capacity_revalidate_and_notify().

[1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/uevents/uevent01.c

Fixes: 716ad0986cbd ("loop: Switch to set_capacity_revalidate_and_notify")
Reported-by: <ltp@lists.linux.it>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
[hch: rebased on a different change to the prototype of
 set_capacity_revalidate_and_notify]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/loop.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index cb1191d6e945f2..a58084c2ed7ceb 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -255,7 +255,8 @@ static void loop_set_size(struct loop_device *lo, loff_t size)
 
 	bd_set_nr_sectors(bdev, size);
 
-	set_capacity_revalidate_and_notify(lo->lo_disk, size, false);
+	if (!set_capacity_revalidate_and_notify(lo->lo_disk, size, false))
+		kobject_uevent(&disk_to_dev(bdev->bd_disk)->kobj, KOBJ_CHANGE);
 }
 
 static inline int
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
