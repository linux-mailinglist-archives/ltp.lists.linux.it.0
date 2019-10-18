Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C86B3DC66D
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 15:46:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6EA6A3C23B4
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 15:46:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 6B8A43C2298
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 15:46:38 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E51621000D1F
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 15:46:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4F9B3AD77;
 Fri, 18 Oct 2019 13:46:37 +0000 (UTC)
Date: Fri, 18 Oct 2019 15:46:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191018134635.GA3374@dell5510>
References: <2e51e5453562001b5b6992ccc897d9177e6673ca.1571053661.git.jstancek@redhat.com>
 <20191018133733.GA31681@dell5510>
 <1403291253.6979626.1571405981736.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1403291253.6979626.1571405981736.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mlock_8-1,
 munlock_10-1: don't use LONG_MAX as invalid pointer
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan,

> > > arm64 kernel with commit 057d3389108e ("mm: untag user pointers passed to
> > > memory syscalls") will assume this is tagged user pointer and will
> > > attempt to clear first byte. This leads to test hitting different error
> > > (EINVAL instead of ENOMEM).

> > > Add a helper function which provides invalid/unused pointer from user
> > > address space.

> > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>

> Thanks, discussion in:
>   http://lists.linux.it/pipermail/ltp/2019-October/013993.html
> is still going, so maybe this will be fixed on kernel side
> after all.

Thanks for info, I didn't notice this is related to your patch.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
