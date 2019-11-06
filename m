Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA48F1318
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 10:59:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55F6D3C23B6
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 10:59:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 945CE3C2218
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 10:59:47 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 012411401A95
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 10:59:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573034384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cM5FiLy+IWu6FESy2s9EuvtFkqZIa6oRV8HMBOOO4yQ=;
 b=bK8twuZhhbur2i2jdKNmhFexcPIJzkGa6+HI6Qp4FtFSA0IdWjLiCLP/hVL7+vHJch5ePb
 QbBQsBZYDW62x4HPBNmxsTJ5lVP6t78L5h7BB+y3/8E9rQCKHWRbeOlyN3UQg0XU4KyqMF
 OkUB3y+1HhDeQK2bfEAMCatfroaro3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-6ZBXEu-fNR2h7xsVP9jCnA-1; Wed, 06 Nov 2019 04:59:42 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26F331800D53
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 09:59:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E3255D9CD
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 09:59:42 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 167EC1802213
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 09:59:42 +0000 (UTC)
Date: Wed, 6 Nov 2019 04:59:41 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Message-ID: <598814762.10700788.1573034381847.JavaMail.zimbra@redhat.com>
In-Reply-To: <48e9d0f8ed25dd69dc97fe31c4446a30cd990b06.1572954996.git.jstancek@redhat.com>
References: <48e9d0f8ed25dd69dc97fe31c4446a30cd990b06.1572954996.git.jstancek@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.17]
Thread-Topic: tst_process_state_wait: wait for schedstats to settle when state
 == S
Thread-Index: CiHBicUsIAwCsiXsGOEl7VlOEfAzKA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 6ZBXEu-fNR2h7xsVP9jCnA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH/RFC] tst_process_state_wait: wait for schedstats
 to settle when state == S
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> There can be a gap between task state update and process being scheduled
> off from runqueue. For example futex_wait_queue_me() updates task state
> before it queues the futex:
> 
>   static void futex_wait_queue_me(struct futex_hash_bucket *hb, struct
>   futex_q *q,
> 				  struct hrtimer_sleeper *timeout)
>   {
> 	  /*
> 	   * The task state is guaranteed to be set before another task can
> 	   * wake it. set_current_state() is implemented using smp_store_mb() and
> 	   * queue_me() calls spin_unlock() upon completion, both serializing
> 	   * access to the hash list and forcing another memory barrier.
> 	   */
> 	  set_current_state(TASK_INTERRUPTIBLE);
> 	  queue_me(q, hb);

hb->lock is locked at this point, and requeue takes it too, so I'm not
sure what makes it fail. I've seen testcase fail in at least
2 different ways now. Here's the other one:

tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
futex_cmp_requeue01.c:106: PASS: futex_cmp_requeue() woke up 3 waiters and requeued 7 waiters
futex_cmp_requeue01.c:106: PASS: futex_cmp_requeue() woke up 0 waiters and requeued 10 waiters
futex_cmp_requeue01.c:106: PASS: futex_cmp_requeue() woke up 2 waiters and requeued 6 waiters
futex_cmp_requeue01.c:106: PASS: futex_cmp_requeue() woke up 50 waiters and requeued 50 waiters
futex_cmp_requeue01.c:106: PASS: futex_cmp_requeue() woke up 0 waiters and requeued 70 waiters
futex_cmp_requeue01.c:46: INFO: process 7923 wasn't woken up: ETIMEDOUT (110)
...
futex_cmp_requeue01.c:71: FAIL: futex_cmp_requeue() returned 776, expected 1000
futex_cmp_requeue01.c:85: FAIL: 224 waiters were not woken up normally
futex_cmp_requeue01.c:106: PASS: futex_cmp_requeue() woke up 300 waiters and requeued 500 waiters


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
