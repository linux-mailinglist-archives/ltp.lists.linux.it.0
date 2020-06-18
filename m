Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B44011FEB38
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 08:00:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6DE7E3C2C83
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 08:00:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 1C0693C2C74
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 08:00:34 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id D0DF7200049
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 08:00:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592460032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iOgXiZDz/nE5AypRVRh8RF71SaoDN935795M+nUqLug=;
 b=GK08xK/+5A/pUaHvmcYLaqDx6PBfGcAV3YTb9N3ubRgo6283URyrWv/y9N7XrWLsiXznAL
 gOIR3O1Mp+OlUwcPyi3/hKyQRX1IbvwU/aVN95ykxFUMSr/hc5trMnFM5/m3BRCQAKYHuq
 LJOI9iBvx67w9PoYf+NbNjGpQQIOEdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-Xq3_2xZ7PGKL03LRboZpGw-1; Thu, 18 Jun 2020 02:00:29 -0400
X-MC-Unique: Xq3_2xZ7PGKL03LRboZpGw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC3A564AD0;
 Thu, 18 Jun 2020 06:00:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5F5C79302;
 Thu, 18 Jun 2020 06:00:28 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E4B91CA6;
 Thu, 18 Jun 2020 06:00:28 +0000 (UTC)
Date: Thu, 18 Jun 2020 02:00:28 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <607606933.16501449.1592460028318.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200617151223.GB7370@yuki.lan>
References: <9b9e3d35b4fddb668b02595e418a997332f98491.1591347655.git.jstancek@redhat.com>
 <5632b2169cfe32807e8380be50ced5e5d6ff93cb.1591347655.git.jstancek@redhat.com>
 <20200617151223.GB7370@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.13]
Thread-Topic: syscalls/setns01: accept also EBADF for regular fd
Thread-Index: pstkg/N/Wba08aoMJzMf4ZSRX4jEfQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] syscalls/setns01: accept also EBADF for
 regular fd
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
> Hi!
> And I guess that this is no longer needed, right?

If Christian's patch goes in then yes, we can drop this one.
I'll send v2 for 2/3.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
