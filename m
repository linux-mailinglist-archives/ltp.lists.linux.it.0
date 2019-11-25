Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD353109070
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Nov 2019 15:54:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A3E43C220C
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Nov 2019 15:54:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 894833C1117
 for <ltp@lists.linux.it>; Mon, 25 Nov 2019 15:54:10 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 928CA1A011CA
 for <ltp@lists.linux.it>; Mon, 25 Nov 2019 15:54:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574693648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=se8l+payS2kmuwI4O7brn/yPONG/NDd5JqI0EC35To8=;
 b=WRmUjLKtBGuI6Ersx7rj54+lnm98/toT+I7yqLq3ZwG0m2PDw/SFEOOmWbmeLbuoL6HiX8
 8go2xoD6Z2oemhPHkUS84DWgX2nniMpy6rX25SaaAeS1PWxofP1RHwzZqoAMOtp7uj4tms
 rp9in9V0b+u9wBqTR7W5hd+oJz6tgw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-Eq7JzTwEOcqSm5SfFCTb5g-1; Mon, 25 Nov 2019 09:54:04 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F763801E63;
 Mon, 25 Nov 2019 14:54:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BE591001B2D;
 Mon, 25 Nov 2019 14:54:03 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E24014BB5B;
 Mon, 25 Nov 2019 14:54:02 +0000 (UTC)
Date: Mon, 25 Nov 2019 09:54:02 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <327090990.13706910.1574693642661.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191122133343.GD19146@rei.lan>
References: <5b0f2a837117f3af1351d8b3da357cacecaa1463.1574087532.git.jstancek@redhat.com>
 <219b1b89de51fda28a0af02f6b15e6da8c73ab7c.1574363475.git.jstancek@redhat.com>
 <20191122133343.GD19146@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.14]
Thread-Topic: perf_event_open02: make do_work() run for specified time
Thread-Index: u5tkTPGZLOOUBGU13V50+90HcbK1Fw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Eq7JzTwEOcqSm5SfFCTb5g-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] perf_event_open02: make do_work() run for
 specified time
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
> > 
> > Tested with: 5.3.0-0.rc6.git0.1.fc31.x86_64
> > 	     4.18.0-143.el8.x86_64
> > 	     4.18.0-147.rt24.93.el8.x86_64
> 
> Looks good, acked.

Series pushed.

I tested also older kernels based on 2.6.32 (RHEL6.10), and recently
released 5.4.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
