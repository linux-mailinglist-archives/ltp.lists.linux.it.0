Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A8D285DBF
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Oct 2020 13:03:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E03A73C32A0
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Oct 2020 13:03:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 14C4D3C256C
 for <ltp@lists.linux.it>; Wed,  7 Oct 2020 13:03:10 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 4C49D1000BEF
 for <ltp@lists.linux.it>; Wed,  7 Oct 2020 13:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602068587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DG6hB7FgZlqfViFi/UwXpAGRF5zAfkbRWOlEGNM7LZY=;
 b=SNAltv4Wk4cUWoGG42+63E4kPDbPbqSNRwyVa7wtjzXhxmfRuacEC63fwiag1zcQcnlFzA
 mw+j2o4g9WEjwFLi8Vx0O1L1lxWTw0nTwv/uXnL3ktvGzDaSiqE1xXiam1+hZFeVFcUElk
 vKbh2nOvCPv8uaUBwBGUATgnU9vd318=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246--1BktYDHPRePLmtJHKfFIQ-1; Wed, 07 Oct 2020 07:03:06 -0400
X-MC-Unique: -1BktYDHPRePLmtJHKfFIQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11CAF1074640;
 Wed,  7 Oct 2020 11:03:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE8F98CD29;
 Wed,  7 Oct 2020 11:03:04 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D46F181A869;
 Wed,  7 Oct 2020 11:03:04 +0000 (UTC)
Date: Wed, 7 Oct 2020 07:03:04 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <327178228.17133052.1602068584591.JavaMail.zimbra@redhat.com>
In-Reply-To: <1601966875-5375-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1601966875-5375-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.2, 10.4.195.23]
Thread-Topic: crypto/af_alg07: Skip this case when not having sockfs_setattr
Thread-Index: tQKgzxpvT3FGhMV2qNXQU4ZW6HXVcQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] crypto/af_alg07: Skip this case when not having
 sockfs_setattr
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
> From: "Yang Xu" <xuyang2018.jy@cn.fujitsu.com>
> To: ltp@lists.linux.it
> Sent: Tuesday, 6 October, 2020 8:47:55 AM
> Subject: [LTP] [PATCH] crypto/af_alg07: Skip this case when not having sockfs_setattr
> 
> Since kernel 4.10-rc1 commit 86741ec25462 ("net: core: Add a UID field to
> struct sock."),
> it introduced sockfs_setattr function. This test needs to use this function
> to trigger this cve bug, so skip it if kernel < 4.10.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

Pushed.

Thanks,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
