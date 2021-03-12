Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FD0338ADA
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 12:02:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED19D3C311F
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 12:02:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 4EDCB3C3044
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 12:02:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9BA0C100129F
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 12:02:09 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E544DB02F;
 Fri, 12 Mar 2021 11:02:08 +0000 (UTC)
Date: Fri, 12 Mar 2021 12:02:07 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <YEtKL70YWfv+yzyZ@pevik>
References: <20210308160122.24522-1-pvorel@suse.cz>
 <20210308160122.24522-2-pvorel@suse.cz> <YEtFmok1oxZjcKVi@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YEtFmok1oxZjcKVi@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] docparse: Unify Description and Algorithm
 titles
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

Hi,

> >  				# fix formatting for asciidoc [DOCUMENTATION] => *DOCUMENTATION*
>                                                                                   ^
> 										  This
> 										  should
> 										  be
> 										  *Documentation*

> >  				if ($doc =~ s/^\[(.*)\]$/$1/) {
> > -					$doc = paragraph(bold($doc));
> > +					$doc = paragraph(bold(ucfirst(lc($doc))));
> >  				}

> >  				$content .= "$doc\n";

> Other than that it looks good.
Thanks, fixed and patchset merged.

Yang, sorry I didn't put it into docparse.c.

> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
