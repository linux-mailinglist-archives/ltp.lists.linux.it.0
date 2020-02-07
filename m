Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5065155AF6
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 16:47:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F1B53C23C6
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 16:47:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E1BD33C2364
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 16:47:54 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 25F581013170
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 16:47:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581090472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rn5aDco/azrvfb1IN45wZ3m0cmTT7uG0SNmcg4bBX+Q=;
 b=QcVtg5Qq8CeoHJA6FIsnKDLjxlrPMItyfw+8/Has9G299/jUbCSZ1bhnH+V0MzgS3k9x75
 DSdYDo+bogmKbSS99Avh9svXwiGqRFAcz870erw/5rfNm6peaKgh5FFtioltkosTyToksI
 lzHK0oDJZMXaQYHGdSPF1LwwSXaAxws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-ovewu7hMPCCdqddq-7y_-g-1; Fri, 07 Feb 2020 10:47:50 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6B3C800D6C;
 Fri,  7 Feb 2020 15:47:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B2265C28C;
 Fri,  7 Feb 2020 15:47:49 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D8F5866B7;
 Fri,  7 Feb 2020 15:47:49 +0000 (UTC)
Date: Fri, 7 Feb 2020 10:47:49 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <285421765.6549099.1581090469387.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200207152406.GA16951@rei.lan>
References: <20200207144105.19947-1-pvorel@suse.cz>
 <20200207152406.GA16951@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.4]
Thread-Topic: safe_macros: Use tst_umount() in safe_umount()
Thread-Index: W+7eHeY00ZWm6Cvt766d0otuJjQsFQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: ovewu7hMPCCdqddq-7y_-g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 1/2] safe_macros: Use tst_umount() in
 safe_umount()
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
> > To get retry workaround for gvfsd-trash background daemon.
> > 
> > Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi,
> > 
> > this should be ok, but better to double check.
> > Used in fsmount01.
> 
> My expectation is that retrying on EBUSY will not break anything. Jan
> what do you think?

I agree. Though I'd like to point out that tst_umount() currently loops
on any error, not just EBUSY.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
