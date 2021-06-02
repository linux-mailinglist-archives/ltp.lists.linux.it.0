Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A335E39922E
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 20:08:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1966E3C8002
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 20:08:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BCC283C28E6
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 20:08:06 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8B3926003CF
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 20:08:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622657283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OjBZrh9lzgVMI9ppTuAJw7Vvjts7Qc023rvWuR2L95U=;
 b=Hb6inJoSRxcNgxgaRHiTYikPduq/1Pltn1/IOaX6Dt+CX72sOA8iauEjwTzwXUTupOwyH+
 4d4SUdHoMCg39ngDV8ItuqzPIZNX402jRgA/l7TSFBMGwpvmCeJZ22ONL8xTTQsghc2WgT
 kz0yXUPQ1eLN/5TzzFa5Ic/Kd5GuV0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-i6uE6mn2Oz-4j0SWtUYxdg-1; Wed, 02 Jun 2021 14:08:01 -0400
X-MC-Unique: i6uE6mn2Oz-4j0SWtUYxdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 613D0501EE;
 Wed,  2 Jun 2021 18:08:00 +0000 (UTC)
Received: from localhost (unknown [10.66.61.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8ED79620DE;
 Wed,  2 Jun 2021 18:07:59 +0000 (UTC)
Date: Thu, 3 Jun 2021 02:26:25 +0800
From: Zorro Lang <zlang@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20210602182625.GJ2978781@localhost.localdomain>
Mail-Followup-To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
References: <20210601155427.996321-1-zlang@redhat.com> <YLdwYJ3Kw5qf64d2@yuki>
MIME-Version: 1.0
In-Reply-To: <YLdwYJ3Kw5qf64d2@yuki>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=zlang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ltp-aiodio: help aiodio test work normally
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

On Wed, Jun 02, 2021 at 01:49:52PM +0200, Cyril Hrubis wrote:
> Hi!
> > ltp aiodio related cmdfiles (runtest/ltp-aio*.part*) can't be used,
> > due to they have unfixed path name. Before we run aiodio test, we
> > need to create some files (e.g. junkfile), and give it to the tests.
> > But current cmdfiles use too many $TMPDIR and aiodio.$$ things, e.g:
> > 
> >   AD022 time aiocp -b 1k -n 64 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
> > 
> > TMPDIR is a directory created by `mktemp ${TMPBASE}/ltp-XXXXXXXXXX`,
> > it's not a fixed path. The aiodio.$$ is also can be sure before
> > running ltp. That cause we can't prepare files in the unfixed path.
> > Even the testscripts/ltp-aiodio.sh can't work well either, due to it
> > try to create files in $TMP/aiodio/..., the $TMP is $TMPBASE, not
> > $TMPDIR, and aiodio is not aiodio.$$.
> >
> > So this patch trys to help runtest/ltp-aio*.part* to use fixed path
> > name, and put all aiodio test related files in $TMPBASE/aiodio/, the
> > $TMPBASE is a fixed pathname comes from runltp -d <directory> option.
> > So after this fix, users will know where they should create files in,
> > no matter running ltp-aiodio.sh or runltp -f runtest/ltp-aio*.part*.
> 
> I do not like this solution. I think that we should instead fix the
> scripts. I think that the runltp should just export TMPDIR if it was
> passed on commandline and it should be the resposibility of the caller
> to set up a temporary directory somewhere in /tmp in that case.

Sorry I can't understand your solution, would you like to show me some
detailed code which can make the aiodio test pass, to explain what do
you really like to do?

> 
> -- 
> Cyril Hrubis
> chrubis@suse.cz
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
