Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AC777F7266
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 11:45:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 287AD3C088A
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 11:45:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 634293C17A2
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 09:38:26 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 21B786000F9
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 09:38:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hcAOVMZPSzZPhTPxN9VZMB0WgNghvQiZWyp0y9X3270=; b=OQc6TyHsOO3L0MFE2gFIEh/2u
 TF2lL1nyj+yTZMLy5mmv5imhXqE+V+8CXMch6bDvBXSksYLErJMKs5UeQ299wYUd9B8nHIxHEVJto
 oIAaICc3N5bh9KCeyuArOpH+2jkFiZs3my+rlzQoh446mRASerHynRsMEjNNr3jEEOmhUJm77cUgX
 wk/FlQ4IjZqmfgKz4BAlXdBOaKD/Bw70ADeDWNlkwloksFnyzKrdKRUWu6hTiiyiq0/QgBnvofuRt
 kUcVgQa3G0wvszDfsT+5HqIATdK3Fs68wZIq3NNrDx2qPcxNvMxtjzaP7pFw5NA9ZvA4lCmVMZHAN
 a9vF33p3g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iU5DD-0007mS-4J; Mon, 11 Nov 2019 08:38:15 +0000
Date: Mon, 11 Nov 2019 00:38:15 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191111083815.GA29540@infradead.org>
References: <CA+G9fYtmA5F174nTAtyshr03wkSqMS7+7NTDuJMd_DhJF6a4pw@mail.gmail.com>
 <852514139.11036267.1573172443439.JavaMail.zimbra@redhat.com>
 <20191111012614.GC6235@magnolia>
 <1751469294.11431533.1573460380206.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1751469294.11431533.1573460380206.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 11 Nov 2019 11:45:19 +0100
Subject: Re: [LTP] LTP: diotest4.c:476: read to read-only space. returns 0:
 Success
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
Cc: Theodore Ts'o <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Christoph Hellwig <hch@infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4 <linux-ext4@vger.kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Nov 11, 2019 at 03:19:40AM -0500, Jan Stancek wrote:
> > > loff_t length,
> > >                 if (pad)
> > >                         iomap_dio_zero(dio, iomap, pos, fs_block_size -
> > >                         pad);
> > >         }
> > > -       return copied ? copied : ret;
> > > +       return copied ? (loff_t) copied : ret;
> > 
> > I'm a little confused on this proposed fix -- why does casting size_t
> > (aka unsigned long) to loff_t (long long) on a 32-bit system change the
> > test outcome?
> 
> Ternary operator has a return type and an attempt is made to convert
> each of operands to the type of the other. So, in this case "ret"
> appears to be converted to type of "copied" first. Both have size of
> 4 bytes on 32-bit x86:

Sounds like we should use a good old if here to avoid that whole problem
spacE:

	if (copied)
		return copied;
	return ret;

> size_t copied = 0;
> int ret = -14;
> long long actor_ret = copied ? copied : ret;
> 
> On x86_64: actor_ret == -14;
> On x86   : actor_ret == 4294967282
> 
> > Does this same diotest4 failure happen with XFS?  I ask
> > because XFS has been using iomap for directio for ages.
> 
> Yes, it fails on XFS too.

Is this a new test?  If not why was this never reported?  Sounds like
we should add this test case to xfstests.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
