Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B887F8E85
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 12:23:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E3C13C25D0
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 12:23:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 826613C25D0
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 12:23:44 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 870AA6029F9
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 12:23:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573557823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=jAHJi7Ptz8q/DCNxiH7dIOicO16avZAWgD57mehyqtE=;
 b=IZVFF9tBNUp7/QDmqXXhzGZFUfaiZOOvFmWx8Cg1/BF3EAXAmBMdAfbF0wYeGbXnD3NMOF
 tVv9BUioivOTKpm5lwLtlnGk/c5ChwaIAxOCfiepj1Z03CQUUUaO80Jwv9qI2w849ifuXh
 rxG7vPlVR1hEw3csq5CYxXpMbuf4Alo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-anwADA_nOW2a6Qc15KaoJQ-1; Tue, 12 Nov 2019 06:23:37 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 582A7801FD1;
 Tue, 12 Nov 2019 11:23:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F85A9F6B;
 Tue, 12 Nov 2019 11:23:36 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43CFD4BB5C;
 Tue, 12 Nov 2019 11:23:36 +0000 (UTC)
Date: Tue, 12 Nov 2019 06:23:36 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1777275000.11658351.1573557816232.JavaMail.zimbra@redhat.com>
In-Reply-To: <532528280.11658082.1573557688898.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.30]
Thread-Topic: kernel test robot emails
Thread-Index: v5xfsfLCNPReAkKLQPgMFR6bzrGO9A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: anwADA_nOW2a6Qc15KaoJQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] kernel test robot emails
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
Cc: LTP Mailing List <ltp@lists.linux.it>, rong.a.chen@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

do you know if kernel test robot emails are allowed to go on LTP list?
I noticed, that I'm seeing only replies to those emails, but never the
first message.

Regards,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
