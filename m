Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2B01FEEC9
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 11:36:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3AF2D3C2C9E
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 11:36:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 834653C02EF
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 11:36:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EB57D1400B86
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 11:36:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B6623B137;
 Thu, 18 Jun 2020 09:36:47 +0000 (UTC)
Date: Thu, 18 Jun 2020 11:36:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200618093646.GA11962@dell5510>
References: <20200617154926.32588-1-alexey.kodanev@oracle.com>
 <CAEemH2dOxAnaaMXhKyj36FqmYDQ_p_kfi-=pMQhrE3O9oQO8LA@mail.gmail.com>
 <20200618055105.GA42990@x230>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618055105.GA42990@x230>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/nsf_lib.sh: TCONF on mount (udp/udp6)
 failure for Linux v5.6+
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, Alexey, Cyril,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> > > +++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> > > @@ -87,11 +87,17 @@ nfs_mount()

> > >         tst_res TINFO "Mounting NFS: $mnt_cmd"
> > >         if [ -n "$LTP_NETNS" ] && [ -z "$LTP_NFS_NETNS_USE_LO" ]; then
> > > -               tst_rhost_run -s -c "$mnt_cmd"


> > Or, maybe we can have a new function naming as 'tst_kconifg_check' to parse
> > kernel .config in shell library as well?
> +1, I was thinking about it for a long time.
Thinking about the balance between base TCONF decision on kernel version vs.
require kernel config to be presented I think for cases like this I'd prefer
kernel version based check (i.e. the original patch).

Requiring kernel config is ok for traditional distros (and even here is
sometimes readable only for root, e.g. Debian/Ubuntu), but it's still rare on
arm (other embedded archs). I guess it'd be nice to have some variable, which
would turn kernel config based requirement into warning.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
