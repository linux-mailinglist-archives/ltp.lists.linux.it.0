Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B048C24FFCF
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 16:30:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 66D1B3C56C4
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 16:30:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 05A943C0515
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 13:06:59 +0200 (CEST)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D61371000A47
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 13:06:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ohQb6esAa782/eIrhlce2XvDBGSTUTKIVr+3ovcDvsQ=; b=e0F1Tbt9Ej9RJfZZz5VToqrdh5
 apDwwZI6rZwCF0XZkWZcWmnGaL48hCLwr+0ZtiqIOD5YNEQ2vtB99xoojMVQLzo9PMP8juHt+WWbM
 Mwo2wIafr27xyUXS7yvzAj4tQHnJoOlOW5QRXaCqCnbrocZclk7RckLIl4XTNa7jMMkSckUI5Oho8
 ZJcV68z6K4CtxsGcSnFiBxJXk3/oWoXO21l8zWiZxFLEbXqCAVVjrIxi9OqsgZKWKVXkCCtmjh5US
 jmHt9aLDPA4zq/qBbcyGGFOh+rv/2/taQP72+ePsKSxPfggx4aEPMtLypZ+9/b8GYz3g3rUidwLMO
 3cWQigwQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kAAJJ-0007jg-UW; Mon, 24 Aug 2020 11:06:46 +0000
Date: Mon, 24 Aug 2020 12:06:45 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200824110645.GC17456@casper.infradead.org>
References: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 24 Aug 2020 16:29:56 +0200
Subject: Re: [LTP] BUG: Bad page state in process true  pfn:a8fed on arm
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, opendmb@gmail.com,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 linux-mm <linux-mm@kvack.org>, Will Deacon <will@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Peter Xu <peterx@redhat.com>, Andy Lutomirski <luto@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 afzal.mohd.ma@gmail.com, Christoph Hellwig <hch@lst.de>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Aug 24, 2020 at 03:14:55PM +0530, Naresh Kamboju wrote:
> [   67.545247] BUG: Bad page state in process true  pfn:a8fed
> [   67.550767] page:9640c0ab refcount:0 mapcount:-1024

Somebody freed a page table without calling __ClearPageTable() on it.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
