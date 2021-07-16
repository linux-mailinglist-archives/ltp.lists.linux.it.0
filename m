Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F20573CB2D4
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 08:44:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BEB073C73C1
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 08:44:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4496E3C65B4
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 08:44:16 +0200 (CEST)
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5BCC220091A
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 08:44:13 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 16G6i07V019054;
 Fri, 16 Jul 2021 14:44:00 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Fri, 16 Jul 2021
 14:44:01 +0800
Date: Fri, 16 Jul 2021 14:43:58 +0800
From: Leo Liang <ycliang@andestech.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <20210716064358.GA9807@andestech.com>
References: <20210715142448.GA30641@atcfdc88>
 <60F0DF88.9020603@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60F0DF88.9020603@fujitsu.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 16G6i07V019054
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2,
 1/2] lib/tst_test.sh: Make tst_umount work with argument that
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
 "metan@ucw.cz" <metan@ucw.cz>, "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Yang,
On Fri, Jul 16, 2021 at 09:23:01AM +0800, xuyang2018.jy@fujitsu.com wrote:
> Hi Leo
> > /proc/mounts shows the mount point without terminating slashes, e.g.
> > ~ $ cat /proc/mounts
> > xxx /root/cgroup cgroup rw,relatime,cpu 0 0
> >
> > So current tst_umount would not work with argument that has terminating slash, e.g.
> > tst_umount cgroup/ would give "The device is not mounted".
> >
> > Fix this by using mountpoint command instead of grepping /proc/mounts.
> >
> > Signed-off-by: Leo Yu-Chi Liang<ycliang@andestech.com>
> > ---
> >   testcases/lib/tst_test.sh | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> > index c6aa2c487..7e77711f1 100644
> > --- a/testcases/lib/tst_test.sh
> > +++ b/testcases/lib/tst_test.sh
> > @@ -282,7 +282,7 @@ tst_umount()
> >
> >   	[ -z "$device" ]&&  return
> >
> > -	if ! grep -q "$device" /proc/mounts; then
> > +	if ! mountpoint -q "$device"; then
> Honestly speaking, I don't want to introduce mountpoint command.
> we can just filter the last "/" string for $device.
> 
> Best Regards
> Yang Xu

Got it! 
I'll send a v3 patch with this approach:
Filtering out the '/' when determining whether a $device is mounted.
Thanks!

Best regards,
Leo

> >   		tst_res TINFO "The $device is not mounted, skipping umount"
> >   		return
> >   	fi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
