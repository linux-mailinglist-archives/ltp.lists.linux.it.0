Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FFF7DA86
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 13:45:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 042053C1E18
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 13:45:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C80393C1E06
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 13:45:25 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2AA3F100061B
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 13:45:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 12ADFAD29;
 Thu,  1 Aug 2019 11:45:24 +0000 (UTC)
Date: Thu, 1 Aug 2019 13:45:23 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190801114522.GA23916@rei>
References: <20190801092616.30553-1-chrubis@suse.cz>
 <20190801092616.30553-2-chrubis@suse.cz>
 <1879623564.3992300.1564655982672.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1879623564.3992300.1564655982672.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/9] lib: Add support for guarded buffers
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > This commit adds a support for guarder buffers. Guarded buffer is a
> > buffer allocated so that there is PROT_NONE page immediatelly after the
> > end of the buffer i.e. any access after the buffer generates
> > SEGFAULT/EFAULT etc.
> > 
> > The library is hooked into the tst_test structure so that all you need
> > is to fill up an NULL terminated array of buffer pointers and sizes to
> > get the respective buffers allocated. The library supports allocating
> > memory in test runtime as well as well as allocating more complex
> > buffers, which currently are iovec vectors.
> 
> Runtime alloc in loop could be an issue, do we need also runtime free?

We can easily add it if we find it useful, so far all the usecases
were either already allocating buffers in setup or converted to do so.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
