Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1521A9EB8
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 14:01:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B21F3C64F2
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 14:01:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0BF6A3C2AFA
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 14:01:39 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 70D7D1001274
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 14:01:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586952096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wG86RRF/die0SwsJqcTdiLaEPMzv29V4F8i7lfNyYPo=;
 b=e/c84em8jApkKlv3bb4dfWfq+4mjhqGMc2KPm/y3Ei7lOWI773Jdmm3wlzxvWQlDHIjNrS
 dPsw31hc9z9YgUxFs8fRb67o0eG71/Kg+FGrBVCn8V/nwUQLZaYabJl5kAEYSkvAq+f98g
 4KU/rU5UAWRjt+WgxN2mEGnae/jclgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-IKv4lrdMPIu1w0KpPcXviQ-1; Wed, 15 Apr 2020 08:01:32 -0400
X-MC-Unique: IKv4lrdMPIu1w0KpPcXviQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFDF8801A08;
 Wed, 15 Apr 2020 12:01:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3C451001920;
 Wed, 15 Apr 2020 12:01:30 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2DF893065;
 Wed, 15 Apr 2020 12:01:29 +0000 (UTC)
Date: Wed, 15 Apr 2020 08:01:29 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <519333462.8303829.1586952089550.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200415112635.14144-1-pvorel@suse.cz>
References: <20200415112635.14144-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.21]
Thread-Topic: Fix compilation with -fno-common (gcc-10)
Thread-Index: L2jKt7Y6MbfVoN1sDvGr3YVK1YH3Ug==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/9] Fix compilation with -fno-common (gcc-10)
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
> Hi,
> 
> I added 1st commit "Remove use of TCID in new API tests" which allows to
> remove extern const char *TCID;
> 
> https://travis-ci.org/github/pevik/ltp/builds/675251626
> 
> Kind regards,
> Petr

Looks good, ack.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
