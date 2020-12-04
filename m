Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D30F2CEAC1
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 10:22:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFBA53C58EA
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 10:22:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B939E3C2B71
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 10:22:23 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 54FC01401186
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 10:22:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607073742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8XBHQ5OnPcST5n3qUSYV64pAoXILgObi47AKh1IL900=;
 b=C45QdGXda1I5Uge+dQFIwWvpkBw1tU+HN7f3fcwTi1MwJn1h4aJvpSAwvWVIgD6vwULrjr
 b4fErmWAwDJT7sszvE/Zmn+U8VpNlqKcz/oYIDAM5xD2fRdkyYmOZPmo6nwIVzM2Ie1OCN
 J77Xb2IReAlfW+8J1HgweQ/xSfbtrUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-kdhXgufPPjmlyydc7xYorg-1; Fri, 04 Dec 2020 04:22:20 -0500
X-MC-Unique: kdhXgufPPjmlyydc7xYorg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91744107ACFC;
 Fri,  4 Dec 2020 09:22:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88BC160C15;
 Fri,  4 Dec 2020 09:22:19 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 812FD18095C9;
 Fri,  4 Dec 2020 09:22:19 +0000 (UTC)
Date: Fri, 4 Dec 2020 04:22:19 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1412193890.27401950.1607073739303.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201203152804.846-1-chrubis@suse.cz>
References: <20201203152804.846-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.36.110.76, 10.4.195.3]
Thread-Topic: Fix timestamp tests in SysV IPC tests
Thread-Index: TwBv15YKF2CgRQTV3piN3tnpkm4vZQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/2] Fix timestamp tests in SysV IPC tests
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
> Cyril Hrubis (2):
>   libnewipc: Add get_ipc_timestamp()
>   syscalls/ipc: Make use of get_ipc_timestamp()
> 
>  include/libnewipc.h                             |  3 +++
>  libs/libltpnewipc/libnewipc.c                   | 13 +++++++++++++
>  testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c |  4 ++--
>  testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c |  4 ++--
>  testcases/kernel/syscalls/ipc/shmctl/Makefile   |  2 +-
>  testcases/kernel/syscalls/ipc/shmctl/shmctl01.c |  4 ++--
>  6 files changed, 23 insertions(+), 7 deletions(-)
> 

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
