Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EABB171B27
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 15:00:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C13F83C24C6
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 15:00:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 48C783C1F2A
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 15:00:03 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 7A28A1001744
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 15:00:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582812000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EckG4FeBWddZ2giOO42++4U3Mq85/0Ako/SOjrhjrB8=;
 b=f6YgidOsWokU7ZwMDAm4imfev16IjHzJojQW98cbrzIGlXoXq2CFvXMbZN6p23YGHyMyCC
 5G/eotfIZEMCTpHVNhRbcO/u+JgdF4Jf80gdxHb5SIP6KTzNb9EFsN7tHvy7kot0VhZap7
 SJaWAz4zoe5sZEtw67jovHHpAQ7euhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-Q6qx51JsPR24t_hpOXMWfw-1; Thu, 27 Feb 2020 08:59:58 -0500
X-MC-Unique: Q6qx51JsPR24t_hpOXMWfw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9178801E6D;
 Thu, 27 Feb 2020 13:59:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F5AF60BE2;
 Thu, 27 Feb 2020 13:59:57 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 403B084466;
 Thu, 27 Feb 2020 13:59:57 +0000 (UTC)
Date: Thu, 27 Feb 2020 08:59:57 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>, Rachel Sibley <rasibley@redhat.com>
Message-ID: <2093843122.9289621.1582811997215.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200227133159.GA24778@rei>
References: <fa386b967db52665ca84150a59058d0f601ca051.1582806435.git.jstancek@redhat.com>
 <20200227133159.GA24778@rei>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.134, 10.4.195.27]
Thread-Topic: syscalls/bpf: bump RLIMIT_MEMLOCK limit
Thread-Index: pmMPVsceDLShcGp90T9siAJluGNnug==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/bpf: bump RLIMIT_MEMLOCK limit
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
> Looks still reasonably small so that we can raise it unconditionally,
> acked.

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
