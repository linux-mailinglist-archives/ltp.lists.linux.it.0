Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B367B1CB19A
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 16:20:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B9B6D3C27D6
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 16:20:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9F8233C2608
 for <ltp@lists.linux.it>; Fri,  8 May 2020 16:20:23 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 3E6C11401B0D
 for <ltp@lists.linux.it>; Fri,  8 May 2020 16:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588947620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3lNh2tgkucdTeP8n/urmgqhN6HkwEU2gIz4Irp4D/bU=;
 b=LSTWOwMjl4xzdavHXh5UwQulTvnR3LKJ0kZRykWWJsUglwBh7nZdMsW6UgPmaez8ObOab4
 TDLVtuU++YprmtZ1ZWiEmbXrK9ZxPZvERlbCSDHaq++e8ZmeIXkoc3u7IZ16oHQxly6o2R
 /0DhFRwqNib9QV4oQvrcnWDlEIFZUMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-ePTIXNK0PaWt0HvCk0bKNw-1; Fri, 08 May 2020 10:20:16 -0400
X-MC-Unique: ePTIXNK0PaWt0HvCk0bKNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 219761B18BC0;
 Fri,  8 May 2020 14:20:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 171B160BEC;
 Fri,  8 May 2020 14:20:15 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C3184CA95;
 Fri,  8 May 2020 14:20:15 +0000 (UTC)
Date: Fri, 8 May 2020 10:20:14 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Message-ID: <475724112.11805789.1588947614752.JavaMail.zimbra@redhat.com>
In-Reply-To: <8f28b9797be3408c0c1086d0a2bc9c052b55bfe2.1588942426.git.agordeev@linux.ibm.com>
References: <cover.1588942426.git.agordeev@linux.ibm.com>
 <8f28b9797be3408c0c1086d0a2bc9c052b55bfe2.1588942426.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.13]
Thread-Topic: lib/cloner.c: Use __clone instead of clone for s390
Thread-Index: Wz8ft5rVh0kEvqqeSG6EQ6B7iKO2IA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] lib/cloner.c: Use __clone instead of clone
 for s390
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
> The kernel sys_clone and s390 glibc entry __clone assume
> the flags parameter type as unsigned long. However, the
> glibc clone wrapper used by ltp_clone helper defines flags
> as signed int. That leads to gcc extending CLONE_IO flag of
> 0x80000000 value to 0xffffffff80000000.

Same problem exists on ppc64le. There's a patch proposed to fix this on
kernel side:
  https://lore.kernel.org/lkml/20200507103214.77218-1-christian.brauner@ubuntu.com/

Earlier discussion is here:
  https://sourceware.org/pipermail/libc-alpha/2020-May/113596.html


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
