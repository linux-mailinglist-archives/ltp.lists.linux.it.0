Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6716E2001F5
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 08:37:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D88953C2C50
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 08:37:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 534D43C231B
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 08:37:17 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 6555C6011B5
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 08:37:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592548635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVq+h8jXkV+MBeouq2MXGAiNS01Tjvr0RhG71JqezJ4=;
 b=XXNbx/yrbm7rRxndZJ7Q+8BVb4NxNnUHjo9DW3YiNg51IPfzBkUUXuubR6zA3sN8JQDfgI
 UCL3uUO5prZdH/mL3VUctm6kyfXhQpv5enhyBuVxmYhunoyiJqnsDOen6qRiOAdIE6Ox0k
 0fz9bVfQtFl8ZnvWUnmWJhiBEMW9yJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-CBqxp-AvMgu14F8bBWo2GQ-1; Fri, 19 Jun 2020 02:37:14 -0400
X-MC-Unique: CBqxp-AvMgu14F8bBWo2GQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3192B872FE0;
 Fri, 19 Jun 2020 06:37:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 058117166C;
 Fri, 19 Jun 2020 06:37:13 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA3D61809543;
 Fri, 19 Jun 2020 06:37:12 +0000 (UTC)
Date: Fri, 19 Jun 2020 02:37:12 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, Li Wang <liwang@redhat.com>, 
 Petr Vorel <pvorel@suse.cz>
Message-ID: <52001094.16712529.1592548632766.JavaMail.zimbra@redhat.com>
In-Reply-To: <1592533501676.33160@cn.fujitsu.com>
References: <53a3e9975f00c50c78528994472ec7e9f8adeb90.1592475774.git.jstancek@redhat.com>
 <1592533501676.33160@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.22]
Thread-Topic: [PATCH] clocks/invaliddates.c: relax acceptable delta
Thread-Index: AQHWRVrE+nS1oZdEoUqSD+O3+2MxHKjfNoCH3x4xK34=
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?b?562U5aSNOiBbUEFUQ0hdIGNsb2Nrcy9pbnZhbGlkZGF0ZXMu?=
 =?utf-8?q?c=3A_relax_acceptable_delta?=
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

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
