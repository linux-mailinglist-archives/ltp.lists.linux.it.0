Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A15CCEE2DE
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 15:50:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28AAC3C24E1
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 15:50:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 643653C2355
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 15:50:35 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 68B7C600BA2
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 15:50:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572879031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjrW/se+HWaAAET6Xa+xSzqodkS7rnCXuLFF/34zp9M=;
 b=KnHp4O/ZU3XRQ0Xkc+oQ6qrnNMGq4OMRBJYYXe83+X3eZvAT0fP6WQgNM0RY/Nj50Oh41u
 jo3yzrLNoyg8BIIppC+n5blWhNaB9Vyct0J1SI/C9Ws4ND/eG8ikXj9akLA+J32hhWnvXK
 daLvLt/9tsv1pP3meg1Oh/BpnAexniA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-g1ypLtrwM9iklXhZqRrOLA-1; Mon, 04 Nov 2019 09:50:26 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAB4B1800D53;
 Mon,  4 Nov 2019 14:50:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1FFF5D6C5;
 Mon,  4 Nov 2019 14:50:25 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6F4118095FF;
 Mon,  4 Nov 2019 14:50:25 +0000 (UTC)
Date: Mon, 4 Nov 2019 09:50:25 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, rpalethorpe@suse.com
Message-ID: <1850082269.10349939.1572879025707.JavaMail.zimbra@redhat.com>
In-Reply-To: <623915519.10305094.1572866731625.JavaMail.zimbra@redhat.com>
References: <008a677b-644d-615f-6c4f-0961af928700@cn.fujitsu.com>
 <1706711917.10302442.1572864628434.JavaMail.zimbra@redhat.com>
 <77525b33-67e5-2cfd-e735-6fc9485087e4@cn.fujitsu.com>
 <623915519.10305094.1572866731625.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.5]
Thread-Topic: question about the EPERM error of LTP bpf test
Thread-Index: J1KQewlNzS9B9tFpkG3F3h9/YML+kamHekc+
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: g1ypLtrwM9iklXhZqRrOLA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] question about the EPERM error of LTP bpf test
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
> > on 2019/11/04 18:50, Jan Stancek wrote:
> > 
> > >
> > > ----- Original Message -----
> > >> Hi All
> > >>
> > >> Now, I test bpf_prog02 and bpf_prog03 in my
> > >> system(4.18.0-107.el8.x86_64).
> > >>
> > >> #./bpf_prog03
> > >> tst_buffers.c:55: INFO: Test is using guarded buffers
> > >> tst_test.c:1137: INFO: Timeout per run is 0h 05m 00s
> > >> bpf_common.h:18: INFO: Raising RLIMIT_MEMLOCK to 262143
> > >> tst_capability.c:29: INFO: Dropping CAP_SYS_ADMIN(21)
> > >> bpf_common.h:37: CONF: bpf() requires CAP_SYS_ADMIN on this system:
> > >> EPERM
> > >> (1)
> > >> #
> > >>
> > >> Jan Stancek has added rlimit_bump_memlock function to avoid EPERM errno,
> > >> but I still can meet this problem every time even though I have
> > >> increased
> > >> BPF_MEMLOCK_ADD limit.
> > > This is likely not related to rlimit. Can you check if unprivileged bpf
> > > is
> > > allowed:
> > >    cat /proc/sys/kernel/unprivileged_bpf_disabled
> > 
> > Hi Jan
> > 
> > Thanks for your quick reply. this value in my system is 1.
> > unprivileged bpf isn't allowed. Do we need to check it before run in case?
> 
> Yes, we should check that and TCONF, or better still run test without
> dropping CAP_SYS_ADMIN.

I added a hint to TCONF message, to have a look at unprivileged_bpf_disabled.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
