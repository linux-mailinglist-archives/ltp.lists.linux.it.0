Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AD817D607
	for <lists+linux-ltp@lfdr.de>; Sun,  8 Mar 2020 21:07:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D72DF3C622B
	for <lists+linux-ltp@lfdr.de>; Sun,  8 Mar 2020 21:07:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id F12273C61D9
 for <ltp@lists.linux.it>; Sun,  8 Mar 2020 21:07:31 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E4AFF1400778
 for <ltp@lists.linux.it>; Sun,  8 Mar 2020 21:07:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583698049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y0/LDG05JWH6iH3DreWtZMhkaDBJPjuzVf5hq+aAXnk=;
 b=gVweCHvO8vseo6aGh4VzXqMKc+KDcyhsRO3ahP5jGEp0W7hHxwe/wLmcq9whYGIi6DDbqy
 nqGBGiqgDt55VjjQQ6rewJ94fgAW6aqKjCOmg0vIxy7zjsEz2D8HlQSEEe9ptxYGegZ+hk
 +PcYI16Jhd3m+9HhsE+O/wGA+ppsxvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-JEHTQzQpNIK3Eca2uovIZQ-1; Sun, 08 Mar 2020 16:07:25 -0400
X-MC-Unique: JEHTQzQpNIK3Eca2uovIZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA628184C800;
 Sun,  8 Mar 2020 20:07:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF16D5D9E2;
 Sun,  8 Mar 2020 20:07:23 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCCE81809563;
 Sun,  8 Mar 2020 20:07:23 +0000 (UTC)
Date: Sun, 8 Mar 2020 16:07:23 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: CKI Project <cki-project@redhat.com>, 
 Linux Stable maillist <stable@vger.kernel.org>
Message-ID: <976629603.10711789.1583698043547.JavaMail.zimbra@redhat.com>
In-Reply-To: <173385062.10432633.1583427362328.JavaMail.zimbra@redhat.com>
References: <cki.EED856DF66.LLEP90YP5M@redhat.com>
 <2065777364.10425170.1583425488638.JavaMail.zimbra@redhat.com>
 <173385062.10432633.1583427362328.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.16]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.5.7-60528b7.cki (stable-queue)
Thread-Index: kkuOJFuqhkSqHy2lWMvJx4dG0KzmcTW74Dzw/2E6cwI=
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E5?=
 =?utf-8?q?=2E7-60528b7=2Ecki_=28stable-queue=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> 5.6.0-0.rc3 crashed as well. On s390x I'm using it's enough to
> "cat /sys/fs/cgroup/cpu.pressure" to trigger.

Fix has already been posted:
  https://lore.kernel.org/lkml/20200224030007.3990-1-cai@lca.pw/

With this patch applied, I no longer see crashes with 5.6.0-rc4+.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
