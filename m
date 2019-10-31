Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F1CEACE6
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 10:53:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A47F3C22DD
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 10:53:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C25AA3C0428
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 10:53:49 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 59D2E10011AA
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 10:53:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572515627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kf6EMJQwkf59eeSFLxGksf0bsXCC+IyYP04k7ID9WbY=;
 b=PVEYw3TMvrauAqlpC5xDuk5Uj20udHm058LTC1qpZUMFMH+vg9w4aF0dh78qDAJwsiXs2q
 7+fKUgBfH5EkjvLqxFKGbBKUgXz4DJatE/QwFaRLfyJBMftnhKEiBFkYKSCFUnmczv6UBz
 GP9ptB3H8ew0zVp4EImUko5jTc8eMPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-qKQqsOxfPtWzDpO_VluCbg-1; Thu, 31 Oct 2019 05:53:43 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C4ED1005502;
 Thu, 31 Oct 2019 09:53:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6482F60BFB;
 Thu, 31 Oct 2019 09:53:41 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D2484BB5B;
 Thu, 31 Oct 2019 09:53:41 +0000 (UTC)
Date: Thu, 31 Oct 2019 05:53:40 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: limingyu <limingyu@deepin.com>
Message-ID: <246485198.9905451.1572515620925.JavaMail.zimbra@redhat.com>
In-Reply-To: <tencent_28D2BF821D50F4EC33C1EF97@qq.com>
References: <tencent_4D69C182358CFFEA3F0A95F7@qq.com>
 <1615187401.9901286.1572514591876.JavaMail.zimbra@redhat.com>
 <tencent_28D2BF821D50F4EC33C1EF97@qq.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.27]
Thread-Topic: Unable to run eventfd test,
 even the libaio-dev installed on debian 10.
Thread-Index: mtKr31noDs6zNizOiRo8gjT9Wo5haw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: qKQqsOxfPtWzDpO_VluCbg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] Unable to run eventfd test,
 even the libaio-dev installed on debian 10.
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
Cc: =?utf-8?B?5rSq5rWp?= <honghao@linuxdeepin.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> Thanks for your reply!
> After I check the config.log, I think all check go into the right place, but
> confdefs.h didn't show up, it's sort of weird.
> Some output from config.log:
> configure:6159: checking libaio.h usability
> configure:6159: gcc -c -g -O2  -D_FORTIFY_SOURCE=2 conftest.c >&5
> configure:6159: $? = 0
> configure:6159: result: yes
> configure:6159: checking libaio.h presence
> configure:6159: gcc -E  -D_FORTIFY_SOURCE=2 conftest.c
> configure:6159: $? = 0
> configure:6159: result: yes
> configure:6159: checking for libaio.h
> configure:6159: result: yes
> configure:6170: checking for io_setup in -laio
> configure:6195: gcc -o conftest -g -O2  -D_FORTIFY_SOURCE=2  conftest.c -laio
> >&5
> configure:6195: $? = 0
> configure:6204: result: yes
> configure:6218: checking io_set_eventfd is defined in aio library or aio
> header

Above looks OK. Please do also "make clean" on everything, just to be sure
you're not using old binaries. I don't see eventfd01 being rebuilt in your
first email.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
