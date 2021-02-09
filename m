Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10182315339
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Feb 2021 16:54:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFD963C683B
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Feb 2021 16:54:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 79C123C22DA
 for <ltp@lists.linux.it>; Tue,  9 Feb 2021 16:54:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 094CE60019B
 for <ltp@lists.linux.it>; Tue,  9 Feb 2021 16:54:48 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70288AEAB;
 Tue,  9 Feb 2021 15:54:48 +0000 (UTC)
Date: Tue, 9 Feb 2021 16:55:54 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
Message-ID: <YCKwiqsfPi47PT/b@yuki.lan>
References: <1612772078-29651-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <YCKim8Pvg+ZTrHXI@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCKim8Pvg+ZTrHXI@rei>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] netns_helper: Make iproute version check work
 correctly
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

Hi!
> >  static int dummy(void *arg)
> > diff --git a/testcases/kernel/containers/netns/netns_helper.sh b/testcases/kernel/containers/netns/netns_helper.sh
> > index a5b77a0..bec43ac 100755
> > --- a/testcases/kernel/containers/netns/netns_helper.sh
> > +++ b/testcases/kernel/containers/netns/netns_helper.sh
> > @@ -50,6 +50,15 @@ tst_check_iproute()
> >  	local cur_ipver="$(ip -V)"
> >  	local spe_ipver="$1"
> >  
> > +	echo $cur_ipver | grep "ip utility, iproute2-ss" > /dev/null
> > +	ret1=$?
> > +	echo $cur_ipver | grep "ip utility, iproute2-" > /dev/null
> > +	ret2=$?
> > +
> > +	if [ $ret1 -ne 0 -a $ret2 -eq 0 ]; then
> > +		return
> > +	fi
> 
> How is this supposed to fix the problem?
> 
> This just skips the test if we haven't found one of the strings in the
                      ^
		      I mean version check, the test iself continues

If nothing else this should TBROK.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
