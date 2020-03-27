Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 604501954ED
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 11:13:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 13A803C3300
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 11:13:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id AED1E3C32DA
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 11:13:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3387310019E4
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 11:13:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7D564AD0F
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 10:13:21 +0000 (UTC)
Date: Fri, 27 Mar 2020 11:15:46 +0100
From: Jozef Pupava <jpupava@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200327111546.07d8e28c@daedruan>
In-Reply-To: <20200327095715.GA16912@dell5510>
References: <20200324143839.3647c485@daedruan>
 <20200326084504.GB29830@dell5510> <20200326134603.GA5185@yuki.lan>
 <20200326203222.GA19445@dell5510> <20200327095715.GA16912@dell5510>
Organization: SUSE
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Avoid zero or negative int results in
 calculations
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

Hi Petr,

I will try to decrease, ideally remove the slowdown.

Jozef

On Fri, 27 Mar 2020 10:57:15 +0100
Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
> 
> > Before:
> > real	0m0,013s  
> 
> > After (slowed by second commit, not by the rewrite):
> > real	0m0,402s  
> 
> Although the slowdown it's ~30 times, it's obviously fast enough,
> so I wouldn't consider it as a problem. I was just surprised by it.
> 
> My concern is about brief explanation where/how is zero or negative
> result appears. But maybe it's obvious and I just don't see it.
> 
> Kind regards,
> Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
