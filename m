Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 249B12F7598
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 10:38:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C04FB3C6A03
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 10:38:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D42D03C2647
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 10:38:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6B2FF1000EDC
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 10:38:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A91CCAA6F;
 Fri, 15 Jan 2021 09:38:36 +0000 (UTC)
Date: Fri, 15 Jan 2021 10:38:34 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Leo Liang <ycliang@andestech.com>
Message-ID: <YAFimsGMMIkf+xU3@pevik>
References: <20210114074603.GB32318@andestech.com> <YABgDXi2WHSWmwHF@pevik>
 <20210115085406.GA23267@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115085406.GA23267@andestech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] device-drivers/zram: Fix false-judgement on
 zram's presence
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

Hi Leo,

...
> > IMHO we have only 2 options:
> > * write something on our own which would look into /lib/modules and
> > /system/lib/modules (Android). That's what BusyBox implementation does
> > (also kmod implementation looks into /lib/modules). BusyBox has this path in
> > defined in build time configuration (CONFIG_DEFAULT_MODULES_DIR), but I'd be
> > surprised if any system had both directories.
> > pros: no external dependency
> > cons: more code

> > * use modinfo, but grep for output: for 'filename:' (turn Leo's suggestion into
> > C code in the API):
> > cons: module not checked, when modprobe missing (we check for 255 exit code).


> Thanks for breaking things down in such detail!

> I personally prefer the first option that looking into those directories ourselves.
> So let's drop this patch and stay as is for now!

FYI: I'm going to implement 1) (own search, written in C API).
Hope to have it on Monday (before the release). If not, we should revert
305a78e4c ("tst_net.sh: Require veth for netns") which breaks *all* network
tests for BusyBox.

> > BTW not sure whether bother about android support anyway. On Android phone I
> > have available (Android 8), there is empty /system/lib/modules directory and no
> > /proc/modules:, thus nor BusyBox neither even toybox modprobe/modinfo
> > implementations work.

> BTW, I found that there's a ver_linux script that detects the version of util-linux.
Yes, but ver_linux it's just legacy info script (we don't have anything better
than this).

> But as I searched through commit log of LTP, there are a lot of workarounds
> regarding the compatibility issue with Busybox (around 10 commits or so).
Yes, these fixes are specific to particular tests. But detecting module in LTP
API affect many tests.

> Is there a certain version of util-linux is expected to conduct a full run of LTP ?
No. We just fix problems when reported (usually reported send a patch).

FYI: We haven't even set minimal supported kernel and (g)libc version.
https://github.com/linux-test-project/ltp/issues/657

> Thanks again,
> Leo


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
