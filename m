Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACB6FC594
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 12:43:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A006A3C203D
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 12:43:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id EF7C43C185F
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 12:43:38 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 4BAAD6005DD
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 12:43:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573731816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2fKxpgcdydznUgAqmqWsZf9x4FZOMs4mqGiqBEBscNE=;
 b=PyqPaLGn4n+OeCISihpzpwM9jUKNtLVaBefKlPR6azZpnV6hKQ1rq+r8s1m0v0t4A7VmAB
 UiXVyto5YXOBDtmws5cChtkBQW3vt/x0/Lx+aPU+0TEZlo7crxUj+wEUz98Cqubya7VbQ3
 4oWmotFqZomrgy3N3s15HPb6vP+NL4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-QJjcIbdmNdSKlUN-2HpCpg-1; Thu, 14 Nov 2019 06:43:35 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3468118A23A2;
 Thu, 14 Nov 2019 11:43:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CCBF5F78F;
 Thu, 14 Nov 2019 11:43:34 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id F053C4BB5B;
 Thu, 14 Nov 2019 11:43:33 +0000 (UTC)
Date: Thu, 14 Nov 2019 06:43:33 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <560257538.12094870.1573731813438.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191114104221.GB30308@rei>
References: <51aabb2e4680d830b5ba7b7623e0c7697bcb6338.1573675056.git.jstancek@redhat.com>
 <20191114104221.GB30308@rei>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.254, 10.4.195.11]
Thread-Topic: mbind04: terminate child processes
Thread-Index: nlnmLStuW3Rboacjk1L5Uw9NaCbf2Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: QJjcIbdmNdSKlUN-2HpCpg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mbind04: terminate child processes
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

> I find the name for the variable quite confusing here, because it
> suggests that the parent exits here, while the opposite is true. Can we
> please just use pid or something less confusing for the variable name?

Pushed with renamed variable.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
