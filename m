Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB2FEA2B1
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Oct 2019 18:41:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F34EE3C1CB7
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Oct 2019 18:41:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id DE0F63C1C8B
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 18:41:32 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id C45066019A9
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 18:41:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572457290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KDHPDOGivraJNwfy+erzLICyzlvdJ3Ss4HvIxugaio=;
 b=fOA1pCsEAbeJZkzMkUTSaKIAcSEG7sUfZFRZAjTIvPkZBnMPKtXac1iHGC1+arJxk+3mM8
 WL3CO/NEmfmU9OgrXzXvSaavFRfJLt4QQMZK4nrG6CPHjOLzAgwBZF3+olHqaKOlCvnRHa
 S3CSEZMl9qfj39oLfIQxpG6ZFZZpJGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-pr8pnZApMf67kEDRC6JZkg-1; Wed, 30 Oct 2019 13:41:25 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 564341800D67;
 Wed, 30 Oct 2019 17:41:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C6C55C1C3;
 Wed, 30 Oct 2019 17:41:24 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED49B18089C8;
 Wed, 30 Oct 2019 17:41:23 +0000 (UTC)
Date: Wed, 30 Oct 2019 13:41:23 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <116299070.9793183.1572457283737.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191030144649.GA25642@dell5510>
References: <20190925094721.18932-1-chrubis@suse.cz>
 <20190925135634.GA32581@dell5510>
 <575273995.9684474.1572426415443.JavaMail.zimbra@redhat.com>
 <1665612504.9724602.1572440600772.JavaMail.zimbra@redhat.com>
 <20191030144649.GA25642@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.23]
Thread-Topic: syscalls/acct02: Check read size.
Thread-Index: anyptRgKx8OvkX1aVXEu6WBVlkQhlg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: pr8pnZApMf67kEDRC6JZkg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/acct02: Check read size.
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



----- Original Message -----
> Hi Jan,
> 
> > > I'm seeing similar failure:
> 
> > > tst_kconfig.c:62: INFO: Parsing kernel config
> > > '/boot/config-3.10.0-1106.el7.cki.s390x'
> > > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > > tst_kconfig.c:62: INFO: Parsing kernel config
> > > '/boot/config-3.10.0-1106.el7.cki.s390x'
> > > acct02.c:239: INFO: Verifying using 'struct acct_v3'
> > > acct02.c:192: INFO: == entry 1 ==
> > > acct02.c:88: INFO: ac_btime < 1572367954 (1572367953)
> 
> > ^^ This is 'acct02_helper', which seemingly started before 'start_time'.
> 
> > ac_btime is calculated back from current time and elapsed time at
> > fill_ac():
> 
> >   ac->ac_btime = get_seconds() - elapsed;
> 
> > s390s are slower, so my guess is another second ticks before btime gets
> > calculated,
> > and it appears to have started later.
> Agree.
> 
> > > acct02.c:192: INFO: == entry 2 ==
> > > acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
> > > acct02.c:88: INFO: ac_btime < 1572367954 (1572367953)
> > > acct02.c:133: INFO: ac_exitcode != 32768 (0)
> > > acct02.c:141: INFO: ac_ppid != 25608 (25607)
> 
> > The 2nd record is filled at acct(NULL), even though process still runs:
> 
> > [ 1156.025654] CPU: 0 PID: 11772 Comm: acct02_helper Tainted: G
> > OE  ------------   3.10.0-1106.el7.s390x #1
> > <>
> > [ 1156.027105]  [<00000000001dd630>] fill_ac+0x0/0x440
> > [ 1156.027108] ([<00000000001ddae8>] do_acct_process+0x78/0x1a0)
> > [ 1156.027110]  [<00000000001de3ae>] acct_process+0xf6/0x140
> > [ 1156.027112]  [<000000000014de32>] do_exit+0x752/0xa38
> > [ 1156.027116]  [<000000000014e216>] do_group_exit+0x66/0xf8
> > [ 1156.027118]  [<000000000014e2ea>] SyS_exit_group+0x42/0x48
> 
> > [ 1157.033294] CPU: 1 PID: 11771 Comm: acct02 Tainted: G           OE
> > ------------   3.10.0-1106.el7.s390x #1
> > <>
> > [ 1157.033384]  [<00000000001dd630>] fill_ac+0x0/0x440
> > [ 1157.033386] ([<00000000001ddae8>] do_acct_process+0x78/0x1a0)
> > [ 1157.033389]  [<00000000001ddcda>] acct_pin_kill+0x52/0xa8
> > [ 1157.033391]  [<000000000034a83e>] pin_kill+0xb6/0x178
> > [ 1157.033395]  [<00000000001ddfe8>] SyS_acct+0x2b8/0x350
> 
> Hm, did you reproduce it on 4.18 (rhel8)?

Above was RHEL7. Do you expect different outcome on RHEL8?
I was looking at upstream sources too and it looked similar.

Anyway, I don't think this part is an issue, test will skip it
because "comm" doesn't match.

We can tweak 'ac_btime' condition, but I think the test will remain
race-y in environments with higher steal time:

acct02.c:239: INFO: Verifying using 'struct acct_v3'
acct02.c:192: INFO: == entry 1 ==
acct02.c:127: INFO: elap_time/clock_ticks >= 2 (236/100: 2.00)
acct02.c:192: INFO: == entry 2 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
acct02.c:127: INFO: elap_time/clock_ticks >= 2 (236/100: 2.00)
acct02.c:133: INFO: ac_exitcode != 32768 (0)
acct02.c:141: INFO: ac_ppid != 43213 (43212)
acct02.c:182: FAIL: end of file reached


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
