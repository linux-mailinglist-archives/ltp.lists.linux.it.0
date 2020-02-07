Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B94155A27
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 15:56:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33C513C23C8
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 15:56:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2F4BD3C2384
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 15:56:16 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id A7BAB6068D5
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 15:56:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581087374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wP6/fIywhtE4zzqmiNZsvc0fo63o9aaI67rAts1aXj4=;
 b=cKvJqi0R0sftD1BE3NzHkUp2WvJFaZkbj7U5H8TxiMovVnQMMgK3oDt5yb3da8oLRqm05P
 dCDhZFJUUz/y/caVguH1TJC2Tq94tVFdmBzDhxPi8CdA7PiOTCm+Vl5Oi1S6UppsbEMeiU
 VZacb8AvGGZYlIGNgJvpS+3wrA/djFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-wCbwNVzzPyinAUN0h8ocLg-1; Fri, 07 Feb 2020 09:56:12 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 050A7800E21;
 Fri,  7 Feb 2020 14:56:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF08060BF7;
 Fri,  7 Feb 2020 14:56:10 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9353F180880B;
 Fri,  7 Feb 2020 14:56:10 +0000 (UTC)
Date: Fri, 7 Feb 2020 09:56:10 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <1149510045.6536246.1581087370399.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200207145403.23193-1-mdoucha@suse.cz>
References: <1041474174.5093428.1580463462902.JavaMail.zimbra@redhat.com>
 <20200207145403.23193-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.18]
Thread-Topic: Taunt OOM killer in fork12 setup()
Thread-Index: HK68MbgJV3iQbCBFS0jLy9v7pifN9g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: wCbwNVzzPyinAUN0h8ocLg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Taunt OOM killer in fork12 setup()
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
> On a system with low memory, fork12 can trigger OOM killer before it hits
> any fork() limits. The OOM killer might accidentally kill e.g. the parent
> shell and external testing tools will assume the test failed.
> 
> Set high oom_score_adj on the children of the main fork12 process so that
> the OOM killer focuses on them.
> 
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
