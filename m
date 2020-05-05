Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE251C516E
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 10:58:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A47E03C2682
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 10:58:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 7A76D3C2670
 for <ltp@lists.linux.it>; Tue,  5 May 2020 10:58:23 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 534FE1A00982
 for <ltp@lists.linux.it>; Tue,  5 May 2020 10:58:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588669101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DsEDLMT9yd978pbK1XURvYISrmcyvzV6dNpj601kf0w=;
 b=N6ZxGhKZRhM2gmjvDQNUeNf/eReqEMeXmfhu9iFwo1457mnvjEZUV6m2PzfachXh+LpVrg
 F7cSfHQUcxtYISOUGjzKL7QjbsEsDgNKyIIbiddkTzFBVGmsLJvgG566TLv3FN761IPcXn
 lrl6USIhvZL/Am3vmHmYp2Kb2zcgUBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-0Z7qW4QUP86pOhJmg_SQyg-1; Tue, 05 May 2020 04:58:18 -0400
X-MC-Unique: 0Z7qW4QUP86pOhJmg_SQyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1849107ACF2;
 Tue,  5 May 2020 08:58:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2308627D9;
 Tue,  5 May 2020 08:58:15 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E6F51809541;
 Tue,  5 May 2020 08:58:15 +0000 (UTC)
Date: Tue, 5 May 2020 04:58:15 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <195377888.11254757.1588669095248.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200505083205.qwwdiotmmjl23aje@wittgenstein>
References: <1038674044.11248021.1588663714272.JavaMail.zimbra@redhat.com>
 <87pnbi4y8x.fsf@mid.deneb.enyo.de>
 <20200505083205.qwwdiotmmjl23aje@wittgenstein>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.20]
Thread-Topic: clone(CLONE_IO) failing after kernel commit commit ef2c41cf38a7
Thread-Index: b6N0urJCdLyflrLQX/chT2e0hS0XvQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [bug?] clone(CLONE_IO) failing after kernel commit commit
 ef2c41cf38a7
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
Cc: Jan Stancek via Libc-alpha <libc-alpha@sourceware.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> (Btw, iiuc, this would've always been a problem, right? In the sense that
> userspace only got away with this because there were no additional flags
> defined and couldn't.)

I think so, 4.20 behaves same way, but kernel ignores any extra flags:
  clone(child_stack=0x1011ffe0, flags=CLONE_IO|0xffffffff00000000|SIGCHLD) = 1061


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
