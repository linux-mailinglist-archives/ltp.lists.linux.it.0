Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E5A104D69
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 09:10:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFC303C1CED
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 09:10:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C933C3C1C8B
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 09:10:25 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 274B9616E3A
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 09:10:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574323823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5uklTWxrYGTxrCEzrRxcfhwcOrzWnUMidq2+skvxSqg=;
 b=YlAf0tlJRKKSNMBWoZWvwzc9z5H0KNlLdK5S+AVT5OFNMVupxfH5tgX6E64wbqjWWP6Z5y
 rzLFTdXjpeueCX+yd2NO073E/li/tdrYLxcvOFrY48IB0haMS3Qn2PZZq3g6sRdt7E6CDh
 U2qIaV6DDx9nYYtp+Zdh/g3hVnSfFgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-2HEF5-H7NV6ciWmGAaVbrw-1; Thu, 21 Nov 2019 03:10:19 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 771E41005509;
 Thu, 21 Nov 2019 08:10:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C0B05D713;
 Thu, 21 Nov 2019 08:10:18 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E3E41809563;
 Thu, 21 Nov 2019 08:10:18 +0000 (UTC)
Date: Thu, 21 Nov 2019 03:10:18 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>
Message-ID: <1973085176.13281191.1574323818330.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191120112230.GB14963@rei.lan>
References: <1a623a82dfac64c8a6f9805c197fa72cb5e6f046.1574159295.git.jstancek@redhat.com>
 <20191120112230.GB14963@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.17]
Thread-Topic: don't pass NULL to strcmp in safe_mount
Thread-Index: KdeEfdqkJrvNIMmk2xGrb58yQXFpOA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 2HEF5-H7NV6ciWmGAaVbrw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: don't pass NULL to strcmp in safe_mount
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
> Thanks for fixing this, acked.

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
