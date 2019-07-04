Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E9B5FA52
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 16:52:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D36893C1D44
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 16:52:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 8C41D3C1CE7
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 16:52:01 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 195211000A06
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 16:51:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 47B4085363;
 Thu,  4 Jul 2019 14:51:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C974968C2;
 Thu,  4 Jul 2019 14:51:58 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 30B0D19720;
 Thu,  4 Jul 2019 14:51:57 +0000 (UTC)
Date: Thu, 4 Jul 2019 10:51:54 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>, hongzhi.song@windriver.com
Message-ID: <559290240.31688905.1562251914018.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190704140849.GB11528@rei.lan>
References: <47b8b48060353711ff8d3695a7d3702f1aced12a.1562224996.git.jstancek@redhat.com>
 <20190704130119.GA11421@rei.lan>
 <594163584.31676743.1562246342334.JavaMail.zimbra@redhat.com>
 <20190704140849.GB11528@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.15]
Thread-Topic: direct_io: diotest4: fix mips MAP_SHARED/MAP_FIXED mmap
Thread-Index: OOZ8Ml3tSrFStFZrjYkl5P5OOlRRWw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 04 Jul 2019 14:51:59 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] direct_io: diotest4: fix mips
 MAP_SHARED/MAP_FIXED mmap
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



----- Original Message -----
> Hi!
> > > > diff --git a/include/lapi/mmap.h b/include/lapi/mmap.h
> > > > index 18547c0d47ed..98b6ade1e2ab 100644
> > > > --- a/include/lapi/mmap.h
> > > > +++ b/include/lapi/mmap.h
> > > > @@ -19,6 +19,8 @@
> > > >  #ifndef LAPI_MMAP_H__
> > > >  #define LAPI_MMAP_H__
> > > >  
> > > > +#include "config.h"
> > > > +
> > > >  #ifndef MAP_HUGETLB
> > > >  # define MAP_HUGETLB 0x40000
> > > >  #endif
> > > 
> > > Huh, this looks completely unrelevant to the patch itself, or do I miss
> > > something?
> > 
> > This fixes the original problem of bad alignment.
> > Hunk below improves on it by removing MAP_FIXED altogether.
> 
> Ah, that is needed for the HAVE_SYS_SHM_H.
> 
> > I could split it into 2 patches, if you prefer that.
> 
> Yes please, both are acked, so just push them.

Pushed as 2 patches.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
