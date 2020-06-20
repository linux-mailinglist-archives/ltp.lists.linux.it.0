Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7454E2021C4
	for <lists+linux-ltp@lfdr.de>; Sat, 20 Jun 2020 07:55:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C828E3C2C13
	for <lists+linux-ltp@lfdr.de>; Sat, 20 Jun 2020 07:55:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 84F103C2237
 for <ltp@lists.linux.it>; Sat, 20 Jun 2020 07:55:35 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 39611601234
 for <ltp@lists.linux.it>; Sat, 20 Jun 2020 07:55:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592632532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mu1LvkhqTIPASyFJgb62Bz5lW184wt+inUx4PRdITbE=;
 b=LE4K5ox1YbaXcQUmn1lNFojdd6omJ8phnoYLzbvXRbR3rmUqICPU+NdEGPhvCmoechQ6DQ
 SbHx1yCfAobMYXl1E1xUT0OE4GHRHK/qzSWL1mWFtvx5etFEwEzU85kYCWC1W18JeH4ywQ
 6iJrlsgX0QV+xsOuIlO3Rquc4cVLdsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-rOHUgWNXP_ip_CLKjohSzg-1; Sat, 20 Jun 2020 01:55:30 -0400
X-MC-Unique: rOHUgWNXP_ip_CLKjohSzg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E3192CCC;
 Sat, 20 Jun 2020 05:55:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FCA85D9C9;
 Sat, 20 Jun 2020 05:55:28 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4EC5833C1;
 Sat, 20 Jun 2020 05:55:28 +0000 (UTC)
Date: Sat, 20 Jun 2020 01:55:28 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <104572215.16889120.1592632528302.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200619192542.20113-1-pvorel@suse.cz>
References: <20200619192542.20113-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.27]
Thread-Topic: tst_test.sh: Print tst_{res, brk} into stdout
Thread-Index: pRP9TXms8YEHs9B0wdxe11CwGAB8cg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] tst_test.sh: Print tst_{res,
 brk} into stdout
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
> This allows printing messages on functions which output is redirected
> into variable or used in eval. Also this change unifies the behavior
> with C new API, which printed into stderr from the beginning.

Should the subject say "into stderr"? Other than that I'm OK
with the change.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
