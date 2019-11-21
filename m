Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58199105542
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 16:21:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B3D4D3C22C6
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 16:21:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 56EAA3C1C8D
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 16:21:05 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5B96D20E768
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 16:21:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DE120B9DA;
 Thu, 21 Nov 2019 15:21:02 +0000 (UTC)
Date: Thu, 21 Nov 2019 16:19:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191121151901.GA30697@dell5510>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1574241216-15168-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191120151244.GA28197@dell5510>
 <1893160007.13287158.1574326875945.JavaMail.zimbra@redhat.com>
 <20191121103003.GC23702@dell5510>
 <339862280.13302048.1574334489479.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <339862280.13302048.1574334489479.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/5] syscalls/quotactl01: Add Q_GETNEXTQUOTA
 test
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

> ----- Original Message -----
> > > > Also ,If we use uint64_t, they still failed on 2.6.32-754.el6.x86_64 with
> > > > undefined  . Or, we should use TST_ABI to define uint64_t them
> > Jan, are you aware of this problem?

> I'm not, it should be defined in stdint.h.

> # cat /etc/redhat-release 
> Red Hat Enterprise Linux Server release 6.10 (Santiago)

> # grep uint64_t -r /usr/include/ | grep stdint
> /usr/include/stdint.h:typedef unsigned long int	uint64_t;

> > Xu, I'm not sure if you're talking about uint64_t problematic in
> > <linux/types.h>
> > (as you mention kernel) or problem in glibc <sys/types.h> / <stdint.h> /
> > <inttypes.h>?
> > We have lots of code which is using some of these 3 libc headers, does it
> > fail
> > on 2.6.32?

> > Does anybody compile for 2.6.32?

> [CC Li]
> I think RH still does compile latest for regression tests. RHEL6 will be in
> sustaining for couple more years. 
Thanks for info. Sorry I forgot, we have CentOS 6.10 in travis, that should be
enough for testing build in old toolchain.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
