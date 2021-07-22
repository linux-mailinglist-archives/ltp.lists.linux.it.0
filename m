Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F573D1E4A
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 08:33:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A16B3C6B1C
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 08:33:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 572853C5A5A
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 08:33:23 +0200 (CEST)
Received: from ATCSQR.andestech.com (exmail.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D3D476013A8
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 08:33:21 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 16M6WbB7010931;
 Thu, 22 Jul 2021 14:32:37 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 22 Jul 2021
 14:32:34 +0800
Date: Thu, 22 Jul 2021 14:32:32 +0800
From: Leo Liang <ycliang@andestech.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20210722063232.GA28553@andestech.com>
References: <20210719092239.GA1475@atcfdc88> <YPgxJwx795fhXgLa@pevik>
 <62262681-222f-8d09-a100-0d7be0c7526f@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62262681-222f-8d09-a100-0d7be0c7526f@jv-coder.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 16M6WbB7010931
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4,
 2/2] cgroup/cgroup_regression_test: Fix umount failure
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

Hi Joerg,
On Thu, Jul 22, 2021 at 12:35:59PM +0800, Joerg Vehlow wrote:
> Hi,
> 
> On 7/21/2021 4:37 PM, Petr Vorel wrote:
> > Hi Leo,
> >
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>
> >
> >>   	rmdir cgroup/0 cgroup/1
> >> -	umount cgroup/
> >> +	tst_umount cgroup/	# Avoid possible EBUSY error
> >>   }
> >>   #---------------------------------------------------------------------------
> >> @@ -193,7 +193,7 @@ test3()
> >>   	wait $pid2 2>/dev/null
> >>   	rmdir $cpu_subsys_path/0 2> /dev/null
> >> -	umount cgroup/ 2> /dev/null
> >> +	tst_umount cgroup/ 2> /dev/null		# Avoid possible EBUSY error
> > I'd prefer: # keep "/" to avoid possible EBUSY error
> > But that can be changed before merge.
> >
> > More I'm interested if other maintainers agree with me about this approach.
> > (keep / here instead of in tst_umount())
> I had a first look at this patches and was curious, what the reasoning 
> behind the "/" is.
> The comment you suggest is wrong. The / was introduced to prevent 
> unmounting some other mountpoint,
> where the device was cgroup.
> Imho the approach of adding a / to the end was wrong and intransparent. 
> I would rather use "./cgroup" or "$PWD/cgroup".
> If possible, I'd actually change tst_umount, to always unmount the 
> mountpoint and not the device, i.e. if the given path is not an absolute 
> path, make it absolute (e.g. by prepending $PWD").
> This way the check if the mountpoint exist wouldn't be the fuzzy thing 
> it is right now.
> 
> As for the comment ("# Avoid possible EBUSY error"): Honestly I'd drop 
> it and like in the c-api make using tst_umount instead of plain umount 
> the default, for the same reasons.

Got it!
Thanks for the detailed explanation!
I will send a v5 patch for this modification.
(making the path absolute inside tst_umount)

> 
> >>   	if dmesg | grep -q "MAX_LOCKDEP_SUBCLASSES too low"; then
> >>   		tst_res TFAIL "lockdep BUG was found"
> >> @@ -254,7 +254,7 @@ test5()
> >>   	mount -t cgroup none cgroup 2> /dev/null
> >>   	mkdir cgroup/0
> >>   	rmdir cgroup/0
> >> -	umount cgroup/ 2> /dev/null
> >> +	tst_umount cgroup/ 2> /dev/null		# Avoid possible EBUSY error
> > I'd drop stderr redirection here. It was here originally, but I suppose it's not
> > needed when using tst_umount. But that can be done during merge.
> +1

This change will be included in the next patch as well.
Thanks again!

Best regards,
Leo

> Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
