Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EBD13A9BC
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 13:53:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D85E13C2364
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 13:53:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id CC32C3C0E97
 for <ltp@lists.linux.it>; Tue, 14 Jan 2020 13:53:21 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 454871A00CA7
 for <ltp@lists.linux.it>; Tue, 14 Jan 2020 13:53:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579006399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H2S28p+yOQHx9wsQZpluvTRwOGVWXvXRtgkJn9/XIEQ=;
 b=Ns3/AGbbvRfZg2AeukrE0e5+NijwbHF8ag1lplyyVboXBtdynxL/+ki9f+tWf2zVWUssZv
 GbELji6W82XmyLA+gve/sh9OcvPVjCOZNKzh9Bj/iMJNCFUCb0Xe4vrtixoxFm8fvZJrAs
 70dA2Hkr5kgLhecke6S1G6YZcvU9D+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-rp4J3dCwNDacB56G_imZig-1; Tue, 14 Jan 2020 07:53:17 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFECF801E78;
 Tue, 14 Jan 2020 12:53:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6F3B5C1B0;
 Tue, 14 Jan 2020 12:53:16 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 778871809563;
 Tue, 14 Jan 2020 12:53:16 +0000 (UTC)
Date: Tue, 14 Jan 2020 07:53:16 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1836578080.1900093.1579006396291.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200114124900.22223-1-chrubis@suse.cz>
References: <20200114124900.22223-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.10]
Thread-Topic: syscalls/statx05: Fix failures on s390 & old libc
Thread-Index: Qf37Z1nIM85QIBmYL+8hPXRDbqFMow==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: rp4J3dCwNDacB56G_imZig-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/statx05: Fix failures on s390 & old libc
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
> When encryption is not enabled in the kernel e4crypt fails with non-zero
> exit value. The value is then stored to long via the TEST() macro. The
> problem is that WEXITSTATUS() does not work with long on big endian s390
> on older libc[1][2]. And while this is not our bug, it also does not
> make sense to misuse the TEST() macro for catching return value from
> tst_test().
> 
> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=19613
> [2]
> https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=b49ab5f4503f36dcbf43f821f817da66b2931fe6
> 
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>

LGTM.

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
