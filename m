Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D50FA105119
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 12:08:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D5423C22D5
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 12:08:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id F29993C1C8D
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 12:08:23 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 594F81A01221
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 12:08:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574334501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4sebo/E6gquE4LfGQsDKWQIvPkLq4FcpTaT+w+dxCIM=;
 b=h+m1lNEfmh9CfbfbH1CQlMCXvinpy4v6jZmgDPP+yeCWENiMCHimYZSXWUtAwCMikmw3M+
 xmabS8DvZ4OEbGAlOEEyG6CPpK3p4tcJC7bkZsNB08w1QvU4rZrBXzfxQ5pTpwWDeqr6lk
 klpIb0Kd1zLoJ8guaXbRJdYfYIlre0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-T9owzla3NfOii4gDKNsyVA-1; Thu, 21 Nov 2019 06:08:11 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63FAC801E58;
 Thu, 21 Nov 2019 11:08:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31A5F107A43C;
 Thu, 21 Nov 2019 11:08:10 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2C3C18089CE;
 Thu, 21 Nov 2019 11:08:09 +0000 (UTC)
Date: Thu, 21 Nov 2019 06:08:09 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>, Li Wang <liwang@redhat.com>
Message-ID: <339862280.13302048.1574334489479.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191121103003.GC23702@dell5510>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1574241216-15168-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191120151244.GA28197@dell5510>
 <1893160007.13287158.1574326875945.JavaMail.zimbra@redhat.com>
 <20191121103003.GC23702@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.2]
Thread-Topic: syscalls/quotactl01: Add Q_GETNEXTQUOTA test
Thread-Index: ULNaBNPMuLeXv/iZoqL+o4KV9iCHEA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: T9owzla3NfOii4gDKNsyVA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> > > Also ,If we use uint64_t, they still failed on 2.6.32-754.el6.x86_64 with
> > > undefined  . Or, we should use TST_ABI to define uint64_t them
> Jan, are you aware of this problem?

I'm not, it should be defined in stdint.h.

# cat /etc/redhat-release 
Red Hat Enterprise Linux Server release 6.10 (Santiago)

# grep uint64_t -r /usr/include/ | grep stdint
/usr/include/stdint.h:typedef unsigned long int	uint64_t;

> Xu, I'm not sure if you're talking about uint64_t problematic in
> <linux/types.h>
> (as you mention kernel) or problem in glibc <sys/types.h> / <stdint.h> /
> <inttypes.h>?
> We have lots of code which is using some of these 3 libc headers, does it
> fail
> on 2.6.32?
> 
> Does anybody compile for 2.6.32?

[CC Li]
I think RH still does compile latest for regression tests. RHEL6 will be in
sustaining for couple more years. 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
