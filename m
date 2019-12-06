Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDE51151AD
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Dec 2019 14:58:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 489523C2451
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Dec 2019 14:58:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 04E3F3C185C
 for <ltp@lists.linux.it>; Fri,  6 Dec 2019 14:58:08 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3DFEB618FF0
 for <ltp@lists.linux.it>; Fri,  6 Dec 2019 14:58:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7C634B03C;
 Fri,  6 Dec 2019 13:58:06 +0000 (UTC)
Date: Fri, 6 Dec 2019 14:58:05 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191206135805.GA729@rei.lan>
References: <1059626680.11523678.1573489826970.JavaMail.zimbra@redhat.com>
 <ec1792be62432bb64e4d5c5085f6ebfa7e5d4b53.1573562645.git.jstancek@redhat.com>
 <20191120161634.GA31645@rei>
 <1318319247.13280749.1574323496266.JavaMail.zimbra@redhat.com>
 <20191121110236.GB14186@rei.lan>
 <1965156629.13355311.1574352460203.JavaMail.zimbra@redhat.com>
 <1013755663.15334773.1575587950733.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1013755663.15334773.1575587950733.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] futex_cmp_requeue01: fix test expectations
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
> Any thoughts about my last reply?

Sorry this fallen out of my radar since I've been off previous week.

> > > > > Unless spurious wakeup has happened between the requeue and wake
> > > > > operation which means that the num_requeues can be smaller because we
> > > > > will wake up less than requeued processes. So if we sampled spurious
> > > > > wakeups before the requeue operation and after the futex_wake() for
> > > > > requeued processes and call it delta_spurious we would get a range:
> > > > > 
> > > > > TST_RET - num_requeues >= set_wakes
> > > > 
> > > > This doesn't look correct if we consider spurious wakeups:
> > > > 
> > > > 5 processes, set_wakes = 5, set_requeue = 0, 1 spuriously wakes up,
> > > > remaining 4 are woken up by futex(), 0 are requeued:
> > > > 
> > > > 4 - 0 >= 5
> > > 
> > > Well I was betting on the fact that we wake up much less processes than
> > > we attempt to lock on the futex and that waking up processes takes
> > > precedence. I we can add delta_spurious to the right side that wouldn't
> > > change much and we end up being correct all the time, i.e.
> > > 
> > > TST_RET + delta_spurious - num_requeues >= set_wakes
> > 
> > I'd go with just spurious instead of delta_spurious. If there is spurious
> > wake up before requeue (and first sample), wouldn't that fail in same way
> > as example above?
> > 
> > TST_RET + delta_spurious - num_requeues >= set_wakes
> > 4 + 0 - 0 >= 5
> > 
> > Also delta_spurious looks racy, because it's based on counter
> > that is increased only after user-space gets chance to run. But process
> > may have been already removed from futex queue on kernel side.
> > So 'first sample before requeue' can see inaccurate state.
> > 
> > So I'd tweak your check to:
> >   set_wakes-spurious <= TST_RET-num_requeues <= set_wakes+spurious

Sounds reasonable to me.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
