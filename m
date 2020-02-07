Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BFC1556A3
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 12:26:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5AE23C23C2
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 12:26:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B5D693C238D
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 12:26:37 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 0CBD3227BE3
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 12:26:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581074794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NAap3JRSedtH4anr1ETbg5stjUPYNbXaaItiDkUiVOU=;
 b=a6sYWzH+Kzc+rl/DYSEt0hzXjnME5w8kFcl9F46h39x5nr2FinD40k1oo2LBdzmLQ/IJZf
 mo8w+bGFn4ddzqnP4QTzrXmlZDrb0phqwoUjMLLDE0Wf+NL2Y7U6WrdYJH0Vrq8kNUZ06S
 1o23rPBUVgycESaKZn3SYEG8kXpa7t0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-Rqlo1DfdMBmMJW-MhiuS0A-1; Fri, 07 Feb 2020 06:26:32 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C033F1800D42;
 Fri,  7 Feb 2020 11:26:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7B4E19756;
 Fri,  7 Feb 2020 11:26:31 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7834518089C8;
 Fri,  7 Feb 2020 11:26:31 +0000 (UTC)
Date: Fri, 7 Feb 2020 06:26:31 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>
Message-ID: <933028887.6504347.1581074791417.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200207111910.GB19508@rei.lan>
References: <7843cc36a04deb034e9479a139f535e5fa5f3135.1580894017.git.jstancek@redhat.com>
 <20200207111910.GB19508@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.6]
Thread-Topic: syscalls/getrandom02: lower bufsize if low on entropy
Thread-Index: /2rvAL9NnddmXLTQEAGtcuaCQVMPdQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Rqlo1DfdMBmMJW-MhiuS0A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/getrandom02: lower bufsize if low on
 entropy
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
> 
> Looks good to me, acked.

Thanks, pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
