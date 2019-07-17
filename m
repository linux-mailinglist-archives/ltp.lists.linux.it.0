Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF856BAB5
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 12:54:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 242D83C1D47
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 12:54:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 661793C0271
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 12:54:21 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4B9CD1A00E27
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 12:54:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1B81BB03A;
 Wed, 17 Jul 2019 10:54:19 +0000 (UTC)
Date: Wed, 17 Jul 2019 12:54:18 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190717105418.GB14596@rei>
References: <20190711125108.GB8709@rei>
 <1563356676-2384-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAOQ4uxiV_weQXVnDn0vFq5exk=Z_F=70Lk1D+783fOV=hsf_6A@mail.gmail.com>
 <5D2EF9D1.3020102@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D2EF9D1.3020102@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/3] lib: alter find_free_loopdev()
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Another option is to leave this function internal and export a wrapper
> > for the exact needed functionality:
> >
> > /* Just find a free minor number */
> > int tst_find_free_loopdev(void)
> > {
> >          return find_free_loopdev(NULL, 0);
> > }
> >
> > I don't mind wither way.
> Hi Amir
> 
> The second way looks better for me.  But I also want to hear the idea of cyril.

Well I wanted to keep the path exposed to user in a case that there
would be a test that would need more than one device. But it's not like
we cannot change the API later when it's actually needed.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
