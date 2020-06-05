Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D41B1EF14C
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 08:16:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 125693C2F5C
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 08:16:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 530683C2232
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 08:16:15 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id C580110006A2
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 08:16:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591337773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1GoUZeXkyCyFDhV15OuTIfDcApXcnDU25VqfZfCq88=;
 b=NIrwkLICTyZLp2NtdJDNIPFA8YKQ9IIzo1mgqjDpScs031BB1csuOcMUCsio1b8I92MizU
 uP3zH+YqqqT9dPYr0xxQcmjEN2tTDcRcR/EXBnyTX2+jmNvv6h5P7ExGKzAxDlBNQeUJS1
 NOuDkILz0cxMHv1CdFDxqgAXB/CwDOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-izjqeblGPj-xJb8YHiQYFQ-1; Fri, 05 Jun 2020 02:16:09 -0400
X-MC-Unique: izjqeblGPj-xJb8YHiQYFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 846FA872FE0;
 Fri,  5 Jun 2020 06:16:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B509707B1;
 Fri,  5 Jun 2020 06:16:07 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 746737CCC6;
 Fri,  5 Jun 2020 06:16:07 +0000 (UTC)
Date: Fri, 5 Jun 2020 02:16:07 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1888126060.14872962.1591337767431.JavaMail.zimbra@redhat.com>
In-Reply-To: <3d927f64-438c-f52e-93c4-969a0d2d7c02@cn.fujitsu.com>
References: <588f29555a93919a5ea47e5cf786eca6a08f85f1.1591185180.git.jstancek@redhat.com>
 <3d927f64-438c-f52e-93c4-969a0d2d7c02@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.11]
Thread-Topic: syscalls/mknod07: whiteout creation no longer requires privileges
Thread-Index: 0e9PAMefTSr7XqnNh/VEgeTvfPGk8A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/mknod07: whiteout creation no longer
 requires privileges
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
> Hi Jan
> 
> Acked.

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
