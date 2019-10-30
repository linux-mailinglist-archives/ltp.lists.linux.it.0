Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B3788E9BFE
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Oct 2019 14:03:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 65B543C22D5
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Oct 2019 14:03:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 77A8A3C1CA9
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 14:03:28 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 7BC0F1400E66
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 14:03:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572440605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Pv0nyL8TM2PxO0hDVOGr71VBSVfLOb2KSGVKiVu6IU=;
 b=HZvULMWDYKI1kyYndHigS8WX9Yg/wObAzcb94tut2UVxQVYJ4PAD7SW9by1ZIF5e+GCBrN
 vnKpnN/QMBPGCAB3o1hLx2aOHgDk2xVs0NLg4DfODIyY0jWTTx5yxrzQcPwNzjx8zZQCo4
 sGPZKnHPbvqASMKhmVS2QlVq/j9yClA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-yJIi2_r6PXuJnjEnJK04dQ-1; Wed, 30 Oct 2019 09:03:22 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DECA800C61;
 Wed, 30 Oct 2019 13:03:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5492110016DA;
 Wed, 30 Oct 2019 13:03:21 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id F37244BB5B;
 Wed, 30 Oct 2019 13:03:20 +0000 (UTC)
Date: Wed, 30 Oct 2019 09:03:20 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <1665612504.9724602.1572440600772.JavaMail.zimbra@redhat.com>
In-Reply-To: <575273995.9684474.1572426415443.JavaMail.zimbra@redhat.com>
References: <20190925094721.18932-1-chrubis@suse.cz>
 <20190925135634.GA32581@dell5510>
 <575273995.9684474.1572426415443.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.19]
Thread-Topic: syscalls/acct02: Check read size.
Thread-Index: FwKw/OGWtHK4rson7k0IP3bEEJxnIwnIXwNA
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: yJIi2_r6PXuJnjEnJK04dQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
> 
> 
> ----- Original Message -----
> > 
> > OK, on s390 where it's failing it actually catches "incomplete read":
> > 
> > tst_kconfig.c:62: INFO: Parsing kernel config '/proc/config.gz'
> > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > tst_kconfig.c:62: INFO: Parsing kernel config '/proc/config.gz'
> > acct02.c:234: INFO: Verifying using 'struct acct_v3'
> > acct02.c:187: INFO: == entry 1 ==
> > acct02.c:147: INFO: ac_version != 3 (131)
> > acct02.c:187: INFO: == entry 2 ==
> > acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
> > acct02.c:133: INFO: ac_exitcode != 32768 (0)
> > acct02.c:141: INFO: ac_ppid != 54783 (54781)
> > acct02.c:147: INFO: ac_version != 3 (131)
> > acct02.c:183: FAIL: incomplete read 0 bytes, expected 64
> 
> I'm seeing similar failure:
> 
> tst_kconfig.c:62: INFO: Parsing kernel config
> '/boot/config-3.10.0-1106.el7.cki.s390x'
> tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> tst_kconfig.c:62: INFO: Parsing kernel config
> '/boot/config-3.10.0-1106.el7.cki.s390x'
> acct02.c:239: INFO: Verifying using 'struct acct_v3'
> acct02.c:192: INFO: == entry 1 ==
> acct02.c:88: INFO: ac_btime < 1572367954 (1572367953)

^^ This is 'acct02_helper', which seemingly started before 'start_time'.

ac_btime is calculated back from current time and elapsed time at fill_ac():

  ac->ac_btime = get_seconds() - elapsed;

s390s are slower, so my guess is another second ticks before btime gets calculated,
and it appears to have started later.

> acct02.c:192: INFO: == entry 2 ==
> acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
> acct02.c:88: INFO: ac_btime < 1572367954 (1572367953)
> acct02.c:133: INFO: ac_exitcode != 32768 (0)
> acct02.c:141: INFO: ac_ppid != 25608 (25607)

The 2nd record is filled at acct(NULL), even though process still runs:

[ 1156.025654] CPU: 0 PID: 11772 Comm: acct02_helper Tainted: G           OE  ------------   3.10.0-1106.el7.s390x #1
<>
[ 1156.027105]  [<00000000001dd630>] fill_ac+0x0/0x440
[ 1156.027108] ([<00000000001ddae8>] do_acct_process+0x78/0x1a0)
[ 1156.027110]  [<00000000001de3ae>] acct_process+0xf6/0x140
[ 1156.027112]  [<000000000014de32>] do_exit+0x752/0xa38
[ 1156.027116]  [<000000000014e216>] do_group_exit+0x66/0xf8
[ 1156.027118]  [<000000000014e2ea>] SyS_exit_group+0x42/0x48

[ 1157.033294] CPU: 1 PID: 11771 Comm: acct02 Tainted: G           OE  ------------   3.10.0-1106.el7.s390x #1
<>
[ 1157.033384]  [<00000000001dd630>] fill_ac+0x0/0x440
[ 1157.033386] ([<00000000001ddae8>] do_acct_process+0x78/0x1a0)
[ 1157.033389]  [<00000000001ddcda>] acct_pin_kill+0x52/0xa8
[ 1157.033391]  [<000000000034a83e>] pin_kill+0xb6/0x178
[ 1157.033395]  [<00000000001ddfe8>] SyS_acct+0x2b8/0x350


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
