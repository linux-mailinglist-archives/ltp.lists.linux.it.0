Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 815271F1B7B
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 16:52:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 31EEC3C2EAF
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 16:52:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 77A023C2E91
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 16:52:19 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 153116008C1
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 16:52:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591627937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKbb4mC4S9ZBOunTv/2SKKytUqI0dCjgW67g772XzFE=;
 b=DA1k1bPiYy7hkpiMgKBVwosrrgdJL188L0+Lq01zUUBKE+rw2s/5e+2DI79lO4Xxo3a+/u
 xWB1axaccw8TV3ckUGDJkWwGKan2CEia0D3iR/3hrcANxPVEInzTmPe2WWhmwQ6T/yQdDX
 9KiMcvl77PeEQJdmspUfKcU9SSByHdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-q5Xi8gnoNR6-SQuy1SCqbA-1; Mon, 08 Jun 2020 10:52:11 -0400
X-MC-Unique: q5Xi8gnoNR6-SQuy1SCqbA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD70C18FE864;
 Mon,  8 Jun 2020 14:52:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A552F6111F;
 Mon,  8 Jun 2020 14:52:09 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6867D180954D;
 Mon,  8 Jun 2020 14:52:09 +0000 (UTC)
Date: Mon, 8 Jun 2020 10:52:09 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Message-ID: <1210169239.15186381.1591627929151.JavaMail.zimbra@redhat.com>
In-Reply-To: <BMXPR01MB23442B106F1292542BA7F85CEE850@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
References: <BMXPR01MB23442B106F1292542BA7F85CEE850@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.22]
Thread-Topic: sched_rr_get_interval01 , sched_rr_get_interval02
 ,sched_rr_get_interval03 testcase failure
Thread-Index: AQHWPY7/FIIF6rRND0e6piB5foPEvOTxch8i
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] sched_rr_get_interval01 , sched_rr_get_interval02 ,
 sched_rr_get_interval03 testcase failure
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
> <<<test_output>>>
> incrementing stop
> sched_rr_get_interval01 1 TBROK : sched_rr_get_interval01.c:131:
> sched_setscheduler() failed

Common cause is that you run tests in cgroup that has zero cpu.rt_runtime_us.

1. Are sched_setparam02 and sched_getscheduler01 passing?

2. Can you rerun with this patch:
     https://github.com/linux-test-project/ltp/commit/94e6163082055700db700c33ed0eab537420fdaf.patch
   or use strace? 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
