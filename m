Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDC6EDCDD
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 11:50:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A90893C23E8
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 11:50:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9D7443C129F
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 11:50:33 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 1FEB91400E73
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 11:50:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572864631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPE3ew5vRMtbilqzbuALAIsRWWD8Vb8Lctbh25jkmFk=;
 b=DLd4LdKdTFqp0rBxLNpUnBUHGZdrgi00NJq6lRdQ+uxSJuHffwjRmj8Av2j96hMLRVNgCP
 puC4RVV5+sib8sce5My232IXGGMDmwrmUvhe4i5Y4ApOINLCtXUsY0FnN8NBRRI/cUwmGm
 9iB78yigOgY0JPLpTR/rrkoE3hywisw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-BLzilk4sMceyVo3-avOCGQ-1; Mon, 04 Nov 2019 05:50:29 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B452D1005502;
 Mon,  4 Nov 2019 10:50:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACBF860BF1;
 Mon,  4 Nov 2019 10:50:28 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A38DD18095FF;
 Mon,  4 Nov 2019 10:50:28 +0000 (UTC)
Date: Mon, 4 Nov 2019 05:50:28 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1706711917.10302442.1572864628434.JavaMail.zimbra@redhat.com>
In-Reply-To: <008a677b-644d-615f-6c4f-0961af928700@cn.fujitsu.com>
References: <008a677b-644d-615f-6c4f-0961af928700@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.7]
Thread-Topic: question about the EPERM error of LTP bpf test
Thread-Index: ubND28mFDtEMhNOfI3nlv2cTAVV54A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: BLzilk4sMceyVo3-avOCGQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
> Hi All
> 
> Now, I test bpf_prog02 and bpf_prog03 in my system(4.18.0-107.el8.x86_64).
> 
> #./bpf_prog03
> tst_buffers.c:55: INFO: Test is using guarded buffers
> tst_test.c:1137: INFO: Timeout per run is 0h 05m 00s
> bpf_common.h:18: INFO: Raising RLIMIT_MEMLOCK to 262143
> tst_capability.c:29: INFO: Dropping CAP_SYS_ADMIN(21)
> bpf_common.h:37: CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM (1)
> #
> 
> Jan Stancek has added rlimit_bump_memlock function to avoid EPERM errno,
> but I still can meet this problem every time even though I have increased
> BPF_MEMLOCK_ADD limit.

This is likely not related to rlimit. Can you check if unprivileged bpf is allowed:
  cat /proc/sys/kernel/unprivileged_bpf_disabled

> 
> How can I run the two cases normally? Also, this error log(requires
> CAP_SYS_ADMIN on this system: EPERM
> ) makes me confused in this situation(because case drops CAP_SYS_ADMIN, but
> log reports need CAP_SYS_ADMIN)
> and I think we may change it into "require CAP_SYS_ADMIN or max locked memory
> limit is too low".
> 
> Or, can I keep CAP_SYS_ADMIN cap in bpf_prog02/[3]?
> 
> 
> Thanks
> Yang Xu
>   
> 
> 
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
