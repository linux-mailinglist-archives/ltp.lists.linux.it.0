Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C5010E98D2
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Oct 2019 10:07:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 798D33C22B4
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Oct 2019 10:07:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id EAD713C0794
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 10:07:00 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 5717B600E30
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 10:06:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572426418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JnwqYs8FvGN1H65rNyQcyaEPa/zqsRcB7vQy1ziLLoE=;
 b=DFlL667n2M4sSeOfyU6MMTPQev+7wqpecQ4HzbyaVRZdh2kyy8+yRvaQVfdWiMsAWXvQAB
 B9cNmCk0BBoUOcQ2IVeODnm1GLRt/rE/nTDXEegXY6E1uVlxEsq2t26l8yCVzF++G/0uMR
 fHibLK05ORphslMZyiA2tmatmb38aj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-nLDFSJ-tMWCDetaobZkLgA-1; Wed, 30 Oct 2019 05:06:56 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFA15800686;
 Wed, 30 Oct 2019 09:06:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C79BB5D9C3;
 Wed, 30 Oct 2019 09:06:55 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBD974EDA5;
 Wed, 30 Oct 2019 09:06:55 +0000 (UTC)
Date: Wed, 30 Oct 2019 05:06:55 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <575273995.9684474.1572426415443.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190925135634.GA32581@dell5510>
References: <20190925094721.18932-1-chrubis@suse.cz>
 <20190925135634.GA32581@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.10]
Thread-Topic: syscalls/acct02: Check read size.
Thread-Index: FwKw/OGWtHK4rson7k0IP3bEEJxnIw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: nLDFSJ-tMWCDetaobZkLgA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
> OK, on s390 where it's failing it actually catches "incomplete read":
> 
> tst_kconfig.c:62: INFO: Parsing kernel config '/proc/config.gz'
> tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> tst_kconfig.c:62: INFO: Parsing kernel config '/proc/config.gz'
> acct02.c:234: INFO: Verifying using 'struct acct_v3'
> acct02.c:187: INFO: == entry 1 ==
> acct02.c:147: INFO: ac_version != 3 (131)
> acct02.c:187: INFO: == entry 2 ==
> acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
> acct02.c:133: INFO: ac_exitcode != 32768 (0)
> acct02.c:141: INFO: ac_ppid != 54783 (54781)
> acct02.c:147: INFO: ac_version != 3 (131)
> acct02.c:183: FAIL: incomplete read 0 bytes, expected 64

I'm seeing similar failure:

tst_kconfig.c:62: INFO: Parsing kernel config '/boot/config-3.10.0-1106.el7.cki.s390x'
tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
tst_kconfig.c:62: INFO: Parsing kernel config '/boot/config-3.10.0-1106.el7.cki.s390x'
acct02.c:239: INFO: Verifying using 'struct acct_v3'
acct02.c:192: INFO: == entry 1 ==
acct02.c:88: INFO: ac_btime < 1572367954 (1572367953)
acct02.c:192: INFO: == entry 2 ==
acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
acct02.c:88: INFO: ac_btime < 1572367954 (1572367953)
acct02.c:133: INFO: ac_exitcode != 32768 (0)
acct02.c:141: INFO: ac_ppid != 25608 (25607)
acct02.c:182: FAIL: end of file reached

but I don't get what process is this record from.
I see 3 pids: library, main and 'acct02_helper'. What 'acct02' process
terminated?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
