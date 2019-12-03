Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC381104C3
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Dec 2019 20:09:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE7433C25C8
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Dec 2019 20:09:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 876533C24ED
 for <ltp@lists.linux.it>; Tue,  3 Dec 2019 20:09:37 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 88D7710006AA
 for <ltp@lists.linux.it>; Tue,  3 Dec 2019 20:09:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=py4BlJOG+aJY1t5dKR8XIt0EiXOF2BwKLJexNHJri1k=; b=CCSUVIohdJ+y56P3xd+6FuQGU
 pJYOCKIHCMeXs7AEXlZL6jhxvHAl+0Lgy118AvAwu1hxc2FV5vGBpf8rZt6LFK4FJKxxYFA30S7Bh
 KJ0LY7pWJ3PZAwiaVZggg4EVTZwgYy27V7jjcaRIRwvPQrHjVi22wX2Pzuqg5TkXtAGAkFpgxlgWD
 YcKt33G2jpjmQMTuNJCApdFpefsW4WxBHjE48iux4CMjK64jcO495icX9To0oB233ho0UJWxLpJeZ
 HavcCSh+2GXDTbHO6nABmvKZ0ENQel24dDe2TsBsZugZ+3E2226e6X6Qtl2lnKDGErDmdcNtk8o+d
 aJmH63Ccg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1icDY5-0001tg-8N; Tue, 03 Dec 2019 19:09:25 +0000
Date: Tue, 3 Dec 2019 11:09:25 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191203190925.GA5150@infradead.org>
References: <cki.6C6A189643.3T2ZUWEMOI@redhat.com>
 <1738119916.14437244.1575151003345.JavaMail.zimbra@redhat.com>
 <8736e3ffen.fsf@mpe.ellerman.id.au>
 <1420623640.14527843.1575289859701.JavaMail.zimbra@redhat.com>
 <1766807082.14812757.1575377439007.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1766807082.14812757.1575377439007.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [bug] userspace hitting sporadic SIGBUS on xfs (Power9,
 ppc64le), v4.19 and later
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
Cc: hch@infradead.org, darrick.wong@oracle.com,
 Michael Ellerman <mpe@ellerman.id.au>, Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>, linux-xfs@vger.kernel.org,
 CKI Project <cki-project@redhat.com>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Please try the patch below:

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 512856a88106..340c15400423 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -28,6 +28,7 @@
 struct iomap_page {
 	atomic_t		read_count;
 	atomic_t		write_count;
+	spinlock_t		uptodate_lock;
 	DECLARE_BITMAP(uptodate, PAGE_SIZE / 512);
 };
 
@@ -51,6 +52,7 @@ iomap_page_create(struct inode *inode, struct page *page)
 	iop = kmalloc(sizeof(*iop), GFP_NOFS | __GFP_NOFAIL);
 	atomic_set(&iop->read_count, 0);
 	atomic_set(&iop->write_count, 0);
+	spin_lock_init(&iop->uptodate_lock);
 	bitmap_zero(iop->uptodate, PAGE_SIZE / SECTOR_SIZE);
 
 	/*
@@ -139,25 +141,38 @@ iomap_adjust_read_range(struct inode *inode, struct iomap_page *iop,
 }
 
 static void
-iomap_set_range_uptodate(struct page *page, unsigned off, unsigned len)
+iomap_iop_set_range_uptodate(struct page *page, unsigned off, unsigned len)
 {
 	struct iomap_page *iop = to_iomap_page(page);
 	struct inode *inode = page->mapping->host;
 	unsigned first = off >> inode->i_blkbits;
 	unsigned last = (off + len - 1) >> inode->i_blkbits;
-	unsigned int i;
 	bool uptodate = true;
+	unsigned long flags;
+	unsigned int i;
 
-	if (iop) {
-		for (i = 0; i < PAGE_SIZE / i_blocksize(inode); i++) {
-			if (i >= first && i <= last)
-				set_bit(i, iop->uptodate);
-			else if (!test_bit(i, iop->uptodate))
-				uptodate = false;
-		}
+	spin_lock_irqsave(&iop->uptodate_lock, flags);
+	for (i = 0; i < PAGE_SIZE / i_blocksize(inode); i++) {
+		if (i >= first && i <= last)
+			set_bit(i, iop->uptodate);
+		else if (!test_bit(i, iop->uptodate))
+			uptodate = false;
 	}
 
-	if (uptodate && !PageError(page))
+	if (uptodate)
+		SetPageUptodate(page);
+	spin_unlock_irqrestore(&iop->uptodate_lock, flags);
+}
+
+static void
+iomap_set_range_uptodate(struct page *page, unsigned off, unsigned len)
+{
+	if (PageError(page))
+		return;
+
+	if (page_has_private(page))
+		iomap_iop_set_range_uptodate(page, off, len);
+	else
 		SetPageUptodate(page);
 }
 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
