Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D22F10FE68
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Dec 2019 14:08:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE9323C2677
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Dec 2019 14:08:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 8A9033C2625
 for <ltp@lists.linux.it>; Tue,  3 Dec 2019 14:08:13 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 70CE1601F74
 for <ltp@lists.linux.it>; Tue,  3 Dec 2019 14:08:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EcIcKJaf0Vzu8gfZz02oe7Gwnt0ERuFDFTLCCrtsorU=; b=CUrXyLSfM0j73HpzyXClUZ9ZB
 Ya7bqqBtCIpv+OfHzcjkp8AY3lZyjlOwMWwBORH1exJBQlXKuRhyu6hN9mAkkBSWypIvRJzID6bH9
 MEt5gGpJM9F/LG9UBnRGyO8JMV5Z+uNRSREp1xk9HOWxG+3rqxnTxffGV/PxbjCab2+0G2FF+0Gop
 wJ/pNAa+v8fo1IVysoeY5Y6awX6A+pEspjRT1OxergIKgPLlAjskkMhIDebmlyQbgkHTxlCKkvB3r
 dnHufob/L8HJlVtJiXPbEofyXbHdLMcke2iNXBFYorJeiP3N/wURx5wmHHpK8ocxtTYf31SN1trqZ
 LtHuZlL1A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ic7uI-0000jv-0C; Tue, 03 Dec 2019 13:07:58 +0000
Date: Tue, 3 Dec 2019 05:07:57 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191203130757.GA2267@infradead.org>
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
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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

On Tue, Dec 03, 2019 at 07:50:39AM -0500, Jan Stancek wrote:
> My theory is that there's a race in iomap. There appear to be
> interleaved calls to iomap_set_range_uptodate() for same page
> with varying offset and length. Each call sees bitmap as _not_
> entirely "uptodate" and hence doesn't call SetPageUptodate().
> Even though each bit in bitmap ends up uptodate by the time
> all calls finish.

Weird.  That should be prevented by the page lock that all callers
of iomap_set_range_uptodate.  But in case I miss something, does
the patch below trigger?  If not it is not jut a race, but might
be some weird ordering problem with the bitops, especially if it
only triggers on ppc, which is very weakly ordered.

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index d33c7bc5ee92..25e942c71590 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -148,6 +148,8 @@ iomap_set_range_uptodate(struct page *page, unsigned off, unsigned len)
 	unsigned int i;
 	bool uptodate = true;
 
+	WARN_ON_ONCE(!PageLocked(page));
+
 	if (iop) {
 		for (i = 0; i < PAGE_SIZE / i_blocksize(inode); i++) {
 			if (i >= first && i <= last)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
