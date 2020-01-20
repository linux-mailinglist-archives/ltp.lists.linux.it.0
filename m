Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0E614331B
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 21:56:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBFB53C2486
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 21:56:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 97ECC3C2479
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 21:56:04 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 6529D60133A
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 21:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579553761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wv/Fjk78GKCs8CouSMuVcVYhTpS0P1OVpV9pRb50wH8=;
 b=DrlzpDD3YTapuCP5Er/U7RQ9SWyCVj7KM5hqf3tI2yCZGjX4L2pufG8/asZhadKtlHe+db
 HULDkl8YwcUJh03w5+nWZ89pD4ZwncwEdL+Ynce4NFlA073vgSbPaR3SSyRCRsfmKql6zP
 DM+JLACGiPMIoQpytWRonMzdIJD8Trw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-WzxAsMgcNBKS3U-_JioN3w-1; Mon, 20 Jan 2020 15:55:57 -0500
X-MC-Unique: WzxAsMgcNBKS3U-_JioN3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84019107ACCA;
 Mon, 20 Jan 2020 20:55:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B7475D9C5;
 Mon, 20 Jan 2020 20:55:56 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1E9E503A4;
 Mon, 20 Jan 2020 20:55:55 +0000 (UTC)
Date: Mon, 20 Jan 2020 15:55:55 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <270741803.2885047.1579553755871.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200116153741.GA558@rei>
References: <cki.FA900DB853.LBD049H627@redhat.com>
 <84944fa0-3c18-f8a4-47ca-7627eb4e0594@redhat.com> <20200116153741.GA558@rei>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.2]
Thread-Topic: ??? FAIL: Test report for kernel 5.4.13-rc1-7f1b863.cki (stable)
Thread-Index: Nvu5TPY5hzSZxc/NJ6UqtiNI5lAyWw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] ??? FAIL: Test report for kernel 5.4.13-rc1-7f1b863.cki
 (stable)
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
Cc: Jianwen Ji <jiji@redhat.com>, Hangbin Liu <haliu@redhat.com>,
 Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>, Jianlin Shi <jishi@redhat.com>,
 CKI Project <cki-project@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hi!
> > > One or more kernel tests failed:
> > > 
> > >      ppc64le:
> > >       ??? LTP
> > 
> > Hi, I see max_map_count failed on ppc64le:
> > https://artifacts.cki-project.org/pipelines/385189/logs/ppc64le_host_2_LTP_mm.run.log
> 
> That's strange, we do attempt to map 65536 mappings but we do not touch
> them, so these shouldn't be faulted in, so there is no real reason why
> mmap() in the child process should stop prematurely at 65532.
> 

We do not touch them, but the test is setting OVERCOMMIT_NEVER since ~2012.
It tries to estimate number of pages that can be used with global CommitLimit
and Committed_AS.

But we sporadically fail at __vm_enough_memory() on a percpu counter:
... 
        if (percpu_counter_read_positive(&vm_committed_as) < allowed)
                return 0;
which can be presumably increased by anything else running on system.

Comments say this is to avoid certain bad OOM behaviour, but given its age,
it might be long invalid.

Regards,
Jan






-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
