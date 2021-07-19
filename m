Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF533CCF53
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 10:19:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B646B3C6480
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 10:19:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 00A263C1D75
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 10:19:27 +0200 (CEST)
Received: from ATCSQR.andestech.com (exmail.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 043FD20021D
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 10:19:24 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 16J8IIDf054093;
 Mon, 19 Jul 2021 16:18:18 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Mon, 19 Jul 2021
 16:18:18 +0800
Date: Mon, 19 Jul 2021 16:18:16 +0800
From: Leo Liang <ycliang@andestech.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20210719081816.GA27093@andestech.com>
References: <20210716140142.GA7113@andestech.com>
 <60F50B67.4000807@fujitsu.com> <YPUS+/YZgAxUAlDn@pevik>
 <YPUUaOMUjRMy43ZH@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPUUaOMUjRMy43ZH@pevik>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 16J8IIDf054093
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3,
 1/2] lib/tst_test.sh: Make tst_umount work with argument that has
 trailing slash
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
Cc: "richiejp@f-m.fm" <richiejp@f-m.fm>,
 Alan Quey-Liang =?utf-8?B?S2FvKOmrmOmtgeiJryk=?= <alankao@andestech.com>,
 "metan@ucw.cz" <metan@ucw.cz>,
 "ycliang@cs.nctu.edu.tw" <ycliang@cs.nctu.edu.tw>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

On Mon, Jul 19, 2021 at 01:58:00PM +0800, Petr Vorel wrote:
> Hi all,
> 
> > > Hi Leo
> 
> > > > /proc/mounts shows the mount point without trailing slashes, e.g.
> > > > ~ $ cat /proc/mounts
> > > > xxx /root/cgroup cgroup rw,relatime,cpu 0 0
> 
> > > > So current tst_umount would not work with argument that has trailing slash, e.g.
> > > > tst_umount cgroup/ would give "The device is not mounted".
> 
> > > > Fix this by filtering out the trailing slash before grepping /proc/mounts.
> 
> > > > Signed-off-by: Leo Yu-Chi Liang<ycliang@andestech.com>
> > > > ---
> > > >   testcases/lib/tst_test.sh | 3 ++-
> > > >   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> > > > diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> > > > index c6aa2c487..f132512e7 100644
> > > > --- a/testcases/lib/tst_test.sh
> > > > +++ b/testcases/lib/tst_test.sh
> > > > @@ -282,13 +282,14 @@ tst_umount()
> 
> > > >   	[ -z "$device" ]&&  return
> 
> > > > +	device=${device%/}
> > > >   	if ! grep -q "$device" /proc/mounts; then
> > > >   		tst_res TINFO "The $device is not mounted, skipping umount"
> > > >   		return
> > > >   	fi
> 
> > > >   	while [ "$i" -lt 50 ]; do
> > > > -		if umount "$device">  /dev/null; then
> > > > +		if umount "$device"/>  /dev/null; then
> > > With removing this(we don't need add "/" here), this patch looks good to me
> > +1
> Actually we need to keep / for next patch, right? (cgroup/)

Yes, I thought so as well, for commit 46172493.

> Thus why not just changing argument for grep?
> -       if ! grep -q "$device" /proc/mounts; then
> +       if ! grep -q "${device%/}" /proc/mounts; then

Thanks! That's a better way to do it.
Will send a v4 patch later with this modification.

Best regards,
Leo

> Kind regards,
> Petr
> 
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> > Kind regards,
> > Petr
> 
> > > Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> > > >   			return
> > > >   		fi
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
