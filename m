Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0432B4A37
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 17:02:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4C373C6F53
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 17:02:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6086A3C5DAF
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 17:02:49 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 66F806009AA
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 17:02:48 +0100 (CET)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 857D9221F9;
 Mon, 16 Nov 2020 16:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605542566;
 bh=nMg82EAoktVc5Hpjdoyrbh8BYV3emzPyILk0yRnaVsE=;
 h=Subject:To:Cc:From:Date:From;
 b=FP+5WGIOGdohnb8cgTG5ExmEiQ1H1VxK8wDRoLSJZkWddLmUahMdaVx6s8qtGAiHl
 ivY2iHmmgHjBw3YaW8TR5X+fYyhda2NTwEJl6Ix3w9oNrkulAN2ydT+V++8jyFhgJO
 8kWXgN3VRLNPa8TTwAqKTb9iklbhMKL4seEOKYAI=
To: axboe@kernel.dk, gregkh@linuxfoundation.org, hch@lst.de, ltp@lists.linux.it,
 pvorel@suse.cz
From: <gregkh@linuxfoundation.org>
Date: Mon, 16 Nov 2020 17:03:00 +0100
Message-ID: <16055425807438@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] Patch "loop: Fix occasional uevent drop" has been added to
 the 5.9-stable tree
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


This is a note to let you know that I've just added the patch titled

    loop: Fix occasional uevent drop

to the 5.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     loop-fix-occasional-uevent-drop.patch
and it can be found in the queue-5.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From c01a21b77722db0474bbcc4eafc8c4e0d8fed6d8 Mon Sep 17 00:00:00 2001
From: Petr Vorel <pvorel@suse.cz>
Date: Thu, 12 Nov 2020 17:50:05 +0100
Subject: loop: Fix occasional uevent drop

From: Petr Vorel <pvorel@suse.cz>

commit c01a21b77722db0474bbcc4eafc8c4e0d8fed6d8 upstream.

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

[hch: rebased on a different change to the prototype of
 set_capacity_revalidate_and_notify]

Cc: stable@vger.kernel.org # v5.9
Fixes: 716ad0986cbd ("loop: Switch to set_capacity_revalidate_and_notify")
Reported-by: <ltp@lists.linux.it>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/block/loop.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -255,7 +255,8 @@ static void loop_set_size(struct loop_de
 
 	bd_set_size(bdev, size << SECTOR_SHIFT);
 
-	set_capacity_revalidate_and_notify(lo->lo_disk, size, false);
+	if (!set_capacity_revalidate_and_notify(lo->lo_disk, size, false))
+		kobject_uevent(&disk_to_dev(bdev->bd_disk)->kobj, KOBJ_CHANGE);
 }
 
 static inline int


Patches currently in stable-queue which might be from pvorel@suse.cz are

queue-5.9/block-add-a-return-value-to-set_capacity_revalidate_and_notify.patch
queue-5.9/loop-fix-occasional-uevent-drop.patch

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
