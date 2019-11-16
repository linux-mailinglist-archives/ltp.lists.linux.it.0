Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E2EFF452
	for <lists+linux-ltp@lfdr.de>; Sat, 16 Nov 2019 18:23:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9AA373C2452
	for <lists+linux-ltp@lfdr.de>; Sat, 16 Nov 2019 18:23:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4EBFA3C242B
 for <ltp@lists.linux.it>; Sat, 16 Nov 2019 18:23:06 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 377391400E14
 for <ltp@lists.linux.it>; Sat, 16 Nov 2019 18:23:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573924983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z2Za4Zqtha9jgQlwsU/N2ojl8tVppPO1qXMfMitD200=;
 b=csI4D1Dn8OSsZLUxqJSx6b+JxrSNujNQh4YjVX5U5c7NRuUI9YjOPfhfnjE3G6XtT11G6i
 76jqw/+eLjCfEqHrKTBZZUdHp3Zn5iDBmCEYUk0++rhsTBmp/PWY0uR8W4mClGllchYDU/
 lWfhBDi2vAJSwVEsefPFX9/ddShBKW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-Y-XJSxGLMvyhybKxYY2EjQ-1; Sat, 16 Nov 2019 12:22:59 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29AE0477;
 Sat, 16 Nov 2019 17:22:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E68F600C6;
 Sat, 16 Nov 2019 17:22:58 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C62C04BB5B;
 Sat, 16 Nov 2019 17:22:57 +0000 (UTC)
Date: Sat, 16 Nov 2019 12:22:57 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <977310824.12699736.1573924977430.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191116002003.13013-1-petr.vorel@gmail.com>
References: <20191116002003.13013-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.45, 10.4.195.20]
Thread-Topic: fanotify: Fix for musl
Thread-Index: 85HnNcHI5frKOfqbQJl5vQ1HIHpUJQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Y-XJSxGLMvyhybKxYY2EjQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] fanotify: Fix for musl
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
> FSID_VAL_MEMBER() wrapper was meant to be only for struct
> fanotify_event_info_fid, it was used also for struct event_t
> (which has also __kernel_fsid_t fsid, but shouldn't be redefined).
> 
> This caused error on recent musl v1.1.23 (with f67b3c17),
> which has struct fanotify_event_info_fid.
> 
> Fixes: 0498fc0a8 ("fanotify: Detect val vs. __val
> fanotify_event_info_fid.fsid member")
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

If it's needed for __kernel_fsid_t we'll need to come up with better names.
This basically reverts part of previous patch, which looks ok to me.

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
