Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8328B10D595
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 13:17:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 459DD3C226C
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 13:17:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E5E503C2078
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 13:17:05 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id D7D93604835
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 13:17:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575029823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xRpJo1QJkNt2IEf0Mb5LggH5SEsarg95LV85cF6wEdU=;
 b=gq9MDO9HbVo5A2c/u7VeN5bNq954ouz+kkK8MXPpVMeyXG0v25jm3NNEObPVanf6Q134BA
 bfI6t4+ABm0e7hDnldErrlRoxWBQ5/QR//m8iieOzR0hLzjNkAurD41srKXgLrvfOPFZa0
 HCvJtP5rvAZz/3k042lS+BJncMu7KVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-vUSK4aXlNimYTr6nQPmQwg-1; Fri, 29 Nov 2019 07:16:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EFB58017D9
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 12:16:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 065635D6D4
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 12:16:49 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id F16534BB5B;
 Fri, 29 Nov 2019 12:16:48 +0000 (UTC)
Date: Fri, 29 Nov 2019 07:16:48 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <615998340.14360504.1575029808785.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191128045525.15454-1-liwang@redhat.com>
References: <20191128045525.15454-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.11]
Thread-Topic: mtest01: correct the ALLOC_THRESHOLD definition on s390x
Thread-Index: BxN0gR9JqnK9Zhaoayf8tYuZLECGkQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: vUSK4aXlNimYTr6nQPmQwg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mtest01: correct the ALLOC_THRESHOLD definition
 on s390x
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
> mtest01 hits a problem on s390x platform. The situation is that if children's
> memory allocating is ongoing and the test remaining time is in an emergency,
> the
> parent will break from the while loop and try to revoke children, obviously,
> it
> doesn't have enough time to wait for the children's status change to 'T'.
> Then it
> occurs timeout issue as below:
> 
>   mtest01.c:134: INFO: Filling up 80% of free ram which is 5868864 kbytes
>   mtest01.c:149: INFO: ... child 38289 starting
>   mtest01.c:149: INFO: ... child 38288 starting
>   mtest01.c:208: WARN: the remaininig time is not enough for testing
>   mtest01.c:218: FAIL: kbytes allocated (and written to) less than expected
>   5868864
>   Test timeouted, sending SIGKILL!

Acked-by: Jan Stancek <jstancek@redhat.com>

I/O on that system looks painfully slow, if it can't fill ~5G of swap in 5 minutes.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
