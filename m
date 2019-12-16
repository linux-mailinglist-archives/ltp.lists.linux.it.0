Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4930612064D
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Dec 2019 13:51:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B91543C2439
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Dec 2019 13:51:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id ADC903C1770
 for <ltp@lists.linux.it>; Mon, 16 Dec 2019 13:51:27 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 2DC741401A54
 for <ltp@lists.linux.it>; Mon, 16 Dec 2019 13:51:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576500685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mntnOYocEBTh5YWhYTCWBDpUwqtYcrV9v1yljesFa8=;
 b=HPbMJJkVnCxtYZvZXNCYnrfZpI3BYMKBJCLzC7nKxwRAQsLAVSZArRjdxim1v4LRrFSzTJ
 cMSRuRaZvS7gkwW4PsjphFUi2l0b6fL2LpA6q0aF+G0OZCrzsAo4CoI8dxYRiVwaLMX1oH
 iOm03de+N1ENiqIBxn9vUZrDDWZNedI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-n24emn-5O-y83pgwnD0ASA-1; Mon, 16 Dec 2019 07:51:21 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7161B800EBF;
 Mon, 16 Dec 2019 12:51:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6780461376;
 Mon, 16 Dec 2019 12:51:20 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 947AB18095FF;
 Mon, 16 Dec 2019 12:51:19 +0000 (UTC)
Date: Mon, 16 Dec 2019 07:51:19 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <2098405807.16999530.1576500679328.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191213130336.GD20795@rei.lan>
References: <cd51199b87580a138fa9c7669e61bdb7611ab204.1576154034.git.jstancek@redhat.com>
 <853f6938da5d133800dc6bf1d490937b50c2e059.1576154034.git.jstancek@redhat.com>
 <20191213130336.GD20795@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.12]
Thread-Topic: statx07: handle ETIMEDOUT when rpcbind.socket is not started
Thread-Index: DcGbqHyGNKqXwx1XFG4HwMk2j83W3A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: n24emn-5O-y83pgwnD0ASA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] statx07: handle ETIMEDOUT when rpcbind.socket
 is not started
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
> Acked as well.
> 

Both pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
